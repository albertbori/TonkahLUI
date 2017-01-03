--[[
	Project....: LUI NextGenWoWUserInterface
	File.......: RaidMenu.lua
	Description: Replaces PallyPower button with a Raid Flare menu
	Version....: 2.0
	Rev Date...: 11/17/2010 [mm/dd/yyyy]
	Author.....: Zista [Thrall] <NightShift>
	
	Notes:
		Replaces PallyPower button with a Raid Menu.  Paladins will be able to show/hide PallyPower by right clicking the button.
]]

-- Local includes/definitions
local LUI = LibStub("AceAddon-3.0"):GetAddon("LUI")
local LSM = LibStub("LibSharedMedia-3.0")
local module = LUI:NewModule("RaidMenu", "AceHook-3.0")
local db
local version = "2.0"
local author = "Zista [Thrall] <NightShift>"

-- Create function to refresh Colors and hook it to the Themes:Refresh_Micromenu function
function module:Refresh_RaidMenu()
	RaidMenu_BG:SetBackdropColor(unpack(db.Colors.micromenu_bg2))
	RaidMenu:SetBackdropColor(unpack(db.Colors.micromenu_bg))
	local micro_r, micro_g, micro_b = unpack(db.Colors.micromenu)
	RaidMenu_Border:SetBackdropColor(micro_r, micro_g, micro_b, 1)
	LootHeader:SetBackdropBorderColor(micro_r, micro_g, micro_b, 1)
	LootHeaderText:SetFont(LSM:Fetch("font", db.Info.Clock.Font), db.Info.Clock.Size, db.Info.Clock.Outline)
	LootHeaderText:SetTextColor(db.Info.Clock.Color.r, db.Info.Clock.Color.g, db.Info.Clock.Color.b, db.Info.Clock.Color.a)
	RaidMenu_Header:SetFont(LSM:Fetch("font", db.Info.Clock.Font), 20, "THICKOUTLINE")
	RaidMenu_Header:SetTextColor(db.Info.Clock.Color.r, db.Info.Clock.Color.g, db.Info.Clock.Color.b, db.Info.Clock.Color.a)
end

local Themes = LUI:GetModule("Themes")
function Themes:Refresh_Micromenu()
	if LUI:GetModule("Micromenu", true) then
		local Micromenu = LUI:GetModule("Micromenu")
		Micromenu:SetColors()
	end
	module:Refresh_RaidMenu()
end

-- Place Raid Target Icon on target
function module:MarkTarget(iconId)
	if (db.RaidMenu.ToggleRaidIcon == true) then
		SetRaidTargetIcon("target", iconId)
	elseif (GetRaidTargetIndex("target") ~= iconId) then
		SetRaidTarget("target", iconId)
	end
end

-- Create module function
function module:SetRaidMenu()
	if (db.RaidMenu.Enable ~= true) or not(LUI:GetModule("Micromenu", true)) then return end
	
	local playerClass, englishClass = UnitClass("player")
	
	-- Create frames for Raid Menu
	local RaidMenu_BG = LUI:CreateMeAFrame("FRAME","RaidMenu_BG",MicroMenu_ButtonLeft,256,256,1,"HIGH",0,"TOPRIGHT",MicroMenu_ButtonLeft,"BOTTOMRIGHT",0,((108/db.RaidMenu.Scale)+17),1)
	RaidMenu_BG:SetBackdrop({bgFile = 'Interface\\AddOns\\LUI\\modules\\RaidMenu\\RaidMenu_BG',
				  edgeFile='Interface\\Tooltips\\UI-Tooltip-Border',
				  tile=false, tileSize = 0, edgeSize = 1,
				  insets = { left = 0, right = 0, top = 0, bottom = 0}})
	RaidMenu_BG:SetBackdropColor(unpack(db.Colors.micromenu_bg2))
	RaidMenu_BG:SetBackdropBorderColor(0,0,0,0)
	RaidMenu_BG:SetFrameStrata("HIGH")
	RaidMenu_BG:SetScale(db.RaidMenu.Scale)
	RaidMenu_BG:Hide()
	
	local RaidMenu = LUI:CreateMeAFrame("FRAME","RaidMenu",RaidMenu_BG,256,256,1,"HIGH",1,"TOPRIGHT",RaidMenu_BG,"TOPRIGHT",0,0,1)
	RaidMenu:SetBackdrop({bgFile = 'Interface\\AddOns\\LUI\\modules\\RaidMenu\\RaidMenu',
				  edgeFile='Interface\\Tooltips\\UI-Tooltip-Border',
				  tile=false, tileSize = 0, edgeSize = 1,
				  insets = { left = 0, right = 0, top = 0, bottom = 0}})
	RaidMenu:SetBackdropColor(unpack(db.Colors.micromenu_bg))
	RaidMenu:SetBackdropBorderColor(0,0,0,0)
	RaidMenu:SetAlpha(1)
	RaidMenu:Show()
	
	local RaidMenu_Border = LUI:CreateMeAFrame("FRAME","RaidMenu_Border",RaidMenu_BG,256,256,1,"HIGH",3,"TOPRIGHT",RaidMenu_BG,"TOPRIGHT",2,1,1)
	RaidMenu_Border:SetBackdrop({bgFile = "Interface\\AddOns\\LUI\\modules\\RaidMenu\\RaidMenu_Border",
				  edgeFile='Interface\\Tooltips\\UI-Tooltip-Border',
				  tile=false, tileSize = 0, edgeSize = 1,
				  insets = { left = 0, right = 0, top = 0, bottom = 0}})
	RaidMenu_Border:SetBackdropColor(db.Colors.micromenu[1], db.Colors.micromenu[2], db.Colors.micromenu[3], 1)
	RaidMenu_Border:SetBackdropBorderColor(0,0,0,0)
	RaidMenu_Border:SetAlpha(1)
	RaidMenu_Border:Show()
	
	local RaidMenu_Header = RaidMenu:CreateFontString("RaidMenu_Header", "OVERLAY")
	RaidMenu_Header:SetFont(LSM:Fetch("font", db.Info.Clock.Font), 20, "THICKOUTLINE")
	RaidMenu_Header:SetPoint("TOP", RaidMenu, "TOP", -5, -25)
	RaidMenu_Header:SetTextColor(db.Info.Clock.Color.r, db.Info.Clock.Color.g, db.Info.Clock.Color.b, db.Info.Clock.Color.a)
	RaidMenu_Header:SetText("LUI Raid Menu v"..version)
	
	-- Create frame for dropdown lists to access
	local LootMenuFrame = CreateFrame("Frame", "LootDropDownMenu", RaidMenu_BG, "UIDropDownMenuTemplate")
	
	-- Create buttons for Raid Menu
	function FormatMarker(frame,x,y,r,g,b,id,t1,t2,t3,t4)
		frame:SetWidth(32)
		frame:SetHeight(32)
		frame:SetScale(1)
		frame:SetFrameStrata("HIGH")
		frame:SetFrameLevel(4)
		frame:SetPoint("TOPLEFT",RaidMenu,"TOPLEFT",x,y)
		frame:SetAlpha(0.6)
		if string.find(frame:GetName(), "Header") == nil then
			frame:RegisterForClicks("AnyUp")
		end
		
		if string.find(frame:GetName(), "WorldMarker") ~= nil then
			frame:SetAttribute("type", "macro")
			
			local texture = frame:CreateTexture(frame:GetName().."MarkerTex")
			texture:SetPoint("TOPLEFT", frame,"TOPLEFT",0,0)
			texture:SetWidth(32)
			texture:SetHeight(32)
			texture:SetTexture("Interface\\Buttons\\UI-Quickslot")
			texture:SetTexCoord(0.15,0.85,0.15,0.85)
			if (frame:GetName() == "ClearWorldMarkers") then
				texture:SetTexture("Interface\\Buttons\\UI-GroupLoot-Pass-Up")
				texture:SetTexCoord(0,1,0,1)
			else			
				local textureColor = frame:CreateTexture(frame:GetName().."TextureColor")
				textureColor:SetPoint("TOPLEFT", frame,"TOPLEFT", 4, -4)
				textureColor:SetPoint("BOTTOMRIGHT", frame,"BOTTOMRIGHT", -4.5, 4.5)
				textureColor:SetTexture(r,g,b)
			end
			
		elseif string.find(frame:GetName(), "RaidIcon") ~= nil then
			frame:SetID(id)
			frame:SetScript("OnClick", function(self)
				if db.RaidMenu.AutoHide == true then
					MicroMenu_ButtonLeft_Clicker:Click()
				end
				module:MarkTarget(frame:GetID());
			end)
			
			local texture = frame:CreateTexture(frame:GetName().."MarkerTex")
			texture:SetPoint("TOPLEFT", frame,"TOPLEFT",2,-2)
			texture:SetWidth(28)
			texture:SetHeight(28)
			if (frame:GetName() == "ClearRaidIcon") then
				texture:SetTexture("Interface\\Buttons\\UI-GroupLoot-Pass-Up")
			else
				texture:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
			end
			texture:SetTexCoord(t1,t2,t3,t4)
			
		elseif (string.find(frame:GetName(), "Loot") ~= nil) then
			if (string.find(frame:GetName(), "Header") ~= nil) then
				frame:SetWidth(120)
				frame:SetHeight(45)
			else
				frame:SetWidth(55)
				frame:SetHeight(20)
			end
			frame:SetAlpha(1)
		else
			frame:SetWidth(120)
			frame:SetHeight(20)
			frame:SetAlpha(1)
		end
	end
	
	local SkullRaidIcon = CreateFrame("BUTTON","SkullRaidIcon",RaidMenu,"MarkerTemplate")
	FormatMarker(SkullRaidIcon, 20, -50, 0, 0, 0, 8, 0.75,1,0.25,0.5)
	
	local CrossRaidIcon = CreateFrame("BUTTON","CrossRaidIcon",RaidMenu,"MarkerTemplate")
	FormatMarker(CrossRaidIcon, 20, -90, 0, 0, 0, 7, 0.5,0.75,0.25,0.5)
	
	local SquareRaidIcon = CreateFrame("BUTTON","SquareRaidIcon",RaidMenu,"MarkerTemplate")
	FormatMarker(SquareRaidIcon, 20, -130, 0, 0, 0, 6, 0.25,0.5,0.25,0.5)
	
	local MoonRaidIcon = CreateFrame("BUTTON","MoonRaidIcon",RaidMenu,"MarkerTemplate")
	FormatMarker(MoonRaidIcon, 20, -170, 0, 0, 0, 5, 0,0.25,0.25,0.5)
	
	local TriangleRaidIcon = CreateFrame("BUTTON","TriangleRaidIcon",RaidMenu,"MarkerTemplate")
	FormatMarker(TriangleRaidIcon, 60, -50, 0, 0, 0, 4, 0.75,1,0,0.25)
	
	local DiamondRaidIcon = CreateFrame("BUTTON","DiamondRaidIcon",RaidMenu,"MarkerTemplate")
	FormatMarker(DiamondRaidIcon, 60, -90, 0, 0, 0, 3, 0.5,0.75,0,0.25)
	
	local CircleRaidIcon = CreateFrame("BUTTON","CircleRaidIcon",RaidMenu,"MarkerTemplate")
	FormatMarker(CircleRaidIcon, 60, -130, 0, 0, 0, 2, 0.25,0.5,0,0.25)
	
	local StarRaidIcon = CreateFrame("BUTTON","StarRaidIcon",RaidMenu,"MarkerTemplate")
	FormatMarker(StarRaidIcon, 60, -170, 0, 0, 0, 1, 0,0.25,0,0.25)
	
	local ClearRaidIcon = CreateFrame("BUTTON","ClearRaidIcon",RaidMenu,"MarkerTemplate")
	FormatMarker(ClearRaidIcon, 40, -210, 0, 0, 0, 0, 0, 1, 0, 1)
	
	local BlueWorldMarker = CreateFrame("BUTTON","BlueWorldMarker",RaidMenu,"SecureMarkerTemplate")
	FormatMarker(BlueWorldMarker, 110, -175, 0, 0.5, 1)
	BlueWorldMarker:SetAttribute("macrotext", [[/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button1
/run if LUI.db.profile.RaidMenu.AutoHide then MicroMenu_ButtonLeft_Clicker:Click() end]])
	
	local GreenWorldMarker = CreateFrame("BUTTON","GreenWorldMarker",RaidMenu,"SecureMarkerTemplate")
	FormatMarker(GreenWorldMarker, 145, -175, 0, 1, 0.2)
	GreenWorldMarker:SetAttribute("macrotext", [[/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button2
/run if LUI.db.profile.RaidMenu.AutoHide then MicroMenu_ButtonLeft_Clicker:Click() end]])
	
	local PurpleWorldMarker = CreateFrame("BUTTON","PurpleWorldMarker",RaidMenu,"SecureMarkerTemplate")
	FormatMarker(PurpleWorldMarker, 180, -175, 0.5, 0, 1)
	PurpleWorldMarker:SetAttribute("macrotext", [[/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button3
/run if LUI.db.profile.RaidMenu.AutoHide then MicroMenu_ButtonLeft_Clicker:Click() end]])
	
	local RedWorldMarker = CreateFrame("BUTTON","RedWorldMarker",RaidMenu,"SecureMarkerTemplate")
	FormatMarker(RedWorldMarker, 110, -210, 1, 0, 0)
	RedWorldMarker:SetAttribute("macrotext", [[/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button4
/run if LUI.db.profile.RaidMenu.AutoHide then MicroMenu_ButtonLeft_Clicker:Click() end]])
	
	local YelloWorldMarker = CreateFrame("BUTTON","YellowWorldMarker",RaidMenu,"SecureMarkerTemplate")
	FormatMarker(YellowWorldMarker, 145, -210, 1, 1, 0)
	YellowWorldMarker:SetAttribute("macrotext", [[/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button5
/run if LUI.db.profile.RaidMenu.AutoHide then MicroMenu_ButtonLeft_Clicker:Click() end]])
	
	local ClearWorldMarkers = CreateFrame("BUTTON","ClearWorldMarkers",RaidMenu,"SecureMarkerTemplate")
	FormatMarker(ClearWorldMarkers, 180, -210, 0, 0, 0)
	ClearWorldMarkers:SetAttribute("macrotext", [[/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button6
/run if LUI.db.profile.RaidMenu.AutoHide then MicroMenu_ButtonLeft_Clicker:Click() end]])
	
	local ConvertRaid = CreateFrame("BUTTON","ConvertRaid",RaidMenu,"OptionsButtonTemplate")
	FormatMarker(ConvertRaid, 105, -50)
	ConvertRaid:SetText("Convert to Raid Group")
	ConvertRaid:SetScript("OnEnter", function(self)
		if db.RaidMenu.ShowToolTips == true then
			GameTooltip:SetOwner(ConvertRaid,"ANCHOR_BOTTOMLEFT")
			GameTooltip:SetClampedToScreen(true)
			GameTooltip:ClearLines()
			GameTooltip:SetText("Convert to Raid Group")
			GameTooltip:AddLine("Convert your party into a Raid Group",204/255,204/255,204/255,1)
			GameTooltip:Show()
		end
	end)
	ConvertRaid:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	ConvertRaid:SetScript("OnClick", function(self)
		ConvertToRaid()
		if db.RaidMenu.AutoHide == true then
			MicroMenu_ButtonLeft_Clicker:Click()
		end
	end)
	
	local LootHeader = CreateFrame("FRAME","LootHeader",RaidMenu)
	FormatMarker(LootHeader, 105, -75)
	LootHeader:SetBackdrop({bgFile = 'Interface\\Tooltips\\UI-Tooltip-Background',
				  edgeFile='Interface\\Tooltips\\UI-Tooltip-Border',
				  tile=true, tileSize = 16, edgeSize = 16,
				  insets = { left = 4, right = 4, top = 4, bottom = 4}})
	LootHeader:SetBackdropColor(0,0,0,0)
	LootHeader:SetBackdropBorderColor(db.Colors.micromenu[1], db.Colors.micromenu[2], db.Colors.micromenu[3], 1)
	local LootHeaderText = LootHeader:CreateFontString("LootHeaderText", "OVERLAY")
	LootHeaderText:SetFont(LSM:Fetch("font", db.Info.Clock.Font), db.Info.Clock.Size, db.Info.Clock.Outline)
	LootHeaderText:SetPoint("TOP", LootHeader, "TOP", 0, -5)
	LootHeaderText:SetTextColor(db.Info.Clock.Color.r, db.Info.Clock.Color.g, db.Info.Clock.Color.b, db.Info.Clock.Color.a)
	LootHeaderText:SetText("Loot Options")
	
	local LootMethod = CreateFrame("BUTTON","LootMethod",RaidMenu,"OptionsButtonTemplate")
	FormatMarker(LootMethod, 109, -95)
	LootMethod:SetText("Method")
	LootMethod:SetScript("OnEnter", function(self)
		if db.RaidMenu.ShowToolTips == true then
			GameTooltip:SetOwner(LootMethod,"ANCHOR_BOTTOMLEFT")
			GameTooltip:SetClampedToScreen(true)
			GameTooltip:ClearLines()
			GameTooltip:SetText("Loot Method")
			GameTooltip:AddLine("Change the Loot Method for your group",204/255,204/255,204/255,1)
			GameTooltip:Show()
		end
	end)
	LootMethod:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	LootMethod:SetScript("OnClick", function(self)
		local LootMethodList = {
			{text = "Group Loot",
			checked = (GetLootMethod() == "group"),
			func = function() SetLootMethod("group") if db.RaidMenu.AutoHide == true then MicroMenu_ButtonLeft_Clicker:Click() end end},
			{text = "Free-For-All",
			checked = (GetLootMethod() == "freeforall"),
			func = function() SetLootMethod("freeforall") if db.RaidMenu.AutoHide == true then MicroMenu_ButtonLeft_Clicker:Click() end end},
			{text = "Master Looter",
			checked = (GetLootMethod() == "master"),
			func = function() SetLootMethod("master", "player") if db.RaidMenu.AutoHide == true then MicroMenu_ButtonLeft_Clicker:Click() end end},
			{text = "Need Before Greed",
			checked = (GetLootMethod() == "needbeforegreed"),
			func = function() SetLootMethod("needbeforegreed") if db.RaidMenu.AutoHide == true then MicroMenu_ButtonLeft_Clicker:Click() end end},
			{text = "Round Robin",
			checked = (GetLootMethod() == "roundrobin"),
			func = function() SetLootMethod("roundrobin") if db.RaidMenu.AutoHide == true then MicroMenu_ButtonLeft_Clicker:Click() end end}
		}
		EasyMenu(LootMethodList, LootMenuFrame, "cursor", 0, 0, "MENU", 1)
	end)
	
	local LootThreshold = CreateFrame("BUTTON","LootThreshold",RaidMenu,"OptionsButtonTemplate")
	FormatMarker(LootThreshold, 166, -95)
	LootThreshold:SetText("Threshold")
	LootThreshold:SetScript("OnEnter", function(self)
		if db.RaidMenu.ShowToolTips == true then
			GameTooltip:SetOwner(LootThreshold,"ANCHOR_BOTTOMLEFT")
			GameTooltip:SetClampedToScreen(true)
			GameTooltip:ClearLines()
			GameTooltip:SetText("Loot Threshold")
			GameTooltip:AddLine("Change the Loot Threshold for your group",204/255,204/255,204/255,1)
			GameTooltip:Show()
		end
	end)
	LootThreshold:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	LootThreshold:SetScript("OnClick", function(self)
		local LootThresholdList = {
			{text = "|cff1EFF00Uncommon|r",
			checked = (GetLootThreshold() == 2),
			func = function() SetLootThreshold("2") if db.RaidMenu.AutoHide == true then MicroMenu_ButtonLeft_Clicker:Click() end end},
			{text = "|cff0070FFRare|r",
			checked = (GetLootThreshold() == 3),
			func = function() SetLootThreshold("3") if db.RaidMenu.AutoHide == true then MicroMenu_ButtonLeft_Clicker:Click() end end},
			{text = "|cffA335EEEpic|r",
			checked = (GetLootThreshold() == 4),
			func = function() SetLootThreshold("4") if db.RaidMenu.AutoHide == true then MicroMenu_ButtonLeft_Clicker:Click() end end},
			{text = "|cffFF8000Legendary|r",
			checked = (GetLootThreshold() == 5),
			func = function() SetLootThreshold("5") if db.RaidMenu.AutoHide == true then MicroMenu_ButtonLeft_Clicker:Click() end end}
		}
		EasyMenu(LootThresholdList, LootMenuFrame, "cursor", 0, 0, "MENU", 1)
	end)
		
	local RoleChecker = CreateFrame("BUTTON","RoleChecker",RaidMenu,"OptionsButtonTemplate")
	FormatMarker(RoleChecker, 105, -125)
	RoleChecker:Hide()
		
	local RoleCheckerButton = CreateFrame("BUTTON","RoleChecker",RaidMenu,"SecureMarkerTemplate")
	FormatMarker(RoleCheckerButton, 105, -125)
	RoleCheckerButton:SetFrameLevel(5)
	RoleCheckerButton:SetHighlightTexture(RoleChecker:GetHighlightTexture())
	RoleCheckerButton:SetPushedTexture(RoleChecker:GetPushedTexture())
	RoleCheckerButton:SetNormalTexture(RoleChecker:GetNormalTexture())
	RoleCheckerButton:SetFontString(RoleChecker:GetFontString())
	RoleCheckerButton:SetText("Role Check")
	RoleCheckerButton:SetAttribute("type", "macro")
	RoleCheckerButton:SetAttribute("macrotext", [[/click CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateRolePoll
/run if LUI.db.profile.RaidMenu.AutoHide then MicroMenu_ButtonLeft_Clicker:Click() end]])
	RoleCheckerButton:SetScript("OnEnter", function(self)
		if db.RaidMenu.ShowToolTips == true then
			GameTooltip:SetOwner(RoleChecker,"ANCHOR_BOTTOMLEFT")
			GameTooltip:SetClampedToScreen(true)
			GameTooltip:ClearLines()
			GameTooltip:SetText("Role Check")
			GameTooltip:AddLine("Perform a Role Check",204/255,204/255,204/255,1)
			GameTooltip:Show()
		end
	end)
	RoleCheckerButton:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	local ReadyChecker = CreateFrame("BUTTON","ReadyChecker",RaidMenu,"OptionsButtonTemplate")
	FormatMarker(ReadyChecker, 105, -150)
	ReadyChecker:SetText("Ready Check")
	ReadyChecker:SetScript("OnEnter", function(self)
		if db.RaidMenu.ShowToolTips == true then
			GameTooltip:SetOwner(ReadyChecker,"ANCHOR_BOTTOMLEFT")
			GameTooltip:SetClampedToScreen(true)
			GameTooltip:ClearLines()
			GameTooltip:SetText("Ready Check")
			GameTooltip:AddLine("Perform a Ready Check",204/255,204/255,204/255,1)
			GameTooltip:Show()
		end
	end)
	ReadyChecker:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	ReadyChecker:SetScript("OnClick", function(self)
		DoReadyCheck()
		if db.RaidMenu.AutoHide == true then
			MicroMenu_ButtonLeft_Clicker:Click()
		end
	end)
	
	-- Create fader frames
	local rm_timerout, rm_timerin = 0,0
	local rm_alpha_timer = 0.5
	
	local RMAlphaOut = CreateFrame("Frame", "RMAlphaOut", UIParent)
	RMAlphaOut:Hide()
	
	RMAlphaOut:SetScript("OnUpdate", function(self,elapsed)
		rm_timerout = rm_timerout + elapsed
		if rm_timerout < rm_alpha_timer then
			local alpha = (1 - rm_timerout / rm_alpha_timer)*(db.RaidMenu.Opacity/100)
			RaidMenu_BG:SetAlpha(alpha)
		else
			RaidMenu_BG:SetAlpha(0)
			RaidMenu_BG:Hide()
			rm_timerout = 0
			self:Hide()
		end
	end)
	
	local RMAlphaIn = CreateFrame("Frame", "RMAlphaIn", UIParent)
	RMAlphaIn:Hide()
	
	RMAlphaIn:SetScript("OnUpdate", function(self,elapsed)
		RaidMenu_BG:Show()
		rm_timerin = rm_timerin + elapsed
		if rm_timerin < rm_alpha_timer then
			local alpha = (rm_timerin / rm_alpha_timer)*(db.RaidMenu.Opacity/100)
			RaidMenu_BG:SetAlpha(alpha)
		else
			RaidMenu_BG:SetAlpha(db.RaidMenu.Opacity/100)
			rm_timerin = 0
			self:Hide()
		end
	end)
	
	-- Set Raid Menu hide script for Middle Button
	MicroMenu_Clicker:SetScript("OnClick", function(self)
		if db.Frames.IsMicroMenuShown == true then
			MMAlphaOut:Show()
			db.Frames.IsMicroMenuShown = false
			
			MicroMenuAnchor:SetBackdrop({bgFile = fdir.."micro_anchor",
				  edgeFile='Interface\\Tooltips\\UI-Tooltip-Border',
				  tile=false, tileSize = 0, edgeSize = 1,
				  insets = { left = 0, right = 0, top = 0, bottom = 0}});
			MicroMenuAnchor:SetBackdropColor(unpack(db.Colors.micromenu_btn_hover))
			MicroMenuAnchor:SetBackdropBorderColor(0,0,0,0)	
		else
			if (RaidMenu_BG:IsShown()) and (db.RaidMenu.AutoHideMicroMenu == true) then
				MicroMenu_ButtonLeft_Clicker:Click()
			end
			MMAlphaIn:Show()
			db.Frames.IsMicroMenuShown = true
			
			MicroMenuAnchor:SetBackdrop({bgFile = fdir.."micro_anchor3",
				  edgeFile='Interface\\Tooltips\\UI-Tooltip-Border',
				  tile=false, tileSize = 0, edgeSize = 1,
				  insets = { left = 0, right = 0, top = 0, bottom = 0}});
			MicroMenuAnchor:SetBackdropColor(unpack(db.Colors.micromenu_btn_hover))
			MicroMenuAnchor:SetBackdropBorderColor(0,0,0,0)
		end
	end)
	
	-- Set scripts for Left Button
	MicroMenu_ButtonLeft_Clicker:Show()
	MicroMenu_ButtonLeft_Clicker:RegisterForClicks("AnyUp")
	
	MicroMenu_ButtonLeft_Clicker:SetScript("OnEnter", function(self)
		MicroMenu_ButtonLeft:SetBackdrop({bgFile = fdir.."mm_button_left_hover",
					  edgeFile='Interface\\Tooltips\\UI-Tooltip-Border',
					  tile=false, tileSize = 0, edgeSize = 1,
					  insets = { left = 0, right = 0, top = 0, bottom = 0}});
		MicroMenu_ButtonLeft:SetBackdropColor(unpack(db.Colors.micromenu_btn_hover))
		MicroMenu_ButtonLeft:SetBackdropBorderColor(0,0,0,0)
	end)
	
	MicroMenu_ButtonLeft_Clicker:SetScript("OnLeave", function(self)
		MicroMenu_ButtonLeft:SetBackdrop({bgFile = fdir.."mm_button_left",
					  edgeFile='Interface\\Tooltips\\UI-Tooltip-Border',
					  tile=false, tileSize = 0, edgeSize = 1,
					  insets = { left = 0, right = 0, top = 0, bottom = 0}});
		MicroMenu_ButtonLeft:SetBackdropColor(unpack(db.Colors.micromenu_btn))
		MicroMenu_ButtonLeft:SetBackdropBorderColor(0,0,0,0)
	end)
	
	MicroMenu_ButtonLeft_Clicker:SetScript("OnClick", function(self, button)
		if (englishClass == "PALADIN") and (IsAddOnLoaded("PallyPower")) and (button == "RightButton") then
			if PallyPowerFrame:IsShown() then
				PallyPowerFrame:Hide()
				PallyPowerFrame:SetAlpha(0)
			else
				PallyPowerFrame:Show()
				PallyPowerFrame:SetAlpha(1)
			end
		else
			if RaidMenu_BG:IsShown() then
				RMAlphaOut:Show()
			else
				if (db.Frames.IsMicroMenuShown == true) and (db.RaidMenu.AutoHideMicroMenu == true) then
					MicroMenu_Clicker:Click()
				end
				RMAlphaIn:Show()
			end
		end
	end)
end

-- Defaults for the module
local defaults = {
	RaidMenu = {
		Enable = true,
		AutoHideMicroMenu = true,
		Opacity = 100,
		Scale = 1,
		ToggleRaidIcon = true,
		ShowToolTips = false,
		AutoHide = false,
	},
}

-- Load options: Creates an option menu for LUI
function module:LoadOptions()
	local options = {
		RaidMenu = {
			name = "Raid Menu",
			type = "group",
			order = 60,
			disabled = function() return not db.RaidMenu.Enable end,
			childGroups = "tab",
			args = {
				General = {
					name = "General",
					type = "group",
					order = 1,
					args = {
						Title = {
							type = "header",
							order = 1,
							name = "Raid Menu v" ..  version,
						},
						Info = {
							name = "Info",
							type = "group",
							order = 2,
							guiInline = true,
							args = {
								Description = {
									name = function()
										if LUI:GetModule("Micromenu", true) then
											return "Written by: "..author.."\n\nThis module will add a Raid Tools menu to the PallyPower button.\nPaladins using PallyPower can show/hide PallyPower by right clicking on the button."
										else
											return "Written by: "..author.."\n\nThis module will add a Raid Tools menu to the PallyPower button.\nPaladins using PallyPower can show/hide PallyPower by right clicking on the button.\n\nThe LUI MicroMenu must be enabled for this module to work!!!"
										end
									end,
									type = "description",
									order = 1,
								},
							},
						},
						Settings = {
							name = "Settings",
							type = "group",
							order = 3,
							disabled = function()
							end,
							guiInline = true,
							args = {
								AutoHideMicroMenu = {
									name = "Auto-Hide MicroMenu",
									desc = "Weather or not the Raid Menu and MicroMenu should hide when the other is opened",
									disabled = function()
										if LUI:GetModule("Micromenu", true) then 
											return not db.RaidMenu.Enable
										else
											return true
										end
									end,
									type = "toggle",
									get = function() return db.RaidMenu.AutoHideMicroMenu end,
									set = function(self) db.RaidMenu.AutoHideMicroMenu = not db.RaidMenu.AutoHideMicroMenu; end,
									order = 1,
								},
								AutoHide = {
									name = "Auto-Hide Raid Menu",
									desc = "Weather or not the Raid Menu should hide itself after clicking on a function",
									disabled = function()
										if LUI:GetModule("Micromenu", true) then 
											return not db.RaidMenu.Enable
										else
											return true
										end
									end,
									type = "toggle",
									get = function() return db.RaidMenu.AutoHide end,
									set = function(self) db.RaidMenu.AutoHide = not db.RaidMenu.AutoHide; end,
									order = 2,
								},
								ToggleRaidIcon = {
									name = "Toggle Raid Icon",
									desc = "Weather of not Raid Target Icons can be removed by applying the icon the target already has",
									disabled = function()
										if LUI:GetModule("Micromenu", true) then 
											return not db.RaidMenu.Enable
										else
											return true
										end
									end,
									type = "toggle",
									get = function() return db.RaidMenu.ToggleRaidIcon end,
									set = function(self) db.RaidMenu.ToggleRaidIcon = not db.RaidMenu.ToggleRaidIcon; end,
									order = 3,
								},
								ShowToolTips = {
									name = "Show Tooltips",
									desc = "Weather or not to show tooltips for the Raid Menu tools",
									disabled = function()
										if LUI:GetModule("Micromenu", true) then 
											return not db.RaidMenu.Enable
										else
											return true
										end
									end,
									type = "toggle",
									get = function() return db.RaidMenu.ShowToolTips end,
									set = function(self) db.RaidMenu.ShowToolTips = not db.RaidMenu.ShowToolTips; end,
									order = 4,
								},
								Scale = {
									name = "Scale",
									desc = "The Scale of the Raid Menu",
									disabled = function()
										if LUI:GetModule("Micromenu", true) then 
											return not db.RaidMenu.Enable
										else
											return true
										end
									end,
									type = "range",
									step = 0.25,
									min = 0.5,
									max = 2.0,
									get = function() return db.RaidMenu.Scale end,
									set = function(self, value)
										db.RaidMenu.Scale = value
										RaidMenu_BG:SetScale(db.RaidMenu.Scale)
										RaidMenu_BG:SetPoint("TOPRIGHT",MicroMenu_ButtonLeft,"BOTTOMRIGHT",0,((108/db.RaidMenu.Scale)+17))
									end,
									order = 5,
								},
								Opacity = {
									name = "Opacity",
									desc = "The Opacity of the Raid Menu\n100% is fully visable",
									disabled = function()
										if LUI:GetModule("Micromenu", true) then 
											return not db.RaidMenu.Enable
										else
											return true
										end
									end,
									type = "range",
									step = 10,
									min = 20,
									max = 100,
									get = function() return db.RaidMenu.Opacity end,
									set = function(self, value)
										db.RaidMenu.Opacity = value
										if RaidMenu_BG:IsShown() then
											RaidMenu_BG:SetAlpha(db.RaidMenu.Opacity/100)
										end
									end,
									order = 6,
								},
							},
						},
					},
				},
			},
		},
	}
	return options
end

-- Load module: Creates a module button to enable/disable through LUI options
function module:LoadModule()
	local module = {
		RaidMenu = {
			order = LUI:GetModuleCount(),
			type = "execute",
			name = function()
				if db.RaidMenu.Enable then
					return "|cff00ff00Raid Menu Enabled|r"
				else
					return "|cffFF0000Raid Menu Disabled|r"
				end
			end,
			func = function(self, RaidMenu)
				db.RaidMenu.Enable = not db.RaidMenu.Enable
				StaticPopup_Show("RELOAD_UI")
			end,
		},
	}
	
	return module
end

-- Initialize module: Called when the addon should intialize itself; this is where we load in database values
function module:OnInitialize()
	LUI:MergeDefaults(LUI.db.defaults.profile, defaults)
	LUI:RefreshDefaults()
	LUI:Refresh()
	
	self.db = LUI.db.profile
	db = self.db
end

-- Enable module: Called when addon is enabled; this is where we register module button and create the module
function module:OnEnable()
	LUI:RegisterOptions(self:LoadOptions())
	LUI:RegisterModule(self:LoadModule())
	self:SetRaidMenu()
end