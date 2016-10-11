SLASH_EquipmentBuddy1 = "/eb";
SLASH_EquipmentBuddy2 = "/equipmentbuddy";
local function handler(msg, editbox)
	if (msg=="off") then
		ebenable = false
		DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r |cffff0000Off|r")
		myCheckButton_GlobalName:SetChecked(false)
	
	elseif (msg=="on") then
		ebenable = true
		DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r |cff00ff00On|r")
		myCheckButton_GlobalName:SetChecked(true)
		
	elseif (msg=="reequip off") then
		ebfishingmode = false
		DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r Re-equip mode |cffff0000Off|r")
		myCheckButton_GlobalName2:SetChecked(false)
	
	elseif (msg=="reequip on") then
		ebfishingmode = true
		DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r Re-equip mode |cff00ff00On|r")
		myCheckButton_GlobalName2:SetChecked(true)

	elseif (msg=="pvp off") then
		ebpvpmode = nil
		DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r PvP mode |cffff0000Off|r")
		myCheckButton_GlobalName4:SetChecked(false)
	
	elseif (msg=="pvp on") then
		ebpvpmode = true
		DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r PvP mode |cff00ff00On|r")
		myCheckButton_GlobalName4:SetChecked(true)	
	
	elseif (msg=="jousting off") then
		ebjoustingmode = nil
		DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r Jousting mode |cffff0000Off|r")
		myCheckButton_GlobalName5:SetChecked(false)
	
	elseif (msg=="jousting on") then
		ebjoustingmode = true
		DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r Jousting mode |cff00ff00On|r")
		myCheckButton_GlobalName5:SetChecked(true)

	elseif (msg=="spec off") then
		ebspecmode = nil
		DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r Spec switching mode |cffff0000Off|r")
		myCheckButton_GlobalName6:SetChecked(false)
	
	elseif (msg=="spec on") then
		ebspecmode = true
		DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r Spec switching mode |cff00ff00On|r")
		myCheckButton_GlobalName6:SetChecked(true)
	
	elseif (msg=="instance off") then
		ebinstance = false
		DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r Instance mode |cffff0000Off|r")
		myCheckButton_GlobalName7:SetChecked(false)
	
	elseif (msg=="instance on") then
		ebinstance = true
		DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r Instance mode |cff00ff00On|r")
		myCheckButton_GlobalName7:SetChecked(true)
	
	elseif (msg=="combat off") then
		ebcombat = false
		DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r Combat mode |cffff0000Off|r")
		myCheckButton_GlobalName8:SetChecked(false)
	
	elseif (msg=="combat on") then
		ebcombat = true
		DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r Combat mode |cff00ff00On|r")
		myCheckButton_GlobalName8:SetChecked(true)
	
	elseif (msg =="" or msg == "help") then
		InterfaceOptionsFrame_OpenToCategory(EquipmentBuddyOptions.panel)
		InterfaceOptionsFrame_OpenToCategory(EquipmentBuddyOptions.panel) -- Cuz the first call doesn't seem to do it
	end
end
SlashCmdList["EquipmentBuddy"] = handler;


EquipmentBuddyOptions = {};
EquipmentBuddyOptions.panel = CreateFrame( "Frame", "MyAddonPanel", UIParent );
EquipmentBuddyOptions.panel.name = "EquipmentBuddy";
InterfaceOptions_AddCategory(EquipmentBuddyOptions.panel);
 
local Title = EquipmentBuddyOptions.panel:CreateFontString("Title", "ARTWORK", "GameFontNormalLarge")
Title:SetPoint("TOPLEFT", EquipmentBuddyOptions.panel, "TOPLEFT", 10, -10)
Title:SetText("EquipmentBuddy")

local PvPTitle = EquipmentBuddyOptions.panel:CreateFontString("PvPTitle", "ARTWORK", "GameFontGreenLarge")
PvPTitle:SetPoint("TOPLEFT", EquipmentBuddyOptions.panel, "TOPLEFT", 210, -170)
PvPTitle:SetText("BattleGround/Arena Sets")

local PvETitle = EquipmentBuddyOptions.panel:CreateFontString("PvETitle", "ARTWORK", "GameFontGreenLarge")
PvETitle:SetPoint("TOPLEFT", EquipmentBuddyOptions.panel, "TOPLEFT", 210, -40)
PvETitle:SetText("Dungeon/Raid Sets")

local Tree1 = EquipmentBuddyOptions.panel:CreateFontString("Tree1", "ARTWORK", "GameFontNormal")
Tree1:SetPoint("RIGHT", EquipmentBuddyOptions.panel, "RIGHT", -300, 210)

local Tree2 = EquipmentBuddyOptions.panel:CreateFontString("Tree2", "ARTWORK", "GameFontNormal")
Tree2:SetPoint("RIGHT", EquipmentBuddyOptions.panel, "RIGHT", -170, 210)

local Tree3 = EquipmentBuddyOptions.panel:CreateFontString("Tree3", "ARTWORK", "GameFontNormal")
Tree3:SetPoint("RIGHT", EquipmentBuddyOptions.panel, "RIGHT", -300, 165)

local Tree4 = EquipmentBuddyOptions.panel:CreateFontString("Tree4", "ARTWORK", "GameFontNormal")
Tree4:SetPoint("RIGHT", EquipmentBuddyOptions.panel, "RIGHT", -170, 165)

local Tree1pvp = EquipmentBuddyOptions.panel:CreateFontString("Tree1pvp", "ARTWORK", "GameFontNormal")
Tree1pvp:SetPoint("RIGHT", EquipmentBuddyOptions.panel, "RIGHT", -300, 80)

local Tree2pvp = EquipmentBuddyOptions.panel:CreateFontString("Tree2pvp", "ARTWORK", "GameFontNormal")
Tree2pvp:SetPoint("RIGHT", EquipmentBuddyOptions.panel, "RIGHT", -170, 80)

local Tree3pvp = EquipmentBuddyOptions.panel:CreateFontString("Tree3pvp", "ARTWORK", "GameFontNormal")
Tree3pvp:SetPoint("RIGHT", EquipmentBuddyOptions.panel, "RIGHT", -300, 35)

local Tree4pvp = EquipmentBuddyOptions.panel:CreateFontString("Tree4pvp", "ARTWORK", "GameFontNormal")
Tree4pvp:SetPoint("RIGHT", EquipmentBuddyOptions.panel, "RIGHT", -170, 35)

local Cook = EquipmentBuddyOptions.panel:CreateFontString("Cook", "ARTWORK", "GameFontNormal")
Cook:SetPoint("RIGHT", EquipmentBuddyOptions.panel, "RIGHT", -300, -50)
Cook:SetText("Cooking Set")

local Pet = EquipmentBuddyOptions.panel:CreateFontString("Pet", "ARTWORK", "GameFontNormal")
Pet:SetPoint("RIGHT", EquipmentBuddyOptions.panel, "RIGHT", -170, -50)
Pet:SetText("Cooking Pet")

local function TitleText(self, ...)
local primarySpec = GetSpecialization(false, false, 1)
local secondarySpec = GetSpecialization(false, false, 2)

local numspecs = GetNumSpecializations()
	
	for i = 1, numspecs do
			local id, name, description, icon, background, role = GetSpecializationInfo(i)

		if i == 1 then
			Tree1:SetText(format("|T%s:16|t%s Set", icon, name))
			Tree1pvp:SetText(format("|T%s:16|t%s Set", icon, name))
		elseif i == 2 then
			Tree2:SetText(format("|T%s:16|t%s Set", icon, name))
			Tree2pvp:SetText(format("|T%s:16|t%s Set", icon, name))
		elseif i == 3 then
			Tree3:SetText(format("|T%s:16|t%s Set", icon, name))
			Tree3pvp:SetText(format("|T%s:16|t%s Set", icon, name))
		elseif i == 4 then
			Tree4:SetText(format("|T%s:16|t%s Set", icon, name))
			Tree4pvp:SetText(format("|T%s:16|t%s Set", icon, name))
		end
	end
end

EquipmentBuddyOptions.panel:SetScript("OnUpdate", TitleText)

local myCheckButton = CreateFrame("CheckButton", "myCheckButton_GlobalName", EquipmentBuddyOptions.panel, "ChatConfigCheckButtonTemplate");
myCheckButton:SetPoint("TOPLEFT", 20, -30);
myCheckButton_GlobalNameText:SetText("Enable");
myCheckButton.tooltip = "This will enable or disable all equipment swaps.";
 
 myCheckButton:SetScript("OnClick", 
  function()
    if myCheckButton:GetChecked() then
	ebenable = true
	else
	ebenable = false
	end
  end)

local myCheckButton2 = CreateFrame("CheckButton", "myCheckButton_GlobalName2", EquipmentBuddyOptions.panel, "ChatConfigCheckButtonTemplate");
myCheckButton2:SetPoint("TOPLEFT", 20, -60);
myCheckButton_GlobalName2Text:SetText("Enable Re-equips");
myCheckButton2.tooltip = "If enabled this will restore your last set before the swap. Useful for re-equipping sets such as fishing or vanity.";
 
 myCheckButton2:SetScript("OnClick", 
  function()
    if myCheckButton2:GetChecked() then
	ebfishingmode = true
	else
	ebfishingmode = false
	end
  end)  

local myCheckButton3 = CreateFrame("CheckButton", "myCheckButton_GlobalName3", EquipmentBuddyOptions.panel, "ChatConfigCheckButtonTemplate");
myCheckButton3:SetPoint("TOPRIGHT", -405, -300);
myCheckButton_GlobalName3Text:SetText("Enable Cooking");
myCheckButton3.tooltip = "This will enable or disable using the cooking set.";
 
 myCheckButton3:SetScript("OnClick", 
  function()
    if myCheckButton3:GetChecked() then
	ebcooking = true
	UIDropDownMenu_EnableDropDown(Cookset)
	UIDropDownMenu_EnableDropDown(Cookpet)
	else
	ebcooking = false
	UIDropDownMenu_DisableDropDown(Cookset)
	UIDropDownMenu_DisableDropDown(Cookpet)
	end
  end)
 
local myCheckButton4 = CreateFrame("CheckButton", "myCheckButton_GlobalName4", EquipmentBuddyOptions.panel, "ChatConfigCheckButtonTemplate");
myCheckButton4:SetPoint("TOPLEFT", 20, -90);
myCheckButton_GlobalName4Text:SetText("Enable PvP mode");
myCheckButton4.tooltip = "If enabled this will make your BG/Arena sets your preferred sets for talent changes and world combat instead of Dungeon/Raid.";
 
 myCheckButton4:SetScript("OnClick", 
  function()
    if myCheckButton4:GetChecked() then
	ebpvpmode = true
	else
	ebpvpmode = nil
	end
  end)

local myCheckButton5 = CreateFrame("CheckButton", "myCheckButton_GlobalName5", EquipmentBuddyOptions.panel, "ChatConfigCheckButtonTemplate");
myCheckButton5:SetPoint("TOPLEFT", 20, -120);
myCheckButton_GlobalName5Text:SetText("Enable Jousting");
myCheckButton5.tooltip = "If enabled this will Autoequip lances for jousting.";
 
 myCheckButton5:SetScript("OnClick", 
  function()
    if myCheckButton5:GetChecked() then
	ebjoustingmode = true
	else
	ebjoustingmode = nil
	end
  end)
 
local myCheckButton6 = CreateFrame("CheckButton", "myCheckButton_GlobalName6", EquipmentBuddyOptions.panel, "ChatConfigCheckButtonTemplate");
myCheckButton6:SetPoint("TOPLEFT", 20, -150);
myCheckButton_GlobalName6Text:SetText("Enable Spec Switching");
myCheckButton6.tooltip = "If enabled this will change sets when you switch talent specs.";
 
 myCheckButton6:SetScript("OnClick", 
  function()
    if myCheckButton6:GetChecked() then
	ebspecmode = true
	else
	ebspecmode = nil
	end
  end) 

local myCheckButton7 = CreateFrame("CheckButton", "myCheckButton_GlobalName7", EquipmentBuddyOptions.panel, "ChatConfigCheckButtonTemplate");
myCheckButton7:SetPoint("TOPLEFT", 20, -180);
myCheckButton_GlobalName7Text:SetText("Enable Instance Swaps");
myCheckButton7.tooltip = "If enabled this will change sets when you zone into an instance such as a dungeon or battle ground.";
 
 myCheckButton7:SetScript("OnClick", 
  function()
    if myCheckButton7:GetChecked() then
	ebinstance = true
	else
	ebinstance = false
	end
  end)
  
local myCheckButton8 = CreateFrame("CheckButton", "myCheckButton_GlobalName8", EquipmentBuddyOptions.panel, "ChatConfigCheckButtonTemplate");
myCheckButton8:SetPoint("TOPLEFT", 20, -210);
myCheckButton_GlobalName8Text:SetText("Enable Combat Swaps");
myCheckButton8.tooltip = "If enabled this will change sets when you enter combat with a fishing pole or other similar non combat items.";
 
 myCheckButton8:SetScript("OnClick", 
  function()
    if myCheckButton8:GetChecked() then
	ebcombat = true
	else
	ebcombat = false
	end
  end)
  
local info = {}
 --First Dropdown 
local function SetSelection(button, arg1, arg2)
	UIDropDownMenu_SetText(Mydropdown, arg2)
	ebname = arg2
end 
local Mydropdown = CreateFrame("Frame", "Mydropdown", EquipmentBuddyOptions.panel, "UIDropDownMenuTemplate")
Mydropdown.initialize = function(self, level) end
Mydropdown:SetPoint("TOPRIGHT", -405, -80);

Mydropdown.initialize = function(self, level)
  
	
	if not level then return end
    wipe(info)
    if level == 1 then
		info.text = "None"
		--info.icon = icon
		info.func = SetSelection 
		--info.arg1 = i
		info.arg2 = nil
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		for i = 1, GetNumEquipmentSets() do
		local name, icon, setID, isEquipped, totalItems, equippedItems, inventoryItems, missingItems, ignoredSlots = GetEquipmentSetInfo(i)
		info.text = name
		info.icon = icon
		info.func = SetSelection 
		info.arg1 = i
		info.arg2 = name
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		end
    end
end

--Second Dropdown
local function SecondarySelection(button, arg1, arg2)
	UIDropDownMenu_SetText(Secondary, arg2)
	ebname2 = arg2
end 

local Secondary = CreateFrame("Frame", "Secondary", EquipmentBuddyOptions.panel, "UIDropDownMenuTemplate")
Secondary.initialize = function(self, level) end
Secondary:SetPoint("TOPRIGHT", -275, -80);

Secondary.initialize = function(self, level)
  
	
	if not level then return end
    wipe(info)
    if level == 1 then
		info.text = "None"
		--info.icon = icon
		info.func = SecondarySelection 
		--info.arg1 = i
		info.arg2 = nil
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		for i = 1, GetNumEquipmentSets() do
		local name, icon, setID, isEquipped, totalItems, equippedItems, inventoryItems, missingItems, ignoredSlots = GetEquipmentSetInfo(i)
		info.text = name
		info.icon = icon
		info.func = SecondarySelection 
		info.arg1 = i
		info.arg2 = name
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		end
    end
end

--Third dropdown
local function CookSelection(button, arg1, arg2)
	UIDropDownMenu_SetText(Cookset, arg2)
	ebcookingname = arg2
end 

local Cookset = CreateFrame("Frame", "Cookset", EquipmentBuddyOptions.panel, "UIDropDownMenuTemplate")
Cookset.initialize = function(self, level) end
Cookset:SetPoint("TOPRIGHT", -405, -340);

Cookset.initialize = function(self, level)
  
	
	if not level then return end
    wipe(info)
    if level == 1 then
		info.text = "None"
		--info.icon = icon
		info.func = CookSelection 
		--info.arg1 = i
		info.arg2 = nil
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		for i = 1, GetNumEquipmentSets() do
		local name, icon, setID, isEquipped, totalItems, equippedItems, inventoryItems, missingItems, ignoredSlots = GetEquipmentSetInfo(i)
		info.text = name
		info.icon = icon
		info.func = CookSelection 
		info.arg1 = i
		info.arg2 = name
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		end
    end
end

--Fourth dropdown
local function PetSelection(button, arg1, arg2)
	UIDropDownMenu_SetText(Cookpet, arg2)
	ebpetname = arg2
	ebpetID = arg1
end 

local Cookpet = CreateFrame("Frame", "Cookpet", EquipmentBuddyOptions.panel, "UIDropDownMenuTemplate")
Cookpet.initialize = function(self, level) end
Cookpet:SetPoint("TOPRIGHT", -275, -340);

Cookpet.initialize = function(self, level)
  local numPets, numOwned = C_PetJournal.GetNumPets(false)
	
	if not level then return end
    wipe(info)
    if level == 1 then
		info.text = "None"
		--info.icon = icon
		info.func = PetSelection 
		--info.arg1 = i
		info.arg2 = nil
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		
		for i = 1, numOwned do
		local petID, speciesID, isOwned, customName, petlevel, favorite, isRevoked, name, icon, petType, companionID, tooltipinfo, description, isWild, canBattle, isTradeable, isUnique, obtainable = C_PetJournal.GetPetInfoByIndex(i)
		if companionID == 51600 or companionID == 70082 --[[or companionID == 36911]] then
		info.text = name
		info.icon = icon
		info.func = PetSelection 
		info.arg1 = petID
		info.arg2 = name
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		end
		end
    end
end

 --Fifth Dropdown 
local function FifthSelection(button, arg1, arg2)
	UIDropDownMenu_SetText(Fifth, arg2)
	ebpvpname = arg2
end 
local Fifth = CreateFrame("Frame", "Fifth", EquipmentBuddyOptions.panel, "UIDropDownMenuTemplate")
Fifth.initialize = function(self, level) end
Fifth:SetPoint("TOPRIGHT", -405, -210);

Fifth.initialize = function(self, level)
  
	
	if not level then return end
    wipe(info)
    if level == 1 then
		info.text = "None"
		--info.icon = icon
		info.func = FifthSelection 
		--info.arg1 = i
		info.arg2 = nil
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		for i = 1, GetNumEquipmentSets() do
		local name, icon, setID, isEquipped, totalItems, equippedItems, inventoryItems, missingItems, ignoredSlots = GetEquipmentSetInfo(i)
		info.text = name
		info.icon = icon
		info.func = FifthSelection 
		info.arg1 = i
		info.arg2 = name
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		end
    end
end

local function SixthSelection(button, arg1, arg2)
	UIDropDownMenu_SetText(Sixth, arg2)
	ebpvpname2 = arg2
end 

--Sixth Dropdown
local Sixth = CreateFrame("Frame", "Sixth", EquipmentBuddyOptions.panel, "UIDropDownMenuTemplate")
Sixth.initialize = function(self, level) end
Sixth:SetPoint("TOPRIGHT", -275, -210);

Sixth.initialize = function(self, level)
  
	
	if not level then return end
    wipe(info)
    if level == 1 then
		info.text = "None"
		--info.icon = icon
		info.func = SixthSelection 
		--info.arg1 = i
		info.arg2 = nil
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		for i = 1, GetNumEquipmentSets() do
		local name, icon, setID, isEquipped, totalItems, equippedItems, inventoryItems, missingItems, ignoredSlots = GetEquipmentSetInfo(i)
		info.text = name
		info.icon = icon
		info.func = SixthSelection 
		info.arg1 = i
		info.arg2 = name
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		end
    end
end

local function SeventhSelection(button, arg1, arg2)
	UIDropDownMenu_SetText(Seventh, arg2)
	ebname3 = arg2
end

local unitClass, englishClass = UnitClass("player")

if englishClass ~= "DEMONHUNTER" then --Demon Hunters only have 2 specs

--Seventh Dropdown
local Seventh = CreateFrame("Frame", "Seventh", EquipmentBuddyOptions.panel, "UIDropDownMenuTemplate")
Seventh.initialize = function(self, level) end
Seventh:SetPoint("TOPRIGHT", -405, -125);

Seventh.initialize = function(self, level)
  
	
	if not level then return end
    wipe(info)
    if level == 1 then
		info.text = "None"
		--info.icon = icon
		info.func = SeventhSelection 
		--info.arg1 = i
		info.arg2 = nil
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		for i = 1, GetNumEquipmentSets() do
		local name, icon, setID, isEquipped, totalItems, equippedItems, inventoryItems, missingItems, ignoredSlots = GetEquipmentSetInfo(i)
		info.text = name
		info.icon = icon
		info.func = SeventhSelection 
		info.arg1 = i
		info.arg2 = name
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		end
    end
end
end

local function EighthSelection(button, arg1, arg2)
	UIDropDownMenu_SetText(Eighth, arg2)
	ebname4 = arg2
end
local unitClass, englishClass = UnitClass("player")

if englishClass == "DRUID" then --Only Druid has 4th spec
--Eighth Dropdown
local Eighth = CreateFrame("Frame", "Eighth", EquipmentBuddyOptions.panel, "UIDropDownMenuTemplate")
Eighth.initialize = function(self, level) end
Eighth:SetPoint("TOPRIGHT", -275, -125);

Eighth.initialize = function(self, level)
  
	
	if not level then return end
    wipe(info)
    if level == 1 then
		info.text = "None"
		--info.icon = icon
		info.func = EighthSelection 
		--info.arg1 = i
		info.arg2 = nil
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		for i = 1, GetNumEquipmentSets() do
		local name, icon, setID, isEquipped, totalItems, equippedItems, inventoryItems, missingItems, ignoredSlots = GetEquipmentSetInfo(i)
		info.text = name
		info.icon = icon
		info.func = EighthSelection 
		info.arg1 = i
		info.arg2 = name
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		end
    end
end
end

local function NinthSelection(button, arg1, arg2)
	UIDropDownMenu_SetText(Ninth, arg2)
	ebpvpname3 = arg2
end

local unitClass, englishClass = UnitClass("player")

if englishClass ~= "DEMONHUNTER" then --Demon Hunters only have 2 specs

--Ninth Dropdown
local Ninth = CreateFrame("Frame", "Ninth", EquipmentBuddyOptions.panel, "UIDropDownMenuTemplate")
Ninth.initialize = function(self, level) end
Ninth:SetPoint("TOPRIGHT", -405, -255);

Ninth.initialize = function(self, level)
  
	
	if not level then return end
    wipe(info)
    if level == 1 then
		info.text = "None"
		--info.icon = icon
		info.func = NinthSelection 
		--info.arg1 = i
		info.arg2 = nil
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		for i = 1, GetNumEquipmentSets() do
		local name, icon, setID, isEquipped, totalItems, equippedItems, inventoryItems, missingItems, ignoredSlots = GetEquipmentSetInfo(i)
		info.text = name
		info.icon = icon
		info.func = NinthSelection 
		info.arg1 = i
		info.arg2 = name
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		end
    end
end
end

local function TenthSelection(button, arg1, arg2)
	UIDropDownMenu_SetText(Tenth, arg2)
	ebpvpname4 = arg2
end
local unitClass, englishClass = UnitClass("player")

if englishClass == "DRUID" then --Only Druid has 4th spec
--Tenth Dropdown
local Tenth = CreateFrame("Frame", "Tenth", EquipmentBuddyOptions.panel, "UIDropDownMenuTemplate")
Tenth.initialize = function(self, level) end
Tenth:SetPoint("TOPRIGHT", -275, -255);

Tenth.initialize = function(self, level)
  
	
	if not level then return end
    wipe(info)
    if level == 1 then
		info.text = "None"
		--info.icon = icon
		info.func = TenthSelection 
		--info.arg1 = i
		info.arg2 = nil
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		for i = 1, GetNumEquipmentSets() do
		local name, icon, setID, isEquipped, totalItems, equippedItems, inventoryItems, missingItems, ignoredSlots = GetEquipmentSetInfo(i)
		info.text = name
		info.icon = icon
		info.func = TenthSelection 
		info.arg1 = i
		info.arg2 = name
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		end
    end
end
end