-- constants
local TSF_NAME_TEMPLATE = "TradeSkillSkill"
local TSF_TEXTURE_NAME = "TradeSkillDWScrollTexture"
local HORZ_BAR_FNAME = [[Interface\ClassTrainerFrame\UI-ClassTrainer-HorizontalBar]]
local SCROLL_BAR_FNAME = [[Interface\ClassTrainerFrame\UI-ClassTrainer-ScrollBar]]
local DEFAULT_DETAIL_FRAME_HEIGHT = 177
local DEFAULT_DETAIL_FRAME_WIDTH = 297
local DEFAULT_HEADER_FRAME_HEIGHT = 118
local MAX_LINE = 40
local SKILL_PRIMARY = "primary"
local SKILL_SECONDARY = "secondary"
local SKILL_SLOT = "slot"
local knownSkills = {
	[SKILL_PRIMARY] = {},
	[SKILL_SECONDARY] = {},
	[SKILL_SLOT] = {},
}
local tabPool = {
	[SKILL_PRIMARY] = {},
	[SKILL_SECONDARY] = {}
}
local stratas = {
    ["PARENT"] = true,
    ["BACKGROUND"] = true,
    ["LOW"] = true,
    ["MEDIUM"] = true,
    ["HIGH"] = true,
    ["DIALOG"] = true,
    ["FULLSCREEN"] = true,
    ["FULLSCREEN_DIALOG"] = true,
    ["TOOLTIP"] = true
}

-- variables
local texf --slider, subText,
local expandButton, resizeGripButton
local buttons = {}
local leftPos, topPos
local tradeskillDW_scriptsSet

local TradeSkillHorizontalBarRight

local function CreateTex(parent, tex, layer, width, height, ...)
	if texf == nil then
		texf = parent:CreateTexture(TSF_TEXTURE_NAME, layer)
	end
	texf:SetPoint(...)
	texf:SetTexture(tex)
	texf:SetWidth(width)
	texf:SetHeight(height)
	texf:Show()
	return texf
end

-- common

local function ttsSlider_OnValueChanged(self, value)
	if value < 8 then
		value = 8
	end
	if value > MAX_LINE then
		value = MAX_LINE
	end

	TRADE_SKILLS_DISPLAYED = value
	TradeSkillDW_Settings["NumButtons"] = value
	
	if expandButton.expanded then
		--TradeSkillFrame:SetAttribute("UIPanelLayout-width", 683)
		TradeSkillFrame:SetWidth(683)
	else
		--TradeSkillFrame:SetAttribute("UIPanelLayout-width", 380)
		TradeSkillFrame:SetWidth(380)
	end

	-- enum buttons
	for i = 1, MAX_LINE do
		buttons[i] = _G["TradeSkillSkill"..i]
	end
	-- hide extra buttons
	for i = value + 1, MAX_LINE do
		buttons[i]:Hide()
	end

	if expandButton.expanded then
		TradeSkillFrame:SetHeight(TRADE_SKILL_HEIGHT * TRADE_SKILLS_DISPLAYED + DEFAULT_HEADER_FRAME_HEIGHT)
		TradeSkillHorizontalBarLeft:Hide()
		if TradeSkillHorizontalBarRight then
			TradeSkillHorizontalBarRight:Hide()
		end
	else
		TradeSkillFrame:SetHeight(TRADE_SKILL_HEIGHT * TRADE_SKILLS_DISPLAYED + DEFAULT_HEADER_FRAME_HEIGHT + 8 + DEFAULT_DETAIL_FRAME_HEIGHT)
		TradeSkillHorizontalBarLeft:ClearAllPoints()
		TradeSkillHorizontalBarLeft:SetPoint("TOPLEFT", 2, -(TRADE_SKILL_HEIGHT * TRADE_SKILLS_DISPLAYED + 82))
		TradeSkillHorizontalBarLeft:SetPoint("RIGHT", -80, 0)
		TradeSkillHorizontalBarLeft:SetTexCoord(0, 1.0, 0, 0.25)
		TradeSkillHorizontalBarLeft:Show()
		if TradeSkillHorizontalBarRight then
			TradeSkillHorizontalBarRight:Show()
		end
	end

	TradeSkillListScrollFrame:ClearAllPoints()
	TradeSkillListScrollFrame:SetPoint("TOPLEFT", 22, -86)
	if expandButton.expanded then
		TradeSkillListScrollFrame:SetWidth(DEFAULT_DETAIL_FRAME_WIDTH)
	else
		TradeSkillListScrollFrame:SetPoint("TOPRIGHT", -32, -86)
	end
	TradeSkillListScrollFrame:SetHeight(TRADE_SKILL_HEIGHT * TRADE_SKILLS_DISPLAYED + 2)
	
	TradeSkillDetailScrollFrame:ClearAllPoints()
	if expandButton.expanded then
		TradeSkillDetailScrollFrame:SetPoint("TOPLEFT", TradeSkillListScrollFrame, "TOPRIGHT", 35, -2)
		TradeSkillDetailScrollFrame:SetHeight(TRADE_SKILL_HEIGHT * TRADE_SKILLS_DISPLAYED + 2)
		TradeSkillDetailScrollFrame:SetWidth(DEFAULT_DETAIL_FRAME_WIDTH)
	else
		TradeSkillDetailScrollFrame:SetPoint("TOPLEFT", TradeSkillListScrollFrame, "BOTTOMLEFT", 0, -8)
		TradeSkillDetailScrollFrame:SetPoint("TOPRIGHT", TradeSkillListScrollFrame, "BOTTOMRIGHT", 0, -8)
		TradeSkillDetailScrollFrame:SetHeight(DEFAULT_DETAIL_FRAME_HEIGHT)
	end
	
	TradeSkillInputBox:ClearAllPoints()
	TradeSkillInputBox:SetPoint("RIGHT", TradeSkillIncrementButton, "LEFT", 0, 0)
	TradeSkillInputBox:SetJustifyH("RIGHT")
	TradeSkillInputBox:SetTextInsets(0, 4, 2, 0)
	
	TradeSkillDecrementButton:ClearAllPoints()
	TradeSkillDecrementButton:SetPoint("RIGHT", TradeSkillInputBox, "LEFT", -4, 0)
	
	TradeSkillCreateAllButton:ClearAllPoints()
	TradeSkillCreateAllButton:SetPoint("RIGHT", TradeSkillDecrementButton, "LEFT", 0, 0)

	local height = TRADE_SKILL_HEIGHT * TRADE_SKILLS_DISPLAYED
	if height > 240 then
		CreateTex(TradeSkillListScrollFrame, SCROLL_BAR_FNAME, "BACKGROUND", 30, height - 235, "LEFT", TradeSkillListScrollFrame, "RIGHT", -3, 0):SetTexCoord(0, 0.46875, 0.2, 0.9609375)
	elseif texf then 
		texf:Hide()
	end
	
	TradeSkillFrame_Update()
	
	TradeSkillDWQueueFrame:ClearAllPoints()
	TradeSkillDWQueueFrame:SetPoint("TOPLEFT", TradeSkillFrame, "TOPRIGHT", 30, 0)
	--TradeSkillDWQueueFrame:SetPoint("BOTTOM", TradeSkillFrame, "BOTTOM", 0, 0)
	TradeSkillDWQueueFrame:SetHeight(TradeSkillFrame:GetHeight())
	TradeSkillDWQueueFrame:Show()
	TradeSkillDWQueueFrame:SetFrameStrata(TradeSkillDW_Settings.frameStrata)
	SetPortraitToTexture(_G[TradeSkillDWQueueFrame:GetName().."Portrait"], GetTradeSkillTexture())
	TradeSkillDWQueue_Init()
end

local function expandButton_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	if (self.expanded) then
		GameTooltip:SetText(HIGHLIGHT_FONT_COLOR_CODE..self.collapseTooltip..FONT_COLOR_CODE_CLOSE)
	else
		GameTooltip:SetText(HIGHLIGHT_FONT_COLOR_CODE..self.expandTooltip..FONT_COLOR_CODE_CLOSE)
	end
end

local function expandButton_OnLeave(self)
	GameTooltip:Hide()
end

local function setExpandButtonTextures(self)
	if (self.expanded) then
		self:SetNormalTexture([[Interface\Buttons\UI-SpellbookIcon-PrevPage-Up]])
		self:SetPushedTexture([[Interface\Buttons\UI-SpellbookIcon-PrevPage-Down]])
		self:SetDisabledTexture([[Interface\Buttons\UI-SpellbookIcon-PrevPage-Disabled]])
	else
		self:SetNormalTexture([[Interface\Buttons\UI-SpellbookIcon-NextPage-Up]])
		self:SetPushedTexture([[Interface\Buttons\UI-SpellbookIcon-NextPage-Down]])
		self:SetDisabledTexture([[Interface\Buttons\UI-SpellbookIcon-NextPage-Disabled]]) 		
	end
end

local function expandButton_OnClick(self)
	if (self.expanded) then
		PlaySound("igCharacterInfoClose")
	else
		PlaySound("igCharacterInfoOpen")
	end
	self.expanded = not(self.expanded)
	setExpandButtonTextures(self)
	TradeSkillDW_Settings["expanded"] = self.expanded
	ttsSlider_OnValueChanged(nil, TRADE_SKILLS_DISPLAYED)
	if (GameTooltip:GetOwner() == self) then
		self:GetScript("OnEnter")(self)
	end
end

local function resizeGripButton_OnMouseDown(self, button)
	if (button == "LeftButton") then
		leftPos = TradeSkillFrame:GetLeft()
		topPos = TradeSkillFrame:GetTop()
		TradeSkillFrame:SetResizable(true)
		TradeSkillFrame:StartSizing("BOTTOMLEFT")
	end 
end

local function resizeGripButton_OnMouseUp(self, button)
	TradeSkillFrame:StopMovingOrSizing()
	TradeSkillFrame:SetResizable(false)
	TradeSkillFrame:ClearAllPoints()
	TradeSkillFrame:SetPoint("TOPLEFT", UiParent, "BOTTOMLEFT", leftPos, topPos)
	--stuff
	local listHeight, listCount
	if expandButton.expanded then
		listHeight = TradeSkillFrame:GetHeight() - DEFAULT_HEADER_FRAME_HEIGHT
	else
		listHeight = TradeSkillFrame:GetHeight() - (DEFAULT_HEADER_FRAME_HEIGHT + 8 + DEFAULT_DETAIL_FRAME_HEIGHT)
	end
	listCount = math.floor(listHeight / TRADE_SKILL_HEIGHT)
	ttsSlider_OnValueChanged(nil, listCount)
end

local function TradeSkillDWQueue_UpdateCooldownSpell(tab, spell)
	if spell then
		local start, duration, enable = GetSpellCooldown(spell)
		if start then
			local charges, maxCharges = GetSpellCharges(spell)
			CooldownFrame_SetTimer(tab.cooldown, start, duration, enable, charges, maxCharges)
		else
			CooldownFrame_SetTimer(tab.cooldown, 0, 0, 0)
			tab.cooldown:Hide()
		end
	end
end

local function TradeSkillDWQueue_UpdateCheckedSpell(tab, spell)
	local currentSkill = GetTradeSkillLine()

	if spell then
		--print(currentSkill, spell) --"Smelting" is "Mining"
		if (currentSkill == spell) then
			tab:SetChecked(1)
		else
			tab:SetChecked(nil)
		end
	else
		tab:SetChecked(nil)
	end
end

local function TradeSkillDWQueue_UpdateCooldowns()
	for _, tab in pairs(tabPool[SKILL_SECONDARY]) do
		TradeSkillDWQueue_UpdateCooldownSpell(tab, tab.skill)
	end
end

local function 	TradeSkillDWQueue_UpdateChecked()
	for _, tab in pairs(tabPool[SKILL_PRIMARY]) do
		TradeSkillDWQueue_UpdateCheckedSpell(tab, tab.skill)
	end
	for _, tab in pairs(tabPool[SKILL_SECONDARY]) do
		TradeSkillDWQueue_UpdateCheckedSpell(tab, tab.skill)
	end
end

local function SetTabValues(value)
	local tab, anchor	
	local index = 1
	for _, v in pairs(knownSkills[value]) do --v is tradeSkillName
		tab = tabPool[value][index]
		if not(tab) then
			tab = CreateFrame("CheckButton", nil, TradeSkillFrame, "TradeSkillDW_SkillTabTemplate")
			tabPool[value][index] = tab
		end

		tab.skill = v
		tab.slot = knownSkills[SKILL_SLOT][v].slot
		tab.bookType = knownSkills[SKILL_SLOT][v].bookType

		if (anchor) then
			if value == SKILL_PRIMARY then
				tab:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -20)
			else
				tab:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", 0, 20)
			end
		else
			if value == SKILL_PRIMARY then
				tab:SetPoint("TOPLEFT", TradeSkillFrame, "TOPRIGHT", 0, -30)
			else
				tab:SetPoint("BOTTOMLEFT", TradeSkillFrame, "BOTTOMRIGHT", 0, 30)
			end
		end

		anchor = tab

		local _, _, texture = GetSpellInfo(tab.skill)

		tab:SetAttribute("*macrotext*", "/cast "..tab.skill)
		tab.nt = tab:GetNormalTexture()
		tab.nt:SetTexture(texture)

		TradeSkillDWQueue_UpdateCooldownSpell(tab, tab.skill)
		TradeSkillDWQueue_UpdateCheckedSpell(tab, tab.skill)
		
		index = index + 1
	end
end

local function FindSpellSlot(name)
	local bookType = BOOKTYPE_SPELL
	--name, texture, offset, numSpells
	local _, _, offset, numSpells = GetSpellTabInfo(2)
	local total = numSpells

	for slot = offset, offset + total do
		local skillType, spellId = GetSpellBookItemInfo(slot, bookType)
		local spellName, rank = GetSpellBookItemName(slot, bookType)

		if name == spellName then
			return slot, bookType, spellId
		end
	end
end

local function SetTabs()
	-- clear
	for k, v in pairs(knownSkills[SKILL_PRIMARY]) do
		if v then
			table.remove(knownSkills[SKILL_PRIMARY], k)
		end
	end
	for k, v in pairs(knownSkills[SKILL_SECONDARY]) do
		if v then
			table.remove(knownSkills[SKILL_SECONDARY], k)
		end
	end
	
	-- prof1, prof2, archaeology, fishing, cooking, firstAid
	local professions = {GetProfessions()}
	local index = 1
	for _, v in pairs(professions) do
		if v then
			-- name, texture, rank, maxRank, numSpells, spelloffset, skillLine, rankModifier, specializationIndex, specializationOffset
			--local name, texture, rank, maxRank, numSpells, spelloffset, skillLine, rankModifier, specializationIndex, specializationOffset = GetProfessionInfo(v)
			--print(name, texture, rank, maxRank, numSpells, spelloffset, skillLine, rankModifier, specializationIndex, specializationOffset)
			local name, _, _, _, numSpells, spelloffset, skillLine = GetProfessionInfo(v)
			--print(name, skillLine)
			if TradeSkillDW_AllowSkills[skillLine] then
				if numSpells > 0 and TradeSkillDW_AllowPrimarySkills[skillLine] then
					local slot = spelloffset + 1
					local spellName, subSpellName = GetSpellBookItemName(slot, BOOKTYPE_PROFESSION)
					knownSkills[SKILL_PRIMARY][index] = spellName
					knownSkills[SKILL_SLOT][spellName] = knownSkills[SKILL_SLOT][spellName] or {}
					knownSkills[SKILL_SLOT][spellName].slot = slot
					knownSkills[SKILL_SLOT][spellName].bookType = BOOKTYPE_PROFESSION
				end
				if numSpells > 1 and TradeSkillDW_AllowSecondarySkills[skillLine] then
					local slot = spelloffset + 2
					local spellName, subSpellName = GetSpellBookItemName(slot, BOOKTYPE_PROFESSION)
					knownSkills[SKILL_SECONDARY][index] = spellName
					knownSkills[SKILL_SLOT][spellName] = knownSkills[SKILL_SLOT][spellName] or {}
					knownSkills[SKILL_SLOT][spellName].slot = slot --slot in 
					knownSkills[SKILL_SLOT][spellName].bookType = BOOKTYPE_PROFESSION
				end
				index = index + 1
			end
		end
	end
	
	--custom skills like Runeforging
	for skillId, spellName in pairs(TradeSkillDW_CustomSkills) do --skillId, skillName
		if IsUsableSpell(spellName) then
			knownSkills[SKILL_PRIMARY][index] = spellName
			local slot, bookType, spellId = FindSpellSlot(spellName)
			knownSkills[SKILL_SLOT][spellName] = knownSkills[SKILL_SLOT][spellName] or {}
			knownSkills[SKILL_SLOT][spellName].slot = slot
			knownSkills[SKILL_SLOT][spellName].bookType = bookType
			index = index + 1
		end
	end
	SetTabValues(SKILL_PRIMARY)
	SetTabValues(SKILL_SECONDARY)
end

local function Update()
	if (InCombatLockdown()) then 
		return
	end

	TradeSkillDW_Settings = TradeSkillDW_Settings or {}

	TradeSkillFrame:SetClampedToScreen(true)
	TradeSkillDW_Settings.frameStrata = TradeSkillDW_Settings.frameStrata or TradeSkillFrame:GetFrameStrata()
	TradeSkillFrame:SetFrameStrata(TradeSkillDW_Settings.frameStrata)
	
	if TradeSkillDW_Settings.movable then
		TradeSkillFrame:SetMovable(true)
		TradeSkillFrame:SetScript("OnMouseDown", function() TradeSkillFrame:StartMoving() end)
		TradeSkillFrame:SetScript("OnMouseUp", function() TradeSkillFrame:StopMovingOrSizing() end)
	else
		TradeSkillFrame:SetMovable(false)
		TradeSkillFrame:SetScript("OnMouseDown", nil)
		TradeSkillFrame:SetScript("OnMouseUp", nil)
	end
	
	if expandButton == nil then
		expandButton = CreateFrame("Button", "TradeSkillDWExpandButton", TradeSkillFrame)
		expandButton:SetWidth(32)
		expandButton:SetHeight(32)
		
		if TradeSkillDW_Settings["expanded"] == nil then
			TradeSkillDW_Settings["expanded"] = true
		end
		expandButton.expanded = TradeSkillDW_Settings["expanded"]
		
		setExpandButtonTextures(expandButton)
		expandButton:SetHighlightTexture([[Interface\Buttons\UI-Common-MouseHilight]])
		expandButton.collapseTooltip = "Collapse to Single mode"
		expandButton.expandTooltip = "Expand to Double Wide mode"
		expandButton:SetScript("OnEnter", expandButton_OnEnter)
		expandButton:SetScript("OnLeave", expandButton_OnLeave)
		expandButton:SetScript("OnClick", expandButton_OnClick)
		
		expandButton:ClearAllPoints()
		expandButton:SetPoint("BOTTOMLEFT", TradeSkillFilterButton, "BOTTOMRIGHT", 12, -4)
		expandButton:SetFrameLevel(expandButton:GetParent():GetFrameLevel() + 2)
	end
	
	if resizeGripButton == nil then
		resizeGripButton = CreateFrame("Button", "TradeSkillDWResizeGripButton", TradeSkillFrame)
		resizeGripButton:SetWidth(32)
		resizeGripButton:SetHeight(32)
		resizeGripButton:SetNormalTexture([[Interface\AddOns\TradeSkillDW\textures\ResizeGripLeft]])
		resizeGripButton:SetHighlightTexture([[Interface\AddOns\TradeSkillDW\textures\ResizeGripLeft]])
		resizeGripButton:SetPoint("BOTTOMLEFT", TradeSkillFrame, "BOTTOMLEFT", -4, -4)
		resizeGripButton:SetScript("OnMouseDown", resizeGripButton_OnMouseDown)
		resizeGripButton:SetScript("OnMouseUp", resizeGripButton_OnMouseUp)
	end
	
	TradeSkillDW_Settings["NumButtons"] = TradeSkillDW_Settings["NumButtons"] or 25

	for i, region in ipairs({TradeSkillFrame:GetRegions()}) do
		if region:IsObjectType("Texture") then
			if (region:GetTexture() == HORZ_BAR_FNAME) then
				--print("region found", region:GetName())
				if not(region:GetName()) then --right bar has no name
					TradeSkillHorizontalBarRight = region
					--print("right bar found")
					break
				end
			end
		end
	end

	ttsSlider_OnValueChanged(nil, TradeSkillDW_Settings["NumButtons"]) --TRADE_SKILLS_DISPLAYED = 25

	SetTabs()
	TradeSkillCancelButton:SetText("Queue")
	if not(tradeskillDW_scriptsSet) then
		tradeskillDW_scriptsSet = true
		TradeSkillCancelButton:SetScript("OnEnter", TradeSkillDWQueueButton_OnEnter)
		TradeSkillCancelButton:SetScript("OnLeave", TradeSkillDWQueueButton_OnLeave)
		TradeSkillCancelButton:SetScript("OnClick", TradeSkillDWQueue_OnClick)
		TradeSkillCancelButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	end
	
	--TradeSkillCreateAllButton:SetScript("OnClick", TradeSkillDWQueue_OnTsCreateAllClick)
	--TradeSkillCreateButton:SetScript("OnClick", TradeSkillDWQueue_OnTsCreateClick)
end

local function CheckIsValueInTable(tbl, value)
	for _, v in pairs(tbl) do
		if v == value then
			return true
		end
	end

	return false
end

function TradeSkillDW_SkillTab_OnEnter(self)
	if (GetCVar("UberTooltips") == "1") then
		GameTooltip_SetDefaultAnchor(GameTooltip, self)
	else
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	end
	if self.slot and self.bookType then
		GameTooltip:SetSpellBookItem(self.slot, self.bookType)
	end
end

function TradeSkillDW_SkillTab_OnLeave(self)
	GameTooltip:Hide()
end

local function controlOnEvent(self, event, ...)
	--print(event)
	if (event == "TRADE_SKILL_CLOSE") then
		TradeSkillDWQueueFrame:Hide()
	end

	if ( not TradeSkillFrame:IsShown() ) then
		return
	end
	if (event == "TRADE_SKILL_SHOW") then
		Update()
	elseif (event == "TRADE_SKILL_UPDATE") then
		TradeSkillDWQueue_Init()
	elseif (event == "SPELL_UPDATE_COOLDOWN") then
		TradeSkillDWQueue_UpdateCooldowns()
	elseif (event == "ACTIONBAR_UPDATE_STATE") then
		TradeSkillDWQueue_UpdateChecked()
	elseif (event == "TRADE_SKILL_FILTER_UPDATE") then
		--local text = TradeSkillFrameSearchBox:GetText()
		--print("TradeSkillFrameSearchBox", text)
		--if text == "" then
			TradeSkillDWQueue_Update()
		--end
	end
end

function TradeSkillDW_SlashHandler(msg, editbox)
	local command, rest = msg:match("^(%S*)%s*(.-)$")
	-- Any leading non-whitespace is captured into command
	-- the rest (minus leading whitespace) is captured into rest.
	command = string.lower(command)
	
	if not(TradeSkillDW_Settings) then
		Update()
	end

	if command == "" then
		print("TradeSkillDW slash commands:\n/tsdw strata LEVEL\ncurrent strata is ", TradeSkillDW_Settings.frameStrata)
	elseif command == "strata" then
		if stratas[rest] then
			TradeSkillDW_Settings.frameStrata = rest
			print("TradeSkillDW strata set to ", rest, "\nreopen to take effect")
		else
			print("wrong strata ", rest, ", possible")
			for k, v in pairs(stratas) do
				print(k)
			end
		end
	elseif command == "movable" then
		TradeSkillDW_Settings.movable = not(TradeSkillDW_Settings.movable)
		print("movable = ", tostring(TradeSkillDW_Settings.movable))
		if TradeSkillDW_Settings.movable then
			TradeSkillFrame:SetMovable(true)
			TradeSkillFrame:SetScript("OnMouseDown", function() TradeSkillFrame:StartMoving() end)
			TradeSkillFrame:SetScript("OnMouseUp", function() TradeSkillFrame:StopMovingOrSizing() end)
		else
			TradeSkillFrame:SetMovable(false)
			TradeSkillFrame:SetScript("OnMouseDown", nil)
			TradeSkillFrame:SetScript("OnMouseUp", nil)
		end
	elseif command == "test" then
		if not(TradeSkillFrame:IsVisible()) then
			print("use 'test' when TradeSkillFrame visible")
			return
		end
		
		print("TRADE_SKILLS_DISPLAYED = "..TRADE_SKILLS_DISPLAYED)
		for i = 9, TRADE_SKILLS_DISPLAYED do
			if buttons[i] == nil then
				print("buttons[", i, "] is nil")
			else
				print("buttons[", i, "] is visible ", tostring(buttons[i]:IsVisible()))
				buttons[i]:SetText("test button "..i)
			end
		end
	end
end

-- event frame

local frame = CreateFrame("Frame", nil, UIParent)
frame:SetScript("OnEvent", controlOnEvent)
frame:RegisterEvent("TRADE_SKILL_SHOW")
frame:RegisterEvent("TRADE_SKILL_CLOSE")
frame:RegisterEvent("TRADE_SKILL_UPDATE")
frame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
frame:RegisterEvent("ACTIONBAR_UPDATE_STATE")
frame:RegisterEvent("TRADE_SKILL_FILTER_UPDATE")

-- init slash
SLASH_TSDW1 = "/tsdw"
SlashCmdList["TSDW"] = TradeSkillDW_SlashHandler
