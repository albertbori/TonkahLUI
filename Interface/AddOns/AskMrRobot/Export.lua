local Amr = LibStub("AceAddon-3.0"):GetAddon("AskMrRobot")
local L = LibStub("AceLocale-3.0"):GetLocale("AskMrRobot", true)
local AceGUI = LibStub("AceGUI-3.0")

local _lastExport = nil
local _txt = nil

local function createLabel(container, text, width)
	local lbl = AceGUI:Create("AmrUiLabel")
	lbl:SetWidth(width or 800)
	lbl:SetText(text)
	lbl:SetFont(Amr.CreateFont("Regular", 14, Amr.Colors.Text))
	container:AddChild(lbl)
	return lbl
end

local function onSplashClose()
	Amr:HideCover()
	Amr.db.char.FirstUse = false
end

local function onTextChanged(widget)
	local val = _txt:GetText()
	if val == "overwolf-bib" then
		-- go to the gear tab, open import window, and show a cover
		Amr:ShowTab("Gear")
		Amr:ShowImportWindow(true)
	end
end

-- render a splash screen with first-time help
local function renderSplash(container)
	local panel = Amr:RenderCoverChrome(container, 700, 450)
	
	local lbl = createLabel(panel, L.ExportSplashTitle, 650)
	lbl:SetJustifyH("CENTER")
	lbl:SetFont(Amr.CreateFont("Bold", 24, Amr.Colors.TextHeaderActive))
	lbl:SetPoint("TOP", panel.content, "TOP", 0, -10)
	
	local lbl2 = createLabel(panel, L.ExportSplashSubtitle, 650)
	lbl2:SetJustifyH("CENTER")
	lbl2:SetFont(Amr.CreateFont("Bold", 18, Amr.Colors.TextTan))
	lbl2:SetPoint("TOP", lbl.frame, "BOTTOM", 0, -20)
	
	lbl = createLabel(panel, L.ExportSplash1, 650)
	lbl:SetFont(Amr.CreateFont("Regular", 14, Amr.Colors.Text))
	lbl:SetPoint("TOPLEFT", lbl2.frame, "BOTTOMLEFT", 0, -70)
	
	lbl2 = createLabel(panel, L.ExportSplash2, 650)
	lbl2:SetFont(Amr.CreateFont("Regular", 14, Amr.Colors.Text))
	lbl2:SetPoint("TOPLEFT", lbl.frame, "BOTTOMLEFT", 0, -15)
	
	lbl = createLabel(panel, L.ExportSplash3, 650)
	lbl:SetFont(Amr.CreateFont("Regular", 14, Amr.Colors.Text))
	lbl:SetPoint("TOPLEFT", lbl2.frame, "BOTTOMLEFT", 0, -15)

	lbl2 = createLabel(panel, L.ExportSplash4, 650)
	lbl2:SetFont(Amr.CreateFont("Regular", 14, Amr.Colors.Text))
	lbl2:SetPoint("TOPLEFT", lbl.frame, "BOTTOMLEFT", 0, -15)
	
	local btn = AceGUI:Create("AmrUiButton")
	btn:SetText(L.ExportSplashClose)
	btn:SetBackgroundColor(Amr.Colors.Green)
	btn:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.White))
	btn:SetWidth(120)
	btn:SetHeight(28)
	btn:SetPoint("BOTTOM", panel.content, "BOTTOM", 0, 20)
	btn:SetCallback("OnClick", onSplashClose)
	panel:AddChild(btn)
end

-- renders the main UI for the Export tab
function Amr:RenderTabExport(container)

	local lbl = createLabel(container, L.ExportTitle)
	lbl:SetFont(Amr.CreateFont("Bold", 24, Amr.Colors.TextHeaderActive))
	lbl:SetPoint("TOPLEFT", container.content, "TOPLEFT", 0, -40)
	
	local lbl2 = createLabel(container, L.ExportHelp1)
	lbl2:SetPoint("TOPLEFT", lbl.frame, "BOTTOMLEFT", 0, -10)
	
	lbl = createLabel(container, L.ExportHelp2)
	lbl:SetPoint("TOPLEFT", lbl2.frame, "BOTTOMLEFT", 0, -10)
	
	lbl2 = createLabel(container, L.ExportHelp3)
	lbl2:SetPoint("TOPLEFT", lbl.frame, "BOTTOMLEFT", 0, -10)
	
	_txt = AceGUI:Create("AmrUiTextarea")
	_txt:SetWidth(800)
	_txt:SetHeight(300)
	_txt:SetPoint("TOP", lbl2.frame, "BOTTOM", 0, -20)
	_txt:SetFont(Amr.CreateFont("Regular", 12, Amr.Colors.Text))
	_txt:SetCallback("OnTextChanged", onTextChanged)
	container:AddChild(_txt)
	
	local data = self:ExportCharacter()	
	local txt = Amr.Serializer:SerializePlayerData(data, true)
	_txt:SetText(txt)
	_txt:SetFocus(true)
	
	-- update shopping list data
	Amr:UpdateShoppingData(data)
	
	-- show help splash if first time a user is using this
	if Amr.db.char.FirstUse then
		Amr:ShowCover(renderSplash)	
		AceGUI:ClearFocus()
	end
end

function Amr:ReleaseTabExport()
end

function Amr:GetExportText()
	return _txt:GetText()
end


-- use some local variables to deal with the fact that a user can close the bank before a scan completes
local _lastBankBagId = nil
local _lastBankSlotId = nil

local function scanBag(bagId, isBank, bagTable, bagItemsWithCount)
	local numSlots = GetContainerNumSlots(bagId)
	for slotId = 1, numSlots do
		local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(bagId, slotId)
		if itemLink ~= nil then
			local itemData = Amr.Serializer.ParseItemLink(itemLink)
			if itemData ~= nil then
			
				-- only add equippable items to bag data
				--if IsEquippableItem(itemLink) or Amr.SetTokenIds[itemData.id] then
	                if isBank then
                    	_lastBankBagId = bagId
                    	_lastBankSlotId = slotId
                	end
										
                	table.insert(bagTable, itemLink)
                --end
				
				-- all items and counts, used for e.g. shopping list and reagents, etc.
                if bagItemsWithCount then
                	if bagItemsWithCount[itemData.id] then
                		bagItemsWithCount[itemData.id] = bagItemsWithCount[itemData.id] + itemCount
                	else
                		bagItemsWithCount[itemData.id] = itemCount
                	end
                end
            end
		end
	end
end

-- get the player's current gear and save it, also returns the data from GetPlayerData for efficiency
local function getEquipped()
	local data = Amr.Serializer:GetPlayerData()
	local spec = GetSpecialization()
	
	Amr.db.char.Equipped[spec] = data.Equipped[spec]
	
	return data
end

local function scanBags()

	local bagItems = {}
	local itemsAndCounts = {}
	
	scanBag(BACKPACK_CONTAINER, false, bagItems, itemsAndCounts) -- backpack
	for bagId = 1, NUM_BAG_SLOTS do
		scanBag(bagId, false, bagItems, itemsAndCounts)
	end
	
	Amr.db.char.BagItems = bagItems
	Amr.db.char.BagItemsAndCounts = itemsAndCounts
end

-- scan the player's bank and save the contents, must be at the bank
local function scanBank()

	local bankItems = {}
	local itemsAndCounts = {}

	scanBag(BANK_CONTAINER, true, bankItems, itemsAndCounts)
	scanBag(REAGENTBANK_CONTAINER, true, bankItems, itemsAndCounts)
	for bagId = NUM_BAG_SLOTS + 1, NUM_BAG_SLOTS + NUM_BANKBAGSLOTS do
		scanBag(bagId, true, bankItems, itemsAndCounts)
	end
	
	-- see if the scan completed before the window closed, otherwise we don't overwrite with partial data
	if _lastBankBagId ~= nil then
		local itemLink = GetContainerItemLink(_lastBankBagId, _lastBankSlotId)
		if itemLink ~= nil then --still open
            Amr.db.char.BankItems = bankItems
            Amr.db.char.BankItemsAndCounts = itemsAndCounts
		end
	end

end

-- scan the player's void storage and save the contents, must be at void storage
local function scanVoid()

	if IsVoidStorageReady() then
		local voidItems = {}
		local VOID_STORAGE_MAX = 80
		local VOID_STORAGE_PAGES = 2
        
		for page = 1,VOID_STORAGE_PAGES do
			for i = 1,VOID_STORAGE_MAX do
				local itemId = GetVoidItemInfo(page, i)
				if itemId then
					local itemLink = GetVoidItemHyperlinkString(((page - 1) * VOID_STORAGE_MAX) + i);
					if itemLink then
						tinsert(voidItems, itemLink)
					end
				end
			end
		end
        
		Amr.db.char.VoidItems = voidItems
	end
	
end

local function getRepStanding(factionId)
    local name, description, standingId, _ = GetFactionInfoByID(factionId)
    return standingId - 1; -- our rep enum correspond to what the armory returns, are 1 less than what the game returns
end

local function getReputations()
    local reps = {}
    
    local repList = {1375,1376,1270,1269,1341,1337,1387,1388,1435}
    for i, repId in pairs(repList) do
        local standing = getRepStanding(repId)
        if standing >= 0 then
            reps[repId] = standing
        end
    end
    
    return reps
end

local function scanTalents()	
	local specPos = GetSpecialization()	
	if not specPos or specPos < 1 or specPos > 4 then return end
	
	local talentInfo = {}
    local maxTiers = 7
    for tier = 1, maxTiers do
        for col = 1, 3 do
            local id, name, _, _, _, spellId, _, t, c, selected = GetTalentInfoBySpecialization(specPos, tier, col)
            if selected then
                talentInfo[tier] = col
            end
        end
    end
    
    local str = ""
    for i = 1, maxTiers do
    	if talentInfo[i] then
    		str = str .. talentInfo[i]
    	else
    		str = str .. '0'
    	end
    end
	
	Amr.db.char.Talents[specPos] = str
end

local function scanArtifact()
	if not Amr.db or not Amr.db.char or not Amr.db.char.Artifacts then return end
	
	local powers = C_ArtifactUI.GetPowers()
	if not powers then return end
	
	local powerRanks = {}
	for k,v in pairs(powers) do
		local spellId, cost, rank, maxRank, relicRank = C_ArtifactUI.GetPowerInfo(v)
		if rank - relicRank > 0 then
			powerRanks[v] = rank - relicRank
		end
	end
	
	local relicInfo = {}
	for i = 1,3 do
		local _, _, _, link = C_ArtifactUI.GetRelicInfo(i);
		table.insert(relicInfo, link or "")
	end
	
	-- make sure that the artifact UI didn't get closed while we were reading it, GetPowers seems to return nil unless it is open
	powers = C_ArtifactUI.GetPowers()
	if not powers then return end
	
	-- use the artifact item ID to figure out which spec this is for, since you can open your artifact on any spec
	local itemID = C_ArtifactUI.GetArtifactInfo()	
	local spec = Amr.ArtifactIdToSpecNumber[itemID]	
	--local spec = GetSpecialization()
	
	if spec then
		Amr.db.char.Artifacts[spec] = {
			Powers = powerRanks,
			Relics = relicInfo
		}
	end
end

-- Returns a data object containing all information about the current player needed for an export:
-- gear, spec, reputations, bag, bank, and void storage items.
function Amr:ExportCharacter()
	
	local data = getEquipped()
	scanBags()
	
	-- scan current spec's talents just before exporting
	scanTalents()
	
	data.Talents = Amr.db.char.Talents
	data.Artifacts = Amr.db.char.Artifacts
	data.Equipped = Amr.db.char.Equipped
	data.Reputations = getReputations()
	data.BagItems = Amr.db.char.BagItems
	data.BankItems = Amr.db.char.BankItems
	data.VoidItems = Amr.db.char.VoidItems
	
	return data
end

function Amr:InitializeExport()
	Amr:AddEventHandler("UNIT_INVENTORY_CHANGED", function(unitID)
		if unitID and unitID ~= "player" then return end
		getEquipped()
	end)
end

Amr:AddEventHandler("BANKFRAME_OPENED", scanBank)
Amr:AddEventHandler("PLAYERBANKSLOTS_CHANGED", scanBank)

Amr:AddEventHandler("VOID_STORAGE_OPEN", scanVoid)
Amr:AddEventHandler("VOID_STORAGE_CONTENTS_UPDATE", scanVoid)
Amr:AddEventHandler("VOID_STORAGE_DEPOSIT_UPDATE", scanVoid)
Amr:AddEventHandler("VOID_STORAGE_UPDATE", scanVoid)

Amr:AddEventHandler("PLAYER_TALENT_UPDATE", scanTalents)
Amr:AddEventHandler("ARTIFACT_UPDATE", scanArtifact)
