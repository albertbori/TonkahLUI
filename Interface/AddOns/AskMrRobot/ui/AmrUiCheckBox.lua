--[[-----------------------------------------------------------------------------
CheckBox Widget
-------------------------------------------------------------------------------]]
local Type, Version = "AmrUiCheckBox", 1
local AceGUI = LibStub and LibStub("AceGUI-3.0", true)
if not AceGUI or (AceGUI:GetWidgetVersion(Type) or 0) >= Version then return end

local Amr = LibStub("AceAddon-3.0"):GetAddon("AskMrRobot")

-- Lua APIs
local pairs = pairs

-- WoW APIs
local _G = _G
local PlaySound, CreateFrame, UIParent = PlaySound, CreateFrame, UIParent


--[[-----------------------------------------------------------------------------
Scripts
-------------------------------------------------------------------------------]]
local function buttonOnClick(frame, ...)
	AceGUI:ClearFocus()
	PlaySound("igMainMenuOption")
	frame.obj:Fire("OnClick", ...)
end

--[[-----------------------------------------------------------------------------
Methods
-------------------------------------------------------------------------------]]
local methods = {
	["OnAcquire"] = function(self)
		-- restore default values
		self:SetDisabled(false)
		self:SetFont(Amr.CreateFont("Regular", 14, Amr.Colors.Text))
		self:SetText()
		self:SetChecked(false)
		self.frame:ClearAllPoints()
	end,

	["SetText"] = function(self, text)
		self.label:SetText(text)
		self.frame:SetWidth(16 + 6 + self.label:GetStringWidth())
	end,
	
	["SetFont"] = function(self, font)
		self.label:SetFontObject(font)
	end,
	
	["SetChecked"] = function(self, checked)
		-- not sure if WoW expects boolean type or not, too lazy to find out so just cast it
		self.frame:SetChecked(not not checked)
	end,
	
	["GetChecked"] = function(self)
		return self.frame:GetChecked()
	end,
	
	["GetWidth"] = function(self)
		return self.frame:GetWidth()
	end,
	
	["SetDisabled"] = function(self, disabled)
		self.disabled = disabled
		if disabled then
			self.frame:Disable()
		else
			self.frame:Enable()
		end
	end,
	
	["SetVisible"] = function(self, visible)
		if visible then
			self.frame:Show()
		else
			self.frame:Hide()
		end
	end
}

--[[-----------------------------------------------------------------------------
Constructor
-------------------------------------------------------------------------------]]
local function Constructor()
	local name = "AmrUiCheckBox" .. AceGUI:GetNextWidgetNum(Type)
	local frame = CreateFrame("CheckButton", name, UIParent)
	frame:SetHeight(16)
	frame:SetPushedTextOffset(0, 0)
	frame:Hide()

	frame:EnableMouse(true)
	frame:SetScript("OnClick", buttonOnClick)
	
	-- unchecked texture
	local texNormal = frame:CreateTexture(nil, "BACKGROUND")
	texNormal:SetWidth(16)
	texNormal:SetHeight(16)
	texNormal:SetTexture("Interface\\AddOns\\" .. Amr.ADDON_NAME .. "\\Media\\check-off")
	texNormal:SetPoint("LEFT", frame, "LEFT")
	frame:SetNormalTexture(texNormal)
	
	-- checked texture
	local texCheck = frame:CreateTexture(nil, "BORDER")
	texCheck:SetTexture("Interface\\AddOns\\" .. Amr.ADDON_NAME .. "\\Media\\check-on")
	texCheck:SetPoint("LEFT", frame, "LEFT")
	frame:SetCheckedTexture(texCheck)
	
	-- label
	local lbl = frame:CreateFontString(nil, "ARTWORK")
	lbl:SetJustifyV("MIDDLE")
	lbl:SetPoint("LEFT", texNormal, "RIGHT", 8, 0)
	frame:SetFontString(lbl)

	local widget = {
		texNormal = texNormal,
		label     = lbl,
		frame     = frame,
		type      = Type
	}
	for method, func in pairs(methods) do
		widget[method] = func
	end

	return AceGUI:RegisterAsWidget(widget)
end

AceGUI:RegisterWidgetType(Type, Constructor, Version)
