local Amr = LibStub("AceAddon-3.0"):GetAddon("AskMrRobot")
local L = LibStub("AceLocale-3.0"):GetLocale("AskMrRobot", true)
local AceGUI = LibStub("AceGUI-3.0")

local _frameLoot
local _panelLoot
local _selectedIndex
local _disenchant = {}
local _rankPanels
local _lootButtons

local _widthItemList = 220
local _widthRankList = 640
local _widthSpacing = 10
local _widthRank = 48
local _widthRankBar = 195
local _widthRollType = 45
local _widthColPadding = 8
local _widthRollExtraSpacing = 4

local _rollTypePos = {
	Need = 1,
	Off = 2,
	Greed = 3,
	Pass = 4
}

-- get the index of the loot item that matches up to the specified item
local function getLootIndex(itemIndex)

	local ranking = Amr.db.global.TeamOpt.Rankings[itemIndex]
	if not ranking then return nil end
	
	local itemUniqueId = Amr.GetItemUniqueId(ranking.item)
	for i = 1, GetNumLootItems() do
		--local texture, item, quantity, quality, locked = GetLootSlotInfo(i)
		local lootType = GetLootSlotType(i)
		if lootType == 1 then
			local link = GetLootSlotLink(i)
			local lootItem = Amr.ParseItemLink(link)
			if Amr.GetItemUniqueId(lootItem) == itemUniqueId then
				return i, link
			end
		end
	end
end

local function getLootCandidateIndex(lootIndex, realm, name)
	-- remove spaces to ensure proper matches, and make all lower
	realm = string.gsub(realm, "%s+", "")
	realm = string.lower(realm)
	name = string.lower(name)
	
	local nameMatches = {}
	for i = 1, 40 do
		local candidate = GetMasterLootCandidate(lootIndex, i)
		if candidate then			
			local candidateName = candidate			
			local candidateRealm = GetRealmName()
			
			-- see if realm is in the name
			local splitPos = string.find(candidateName, "-")
			if splitPos ~= nil then
				candidateRealm = string.sub(candidateName, splitPos + 1)
				candidateName = string.sub(candidateName, 1, splitPos - 1)
			end
			
			-- remove spaces to ensure proper matches, and make all lower
			candidateRealm = string.gsub(candidateRealm, "%s+", "")			
			candidateRealm = string.lower(candidateRealm)
			candidateName = string.lower(candidateName)
			
			-- if perfect match then we are done
			if candidateRealm == realm and candidateName == name then 
				return i
			end
			
			if candidateName == name then
				table.insert(nameMatches, i)
			end
		end
	end
	
	-- only one player with same name, must be the player of interest
	if #nameMatches == 1 then 
		return nameMatches[1]
	end
	
	-- could not be found or ambiguous
	return nil
end

-- helper to send a message telling everyone that an item was just given out
local function sendGiveLootMessage(itemLink, unitId, isDisenchant)
	-- some display info
	local cls, clsEn = UnitClass(unitId)
	local name = UnitName(unitId)
			
	local result = isDisenchant and "Disenchant" or (roll and roll.rollType or nil)
	if result == nil then result = "??" end
	
	local msg = string.format("%s\n%d\n%s\n%s\n%s\n%s", Amr.LootMessagePrefixes.Give, _selectedIndex, itemLink, result, clsEn, name)
	Amr:SendAmrCommMessage(msg)
end

local function onGiveLootClick(widget)
	local rollIndex = widget:GetUserData("index")
	
	local rankings = Amr.db.global.TeamOpt.Rankings
	local ranking = rankings[_selectedIndex]
	local rank = ranking and ranking.ranks[rollIndex] or nil
	if rank then
		local roll = Amr.db.char.TeamOpt.Rolls[_selectedIndex][rollIndex]
		local isDisenchant = not not _disenchant[_selectedIndex]
		
		local unitId = Amr:GetUnitId(rank.realm, rank.name)
		if unitId then
			-- find the item and loot candidate index		
			local itemIndex, itemLink = getLootIndex(_selectedIndex)

			-- for debugging when don't actually have any loot
			--itemLink = Amr.CreateItemLink(ranking.item)

			local playerIndex = itemIndex and getLootCandidateIndex(itemIndex, rank.realm, rank.name) or nil
			if itemIndex and playerIndex then
				GiveMasterLoot(itemIndex, playerIndex)
				sendGiveLootMessage(itemLink, unitId, isDisenchant)
				return
			end
			
		end
	end
	
	-- if we make it here, we could not give out the item for some reason
	Amr:Print(L.LootMasterGiveFail)
end

function Amr:OnLootGiveReceived(parts)
	if not parts or #parts < 6 then return end
	
	local rankings = Amr.db.global.TeamOpt.Rankings
	
	-- index of the item that was given, flag it to hide it from the ui now
	local index = tonumber(parts[2])
	local ranking = rankings[index]
	if ranking then
		ranking.given = true
	end
	
	-- change the selected item index to the next ungiven item
	for i, obj in ipairs(rankings) do
		if not obj.given then
			_selectedIndex = i
			break
		end
	end
	
	-- add a loot history entry
	local entry = {
		link = parts[3],
		result = parts[4],
		class = parts[5],
		name = parts[6]
	}
	table.insert(Amr.db.char.TeamOpt.History, entry)
	
	-- redraw any open windows
	Amr:RefreshTeamUi()
	Amr:RefreshLootWindow()
	Amr:RefreshLootRolls()
	
	-- if this is the master looter, check if all items have been given out
	if IsMasterLooter() then
		local allDone = true
		for i, ranking in ipairs(rankings) do
			if not ranking.given then
				allDone = false
				break
			end
		end
		
		if allDone then
			-- send a message indicating that looting is done
			Amr:SendAmrCommMessage(Amr.LootMessagePrefixes.Finish)
		end
	end
	
end

local function onDisenchantClick()
	local val = not _disenchant[_selectedIndex]
	_disenchant[_selectedIndex] = val
	
	Amr:RefreshLootWindow()
	Amr:RefreshLootRolls()
end

local function onRollClick()
	-- generate a roll for everyone on the current item
	local rands = {}
	
	local ranking = Amr.db.global.TeamOpt.Rankings[_selectedIndex]
	for i, rank in ipairs(ranking.ranks) do
		local r = math.random(100)
		rands[i] = r
	end
	
	-- transmit the roll data to all group members
	local msg = string.format("%s\n%d\n%s", Amr.LootMessagePrefixes.Rand, _selectedIndex, Amr:Serialize(rands))
	Amr:SendAmrCommMessage(msg)
end

function Amr:OnLootRandReceived(parts)
	if not parts or #parts < 3 then return end
	
	local index = tonumber(parts[2])
	local success, rands = Amr:Deserialize(parts[3])
	if not index or not success then return end
	
	local rolls = Amr.db.char.TeamOpt.Rolls[index]
	for i, r in pairs(rands) do
		local roll = rolls[i]
		if not roll then
			roll = {}
			rolls[i] = roll
		end
		
		roll.rand = r
	end
	
	Amr:RefreshLootRolls()
end

local function onVetoClick(widget)
	local rollIndex = widget:GetUserData("rollIndex")
	local rollType = widget:GetUserData("rollType")
	
	-- acts like a toggle
	local roll = Amr.db.char.TeamOpt.Rolls[_selectedIndex][rollIndex]	
	local veto = not roll or not roll.vetoes or not roll.vetoes[rollType]
	
	-- send a message that a veto has been changed
	local msg = string.format("%s\n%d\n%d\n%s\n%s", Amr.LootMessagePrefixes.Veto, _selectedIndex, rollIndex, rollType, veto and "t" or "f")
	Amr:SendAmrCommMessage(msg)
end

function Amr:OnLootVetoReceived(parts)
	if not parts or #parts < 5 then return end
	
	local itemIndex = tonumber(parts[2])
	local rollIndex = tonumber(parts[3])
	local rollType = parts[4]
	local veto = parts[5] == "t"
	
	if itemIndex and rollIndex then
		local roll = Amr.db.char.TeamOpt.Rolls[itemIndex][rollIndex]
		if not roll then
			roll = {}
			Amr.db.char.TeamOpt.Rolls[itemIndex][rollIndex] = roll
		end
		
		if not roll.vetoes then
			roll.vetoes = {}
		end
		
		roll.vetoes[rollType] = veto

		-- if the player chose this option, have to remove it because it has been vetoed
		if veto and roll.rollType == rollType then
			roll.rollType = nil
		end
		
		Amr:RefreshLootRolls()
	end
end

-- a user choice for what they want to do on an item
local function doRoll(rollType)

	local msg = string.format("%s\n%d\n%s\n%s\n%s", Amr.LootMessagePrefixes.Roll, _selectedIndex, rollType, GetRealmName(), UnitName("player"))
	Amr:SendAmrCommMessage(msg)
end

function Amr:OnLootRollReceived(parts)
	local index = tonumber(parts[2])
	local rollType = parts[3]
	local realm = parts[4]
	local name = parts[5]
	
	-- for now, this code matches up name/realm to one in the rankings
	-- TODO: more robust handling of players with same name but different realms in the same group on non-english clients
	local nameMatches = {}
	local ranking = Amr.db.global.TeamOpt.Rankings[index]
	for i, rank in ipairs(ranking.ranks) do
		if name == rank.name and realm == rank.realm then
			nameMatches = {}
			break
		end
		
		if name == rank.name then
			table.insert(nameMatches, rank)
		end
	end
	if #nameMatches == 1 then
		realm = nameMatches[1].realm
		name = nameMatches[1].name
	end
	
	-- find index of the ranking
	local rankIndex = nil
	for i, rank in ipairs(ranking.ranks) do
		if name == rank.name and realm == rank.realm then
			rankIndex = i
			break
		end
	end
	
	if rankIndex then
		local obj = Amr.db.char.TeamOpt.Rolls[index][rankIndex]
		if not obj then 
			obj = {}
			Amr.db.char.TeamOpt.Rolls[index][rankIndex] = obj
		end
		obj.rollType = rollType
	end
	
	Amr:RefreshLootRolls()
end

local function renderRollType(rp, rollType, roll, index)
	
	local icon = rp:GetUserData(rollType)
	if not icon and roll then
		-- create icon if we need one
		icon = AceGUI:Create("AmrUiTextButton")
		icon:SetWidth(16)
		icon:SetHeight(16)
		local pos = _rollTypePos[rollType]
		local left = _widthRank + _widthColPadding + _widthRankBar + (pos * _widthColPadding) + ((pos - 1) * _widthRollType) + ((_widthRollType - 16) / 2)
		icon:SetPoint("LEFT", rp.content, "LEFT", left, 0)
		rp:AddChild(icon)
		rp:SetUserData(rollType, icon)
		
		icon:SetUserData("rollType", rollType)
		icon:SetUserData("rollIndex", index)
		icon:SetVisible(false)
		
		icon:SetCallback("OnClick", onVetoClick)
	end
	
	if icon then
		if roll and roll.rollType == rollType then
			icon:SetVisible(true)
			icon:SetBackgroundImage("Interface\\AddOns\\" .. Amr.ADDON_NAME .. "\\Media\\IconCheck")
			icon:SetHoverBackgroundImage("Interface\\AddOns\\" .. Amr.ADDON_NAME .. "\\Media\\IconCheck")
		elseif roll and roll.vetoes and roll.vetoes[rollType] then
			icon:SetVisible(true)
			icon:SetBackgroundImage("Interface\\AddOns\\" .. Amr.ADDON_NAME .. "\\Media\\IconX")
			icon:SetHoverBackgroundImage("Interface\\AddOns\\" .. Amr.ADDON_NAME .. "\\Media\\IconX")
		else
			icon:SetVisible(false)
		end
		
		icon:SetDisabled(not IsMasterLooter())
	end
	
	-- update button state for this roll type
	if _lootButtons and _lootButtons[rollType] then
		_lootButtons[rollType]:SetDisabled(roll and roll.vetoes and roll.vetoes[rollType])
	end
end

-- gets the current winner based on rolls and currently selected roll type for each user (returns index into rankings for item, or -1 if no winner yet)
local function getWinner(itemIndex)

	local rolls = Amr.db.char.TeamOpt.Rolls[itemIndex]
	if not rolls then return -1 end
	
	-- go through and find the highest priority roll type
	local bestRollType
	local bestTypePos = 100
	for i, roll in pairs(rolls) do
		if roll.rollType then
			local rollPos = _rollTypePos[roll.rollType]
			if rollPos < bestTypePos and rollPos < _rollTypePos["Pass"] then
				bestRollType = roll.rollType
				bestTypePos = rollPos
			end
		end
	end
	
	-- nobody has chosen anything yet
	if not bestRollType then return -1 end
	
	-- find highest roll in the highest priority roll type
	local maxRoll = -1
	local bestRoll = -1	
	for i, roll in pairs(rolls) do		
		if roll.rollType == bestRollType and roll.rand and roll.rand > maxRoll then
			bestRoll = i
			maxRoll = roll.rand
		end
	end
	
	return bestRoll
end

function Amr:RefreshLootRolls()
	if not _rankPanels then return end

	local ranking = Amr.db.global.TeamOpt.Rankings[_selectedIndex]
	local rolls = Amr.db.char.TeamOpt.Rolls[_selectedIndex]	
	local isDisenchant = _disenchant[_selectedIndex]
	
	local winnerIndex = getWinner(_selectedIndex)
	
	for i, rp in pairs(_rankPanels) do
		local rank = ranking.ranks[i]
		local roll = rolls[i]
		if isDisenchant then roll = nil end
		
		-- clear or set the value of each roll column
		renderRollType(rp, "Need", roll, i)
		renderRollType(rp, "Off", roll, i)
		renderRollType(rp, "Greed", roll, i)
		renderRollType(rp, "Pass", roll, i)
		
		-- render the random roll
		local lbl = rp:GetUserData("randLabel")
		if roll and roll.rand then
			if not lbl then
				lbl = AceGUI:Create("AmrUiLabel")
				lbl:SetJustifyH("RIGHT")
				
				local left = _widthRank + _widthColPadding + _widthRankBar + (5 * _widthColPadding) + (5 * _widthRollType)
				lbl:SetPoint("RIGHT", rp.content, "LEFT", left, 0)
				rp:AddChild(lbl)
				rp:SetUserData("randLabel", lbl)
			end
			
			-- highlight this roll if winner, otherwise unhighlight
			if i == winnerIndex then
				lbl:SetFont(Amr.CreateFont("Bold", 18, Amr.Colors.BrightGreen))
			else
				lbl:SetFont(Amr.CreateFont("Regular", 14, Amr.Colors.White))
			end
			
			lbl:SetText(roll.rand)
		else
			if lbl then
				lbl:SetVisible(false)
			end
		end
		
		-- if this person does not have the addon, show a message (except in DE mode)
		local hasAddon = true
		local unitId = Amr:GetUnitId(rank.realm, rank.name)
		if unitId then
			local realm, name = Amr:GetRealmAndName(unitId)
			if realm then
				local ver = Amr:GetAddonVersion(realm, name)
				hasAddon = ver >= Amr.MIN_ADDON_VERSION
			end
		end
		
		lbl = rp:GetUserData("noaddonLabel")
		if not hasAddon and not isDisenchant then
			if not lbl then
				lbl = AceGUI:Create("AmrUiLabel")
				lbl:SetFont(Amr.CreateFont("Italic", 14, Amr.Colors.Red))
				lbl:SetText(L.LootRankLabelNoAddon)				
				lbl:SetPoint("LEFT", rp.content, "LEFT", _widthRank + _widthColPadding + _widthRankBar + _widthColPadding + 5, 0)				
				rp:AddChild(lbl)
				rp:SetUserData("noaddonLabel", lbl)
			end
		else
			if lbl then
				lbl:SetVisible(false)
			end
		end
		
	end
end

-- helper to create the column bg and header for rank list
local function createLootRankColumn(container, prevColumn, width, txt, txtAlign, extraPadding)
	extraPadding = extraPadding and extraPadding or 0
	
	local panel = AceGUI:Create("AmrUiPanel")
	panel:SetBackgroundColor(Amr.Colors.Black, 0.3)
	container:AddChild(panel)

	if prevColumn then
		-- pad a bit to right of previous column
		panel:SetPoint("TOPLEFT", prevColumn.content, "TOPRIGHT", _widthColPadding + extraPadding, 0)
		panel:SetPoint("BOTTOMRIGHT", prevColumn.content, "BOTTOMRIGHT", _widthColPadding + extraPadding + width, 0)
	else
		-- first column abs position in the main ranking panel
		panel:SetPoint("TOPLEFT", container.content, "TOPLEFT", _widthItemList + _widthSpacing, -115)
		panel:SetPoint("BOTTOMRIGHT", container.content, "BOTTOMLEFT", _widthItemList + _widthSpacing + width, 0)
	end
	
	lbl = AceGUI:Create("AmrUiLabel")
	lbl:SetWordWrap(false)
	lbl:SetFont(Amr.CreateFont("Regular", 12, Amr.Colors.TextHeaderDisabled))
	lbl:SetText(txt)
	lbl:SetJustifyH(txtAlign)
	lbl:SetWidth(width)
	lbl:SetPoint("BOTTOMLEFT", panel.content, "TOPLEFT", 0, 5)
	container:AddChild(lbl)
	
	return panel, lbl
end

function Amr:RefreshLootWindow()
	if not _panelLoot then return end
	
	-- clear out any children of the main loot frame and re-render
	_panelLoot:ReleaseChildren()
	_rankPanels = {}
	_lootButtons = {}
	
	local ml = IsMasterLooter()
	local myUnitId = Amr:GetUnitId(GetRealmName(), UnitName("player"))
	
	local rankings = Amr.db.global.TeamOpt.Rankings
	if rankings and #rankings > 0 then

		-- make sure that an item is selected
		if not _selectedIndex then
			for i, ranking in ipairs(rankings) do
				if not ranking.given then
					_selectedIndex = i
					break
				end
			end
		end
	
		-- render list of items
		local panelItems = AceGUI:Create("AmrUiPanel")
		panelItems:SetLayout("Fill")
		panelItems:SetWidth(_widthItemList)
		panelItems:SetBackgroundColor(Amr.Colors.Black, 0)
		panelItems:SetPoint("TOPLEFT", _panelLoot.content, "TOPLEFT", 0, 0)
		panelItems:SetPoint("BOTTOMLEFT", _panelLoot.content, "BOTTOMLEFT")
		_panelLoot:AddChild(panelItems)
		
		local scrollItems = AceGUI:Create("AmrUiScrollFrame")
		scrollItems:SetLayout("List")
		panelItems:AddChild(scrollItems)
		
		-- render the divider between items and ranks
		local divider = AceGUI:Create("AmrUiPanel")
		divider:SetBackgroundColor(Amr.Colors.Black, 0.5)
		divider:SetPoint("TOPLEFT", _panelLoot.content, "TOPLEFT", _widthItemList, 0)
		divider:SetPoint("BOTTOMRIGHT", _panelLoot.content, "BOTTOMLEFT", _widthItemList + 5, 0)
		_panelLoot:AddChild(divider)
		
		local btn, btn2, lbl, lbl2, panel, panel2, chk
		
		local remainingItems = {}
		for i, ranking in ipairs(rankings) do
			if not ranking.given then
				remainingItems[i] = ranking
			end
		end
		
		for i, ranking in pairs(remainingItems) do
			btn = AceGUI:Create("AmrUiTextButton")
			btn:SetWidth(_widthItemList)
			btn:SetHeight(50)
			btn:SetJustifyH("LEFT")
			btn:SetJustifyV("TOP")
			btn:SetTextPadding(9, nil, nil, 2)
			btn:SetWordWrap(false)
			btn:SetUserData("index", i)
			
			local f
			if _selectedIndex == i then
				f = Amr.CreateFont("Bold", 16, Amr.Colors.Text)
				btn:SetBackgroundColor(Amr.Colors.Black, 0.5)
				btn:SetHoverBackgroundColor(Amr.Colors.Black, 0.5)
			else
				f = Amr.CreateFont("Regular", 14, Amr.Colors.Text)
				btn:SetHoverBackgroundColor(Amr.Colors.Black, 0.2)
			end
			
			btn:SetFont(f)
			btn:SetHoverFont(f)
			
			scrollItems:AddChild(btn)
			
			btn:SetCallback("OnClick", function(widget)
				Amr:SelectLootItem(widget:GetUserData("index"))
			end)
			
			local rankLink = Amr.CreateItemLink(ranking.item)
			Amr.GetItemInfo(rankLink, function(obj, name, link)					
				-- set item name, tooltip
				obj:SetText(" " .. link:gsub("%[", ""):gsub("%]", ""))
				Amr:SetItemTooltip(obj, link, "ANCHOR_BOTTOMLEFT", 0, obj.frame:GetHeight())					
			end, btn)
			
			-- add a label for slot, armor type
			local slotText = Amr.SlotEnumDisplayText[ranking.itemInfo.slot]
            if ranking.itemInfo.slot == 'MainHand' then
                slotText = ranking.itemInfo.subclass == 'TwoHand' and L.TwoHand or L.OneHand
            elseif ranking.itemInfo.slot == 'OffHand' then
                slotText = L.OffHand
			end

            if ranking.itemInfo.armorType == 'None' and ranking.itemInfo.weaponType ~= 'None' then
                if ranking.itemInfo.weaponType ~= 'OffHand' then
                    slotText = slotText .. ", " .. L.WeaponTypes[ranking.itemInfo.weaponType]
				end
            elseif ranking.itemInfo.armorType ~= 'None' then
                slotText = slotText .. ", " .. L.ArmorTypes[ranking.itemInfo.armorType]
			end
			
			btn:SetSubtextFont(Amr.CreateFont("Regular", 13, Amr.Colors.TextGray))
			btn:SetSubtextJustifyH("LEFT")
			btn:SetSubtextJustifyV("BOTTOM")
			btn:SetSubtextPadding(nil, nil, 9, 7)
			btn:SetSubtextWordWrap(false)
			btn:SetSubtext(slotText)
			
			
			local isDisenchant = not not _disenchant[i]
			
			if _selectedIndex == i then

				-- see if I am in the list
				local canLoot = false
				for j, rank in ipairs(ranking.ranks) do
					local unitId = Amr:GetUnitId(rank.realm, rank.name)
					if unitId == myUnitId then
						canLoot = not rank.notRanked or rank.offspec
						break
					end
				end
				
				-- render loot options
				if canLoot then
					btn = AceGUI:Create("AmrUiButton")
					btn:SetWidth(120)
					btn:SetHeight(26)
					btn:SetFont(Amr.CreateFont("Bold", 15, Amr.Colors.White))
					btn:SetBackgroundColor(Amr.Colors.Green)
					btn:SetText(L.TeamLootOptionNeed)
					btn:SetPoint("TOPLEFT", _panelLoot.content, "TOPLEFT", _widthItemList + _widthSpacing, -7)
					btn:SetCallback("OnClick", function(widget) doRoll("Need") end)
					_panelLoot:AddChild(btn)
					_lootButtons["Need"] = btn
									
					btn2 = AceGUI:Create("AmrUiButton")
					btn2:SetWidth(120)
					btn2:SetHeight(26)
					btn2:SetFont(Amr.CreateFont("Bold", 15, Amr.Colors.White))
					btn2:SetBackgroundColor(Amr.Colors.Orange)
					btn2:SetText(L.TeamLootOptionPass)
					btn2:SetPoint("TOPLEFT", btn.frame, "BOTTOMLEFT", 0, -15)
					btn2:SetCallback("OnClick", function(widget) doRoll("Pass") end)
					_panelLoot:AddChild(btn2)
					_lootButtons["Pass"] = btn2
					
					btn = AceGUI:Create("AmrUiButton")
					btn:SetWidth(120)
					btn:SetHeight(26)
					btn:SetFont(Amr.CreateFont("Bold", 15, Amr.Colors.White))
					btn:SetBackgroundColor(Amr.Colors.Blue)
					btn:SetText(L.TeamLootOptionOff)
					btn:SetPoint("BOTTOMLEFT", btn2.frame, "TOPRIGHT", 15, 15)
					btn:SetCallback("OnClick", function(widget) doRoll("Off") end)
					_panelLoot:AddChild(btn)
					_lootButtons["Off"] = btn
					
					btn2 = AceGUI:Create("AmrUiButton")
					btn2:SetWidth(120)
					btn2:SetHeight(26)
					btn2:SetFont(Amr.CreateFont("Bold", 15, Amr.Colors.White))
					btn2:SetBackgroundColor(Amr.Colors.Blue)
					btn2:SetText(L.TeamLootOptionGreed)
					btn2:SetPoint("TOPLEFT", btn.frame, "BOTTOMLEFT", 0, -15)
					btn2:SetCallback("OnClick", function(widget) doRoll("Greed") end)
					_panelLoot:AddChild(btn2)
					_lootButtons["Greed"] = btn2
				else
					lbl = AceGUI:Create("AmrUiLabel")
					lbl:SetFont(Amr.CreateFont("Italic", 14, Amr.Colors.TextTan))
					lbl:SetText(L.LootIneligible)
					lbl:SetWidth(255)
					lbl:SetPoint("TOPLEFT", _panelLoot.content, "TOPLEFT", _widthItemList + _widthSpacing, -7)
					_panelLoot:AddChild(lbl)
				end
				
				-- master loot options
				if ml then
					chk = AceGUI:Create("AmrUiCheckBox")
					chk:SetText(L.LootMasterDisenchantText)
					chk:SetPoint("TOPRIGHT", _panelLoot.content, "TOPRIGHT", -18, -12)
					chk:SetCallback("OnClick", onDisenchantClick)
					chk:SetChecked(_disenchant[i])
					_panelLoot:AddChild(chk)
					
					lbl = AceGUI:Create("AmrUiLabel")
					lbl:SetWidth(120)
					lbl:SetJustifyH("CENTER")
					lbl:SetText(L.LootMasterDisenchantLabel)
					lbl:SetFont(Amr.CreateFont("Italic", 12, Amr.Colors.TextTan))
					lbl:SetPoint("TOP", chk.frame, "BOTTOM", 0, -5)
					_panelLoot:AddChild(lbl)
				
					btn2 = AceGUI:Create("AmrUiButton")
					btn2:SetWidth(120)
					btn2:SetHeight(26)
					btn2:SetFont(Amr.CreateFont("Bold", 15, Amr.Colors.White))
					btn2:SetBackgroundColor(Amr.Colors.Green)
					btn2:SetText(L.LootMasterRollText)
					btn2:SetPoint("RIGHT", chk.frame, "LEFT", -50, 0)
					btn2:SetCallback("OnClick", onRollClick)
					_panelLoot:AddChild(btn2)
					
					lbl = AceGUI:Create("AmrUiLabel")
					lbl:SetWidth(120)
					lbl:SetJustifyH("CENTER")
					lbl:SetText(L.LootMasterRollLabel)
					lbl:SetFont(Amr.CreateFont("Italic", 12, Amr.Colors.TextTan))
					lbl:SetPoint("TOP", btn2.frame, "BOTTOM", 0, -5)
					_panelLoot:AddChild(lbl)
					
				end
								
				-- backgrounds for the rank list and headers
				panel = createLootRankColumn(_panelLoot, nil, _widthRank, isDisenchant and "" or L.LootRankHeaderRank, "RIGHT")
				panel = createLootRankColumn(_panelLoot, panel, _widthRankBar, isDisenchant and L.LootRankHeaderScoreDisenchant or L.LootRankHeaderScore, "LEFT")
				
				if not isDisenchant then
					panel = createLootRankColumn(_panelLoot, panel, _widthRollType, L.LootRankHeaderNeed, "CENTER")
					panel = createLootRankColumn(_panelLoot, panel, _widthRollType, L.LootRankHeaderOff, "CENTER")
					panel = createLootRankColumn(_panelLoot, panel, _widthRollType, L.LootRankHeaderGreed, "CENTER")
					panel = createLootRankColumn(_panelLoot, panel, _widthRollType, L.LootRankHeaderPass, "CENTER")
					panel = createLootRankColumn(_panelLoot, panel, _widthRollType, L.LootRankHeaderRoll, "RIGHT", _widthRollExtraSpacing)
				end
				
				-- rank list for selected item
				panel = AceGUI:Create("AmrUiPanel")
				panel:SetLayout("Fill")
				panel:SetBackgroundColor(Amr.Colors.Black, 0)
				panel:SetPoint("TOPLEFT", _panelLoot.content, "TOPLEFT", _widthItemList + _widthSpacing, -115)
				panel:SetPoint("BOTTOMRIGHT", _panelLoot.content, "BOTTOMRIGHT")
				_panelLoot:AddChild(panel)
				
				local scrollRanks = AceGUI:Create("AmrUiScrollFrame")
				scrollRanks:SetLayout("List")
				panel:AddChild(scrollRanks)
								
				-- find min and max value, used for sizing the bars
				local rankMin = -0.02
				local rankMax = 0.02
				for j, rank in ipairs(ranking.ranks) do
					if rank.score < rankMin then
						rankMin = rank.score
					end
					if rank.score > rankMax then
						rankMax = rank.score
					end
				end
				
				-- just make min less than max if they are the same, doesn't really matter what it is, would be a wacky case
				if rankMin == rankMax then
					rankMin = rankMax - 1
				end
					
				local minWidth = 10
				local maxWidth = _widthRankBar - 36 - 65 - 2 -- reserve 36 for icon, 65 for bar label, and 2 for a border around the bar
				local rankCount = 0
				
				for j, rank in ipairs(ranking.ranks) do
					local unitId = Amr:GetUnitId(rank.realm, rank.name)
					if unitId then
						local skip = false
						if isDisenchant then
							skip = true
							if rank.isMasterLooter or (rank.enchantingSkill and rank.enchantingSkill > 0) then
								skip = false
							end
						end
						
						if not skip then
							rankCount = rankCount + 1
							
							local rp = AceGUI:Create("AmrUiPanel")
							rp:SetLayout("None")
							rp:SetBackgroundColor(Amr.Colors.Black, 0)
							rp:SetWidth(_widthRankList)
							rp:SetHeight(45)
							scrollRanks:AddChild(rp)
							_rankPanels[j] = rp
							
							if not isDisenchant then
								panel = AceGUI:Create("AmrUiPanel")
								panel:SetBackgroundColor(Amr.Colors.Black, 1)
								panel:SetPoint("TOPLEFT", rp.content, "BOTTOMLEFT", 0, 0)
								panel:SetPoint("BOTTOMRIGHT", rp.content, "BOTTOMRIGHT", -120, -1)
								rp:AddChild(panel)
							end
							
							lbl = AceGUI:Create("AmrUiLabel")
							lbl:SetFont(Amr.CreateFont("Bold", 32, Amr.Colors.White))
							lbl:SetText(rankCount)
							lbl:SetWidth(_widthRank - 6)
							lbl:SetJustifyH("RIGHT")
							lbl:SetPoint("BOTTOMLEFT", rp.content, "BOTTOMLEFT", 0, 3)
							rp:AddChild(lbl)
							
							local cls, clsEn = UnitClass(unitId)
							local color = clsEn and Amr.Colors.Classes[clsEn] or Amr.Colors.TextHeaderDisabled
							
							local icon = AceGUI:Create("AmrUiIcon")	
							icon:SetIconBorderColor(color)
							icon:SetWidth(36)
							icon:SetHeight(36)
							icon:SetIcon("Interface\\Icons\\" .. Amr.SpecIcons[rank.specId])
							icon:SetPoint("BOTTOMLEFT", rp.content, "BOTTOMLEFT", 48 + 8, 0)
							rp:AddChild(icon)
							
							lbl = AceGUI:Create("AmrUiLabel")
							lbl:SetFont(Amr.CreateFont("Bold", 16, color))
							lbl:SetText(UnitName(unitId))
							lbl:SetWidth(_widthRankBar - 36 - 8) -- 4px on left and right side
							lbl:SetPoint("TOPLEFT", icon.frame, "TOPRIGHT", 4, -2)
							rp:AddChild(lbl)
							
							if isDisenchant or rank.notRanked then							
								lbl = AceGUI:Create("AmrUiLabel")
								lbl:SetFont(Amr.CreateFont("Italic", 13, Amr.Colors.TextHeaderDisabled))
								lbl:SetWidth(_widthRankBar - 36 - 4) -- 4px on left side
								lbl:SetWordWrap(false)
								lbl:SetPoint("BOTTOMLEFT", icon.frame, "BOTTOMRIGHT", 4, 2)
								rp:AddChild(lbl)
								
								if isDisenchant then
									-- will be disenchanter or ML if we are DEing the item
									lbl:SetText((rank.enchantingSkill and rank.enchantingSkill > 0) and string.format(L.LootRankLabelDisenchant .. " (%d)", rank.enchantingSkill) or L.LootRankLabelMasterLooter)
								else
									-- if this is off spec or just a disenchanter, no score bar just description text
									lbl:SetText(rank.offspec and L.LootRankLabelOff or ((rank.enchantingSkill and rank.enchantingSkill > 0) and string.format(L.LootRankLabelDisenchant .. " (%d)", rank.enchantingSkill) or L.LootRankLabelMasterLooter))
								end
							else
								local scoreText = rank.score .. "%"
								local val = rank.score;
								if rank.isEquipped then
									scoreText = "E"
									val = 0
								elseif val >= 0 then
									scoreText = "+" .. scoreText
								end

								local per = (val - rankMin) / (rankMax - rankMin);
								local w = minWidth + (per * (maxWidth - minWidth));
								color = val > 0 and Amr.Colors.BarHigh or (val == 0 and Amr.Colors.BarMed or Amr.Colors.BarLow)
								
								panel = AceGUI:Create("AmrUiPanel")
								panel:SetLayout("None")
								panel:SetWidth(w + 2)
								panel:SetHeight(16)
								panel:SetBackgroundColor(Amr.Colors.Black, 1)
								panel:SetPoint("BOTTOMLEFT", icon.frame, "BOTTOMRIGHT", 0, -1)
								rp:AddChild(panel)
								
								panel2 = AceGUI:Create("AmrUiPanel")
								panel2:SetLayout("None")
								panel2:SetWidth(w)
								panel2:SetHeight(14)
								panel2:SetBackgroundColor(color, 1)
								panel2:SetPoint("TOPLEFT", panel.content, "TOPLEFT", 1, -1)
								panel:AddChild(panel2)
								
								lbl = AceGUI:Create("AmrUiLabel")
								lbl:SetFont(Amr.CreateFont("Bold", 13, color))
								lbl:SetText(scoreText)
								lbl:SetWidth(63)
								lbl:SetWordWrap(false)
								lbl:SetPoint("LEFT", panel.content, "RIGHT", 2, 0)
								rp:AddChild(lbl)
							end
							
							if ml then
								btn2 = AceGUI:Create("AmrUiButton")
								btn2:SetHeight(24)
								btn2:SetFont(Amr.CreateFont("Regular", 13, Amr.Colors.White))
								btn2:SetBackgroundColor(Amr.Colors.Green)
								
								if isDisenchant then
									btn2:SetWidth(200)
									btn2:SetText(L.LootMasterGiveDisenchant)
									btn2:SetPoint("LEFT", rp.content, "LEFT", _widthRank + _widthRankBar + (3 * _widthColPadding), 0)
								else
									btn2:SetWidth(85)
									btn2:SetText(L.LootMasterGiveLoot)
									btn2:SetPoint("RIGHT", rp.content, "RIGHT", -30, 0)
								end
								
								btn2:SetUserData("index", j)
								btn2:SetCallback("OnClick", onGiveLootClick)
								rp:AddChild(btn2)
							end
						end
						
					end
				end
				
			end
			
		end
		
	else
		local lbl = AceGUI:Create("AmrUiLabel")
		lbl:SetFont(Amr.CreateFont("Italic", 16, Amr.Colors.TextTan))
		lbl:SetWidth(800)
		lbl:SetText(L.LootEmpty)
		lbl:SetPoint("CENTER", _panelLoot.content, "CENTER")
		_panelLoot:AddChild(lbl)
	end
	
end

-- select a particular loot item to display
function Amr:SelectLootItem(index)
	_selectedIndex = index
	self:RefreshLootWindow()
	self:RefreshLootRolls()
end

local function onLootFrameClose(widget)
	AceGUI:Release(widget)
	_frameLoot = nil
	_panelLoot = nil
	_rankPanels = nil
	_lootButtons = nil
end

function Amr:HideLootWindow()
	if not _frameLoot then return end
	_frameLoot:Hide()
end

function Amr:ShowLootWindow()
	if not _frameLoot then
		_frameLoot = AceGUI:Create("AmrUiFrame")
		_frameLoot:SetStatusTable(Amr.db.profile.lootWindow) -- window position is remembered in db
		_frameLoot:SetCallback("OnClose", onLootFrameClose)
		_frameLoot:SetLayout("None")
		_frameLoot:SetWidth(900)
		_frameLoot:SetHeight(600)
		_frameLoot:SetBorderColor(Amr.Colors.BorderBlue)
		_frameLoot:SetBackgroundColor(Amr.Colors.Bg)
		
		if Amr.db.profile.options.uiScale ~= 1 then
			local scale = tonumber(Amr.db.profile.options.uiScale)
			_frameLoot:SetScale(scale)
		end
		
		local lbl = AceGUI:Create("AmrUiLabel")
		lbl:SetWidth(600)
		lbl:SetFont(Amr.CreateFont("Bold", 28, Amr.Colors.White))
		lbl:SetText(L.LootTitle)
		lbl:SetWordWrap(false)
		lbl:SetJustifyH("CENTER")
		lbl:SetPoint("TOP", _frameLoot.content, "TOP", 0, 30)
		_frameLoot:AddChild(lbl)
		
		lbl:SetCallback("OnMouseDown", function(widget) _frameLoot:StartMove() end)
		lbl:SetCallback("OnMouseUp", function(widget) _frameLoot:EndMove() end)
		
		lbl = AceGUI:Create("AmrUiLabel")
		lbl:SetWidth(_widthItemList)
		lbl:SetFont(Amr.CreateFont("Regular", 18, Amr.Colors.TextHeaderActive))
		lbl:SetText(L.LootHelpItems)
		lbl:SetPoint("TOPLEFT", _frameLoot.content, "TOPLEFT", 0, -10)
		_frameLoot:AddChild(lbl)
		
		lbl = AceGUI:Create("AmrUiLabel")
		lbl:SetWidth(_widthItemList)
		lbl:SetFont(Amr.CreateFont("Regular", 18, Amr.Colors.TextHeaderActive))
		lbl:SetText(L.LootHelpRanks)
		lbl:SetPoint("TOPLEFT", _frameLoot.content, "TOPLEFT", _widthItemList + _widthSpacing, -10)
		_frameLoot:AddChild(lbl)
		
		if IsMasterLooter() then
			lbl = AceGUI:Create("AmrUiLabel")
			lbl:SetWidth(_widthItemList)
			lbl:SetFont(Amr.CreateFont("Regular", 18, Amr.Colors.TextHeaderActive))
			lbl:SetText(L.LootHelpMaster)
			lbl:SetPoint("TOPLEFT", _frameLoot.content, "TOPLEFT", _widthItemList + _widthSpacing + _widthRank + _widthRankBar + _widthRollType + (_widthColPadding * 3), -10)
			_frameLoot:AddChild(lbl)
		end
		
		_panelLoot = AceGUI:Create("AmrUiPanel")
		_panelLoot:SetLayout("None")
		_panelLoot:SetBackgroundColor(Amr.Colors.Black, 0)
		_panelLoot:SetPoint("TOPLEFT", _frameLoot.content, "TOPLEFT", 0, -40)
		_panelLoot:SetPoint("BOTTOMRIGHT", _frameLoot.content, "BOTTOMRIGHT", 0, 0)
		_frameLoot:AddChild(_panelLoot)
	else
		_frameLoot:Show()
	end
	
	_frameLoot:Raise()
end

function Amr:OnStartLootReceived(parts)
	local data = {}
	for i = 2, #parts do
		table.insert(data, parts[i])
	end
	data = table.concat(data, "\n")
	
	-- reset rankings to the new data sent out by person in control
	local rankings = Amr:ParseRankingString(data)
	Amr.db.global.TeamOpt.Rankings = rankings
	
	-- reset disenchant state
	_disenchant = {}
	
	-- reset roll information when loot is started
	local rolls = {}
	for i = 1, #rankings do
		table.insert(rolls, {})
	end	
	Amr.db.char.TeamOpt.Rolls = rolls

	-- select first item by default
	_selectedIndex = #rankings > 0 and 1 or nil
	
	-- begin looting
	Amr.db.char.TeamOpt.LootInProgress = true
	
	Amr:RefreshTeamUi()
	Amr:ShowLootWindow()
	Amr:RefreshLootWindow()
end
