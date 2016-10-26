local Amr = LibStub("AceAddon-3.0"):GetAddon("AskMrRobot")
local L = LibStub("AceLocale-3.0"):GetLocale("AskMrRobot", true)
local AceGUI = LibStub("AceGUI-3.0")

local _gearTabs
local _activeTab

-- Returns a number indicating how different two items are (0 means the same, higher means more different)
local function countItemDifferences(item1, item2)
    if item1 == nil and item2 == nil then return 0 end
    
    -- different items (id + bonus ids + suffix, constitutes a different physical drop)
    if Amr.GetItemUniqueId(item1, true) ~= Amr.GetItemUniqueId(item2, true) then
		return 1000
    end
    
    -- different upgrade levels of the same item
    if item1.upgradeId ~= item2.upgradeId then
        return 100
    end
    
    -- different gems
    local gemDiffs = 0
    for i = 1, 3 do
        if item1.gemIds[i] ~= item2.gemIds[i] then
            gemDiffs = gemDiffs + 1
        end
    end
    
	-- different enchants
    local enchantDiff = 0
    if item1.enchantId ~= item2.enchantId then
        enchantDiff = 1
    end
    
    return gemDiffs + enchantDiff
end

-- given a table of items (keyed or indexed doesn't matter) find closest match to item, or nil if none are a match
local function findMatchingItemFromTable(item, list, bestLink, bestItem, bestDiff, bestLoc, usedItems, tableType)
	if not list then return nil end
	
	local found = false
	for k,v in pairs(list) do
		local listItem = Amr.ParseItemLink(v)
		if listItem then
			local diff = countItemDifferences(item, listItem)
			if diff < bestDiff then
				-- each physical item can only be used once, the usedItems table has items we can't use in this search
				local key = string.format("%s_%s", tableType, k)
				if not usedItems[key] then
					bestLink = v
					bestItem = listItem
					bestDiff = diff
					bestLoc = string.format("%s_%s", tableType, k)
					found = true
				end
			end
			if found then break end
		end
	end
	
	return bestLink, bestItem, bestDiff, bestLoc
end

-- search the player's equipped gear, bag, bank, and void storage for an item that best matches the specified item
function Amr:FindMatchingItem(item, player, usedItems)
	if not item then return nil end

	local equipped = player.Equipped and player.Equipped[player.ActiveSpec] or nil
	local bestLink, bestItem, bestDiff, bestLoc = findMatchingItemFromTable(item, equipped, nil, nil, 1000, nil, usedItems, "equip")
	bestLink, bestItem, bestDiff, bestLoc = findMatchingItemFromTable(item, player.BagItems, bestLink, bestItem, bestDiff, bestLoc, usedItems, "bag")
	bestLink, bestItem, bestDiff, bestLoc = findMatchingItemFromTable(item, player.BankItems, bestLink, bestItem, bestDiff, bestLoc, usedItems, "bank")
	bestLink, bestItem, bestDiff, bestLoc = findMatchingItemFromTable(item, player.VoidItems, bestLink, bestItem, bestDiff, bestLoc, usedItems, "void")

	if bestDiff >= 1000 then
		return nil, nil, 1000
	else
		usedItems[bestLoc] = true
		return bestLink, bestItem, bestDiff
	end
end

local function renderEmptyGear(container)

	local panelBlank = AceGUI:Create("AmrUiPanel")
	panelBlank:SetLayout("None")
	panelBlank:SetBackgroundColor(Amr.Colors.Black, 0.4)
	panelBlank:SetPoint("TOPLEFT", container.content, "TOPLEFT", 6, 0)
	panelBlank:SetPoint("BOTTOMRIGHT", container.content, "BOTTOMRIGHT")
	container:AddChild(panelBlank)
	
	local lbl = AceGUI:Create("AmrUiLabel")
	lbl:SetText(L.GearBlank)
	lbl:SetWidth(700)
	lbl:SetJustifyH("MIDDLE")
	lbl:SetFont(Amr.CreateFont("Italic", 16, Amr.Colors.TextTan))		
	lbl:SetPoint("BOTTOM", panelBlank.content, "CENTER", 0, 20)
	panelBlank:AddChild(lbl)
	
	local lbl2 = AceGUI:Create("AmrUiLabel")
	lbl2:SetText(L.GearBlank2)
	lbl2:SetWidth(700)
	lbl2:SetJustifyH("MIDDLE")
	lbl2:SetFont(Amr.CreateFont("Italic", 16, Amr.Colors.TextTan))		
	lbl2:SetPoint("TOP", lbl.frame, "CENTER", 0, -20)
	panelBlank:AddChild(lbl2)
end

local function renderGear(spec, container)

	local player = Amr:ExportCharacter()
	local gear = Amr.db.char.GearSets[spec]
	local equipped = player.Equipped[player.ActiveSpec]
		
	if not gear then
		-- no gear has been imported for this spec so show a message
		renderEmptyGear(container)
	else
		local panelGear = AceGUI:Create("AmrUiPanel")
		panelGear:SetLayout("None")
		panelGear:SetBackgroundColor(Amr.Colors.Black, 0.3)
		panelGear:SetPoint("TOPLEFT", container.content, "TOPLEFT", 6, 0)
		panelGear:SetPoint("BOTTOMRIGHT", container.content, "BOTTOMRIGHT", -300, 0)
		container:AddChild(panelGear)
		
		local panelMods = AceGUI:Create("AmrUiPanel")
		panelMods:SetLayout("None")
		panelMods:SetPoint("TOPLEFT", panelGear.frame, "TOPRIGHT", 15, 0)
		panelMods:SetPoint("BOTTOMRIGHT", container.content, "BOTTOMRIGHT")
		panelMods:SetBackgroundColor(Amr.Colors.Black, 0.3)
		container:AddChild(panelMods)
		
		-- spec icon
		local icon = AceGUI:Create("AmrUiIcon")	
		icon:SetIconBorderColor(Amr.Colors.Classes[player.Class])
		icon:SetWidth(48)
		icon:SetHeight(48)
		
		local iconSpec
		if player.SubSpecs and player.SubSpecs[spec] then
			iconSpec = player.SubSpecs[spec]
		else
			iconSpec = player.Specs[spec]
		end

		icon:SetIcon("Interface\\Icons\\" .. Amr.SpecIcons[iconSpec])
		icon:SetPoint("TOPLEFT", panelGear.content, "TOPLEFT", 10, -10)
		panelGear:AddChild(icon)
		
		local btnEquip = AceGUI:Create("AmrUiButton")
		btnEquip:SetText(L.GearButtonEquip(L.SpecsShort[player.Specs[spec]]))
		btnEquip:SetBackgroundColor(Amr.Colors.Green)
		btnEquip:SetFont(Amr.CreateFont("Regular", 14, Amr.Colors.White))
		btnEquip:SetWidth(300)
		btnEquip:SetHeight(26)
		btnEquip:SetPoint("LEFT", icon.frame, "RIGHT", 40, 0)
		btnEquip:SetPoint("RIGHT", panelGear.content, "RIGHT", -40, 0)
		btnEquip:SetCallback("OnClick", function(widget)
			Amr:EquipGearSet(spec)			
		end)
		panelGear:AddChild(btnEquip)
		
		-- each physical item can only be used once, this tracks ones we have already used
		local usedItems = {}
		
		-- gear list
		local prevElem = icon
		for slotNum = 1, #Amr.SlotIds do
			local slotId = Amr.SlotIds[slotNum]
			
			local equippedItemLink = equipped and equipped[slotId] or nil
			local equippedItem = Amr.ParseItemLink(equippedItemLink)
			local optimalItem = gear[slotId]			
			local optimalItemLink = Amr.CreateItemLink(optimalItem)
			
			-- see if item is currently equipped, is false if don't have any item for that slot (e.g. OH for a 2-hander)
			local isEquipped = false			
			if equippedItem and optimalItem and Amr.GetItemUniqueId(equippedItem) == Amr.GetItemUniqueId(optimalItem) then
				isEquipped = true
			end
			
			-- find the item in the player's inventory that best matches what the optimization wants to use
			local matchItemLink, matchItem = Amr:FindMatchingItem(optimalItem, player, usedItems)
			
			-- slot label
			local lbl = AceGUI:Create("AmrUiLabel")
			lbl:SetText(Amr.SlotDisplayText[slotId])
			lbl:SetWidth(85)
			lbl:SetFont(Amr.CreateFont("Regular", 14, Amr.Colors.White))		
			lbl:SetPoint("TOPLEFT", prevElem.frame, "BOTTOMLEFT", 0, -12) 
			panelGear:AddChild(lbl)
			prevElem = lbl
			
			-- ilvl label
			local lblIlvl = AceGUI:Create("AmrUiLabel")
			lblIlvl:SetWidth(45)
			lblIlvl:SetFont(Amr.CreateFont("Italic", 14, Amr.Colors.TextTan))		
			lblIlvl:SetPoint("TOPLEFT", lbl.frame, "TOPRIGHT", 0, 0) 
			panelGear:AddChild(lblIlvl)
			
			-- equipped label
			local lblEquipped = AceGUI:Create("AmrUiLabel")
			lblEquipped:SetWidth(20)
			lblEquipped:SetFont(Amr.CreateFont("Regular", 14, Amr.Colors.White))
			lblEquipped:SetPoint("TOPLEFT", lblIlvl.frame, "TOPRIGHT", 0, 0) 
			lblEquipped:SetText(isEquipped and "E" or "")
			panelGear:AddChild(lblEquipped)
			
			-- item name/link label
			local lblItem = AceGUI:Create("AmrUiLabel")
			lblItem:SetWordWrap(false)
			lblItem:SetWidth(345)
			lblItem:SetFont(Amr.CreateFont(isEquipped and "Regular" or "Bold", isEquipped and 14 or 15, Amr.Colors.White))		
			lblItem:SetPoint("TOPLEFT", lblEquipped.frame, "TOPRIGHT", 0, 0) 
			panelGear:AddChild(lblItem)
			
			-- fill the name/ilvl labels, which may require asynchronous loading of item information
			if optimalItemLink then
				Amr.GetItemInfo(optimalItemLink, function(obj, name, link, quality, iLevel)					
					-- set item name, tooltip, and ilvl
					obj.nameLabel:SetText(link:gsub("%[", ""):gsub("%]", ""))
					
					-- not quite right but whatever... close enough
					if quality == 6 then
						local tmprel = optimalItem.relicBonusIds
						optimalItem.relicBonusIds = nil
						link = Amr.CreateItemLink(optimalItem)
						optimalItem.relicBonusIds = tmprel
					end
					
					Amr:SetItemTooltip(obj.nameLabel, link)
					
					-- the game's info gives the wrong item level, so we have to scan for it
					--iLevel = (quality ~= 6 or optimalItem.relicBonusIds) and Amr.GetItemLevel(nil, nil, link) or ""
					obj.ilvlLabel:SetText(iLevel)			
					
				end, { ilvlLabel = lblIlvl, nameLabel = lblItem })
			end
						
			-- modifications
			if optimalItem then
				local itemInfo = Amr.db.char.ExtraItemData[spec][optimalItem.id]

				-- gems
				if itemInfo and itemInfo.socketColors then
					local prevSocket = nil
					for i = 1, #itemInfo.socketColors do
						local g = optimalItem.gemIds[i]
						local isGemEquipped = g ~= 0 and matchItem and matchItem.gemIds and matchItem.gemIds[i] == g
						
						-- highlight for gem that doesn't match
						local socketBorder = AceGUI:Create("AmrUiPanel")
						socketBorder:SetLayout("None")
						socketBorder:SetBackgroundColor(Amr.Colors.Black, isGemEquipped and 0 or 1)
						socketBorder:SetWidth(26)
						socketBorder:SetHeight(26)
						if not prevSocket then
							socketBorder:SetPoint("LEFT", lblItem.frame, "RIGHT", 30, 0)
						else
							socketBorder:SetPoint("LEFT", prevSocket.frame, "RIGHT", 2, 0)
						end
						if isGemEquipped then
							socketBorder:SetAlpha(0.3)
						end
						panelMods:AddChild(socketBorder)
						
						local socketBg = AceGUI:Create("AmrUiIcon")
						socketBg:SetLayout("None")
						socketBg:SetBorderWidth(2)
						socketBg:SetIconBorderColor(Amr.Colors.Green, isGemEquipped and 0 or 1)
						socketBg:SetWidth(24)
						socketBg:SetHeight(24)
						socketBg:SetPoint("TOPLEFT", socketBorder.content, "TOPLEFT", 1, -1)
						socketBorder:AddChild(socketBg)
						
						local socketIcon = AceGUI:Create("AmrUiIcon")
						socketIcon:SetBorderWidth(1)
						socketIcon:SetIconBorderColor(Amr.Colors.White)
						socketIcon:SetWidth(18)
						socketIcon:SetHeight(18)
						socketIcon:SetPoint("CENTER", socketBg.content, "CENTER")
						socketBg:AddChild(socketIcon)
						
						-- get icon for optimized gem
						if g ~= 0 then
							local gemInfo = Amr.db.char.ExtraGemData[spec][g]
							if gemInfo then
								local gident = gemInfo.id
								if optimalItem.relicBonusIds then
									gident = Amr.CreateItemLink({ id = gemInfo.id, enchantId = 0, gemIds = {0,0,0,0}, suffixId = 0, bonusIds = optimalItem.relicBonusIds[i]})
								end
								Amr.GetItemInfo(gident, function(obj, name, link, quality, iLevel, reqLevel, class, subclass, maxStack, equipSlot, texture)					
									-- set icon and a tooltip
									obj:SetIcon(texture)
									Amr:SetItemTooltip(obj, link)
								end, socketIcon)
							end
						end
						
						prevSocket = socketBorder
					end
				end
				
				-- enchant
				if optimalItem.enchantId and optimalItem.enchantId ~= 0 then
					local isEnchantEquipped = matchItem and matchItem.enchantId and matchItem.enchantId == optimalItem.enchantId
					
					local lblEnchant = AceGUI:Create("AmrUiLabel")
					lblEnchant:SetWordWrap(false)
					lblEnchant:SetWidth(170)
					lblEnchant:SetFont(Amr.CreateFont(isEnchantEquipped and "Regular" or "Bold", 14, isEnchantEquipped and Amr.Colors.TextGray or Amr.Colors.White))
					lblEnchant:SetPoint("TOPLEFT", lblItem.frame, "TOPRIGHT", 130, 0)
					
					local enchInfo = Amr.db.char.ExtraEnchantData[spec][optimalItem.enchantId]
					if enchInfo then
						lblEnchant:SetText(enchInfo.text)
						
						Amr.GetItemInfo(enchInfo.itemId, function(obj, name, link)					
							Amr:SetItemTooltip(obj, link)
						end, lblEnchant)						
						--Amr:SetSpellTooltip(lblEnchant, enchInfo.spellId)
					end
					panelMods:AddChild(lblEnchant)
				end
			end
			
			prevElem = lbl
		end
	end
end

local function onGearTabSelected(container, event, group)
	container:ReleaseChildren()
	_activeTab = group
	renderGear(tonumber(group), container)
end

local function onImportClick(widget)
	Amr:ShowImportWindow()
end

-- renders the main UI for the Gear tab
function Amr:RenderTabGear(container)

	local btnImport = AceGUI:Create("AmrUiButton")
	btnImport:SetText(L.GearButtonImportText)
	btnImport:SetBackgroundColor(Amr.Colors.Orange)
	btnImport:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.White))
	btnImport:SetWidth(120)
	btnImport:SetHeight(26)
	btnImport:SetPoint("TOPLEFT", container.content, "TOPLEFT", 0, -81)
	btnImport:SetCallback("OnClick", onImportClick)
	container:AddChild(btnImport)	
	
	local lbl = AceGUI:Create("AmrUiLabel")
	lbl:SetText(L.GearImportNote)
	lbl:SetWidth(100)
	lbl:SetFont(Amr.CreateFont("Italic", 12, Amr.Colors.TextTan))
	lbl:SetJustifyH("MIDDLE")
	lbl:SetPoint("TOP", btnImport.frame, "BOTTOM", 0, -5)
	container:AddChild(lbl)
	
	local lbl2 = AceGUI:Create("AmrUiLabel")
	lbl2:SetText(L.GearTipTitle)
	lbl2:SetWidth(140)
	lbl2:SetFont(Amr.CreateFont("Italic", 20, Amr.Colors.Text))
	lbl2:SetJustifyH("MIDDLE")
	lbl2:SetPoint("TOP", lbl.frame, "BOTTOM", 0, -50)
	container:AddChild(lbl2)
	
	lbl = AceGUI:Create("AmrUiLabel")
	lbl:SetText(L.GearTipText)
	lbl:SetWidth(140)
	lbl:SetFont(Amr.CreateFont("Italic", 12, Amr.Colors.Text))
	lbl:SetJustifyH("MIDDLE")
	lbl:SetPoint("TOP", lbl2.frame, "BOTTOM", 0, -5)
	container:AddChild(lbl)
	
	lbl2 = AceGUI:Create("AmrUiLabel")
	lbl2:SetText(L.GearTipCommands)
	lbl2:SetWidth(130)
	lbl2:SetFont(Amr.CreateFont("Italic", 12, Amr.Colors.Text))
	lbl2:SetPoint("TOP", lbl.frame, "BOTTOM", 10, -5)
	container:AddChild(lbl2)
	
	local t =  AceGUI:Create("AmrUiTabGroup")
	t:SetLayout("None")
	
	local tabz = {}
	for pos = 1, 4 do
        local specId = GetSpecializationInfo(pos)
        if specId then
            table.insert(tabz, { text = L.SpecsShort[Amr.SpecIds[specId]], value = pos .. "", style = "bold" })
        end
	end
	
	t:SetTabs(tabz)
	t:SetCallback("OnGroupSelected", onGearTabSelected)
	t:SetPoint("TOPLEFT", container.content, "TOPLEFT", 144, -30)
	t:SetPoint("BOTTOMRIGHT", container.content, "BOTTOMRIGHT")
	container:AddChild(t)	
	_gearTabs = t;
	
	local btnShop = AceGUI:Create("AmrUiButton")
	btnShop:SetText(L.GearButtonShop)
	btnShop:SetBackgroundColor(Amr.Colors.Blue)
	btnShop:SetFont(Amr.CreateFont("Regular", 14, Amr.Colors.White))
	btnShop:SetWidth(245)
	btnShop:SetHeight(26)
	btnShop:SetPoint("TOPRIGHT", container.content, "TOPRIGHT", -20, -25)
	btnShop:SetCallback("OnClick", function(widget) Amr:ShowShopWindow() end)
	container:AddChild(btnShop)
	
	if not _activeTab then
		_activeTab = tostring(GetSpecialization())
	end
	
	t:SelectTab(_activeTab)
end

-- do cleanup when the gear tab is released
function Amr:ReleaseTabGear()
	_gearTabs = nil
end

-- show and update the gear tab for the specified spec
function Amr:ShowGearTab(spec)
	if not _gearTabs then return end
	
	_activeTab = tostring(spec)
	_gearTabs:SelectTab(_activeTab)
end

-- refresh display of the current gear tab
function Amr:RefreshGearTab()
	if not _gearTabs then return end
	_gearTabs:SelectTab(_activeTab)
end


------------------------------------------------------------------------------------------------
-- Gear Set Management
------------------------------------------------------------------------------------------------
local _waitingForSpec = 0
local _waitingForItemLock = nil
local _pendingEquip = nil
local _pendingRemove = nil

-- scan a bag for the best matching item
local function scanBagForItem(item, bagId, bestItem, bestDiff, bestLink)
	local numSlots = GetContainerNumSlots(bagId)
	for slotId = 1, numSlots do
		local _, _, _, _, _, _, itemLink = GetContainerItemInfo(bagId, slotId)
        -- we skip any stackable item, as far as we know, there is no equippable gear that can be stacked
		if itemLink then
			local bagItem = Amr.ParseItemLink(itemLink)
			if bagItem ~= nil then
				local diff = countItemDifferences(item, bagItem)
				if diff < bestDiff then
					bestItem = { bag = bagId, slot = slotId }
					bestDiff = diff
					bestLink = itemLink
				end
            end
		end
	end
	return bestItem, bestDiff, bestLink
end

local function onEquipGearSetComplete()
	if Amr.db.profile.options.disableEm then return end
	
	-- create an equipment manager set
	local specId, specName = GetSpecializationInfo(GetSpecialization())
	
	local item = Amr.ParseItemLink(GetInventoryItemLink("player", INVSLOT_MAINHAND))
	if not item or not Amr.ArtifactIdToSpecNumber[item.id] then
		item = Amr.ParseItemLink(GetInventoryItemLink("player", INVSLOT_OFFHAND))
		if item and not Amr.ArtifactIdToSpecNumber[item.id] then
			item = nil
		end
	end
	if item then
		Amr.GetItemInfo(item.id, function(customArg, name, link, quality, iLevel, reqLevel, class, subclass, maxStack, equipSlot, texture)
			SaveEquipmentSet("AMR " .. specName, texture)
		end)
	end
end

-- find the first empty slot in the player's backpack+bags
local function findFirstEmptyBagSlot()
	
	local bagIds = {}
	table.insert(bagIds, BACKPACK_CONTAINER)
	for bagId = 1, NUM_BAG_SLOTS do
		table.insert(bagIds, bagId)
	end
	
	for i, bagId in ipairs(bagIds) do
		local numSlots = GetContainerNumSlots(bagId)
		for slotId = 1, numSlots do
			local _, _, _, _, _, _, itemLink = GetContainerItemInfo(bagId, slotId)
			if not itemLink then
				return bagId, slotId
			end
		end
	end
	
	return nil, nil
end

local function finishEquipGearSet()
	if not _pendingEquip then return end
	
	_pendingEquip.tries = _pendingEquip.tries + 1
	if _pendingEquip.tries > 16 then
		-- too many tries, just give up (shouldn't happen but just to be safe)
		_pendingEquip = nil
	else
		-- start over again, trying any items that could not be equipped in the previous pass (unique constraints)
		Amr:EquipGearSet(_pendingEquip.spec)
	end
end

-- equip the next slot in a pending equip
local function tryEquipNextItem()
	if not _pendingEquip then return end
	
	local item = _pendingEquip.itemsToEquip[_pendingEquip.nextSlot]
	
	local bestItem = nil
	local bestLink = nil
	local bestDiff = 1000
	
	-- find the best matching item
	
	-- inventory
	bestItem, bestDiff, bestLink = scanBagForItem(item, BACKPACK_CONTAINER, bestItem, bestDiff, bestLink)
	for bagId = 1, NUM_BAG_SLOTS do
		bestItem, bestDiff, bestLink = scanBagForItem(item, bagId, bestItem, bestDiff, bestLink)
	end

	-- equipped items, but skip slots we have just equipped (to avoid e.g. just moving 2 of the same item back and forth between mh oh weapon slots)
	for slotNum = 1, #Amr.SlotIds do
		local slotId = Amr.SlotIds[slotNum]
		if not _pendingEquip.doneSlots[slotId] then
			local itemLink = GetInventoryItemLink("player", slotId)
			if itemLink then
				local invItem = Amr.ParseItemLink(itemLink)
				if invItem ~= nil then
					local diff = countItemDifferences(item, invItem)
					if diff < bestDiff then
						bestItem = { slot = slotId }
						bestDiff = diff
						bestLink = itemLink
					end
				end
			end
		end
	end
	
	-- bank
	bestItem, bestDiff, bestLink = scanBagForItem(item, BANK_CONTAINER, bestItem, bestDiff, bestLink)
	for bagId = NUM_BAG_SLOTS + 1, NUM_BAG_SLOTS + NUM_BANKBAGSLOTS do
		bestItem, bestDiff, bestLink = scanBagForItem(item, bagId, bestItem, bestDiff, bestLink)
	end
	
	ClearCursor()
	
	if not bestItem then
		-- stop if we can't find an item
		Amr:Print(L.GearEquipErrorNotFound)
		Amr:Print(L.GearEquipErrorNotFound2)
		_pendingEquip = nil
		return
		
	elseif bestItem and bestItem.bag and (bestItem.bag == BANK_CONTAINER or bestItem.bag >= NUM_BAG_SLOTS + 1 and bestItem.bag <= NUM_BAG_SLOTS + NUM_BANKBAGSLOTS) then
		-- find first empty bag slot
		local invBag, invSlot = findFirstEmptyBagSlot()
		if not invBag then
			-- stop if bags are too full
			Amr:Print(L.GearEquipErrorBagFull)
			_pendingEquip = nil
			return
		end

		-- move from bank to bag
		PickupContainerItem(bestItem.bag, bestItem.slot)
		PickupContainerItem(invBag, invSlot)

		-- set flag so that when we clear cursor and release the item lock, we can respond to the event and continue
		_waitingForItemLock = {
			bagId = invBag,
			slotId = invSlot
		}
		
		ClearCursor()
		
		-- now we need to wait for game event to continue and try this item again after it is in our bag
		return
	else
		if not Amr:CanEquip(bestItem.bag, bestItem.slot) then
			-- if an item is not soulbound, then warn the user and quit
			Amr:Print(L.GearEquipErrorSoulbound(bestLink))
			_pendingEquip = nil
			return
		else
			local slotId = _pendingEquip.nextSlot
			
			-- an item in the player's bags or already equipped, equip it
			_pendingEquip.bag = bestItem.bag
			_pendingEquip.slot = bestItem.slot
			_pendingEquip.destSlot = slotId
			
			if bestItem.bag then
				PickupContainerItem(bestItem.bag, bestItem.slot)
			else
				PickupInventoryItem(bestItem.slot)
			end
			PickupInventoryItem(slotId)
			ClearCursor()
			
			-- wait for game events to continue
		end
	end
	
end

local function removeNextItem()
	if not _pendingRemove then return end
	
	local list = _pendingRemove.slotsToRemove
	local slot = list[#list - _pendingRemove.remaining + 1]
	
	-- find first empty bag slot
	local invBag, invSlot = findFirstEmptyBagSlot()
	if not invBag then
		-- stop if bags are too full
		Amr:Print(L.GearEquipErrorBagFull)
		_pendingRemove = nil
		_pendingEquip = nil
		return
	end
	
	PickupInventoryItem(slot)
	PickupContainerItem(invBag, invSlot)
	
	-- set flag so that when we clear cursor and release the item lock, we can respond to the event and continue
	_waitingForItemLock = {
		bagId = invBag,
		slotId = invSlot,
		isRemove = true
	}
	
	ClearCursor()
end

local function onItemUnlocked(bagId, slotId)
	
	if _waitingForItemLock then
		-- waiting on a move from bank to bags to complete, or waiting on removing an item to complete, just continue as normal afterwards
		if bagId == _waitingForItemLock.bagId and slotId == _waitingForItemLock.slotId then
			local isremove = _waitingForItemLock.isRemove
			_waitingForItemLock = nil
			
			if isremove then
				_pendingRemove.remaining = _pendingRemove.remaining - 1
				if _pendingRemove.remaining > 0 then
					removeNextItem()
				else
					-- we have removed all items that we want to remove, now do the equip
					_pendingRemove = nil
					tryEquipNextItem()
				end
			else
				tryEquipNextItem()
			end
		end
		
	elseif _pendingEquip and _pendingEquip.destSlot then
		-- waiting on an item swap to complete successfully so that we can go on to the next item
		
		-- inventory slot we're swapping to is still locked, can't continue yet
		if IsInventoryItemLocked(_pendingEquip.destSlot) then return end

		if _pendingEquip.bag then
			local _, _, locked = GetContainerItemInfo(_pendingEquip.bag, _pendingEquip.slot)
			-- the bag slot we're swapping from is still locked, can't continue yet
			if locked then return end
		else
			-- inventory slot we're swapping from is still locked, can't continue yet
			if IsInventoryItemLocked(_pendingEquip.slot) then return end
		end
		
		-- move on to the next item, this item is done or could not be swapped
		
		local item = _pendingEquip.itemsToEquip[_pendingEquip.destSlot]
		local itemLink = GetInventoryItemLink("player", _pendingEquip.destSlot)
		if itemLink then
			local invItem = Amr.ParseItemLink(itemLink)
			if invItem ~= nil then	
				local diff = countItemDifferences(item, invItem)
				if diff == 0 then
					_pendingEquip.doneSlots[_pendingEquip.destSlot] = true
				end
			end
		end
		
		_pendingEquip.itemsToEquip[_pendingEquip.destSlot] = nil
		_pendingEquip.destSlot = nil
		_pendingEquip.bag = nil
		_pendingEquip.slot = nil
		
		_pendingEquip.remaining = _pendingEquip.remaining - 1
		if _pendingEquip.remaining > 0 then
			for slotId, item in pairs(_pendingEquip.itemsToEquip) do
				_pendingEquip.nextSlot = slotId
				break
			end
			tryEquipNextItem()
		else
			finishEquipGearSet()
		end
		
	end
end

local function startEquipGearSet(spec)

	local gear = Amr.db.char.GearSets[spec]
	if not gear then 
		Amr:Print(L.GearEquipErrorEmpty)
		return
	end
	
	local player = Amr:ExportCharacter()

	local itemsToEquip = {}
	local remaining = 0
	local usedItems = {}
	local firstSlot = nil
	
	-- check for items that need to be equipped
	for slotNum = 1, #Amr.SlotIds do
		local slotId = Amr.SlotIds[slotNum]
		
		local old = player.Equipped[spec][slotId]
		old = Amr.ParseItemLink(old)
		
		local new = gear[slotId]
		if new then
			local diff = countItemDifferences(old, new)
			if diff < 1000 then
				-- same item, see if inventory has one that is closer (e.g. a duplicate item with correct enchants/gems)
				local bestLink, bestItem, bestDiff = Amr:FindMatchingItem(new, player, usedItems)
				if bestDiff and bestDiff < diff then
					itemsToEquip[slotId] = new
					remaining = remaining + 1
				end
			else
				itemsToEquip[slotId] = new
				remaining = remaining + 1
			end
		end
	end

	if remaining > 0 then
		-- if this is not our first try, then remove weapons before starting
		local toRemove = {}
		local removesRemaining = 0
		if _pendingEquip and _pendingEquip.tries > 0 then
			for slotId, item in pairs(itemsToEquip) do
				if slotId == 16 or slotId == 17 then
					table.insert(toRemove, slotId)
					removesRemaining = removesRemaining + 1
				end
			end			
		end
		
		_pendingEquip = {
			tries = _pendingEquip and _pendingEquip.spec == spec and _pendingEquip.tries or 0,
			spec = spec,
			itemsToEquip = itemsToEquip,
			remaining = remaining,
			doneSlots = _pendingEquip and _pendingEquip.spec == spec and _pendingEquip.doneSlots or {},
			nextSlot = firstSlot
		}

		-- starting item
		for slotId, item in pairs(_pendingEquip.itemsToEquip) do
			_pendingEquip.nextSlot = slotId
			break
		end
		
		if removesRemaining > 0 then
			_pendingRemove = {
				slotsToRemove = toRemove,
				remaining = removesRemaining
			}
			removeNextItem()
		else
			tryEquipNextItem()
		end
	else
		_pendingEquip = nil
		onEquipGearSetComplete()
	end
end

local function onActiveTalentGroupChanged()

	local auto = Amr.db.profile.options.autoGear
	local currentSpec = GetSpecialization()
	
	if currentSpec == _waitingForSpec or auto then
		-- spec is what we want, now equip the gear
		startEquipGearSet(currentSpec)
	end
	
	_waitingForSpec = 0
end

-- activate the specified spec and then equip the saved gear set
function Amr:EquipGearSet(spec)
	
	-- if no argument, then cycle spec
	if not spec then
		spec = GetSpecialization() + 1
	end

	-- allow some flexibility in the arguments
	if spec == "1" or spec == "2" or spec == "3" or spec == "4" then spec = tonumber(spec) end

	local specId = GetSpecializationInfo(spec)
	if not specId then spec = 1 end
	
	if UnitAffectingCombat("player") then
		Amr:Print(L.GearEquipErrorCombat)
		return
	end
	
	_waitingForSpec = spec
	
	local currentSpec = GetSpecialization()
	if currentSpec ~= spec then
		SetSpecialization(spec)
	else
		onActiveTalentGroupChanged()
	end
end

-- moves any gear in bags to the bank if not part of main or off spec gear set
function Amr:CleanBags()
	-- TODO: implement
end

--[[
local function testfunc(message)
	print(strsub(message, 13))
end
]]

function Amr:InitializeGear()
	Amr:AddEventHandler("ACTIVE_TALENT_GROUP_CHANGED", onActiveTalentGroupChanged)

	--Amr:AddEventHandler("CHAT_MSG_CHANNEL", testfunc)
	
	Amr:AddEventHandler("UNIT_INVENTORY_CHANGED", function(unitID)
		if unitID and unitID ~= "player" then return end
		Amr:RefreshGearTab()
	end)

	Amr:AddEventHandler("ITEM_UNLOCKED", onItemUnlocked)
end