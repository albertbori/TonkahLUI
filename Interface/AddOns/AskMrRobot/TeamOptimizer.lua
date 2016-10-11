local Amr = LibStub("AceAddon-3.0"):GetAddon("AskMrRobot")
local L = LibStub("AceLocale-3.0"):GetLocale("AskMrRobot", true)
local AceGUI = LibStub("AceGUI-3.0")

local _panelSplash
local _panelStartLoot
local _lblStartLoot
local _btnStartLoot
local _scrollHistory
local _tabs

local _messagePrefixes = {
	RosterRequestGear = "_TRR",
	RosterGear = "_TRG",
	ItemExportRequestGear = "_TLR",
	ItemExportGear = "_TLG",
	ItemExportLoot = "_TLL",
	SyncRequest = "_TSR",
	Sync = "_TSS"
}

Amr.LootMessagePrefixes = {
	Start = "_TCS",
	Roll = "_TCR",
	Veto = "_TCV",
	Rand = "_TCD",
	Give = "_TCG",
	Finish = "_TCF"
}

local function renderExportWindow(container, instructions, text)

	local bg = Amr:RenderCoverChrome(container, 800, 450)
	
	local lbl = AceGUI:Create("AmrUiLabel")
	lbl:SetWidth(750)
	lbl:SetText(L.TeamExportHelp)
	lbl:SetPoint("TOP", bg.content, "TOP", 0, -10)
	bg:AddChild(lbl)
	
	local lbl2 = AceGUI:Create("AmrUiLabel")
	lbl2:SetWidth(750)
	lbl2:SetText(instructions)
	lbl2:SetPoint("TOP", lbl.frame, "BOTTOM", 0, -10)
	bg:AddChild(lbl2)

	local txt = AceGUI:Create("AmrUiTextarea")
	txt:SetWidth(750)
	txt:SetHeight(300)
	txt:SetPoint("TOP", lbl2.frame, "BOTTOM", 0, -10)
	txt:SetFont(Amr.CreateFont("Regular", 12, Amr.Colors.Text))
	txt:SetText(text)
	bg:AddChild(txt)
	
	local btn = AceGUI:Create("AmrUiButton")
	btn:SetText(L.TeamButtonExportClose)
	btn:SetBackgroundColor(Amr.Colors.Green)
	btn:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.White))
	btn:SetWidth(120)
	btn:SetHeight(28)
	btn:SetPoint("TOPLEFT", txt.frame, "BOTTOMLEFT", 0, -10)
	btn:SetCallback("OnClick", function(widget) Amr:HideCover() end)
	bg:AddChild(btn)
	
	return txt
end

local function renderImportWindow(container)

	local bg = Amr:RenderCoverChrome(container, 700, 450)
	
	local lbl = AceGUI:Create("AmrUiLabel")
	lbl:SetWidth(600)
	lbl:SetText(L.TeamImportRankingsHeader)
	lbl:SetPoint("TOP", bg.content, "TOP", 0, -10)
	bg:AddChild(lbl)

	local txt = AceGUI:Create("AmrUiTextarea")
	txt:SetWidth(600)
	txt:SetHeight(300)
	txt:SetPoint("TOP", lbl.frame, "BOTTOM", 0, -10)
	txt:SetFont(Amr.CreateFont("Regular", 12, Amr.Colors.Text))
	bg:AddChild(txt)
	
	local btnImportOk = AceGUI:Create("AmrUiButton")
	btnImportOk:SetText(L.ImportButtonOk)
	btnImportOk:SetBackgroundColor(Amr.Colors.Green)
	btnImportOk:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.White))
	btnImportOk:SetWidth(120)
	btnImportOk:SetHeight(28)
	btnImportOk:SetPoint("TOPLEFT", txt.frame, "BOTTOMLEFT", 0, -10)
	bg:AddChild(btnImportOk)
	
	local btnImportCancel = AceGUI:Create("AmrUiButton")
	btnImportCancel:SetText(L.ImportButtonCancel)
	btnImportCancel:SetBackgroundColor(Amr.Colors.Green)
	btnImportCancel:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.White))
	btnImportCancel:SetWidth(120)
	btnImportCancel:SetHeight(28)
	btnImportCancel:SetPoint("LEFT", btnImportOk.frame, "RIGHT", 20, 0)
	btnImportCancel:SetCallback("OnClick", function(widget) Amr:HideCover() end)
	bg:AddChild(btnImportCancel)
	
	local lblErr = AceGUI:Create("AmrUiLabel")
	lblErr:SetWidth(600)
	lblErr:SetFont(Amr.CreateFont("Bold", 14, Amr.Colors.Red))
	lblErr:SetText("")
	lblErr:SetPoint("TOPLEFT", btnImportOk.frame, "BOTTOMLEFT", 0, -20)
	bg:AddChild(lblErr)
	
	btnImportOk:SetCallback("OnClick", function(widget)
		local msg = txt:GetText()
		local err = Amr:ImportRankings(msg)
		if err then
			lblErr:SetText(err)
			txt:SetFocus(true)
		else
			Amr:HideCover()
			Amr:RefreshTeamUi()
		end
	end)
	
	return txt
end

local function renderVersionWindow(container)

	local windowWidth = 500
	local lbl, lbl2
	local bg, border = Amr:RenderCoverChrome(container, windowWidth, 600)
	
	lbl = AceGUI:Create("AmrUiLabel")
	lbl:SetWidth(windowWidth - 60)
	lbl:SetJustifyH("CENTER")
	lbl:SetFont(Amr.CreateFont("Bold", 24, Amr.Colors.TextHeaderActive))
	lbl:SetText(L.TeamVersionTitle)
	lbl:SetPoint("TOP", bg.content, "TOP", 0, -10)
	bg:AddChild(lbl)
	
	if not IsInGroup() and not IsInRaid() then
		lbl2 = AceGUI:Create("AmrUiLabel")
		lbl2:SetWidth(windowWidth - 20)
		lbl2:SetJustifyH("CENTER")
		lbl2:SetFont(Amr.CreateFont("Italic", 16, Amr.Colors.TextTan))
		lbl2:SetText(L.TeamVersionNoGroup)
		lbl2:SetPoint("TOP", lbl.frame, "BOTTOM", 0, -25)
		bg:AddChild(lbl2)
		border:SetHeight(150)
	else
		local units = Amr:GetGroupUnitIdentifiers()
	
		local missing = {}
		local tooLow = {}
		
		for i, unitId in ipairs(units) do
			local realm, name = Amr:GetRealmAndName(unitId)
			if realm then
				local ver = Amr:GetAddonVersion(realm, name)
				if ver == 0 then
					table.insert(missing, { unitId, realm, name })
				elseif ver < Amr.MIN_ADDON_VERSION then
					table.insert(tooLow, { unitId, realm, name, ver })
				end
			end
		end
		
		if #missing == 0 and #tooLow == 0 then
			lbl2 = AceGUI:Create("AmrUiLabel")
			lbl2:SetWidth(windowWidth - 20)
			lbl2:SetJustifyH("CENTER")
			lbl2:SetFont(Amr.CreateFont("Italic", 16, Amr.Colors.TextTan))
			lbl2:SetText(L.TeamVersionGood)
			lbl2:SetPoint("TOP", lbl.frame, "BOTTOM", 0, -25)
			bg:AddChild(lbl2)
			border:SetHeight(150)
		else
			local prev = lbl
			local h = 0
			
			-- helper to render a player name
			local function renderItem(obj, showVer)
				lbl = AceGUI:Create("AmrUiLabel")
				lbl:SetWidth(120)
				
				local cls, clsEn = UnitClass(obj[1])
				local color = clsEn and Amr.Colors.Classes[clsEn] or Amr.Colors.TextHeaderDisabled
				lbl:SetFont(Amr.CreateFont("Regular", 14, color))
				
				lbl:SetText(obj[3])
				lbl:SetPoint("TOPLEFT", prev.frame, "BOTTOMLEFT", 0, -5)
				bg:AddChild(lbl)
				prev = lbl
				h = h + lbl:GetHeight() + 5
				
				if showVer then
					lbl2 = AceGUI:Create("AmrUiLabel")
					lbl2:SetWidth(60)
					lbl2:SetFont(Amr.CreateFont("Regular", 14, Amr.Colors.White))
					lbl2:SetText("v" .. obj[4])
					lbl2:SetPoint("LEFT", lbl.frame, "RIGHT", 5, 0)
					bg:AddChild(lbl2)
				end
			end
			
			if #missing > 0 then
				lbl2 = AceGUI:Create("AmrUiLabel")
				lbl2:SetWidth(180)
				lbl2:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.Red))
				lbl2:SetText(L.TeamVersionMissing)
				lbl2:SetJustifyH("CENTER")
				lbl2:SetPoint("TOP", prev.frame, "BOTTOM", 0, -20)
				bg:AddChild(lbl2)
				h = h + lbl2:GetHeight() + 20
				
				prev = lbl2
				for i, obj in ipairs(missing) do
					renderItem(obj)
				end
			end
			
			if #tooLow > 0 then
				lbl2 = AceGUI:Create("AmrUiLabel")
				lbl2:SetWidth(180)
				lbl2:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.Gold))
				lbl2:SetText(L.TeamVersionOld)
				lbl2:SetJustifyH("CENTER")
				lbl2:SetPoint("TOP", prev.frame, "BOTTOM", 0, -20)
				bg:AddChild(lbl2)
				h = h + lbl2:GetHeight() + 20
				
				prev = lbl2
				for i, obj in ipairs(tooLow) do
					renderItem(obj, true)
				end
			end
			
			border:SetHeight(h + 100)
		end
	end
	
	local btn = AceGUI:Create("AmrUiButton")
	btn:SetText(L.TeamButtonExportClose)
	btn:SetBackgroundColor(Amr.Colors.Green)
	btn:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.White))
	btn:SetWidth(120)
	btn:SetHeight(28)
	btn:SetPoint("BOTTOM", bg.content, "BOTTOM", 0, 10)
	btn:SetCallback("OnClick", function(widget) Amr:HideCover() end)
	bg:AddChild(btn)
end

local function onVersionClick()
	-- show a window with players who do not have the addon or too low a version
	Amr:ShowCover(renderVersionWindow)
end

local function onExportRosterClick()

	Amr:ShowCover(L.TeamExportRosterLoading)
	
	Amr:ExportRosterAsync(function(txt)
		Amr:HideCover()
		
		if not txt then
			Amr:ShowAlert(L.TeamAlertNoGroup, L.AlertOk)
			return
		end
		
		Amr:ShowCover(function(container)
			local textbox = renderExportWindow(container, L.TeamExportRosterText, txt)
			textbox:SetFocus(true)
		end)
	end)
	
end

local function onExportLootClick()

	Amr:ShowCover(L.TeamExportRosterLoading)

	Amr:ExportLootAsync(function(txt)
		Amr:HideCover()
		
		if txt == "NOGROUP" then
			Amr:ShowAlert(L.TeamAlertNoGroup, L.AlertOk)
			return
		elseif txt == "NOLOOT" then
			Amr:ShowAlert(L.TeamAlertNoLoot, L.AlertOk)
			return
		else
			Amr:ShowCover(function(container)
				local textbox = renderExportWindow(container, L.TeamExportLootText, txt)
				textbox:SetFocus(true)
			end)
		end
	end)
end

local function onImportRankingsClick()
	Amr:ShowCover(function(container)
		local textbox = renderImportWindow(container)
		textbox:SetFocus(true)
	end)
end

local function renderTab(tab, container)

	local lbl, lbl2
	
	if tab == "Member" then
		local lbl = AceGUI:Create("AmrUiLabel")
		lbl:SetWidth(500)
		lbl:SetFont(Amr.CreateFont("Regular", 24, Amr.Colors.TextTan))
		lbl:SetText(L.TeamMemberText)
		lbl:SetPoint("TOPLEFT", container.content, "TOPLEFT", 0, -40)
		container:AddChild(lbl)
		
		-- if loot is still going on, show a button to re-show the loot window
		if Amr.db.char.TeamOpt.LootInProgress then
			lbl2 = AceGUI:Create("AmrUiLabel")
			lbl2:SetWidth(500)
			lbl2:SetFont(Amr.CreateFont("Italic", 18, Amr.Colors.TextTan))
			lbl2:SetText(L.TeamMemberShowLootLabel)
			lbl2:SetPoint("TOPLEFT", lbl.frame, "BOTTOMLEFT", 0, -60)
			container:AddChild(lbl2)
		
			local btn = AceGUI:Create("AmrUiButton")
			btn:SetWidth(180)
			btn:SetHeight(26)
			btn:SetBackgroundColor(Amr.Colors.Blue)
			btn:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.White))
			btn:SetText(L.TeamMemberShowLoot)
			btn:SetPoint("TOPLEFT", lbl2.frame, "BOTTOMLEFT", 0, -10)
			btn:SetCallback("OnClick", function(widget) 
				Amr:ShowLootWindow()
				Amr:RefreshLootWindow()
				Amr:RefreshLootRolls()
			end)
			container:AddChild(btn)
		end
		
	elseif tab == "Leader" then
	
		local lblNum = AceGUI:Create("AmrUiLabel")
		lblNum:SetFont(Amr.CreateFont("Bold", 26, Amr.Colors.White))
		lblNum:SetText("0.")
		lblNum:SetWidth(40)
		lblNum:SetPoint("TOPLEFT", container.content, "TOPLEFT", 6, -40)
		container:AddChild(lblNum)
	
		local btnVersion = AceGUI:Create("AmrUiButton")
		btnVersion:SetText(L.TeamButtonVersionText)
		btnVersion:SetBackgroundColor(Amr.Colors.Orange)
		btnVersion:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.White))
		btnVersion:SetWidth(180)
		btnVersion:SetHeight(26)
		btnVersion:SetPoint("LEFT", lblNum.frame, "RIGHT", 0, -1)
		btnVersion:SetCallback("OnClick", onVersionClick)
		container:AddChild(btnVersion)
		
		lbl = AceGUI:Create("AmrUiLabel")
		lbl:SetFont(Amr.CreateFont("Italic", 14, Amr.Colors.TextTan))
		lbl:SetText(L.TeamExportVersionLabel)
		lbl:SetWidth(400)
		lbl:SetPoint("TOPLEFT", btnVersion.frame, "TOPRIGHT", 20, 0)
		container:AddChild(lbl)
		
		lblNum = AceGUI:Create("AmrUiLabel")
		lblNum:SetFont(Amr.CreateFont("Bold", 26, Amr.Colors.White))
		lblNum:SetText("1.")
		lblNum:SetWidth(40)
		lblNum:SetPoint("TOPRIGHT", btnVersion.frame, "BOTTOMLEFT", 0, -39)
		container:AddChild(lblNum)
		
		local btnRoster = AceGUI:Create("AmrUiButton")
		btnRoster:SetText(L.TeamButtonExportRosterText)
		btnRoster:SetBackgroundColor(Amr.Colors.Orange)
		btnRoster:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.White))
		btnRoster:SetWidth(180)
		btnRoster:SetHeight(26)
		btnRoster:SetPoint("LEFT", lblNum.frame, "RIGHT", 0, -1)
		btnRoster:SetCallback("OnClick", onExportRosterClick)
		container:AddChild(btnRoster)
		
		lbl = AceGUI:Create("AmrUiLabel")
		lbl:SetFont(Amr.CreateFont("Italic", 14, Amr.Colors.TextTan))
		lbl:SetText(L.TeamExportRosterLabel)
		lbl:SetWidth(400)
		lbl:SetPoint("TOPLEFT", btnRoster.frame, "TOPRIGHT", 20, 0)
		container:AddChild(lbl)

		lblNum = AceGUI:Create("AmrUiLabel")
		lblNum:SetFont(Amr.CreateFont("Bold", 26, Amr.Colors.White))
		lblNum:SetText("2.")
		lblNum:SetWidth(40)
		lblNum:SetPoint("TOPRIGHT", btnRoster.frame, "BOTTOMLEFT", 0, -89)
		container:AddChild(lblNum)
		
		local btnLoot = AceGUI:Create("AmrUiButton")
		btnLoot:SetText(L.TeamButtonExportLootText)
		btnLoot:SetBackgroundColor(Amr.Colors.Orange)
		btnLoot:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.White))
		btnLoot:SetWidth(180)
		btnLoot:SetHeight(26)
		btnLoot:SetPoint("LEFT", lblNum.frame, "RIGHT", 0, -1)
		btnLoot:SetCallback("OnClick", onExportLootClick)
		container:AddChild(btnLoot)

		lbl = AceGUI:Create("AmrUiLabel")
		lbl:SetFont(Amr.CreateFont("Italic", 14, Amr.Colors.TextTan))
		lbl:SetText(L.TeamExportLootLabel)
		lbl:SetWidth(400)
		lbl:SetPoint("TOPLEFT", btnLoot.frame, "TOPRIGHT", 20, 0)
		container:AddChild(lbl)
		
		lbl2 = AceGUI:Create("AmrUiLabel")
		lbl2:SetFont(Amr.CreateFont("Bold", 14, Amr.Colors.Blue))
		lbl2:SetText(L.TeamExportLootLabel2)
		lbl2:SetWidth(400)
		lbl2:SetPoint("TOPLEFT", lbl.frame, "BOTTOMLEFT", 0, -5)
		container:AddChild(lbl2)
				
		lblNum = AceGUI:Create("AmrUiLabel")
		lblNum:SetFont(Amr.CreateFont("Bold", 26, Amr.Colors.White))
		lblNum:SetText("3.")
		lblNum:SetWidth(40)
		lblNum:SetPoint("TOPRIGHT", btnLoot.frame, "BOTTOMLEFT", 0, -89)
		container:AddChild(lblNum)
		
		local btnRank = AceGUI:Create("AmrUiButton")
		btnRank:SetText(L.TeamButtonImportRankingsText)
		btnRank:SetBackgroundColor(Amr.Colors.Green)
		btnRank:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.White))
		btnRank:SetWidth(180)
		btnRank:SetHeight(26)
		btnRank:SetPoint("LEFT", lblNum.frame, "RIGHT", 0, -1)
		btnRank:SetCallback("OnClick", onImportRankingsClick)
		container:AddChild(btnRank)
		
		lbl = AceGUI:Create("AmrUiLabel")
		lbl:SetFont(Amr.CreateFont("Italic", 14, Amr.Colors.TextTan))
		lbl:SetText(L.TeamImportRankingsLabel)
		lbl:SetWidth(400)
		lbl:SetPoint("TOPLEFT", btnRank.frame, "TOPRIGHT", 20, 0)
		container:AddChild(lbl)
		
		_panelStartLoot = AceGUI:Create("AmrUiPanel")
		_panelStartLoot:SetLayout("None")
		_panelStartLoot:SetBackgroundColor(Amr.Colors.Black, 0)
		_panelStartLoot:SetPoint("TOPLEFT", lblNum.frame, "BOTTOMLEFT", 0, -90)
		container:AddChild(_panelStartLoot)
		_panelStartLoot:SetVisible(false)
		
		lblNum = AceGUI:Create("AmrUiLabel")
		lblNum:SetFont(Amr.CreateFont("Bold", 26, Amr.Colors.White))
		lblNum:SetText("4.")
		lblNum:SetWidth(40)
		lblNum:SetPoint("TOPLEFT", _panelStartLoot.content, "TOPLEFT")
		_panelStartLoot:AddChild(lblNum)
		
		_btnStartLoot = AceGUI:Create("AmrUiButton")
		_btnStartLoot:SetText(L.TeamButtonStartLootText)
		_btnStartLoot:SetBackgroundColor(Amr.Colors.Blue)
		_btnStartLoot:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.White))
		_btnStartLoot:SetWidth(180)
		_btnStartLoot:SetHeight(26)
		_btnStartLoot:SetPoint("LEFT", lblNum.frame, "RIGHT", 0, -1)
		_btnStartLoot:SetCallback("OnClick", function(widget) 
			if Amr.db.char.TeamOpt.LootInProgress then
				Amr:ShowLootWindow()
				Amr:RefreshLootWindow()
				Amr:RefreshLootRolls()
			else
				Amr:StartLoot()
			end
		end)
		_panelStartLoot:AddChild(_btnStartLoot)
		
		_lblStartLoot = AceGUI:Create("AmrUiLabel")
		_lblStartLoot:SetFont(Amr.CreateFont("Bold", 16, Amr.Colors.Text))
		_lblStartLoot:SetWidth(400)
		_lblStartLoot:SetPoint("LEFT", _btnStartLoot.frame, "RIGHT", 20, 0)
		_panelStartLoot:AddChild(_lblStartLoot)
	end
	
	-- loot history shows on either tab
	lbl = AceGUI:Create("AmrUiLabel")
	lbl:SetFont(Amr.CreateFont("Regular", 16, Amr.Colors.TextTan))
	lbl:SetText(L.TeamHistoryTitle)
	lbl:SetWidth(280)
	lbl:SetPoint("TOPRIGHT", container.content, "TOPRIGHT", 0, -12)
	container:AddChild(lbl)
	
	local panelHistory = AceGUI:Create("AmrUiPanel")
	panelHistory:SetLayout("Fill")
	panelHistory:SetBackgroundColor(Amr.Colors.Black, 0.3)
	panelHistory:SetPoint("TOPRIGHT", lbl.frame, "BOTTOMRIGHT", 0, -5)
	panelHistory:SetPoint("BOTTOMLEFT", container.content, "BOTTOMRIGHT", -280, 0)
	container:AddChild(panelHistory)
	
	_scrollHistory = AceGUI:Create("AmrUiScrollFrame")
	_scrollHistory:SetLayout("List")
	panelHistory:AddChild(_scrollHistory)
end

local function renderHistory()
	if not _scrollHistory then return end
	_scrollHistory:ReleaseChildren()
	
	-- history is list of objects with:
	-- link, result, class, name
	
	local history = Amr.db.char.TeamOpt.History
	local historyWidth = 260
	
	local emptyMsg = nil
	if not IsInGroup() and not IsInRaid() then
		emptyMsg = L.TeamHistoryNoGroup
	elseif not history or #history == 0 then
		emptyMsg = L.TeamHistoryEmpty
	end
	
	if emptyMsg then
		local panel = AceGUI:Create("AmrUiPanel")
		panel:SetLayout("None")
		panel:SetBackgroundColor(Amr.Colors.Black, 0)
		panel:SetWidth(historyWidth)
		panel:SetHeight(30)
		_scrollHistory:AddChild(panel)
		
		local lbl = AceGUI:Create("AmrUiLabel")
		lbl:SetWidth(historyWidth)
		lbl:SetJustifyH("CENTER")
		lbl:SetFont(Amr.CreateFont("Italic", 14, Amr.Colors.TextTan))
		lbl:SetText(emptyMsg)
		lbl:SetPoint("LEFT", panel.content, "LEFT", 8, 0)
		panel:AddChild(lbl)
	else
		for i = #history, 1, -1 do
			local obj = history[i]
			local itemLink = obj.link
			
			local panel = AceGUI:Create("AmrUiPanel")
			panel:SetLayout("None")
			panel:SetBackgroundColor(Amr.Colors.Black, 0)
			panel:SetWidth(historyWidth)
			panel:SetHeight(45)
			_scrollHistory:AddChild(panel)
			
			local lbl = AceGUI:Create("AmrUiLabel")
			lbl:SetWidth(historyWidth - 5)
			lbl:SetWordWrap(false)
			lbl:SetFont(Amr.CreateFont("Regular", 14, Amr.Colors.Text))
			lbl:SetPoint("TOPLEFT", panel.content, "TOPLEFT", 5, -5)
			panel:AddChild(lbl)
			
			Amr.GetItemInfo(itemLink, function(obj, name, link)					
				-- set item name, tooltip
				obj:SetText(link:gsub("%[", ""):gsub("%]", ""))
				Amr:SetItemTooltip(obj, link, "ANCHOR_BOTTOMRIGHT", 0, obj.frame:GetHeight())					
			end, lbl)

			lbl = AceGUI:Create("AmrUiLabel")
			lbl:SetWidth(historyWidth - 5)
			lbl:SetWordWrap(false)
			lbl:SetFont(Amr.CreateFont("Italic", 12, Amr.Colors.White))
			
			if obj.result == "Disenchant" then
				lbl:SetFont(Amr.CreateFont("Italic", 12, Amr.Colors.TextHeaderDisabled))
				lbl:SetText(L.TeamLootOptionDisenchant)
			else
				local color = obj.class and Amr.Colors.Classes[obj.class] or Amr.Colors.TextHeaderDisabled
				lbl:SetText((obj.result == "??" and "" or L["TeamLootOption" .. obj.result] .. ": ") .."|c" .. Amr.ColorToHex(color, 1) .. obj.name .. "|r")
			end
			
			lbl:SetPoint("BOTTOMLEFT", panel.content, "BOTTOMLEFT", 5, 8)			
			panel:AddChild(lbl)
			
			local line = AceGUI:Create("AmrUiPanel")
			line:SetBackgroundColor(Amr.Colors.Black, 1)
			line:SetWidth(historyWidth)
			line:SetHeight(1)
			line:SetPoint("BOTTOM", panel.content, "BOTTOM")
			panel:AddChild(line)
		end
	end
end

local function onTabSelected(container, event, group)
	container:ReleaseChildren()
	
	-- clear references to tab elements
	_panelStartLoot = nil
	_lblStartLoot = nil
	_btnStartLoot = nil
	_scrollHistory = nil
	
	Amr.db.char.TeamOpt.Role = group
	renderTab(group, container)
	Amr:RefreshTeamUi()
end

-- renders the main UI for the Team Optimizer tab
function Amr:RenderTabTeam(container)

	-- splash screen to customize team optimizer ui for the user
	if not Amr.db.char.TeamOpt.Role then
		_panelSplash = AceGUI:Create("AmrUiPanel")
		_panelSplash:SetLayout("None")
		_panelSplash:SetBackgroundColor(Amr.Colors.Black, 0)
		_panelSplash:SetPoint("TOPLEFT", container.content, "TOPLEFT")
		_panelSplash:SetPoint("BOTTOMRIGHT", container.content, "BOTTOMRIGHT")
		container:AddChild(_panelSplash)
	
		local lblSplash = AceGUI:Create("AmrUiLabel")
		lblSplash:SetWidth(800)
		lblSplash:SetJustifyH("CENTER")
		lblSplash:SetFont(Amr.CreateFont("Regular", 24, Amr.Colors.Text))
		lblSplash:SetText(L.TeamSplashHeader)
		lblSplash:SetPoint("TOP", _panelSplash.content, "TOP", 0, -40)
		_panelSplash:AddChild(lblSplash)
		
		local btn = AceGUI:Create("AmrUiButton")
		btn:SetText(L.TeamTabLeaderText)
		btn:SetBackgroundColor(Amr.Colors.Orange)
		btn:SetFont(Amr.CreateFont("Bold", 24, Amr.Colors.White))
		btn:SetWidth(280)
		btn:SetHeight(60)
		btn:SetPoint("TOPRIGHT", lblSplash.frame, "BOTTOM", -50, -50)
		btn:SetCallback("OnClick", function(widget)
			Amr.db.char.TeamOpt.Role = "Leader"
			_panelSplash:SetVisible(false)
			_tabs:SetVisible(true)
			_tabs:SelectTab("Leader")
		end)
		_panelSplash:AddChild(btn)
		
		local lbl = AceGUI:Create("AmrUiLabel")
		lbl:SetWidth(280)
		lbl:SetJustifyH("CENTER")
		lbl:SetFont(Amr.CreateFont("Italic", 16, Amr.Colors.TextTan))
		lbl:SetText(L.TeamSplashLeaderLabel)
		lbl:SetPoint("TOP", btn.frame, "BOTTOM", 0, -20)
		_panelSplash:AddChild(lbl)
		
		btn = AceGUI:Create("AmrUiButton")
		btn:SetText(L.TeamTabMemberText)
		btn:SetBackgroundColor(Amr.Colors.Orange)
		btn:SetFont(Amr.CreateFont("Bold", 24, Amr.Colors.White))
		btn:SetWidth(280)
		btn:SetHeight(60)
		btn:SetPoint("TOPLEFT", lblSplash.frame, "BOTTOM", 50, -50)
		btn:SetCallback("OnClick", function(widget)
			Amr.db.char.TeamOpt.Role = "Member"
			_panelSplash:SetVisible(false)
			_tabs:SetVisible(true)
			_tabs:SelectTab("Member")
		end)
		_panelSplash:AddChild(btn)
		
		lbl = AceGUI:Create("AmrUiLabel")
		lbl:SetWidth(280)
		lbl:SetJustifyH("CENTER")
		lbl:SetFont(Amr.CreateFont("Italic", 16, Amr.Colors.TextTan))
		lbl:SetText(L.TeamSplashMemberLabel)
		lbl:SetPoint("TOP", btn.frame, "BOTTOM", 0, -20)
		_panelSplash:AddChild(lbl)
	end
	
	-- tabstrip
	_tabs =  AceGUI:Create("AmrUiTabGroup")
	_tabs:SetLayout("None")
	_tabs:SetTabs({
		{text=L.TeamTabLeaderText, value="Leader", style="bold"}, 
		{text=L.TeamTabMemberText, value="Member", style="bold"}
	})
	_tabs:SetPoint("TOPLEFT", container.content, "TOPLEFT", 6, -30)
	_tabs:SetPoint("BOTTOMRIGHT", container.content, "BOTTOMRIGHT")
	_tabs:SetCallback("OnGroupSelected", onTabSelected)
	container:AddChild(_tabs)
	
	local role = Amr.db.char.TeamOpt.Role
	
	_tabs:SetVisible(not not role)
	if role then
		-- if a role has been chosen, select the proper tab (which will also refresh the UI)
		_tabs:SelectTab(role)
	else
		-- no role, refresh the UI manually
		self:RefreshTeamUi()
	end
	
end

function Amr:ReleaseTabTeam()
	_panelSplash = nil
	_panelStartLoot = nil
	_lblStartLoot = nil
	_btnStartLoot = nil
	_scrollHistory = nil
	_tabs = nil
end

function Amr:RefreshTeamUi()
	
	-- if rankings have been loaded, render the 'start loot' panel
	if _panelStartLoot then
		local rankString = Amr.db.global.TeamOpt.RankingString
		if rankString then
			_panelStartLoot:SetVisible(true)
			_lblStartLoot:SetText(L.TeamStartLootLabel(#Amr.db.global.TeamOpt.Rankings))			
			_btnStartLoot:SetText(Amr.db.char.TeamOpt.LootInProgress and L.TeamButtonResumeLootText or L.TeamButtonStartLootText)
		else
			_panelStartLoot:SetVisible(false)
		end
	end
	
	-- render loot history
	renderHistory()
end

local function getItemIdsFromLinks(all, list)
	for i, v in ipairs(list) do
		local obj = Amr.ParseItemLink(v)
		local id = Amr.GetItemUniqueId(obj)
		if id then
			table.insert(all, id)
		end
	end
end

-- update AllItems, used to determine when a new item is actually a new equippable item
local function snapshotAllItems(data)

	local all = {}
	for k, v in pairs(data.Equipped[data.ActiveSpec]) do
		local obj = Amr.ParseItemLink(v)
		local id = Amr.GetItemUniqueId(obj)
		if id then
			table.insert(all, id)
		end
	end
	getItemIdsFromLinks(all, data.BagItems)
	getItemIdsFromLinks(all, data.BankItems)
	getItemIdsFromLinks(all, data.VoidItems)
	
	table.sort(all)
	return all
end

local function sendGear(prefix, empty)

	local region = Amr.RegionNames[GetCurrentRegion()]
    local realm = GetRealmName()
    local name = UnitName("player")
	
	-- get all data, including inventory
	local txt = "_"
	if not empty then
		local data = Amr:ExportCharacter()
		txt = Amr.Serializer:SerializePlayerData(data, true)

		-- snapshot items when gear is sent
		Amr.db.char.TeamOpt.AllItems = snapshotAllItems(data)	
	end
	
	local msg = string.format("%s\n%s\n%s\n%s\n%s", prefix, region, realm, name, txt)
	Amr:SendAmrCommMessage(msg)
end

local function toPlayerKey(realm, name)
	return name .. "-" .. realm
end


------------------------------------------------------------------------------------------------
-- Loot Export
------------------------------------------------------------------------------------------------

-- prune out any characters no longer in the player's group
local function pruneGearForItemExport()

	local newInfo = {}
	local units = Amr:GetGroupUnitIdentifiers()
	
    for i, unitId in ipairs(units) do
		local realm, name = Amr:GetRealmAndName(unitId)	
		if realm then
			local key = toPlayerKey(realm, name)
			newInfo[key] = Amr.db.global.TeamOpt.LootGear[key]
		end
    end
	
	Amr.db.global.TeamOpt.LootGear = newInfo	
end

local _ignoreLoot = {
	[139562] = true,
	[136903] = true
}

local function scanMasterLoot()
	-- only care if we are in a raid or group
	if not IsInGroup() and not IsInRaid() then return end
	
	-- we only care about the master looter
	if not IsMasterLooter() then return end

	-- guid of the unit being looted
	local npcGuid = UnitGUID("target")
	if not npcGuid then
		-- this could wack shit out... but no raid bosses drop loot from containers right now, so should be fine
		npcGuid = "container"
	end

	-- if we already have loot data for this unit, then we can ignore
	if Amr.db.char.TeamOpt.LootGuid == npcGuid then return end
	
	local loot = {}
	for i = 1, GetNumLootItems() do
		--local texture, item, quantity, quality, locked = GetLootSlotInfo(i)
		local lootType = GetLootSlotType(i)
		if lootType == 1 then
			local link = GetLootSlotLink(i)
			local success, itemObj = pcall(Amr.ParseItemLink, link)
			
			if not success or not itemObj or _ignoreLoot[itemObj.id] then
				-- ignore items that can't be read or that we explicitly don't care about
			else			
				table.insert(loot, link)
			end
		end
	end
	
	Amr.db.char.TeamOpt.LootGuid = npcGuid
	Amr.db.char.TeamOpt.Loot = loot
	
	-- publish loot information to everyone else running the addon in case team optimizer user is not the master looter
	local msg = _messagePrefixes.ItemExportLoot .. "\n" .. npcGuid .. "\n" .. table.concat(loot, "\n")	
	Amr:SendAmrCommMessage(msg)
end

local function onLootReceived(parts)

	Amr.db.char.TeamOpt.LootGuid = parts[2]
	
	local loot = {}
	for i = 3, #parts do
		table.insert(loot, parts[i])
	end
	Amr.db.char.TeamOpt.Loot = loot
end

local function onLeaveGroup()
	-- if the current player is no longer in a group or raid, finish any looting in progress
	Amr:FinishLoot(true)
	
	-- clear loot when leave a group
	Amr.db.char.TeamOpt.Loot = {}
	Amr.db.char.TeamOpt.LootGuid = nil
	Amr.db.global.TeamOpt.LootGear = {}
end

local function onGroupChanged()

	if not IsInGroup() and not IsInRaid() then
		onLeaveGroup()
	end
end


local _lootExPlayersRemaining = 0
local _lootExRoster = nil
local _lootExCallback = nil

local function serializeLootExport()
	if not IsInGroup() and not IsInRaid() then return "NOGROUP" end
	
	local loot = Amr.db.char.TeamOpt.Loot
	if not loot or #loot == 0 then return "NOLOOT" end

	local itemObjects = {}
	for i, link in ipairs(loot) do
		local obj = Amr.ParseItemLink(link)
		if obj then
			table.insert(itemObjects, obj)
		end
	end
	
	-- DEBUG: just grab all currently equipped items
	--[[
	itemObjects = {}
	local blah = Amr:ExportCharacter()
	for k, v in pairs(blah.Equipped[blah.ActiveSpec]) do
		local obj = Amr.ParseItemLink(v)
		if obj then
			table.insert(itemObjects, obj)
		end
	end
	]]
	
	local parts = {}
	
	-- unique ids of items
	local lootPart = {}
	for i, obj in ipairs(itemObjects) do
		table.insert(lootPart, Amr.GetItemUniqueId(obj))
	end	
	table.insert(parts, table.concat(lootPart, ";"))
	
	-- gear for players who have gained loot since the last item import or roster export
	pruneGearForItemExport()
	local lootGear = Amr.db.global.TeamOpt.LootGear
	for k, v in pairs(lootGear) do
		table.insert(parts, v)
	end
	
	return table.concat(parts, "\n")
end

local function onLootExportCompleted()

	-- fill in LootGear with just those players who have changed
	Amr.db.global.TeamOpt.LootGear = _lootExRoster	
	
	if _lootExCallback then
		local txt = serializeLootExport()
		_lootExCallback(txt)
	end
	
	-- reset state
	_lootExPlayersRemaining = 0
	_lootExRoster = nil
	_lootExCallback = nil	
end

-- called when this player's gear info has been requested by someone exporting loot
local function onGearForLootExportRequested()

	local hasNewItem = false
	local oldItems = Amr.db.char.TeamOpt.AllItems
	
	if oldItems and #oldItems > 0 then
		-- see if any new equippable items have been gained by comparing to the last snapshot
		local data = Amr:ExportCharacter()
		local allItems = snapshotAllItems(data)
		
		if #oldItems ~= #allItems then
			hasNewItem = true
		else
			-- go through items from front to back, if there are any that don't match then something has changed
			for i = 1, #allItems do
				local oldItem = oldItems[i]
				local newItem = allItems[i]
				if oldItem ~= newItem then
					hasNewItem = true
					break
				end
			end
		end
	end
	
	-- whenever a new item is received, send out updated gear information that should be added to the next item export
	sendGear(_messagePrefixes.ItemExportGear, not hasNewItem)
end

local function onGearForLootExportReceived(region, realm, name, data)
	-- if I am not listening for incoming gear data for an item export, then ignore this message
	if _lootExPlayersRemaining == 0 then return end
	
	local key = toPlayerKey(realm, name)
	if not data or data == "_" then
		_lootExRoster[key] = nil
	else
		_lootExRoster[key] = data
	end
	
	_lootExPlayersRemaining = _lootExPlayersRemaining - 1
	if _lootExPlayersRemaining <= 0 then
		onLootExportCompleted()
	end
end

-- Export the current loot, including any known gear data for players with the in-game addon, but only if it has changed since the last snapshot.
-- This is asynchronous because it needs to wait for gear data to arrive from each player.
function Amr:ExportLootAsync(callback)

	if not IsInGroup() and not IsInRaid() then 
		callback("NOGROUP")
	end
	
	local loot = Amr.db.char.TeamOpt.Loot
	if not loot or #loot == 0 then 
		callback("NOLOOT")
	end

	local playersNoGear = {}
	_lootExPlayersRemaining = 0
	
	local units = self:GetGroupUnitIdentifiers()
	for i, unitId in ipairs(units) do
		local realm, name = self:GetRealmAndName(unitId)
		if realm then
			local ver = self:GetAddonVersion(realm, name)
			local key = toPlayerKey(realm, name)
			
			if ver >= Amr.MIN_ADDON_VERSION then
				_lootExPlayersRemaining = _lootExPlayersRemaining + 1
			else
				table.insert(playersNoGear, unitId)
			end
		end
	end
	
	_lootExRoster = {}	
	_lootExCallback = callback
	
	if _lootExPlayersRemaining > 0 then
		-- send a message to receive player data, when the last player is received onLootExportCompleted will be called
		Amr:SendAmrCommMessage(_messagePrefixes.ItemExportRequestGear)
	else
		-- don't need to wait for anybody, just call immediately
		onLootExportCompleted()
	end
end


------------------------------------------------------------------------------------------------
-- Roster Export
------------------------------------------------------------------------------------------------

local _rosterPlayersRemaining = 0
local _roster = nil
local _rosterCallback = nil

local function onRosterCompleted()

	if _rosterCallback then
		-- serialize the roster
		local parts = {}
		for key, data in pairs(_roster) do
			table.insert(parts, data)
		end
		local msg = table.concat(parts, "\n")	
	
		-- send to callback
		_rosterCallback(msg)
	end
	
	-- reset state
	_rosterPlayersRemaining = 0
	_roster = nil
	_rosterCallback = nil
	
	-- clear out loot gear needed, an export will refresh everyone at the time of export
	Amr.db.global.TeamOpt.LootGear = {}
end

-- called when this player's gear info has been requested by someone exporting the raid roster
local function onGearForRosterRequested()

	sendGear(_messagePrefixes.RosterGear)
end

local function onGearForRosterReceived(region, realm, name, data)
	-- if I am not listening for incoming gear data for the roster, then ignore this message
	if _rosterPlayersRemaining == 0 then return end
	
	local key = toPlayerKey(realm, name)
	_roster[key] = data
	
	_rosterPlayersRemaining = _rosterPlayersRemaining - 1
	if _rosterPlayersRemaining <= 0 then
		onRosterCompleted()
	end
end

-- Export the current roster, including any known gear data for players with the in-game addon.
-- This is asynchronous because it needs to wait for gear data to arrive from each player.
function Amr:ExportRosterAsync(callback)
	if not IsInGroup() and not IsInRaid() then 
		callback()
		return 
	end
	
	local playersNoGear = {}
	_rosterPlayersRemaining = 0
	
	local units = self:GetGroupUnitIdentifiers()
	for i, unitId in ipairs(units) do
		local realm, name = self:GetRealmAndName(unitId)
		if realm then
			local ver = self:GetAddonVersion(realm, name)
			local key = toPlayerKey(realm, name)
			
			if ver >= Amr.MIN_ADDON_VERSION then
				_rosterPlayersRemaining = _rosterPlayersRemaining + 1
			else
				table.insert(playersNoGear, unitId)
			end
		end
	end
	
	-- fill the roster with any players who can't send us data
	_roster = {}
	for i, unitId in ipairs(playersNoGear) do
		local realm, name = self:GetRealmAndName(unitId)
		if realm then
			local key = toPlayerKey(realm, name)
			local obj = {
				Region = Amr.RegionNames[GetCurrentRegion()],
				Realm = realm,
				Name = name
			}
			_roster[key] = Amr.Serializer:SerializePlayerIdentity(obj)
		end
	end
	
	_rosterCallback = callback
	
	if _rosterPlayersRemaining > 0 then
		-- send a message to receive player data, when the last player is received onRosterCompleted will be called
		Amr:SendAmrCommMessage(_messagePrefixes.RosterRequestGear)
	else
		-- don't need to wait for anybody, just call immediately
		onRosterCompleted()
	end
end


------------------------------------------------------------------------------------------------
-- Ranking Import
------------------------------------------------------------------------------------------------

-- helper to parse import item identifier format into an item object
local function parseItemIdentifier(ident)

	local parts = { strsplit(":", ident) }
	local item = {}
	item.id = tonumber(parts[1])
	item.enchantId = 0
	item.gemIds = { 0, 0, 0, 0 }
	item.suffixId = math.abs(tonumber(parts[2]))
	item.upgradeId = tonumber(parts[3])
	item.level = tonumber(parts[4])
	
	if #parts > 4 then
		item.bonusIds = {}
		for b = 5, #parts do
			table.insert(item.bonusIds, tonumber(parts[b]))
		end
		table.sort(item.bonusIds)
	end
	
	return item
end

function Amr:ParseRankingString(data)
	local rankings = {}
	
	local player = Amr:ExportCharacter()
	local myUnitId = Amr:GetUnitId(player.Realm, player.Name)
	local ml = IsMasterLooter()
	
	local itemList = { strsplit("\n", data) }	
	for i = 1, #itemList do
		local ranking = {}
		
		local itemParts = { strsplit("_", itemList[i]) }
		
		-- first part has the item identifier
		ranking.item = parseItemIdentifier(itemParts[1])

		-- second part has item info
		local infoParts = { strsplit(";", itemParts[2]) }
		ranking.itemInfo = {
			slot = infoParts[1],
			subclass = infoParts[2],
			weaponType = infoParts[3],
			armorType = infoParts[4]
		}
		
		local meInList = false
		
		-- parse each ranking
		ranking.ranks = {}
		for j = 3, #itemParts do
			local rankParts = { strsplit(";", itemParts[j]) }
			
			local rank = {}
			rank.realm = rankParts[1]
			rank.name = rankParts[2]
			rank.specId = tonumber(rankParts[3])
			if rankParts[4] ~= "--" then
				rank.equipped = parseItemIdentifier(rankParts[4])
			end
			rank.score = tonumber(rankParts[5])
			rank.isEquipped = rankParts[6] == "t"
			rank.notRanked = rankParts[7] == "t"
			rank.offspec = rankParts[8] == "t"
			rank.enchantingSkill = tonumber(rankParts[9])
			
			table.insert(ranking.ranks, rank)
			
			if myUnitId == Amr:GetUnitId(rank.realm, rank.name) then
				meInList = true
				rank.isMasterLooter = ml
			end
		end
		
		-- if the current player is the master looter and he is not in the list, then add him at the end
		if ml and not meInList then
			local rank = {
				realm = player.Realm,
				name = player.Name,
				specId = player.Specs[player.ActiveSpec],
				equipped = "--",
				score = 0,
				isEquipped = false,
				notRanked = true,
				offspec = false,
				enchantingSkill = 0,
				isMasterLooter = true
			}
			table.insert(ranking.ranks, rank)
		end
		
		table.insert(rankings, ranking)
	end
	
	return rankings
end

-- import rankings from the website, save into the database, returns a string error if can't import for some reason
function Amr:ImportRankings(data)

	if not data or string.len(data) == 0 then
        return L.ImportErrorEmpty
    end
	
	local success, rankings = pcall(Amr.ParseRankingString, self, data)

	if not success then
		return L.ImportErrorFormat
	end
	
	-- finish any looting in progress, effectively canceling it, user will have to press Start Loot again
	Amr:FinishLoot()
	
	-- save the rankings
	Amr.db.global.TeamOpt.Rankings = rankings
	Amr.db.global.TeamOpt.RankingString = data
	
	-- clear loot gear needed on successful ranking import
	Amr.db.global.TeamOpt.LootGear = {}
end


------------------------------------------------------------------------------------------------
-- Loot Distribution
------------------------------------------------------------------------------------------------

function Amr:StartLoot()
	
	if not IsInGroup() and not IsInRaid() then
		Amr:ShowAlert(L.TeamAlertNoGroup, L.AlertOk)
		return
	end
	
	-- broadcast the loot data to everyone, this triggers the loot window to show
	local msg = string.format("%s\n%s", Amr.LootMessagePrefixes.Start, Amr.db.global.TeamOpt.RankingString)
	Amr:SendAmrCommMessage(msg)
end

function Amr:FinishLoot(clearHistory)

	-- reset all state
	Amr.db.char.TeamOpt.LootInProgress = false
	
	-- don't reset these for now... only reset these if someone leaves a group
	--Amr.db.char.TeamOpt.Loot = {}
	--Amr.db.char.TeamOpt.LootGuid = nil
	--Amr.db.global.TeamOpt.LootGear = {}
	
	Amr.db.global.TeamOpt.Rankings = {}
	Amr.db.global.TeamOpt.RankingString = nil
		
	Amr.db.char.TeamOpt.Rolls = {}
	
	if clearHistory then
		Amr.db.char.TeamOpt.History = {}
	end
	
	-- close the loot window
	Amr:HideLootWindow()
	
	-- re-render the team optimizer UI
	Amr:RefreshTeamUi()
end


------------------------------------------------------------------------------------------------
-- Synchronization
------------------------------------------------------------------------------------------------
local _waitingForSync = false

-- check if we need to synchronize
local function checkSync()
	-- if loot is in progress and this person is not the ML, send a request to synchronize on startup, this player may have missed some data
	if not IsMasterLooter() and Amr.db.char.TeamOpt.LootInProgress then
		_waitingForSync = true
		Amr:SendAmrCommMessage(_messagePrefixes.SyncRequest)
	end
end

-- send data to anyone who needs to synchronize their loot data: history, rolls, rankings
local function sendSyncData()
	-- only the master looter sends sync data to ensure that everyone gets the same stuff and we don't spam
	if not IsMasterLooter() then return end
	
	local msgParts = {}
	table.insert(msgParts, _messagePrefixes.Sync)
	table.insert(msgParts, Amr:Serialize(Amr.db.char.TeamOpt.History))
	table.insert(msgParts, Amr:Serialize(Amr.db.char.TeamOpt.Rolls))
	table.insert(msgParts, Amr:Serialize(Amr.db.global.TeamOpt.Rankings))
	
	Amr:SendAmrCommMessage(table.concat(msgParts, "\n"))
end

local function receiveSyncData(parts)
	if not _waitingForSync then return end	
	_waitingForSync = false
	
	local success, obj = Amr:Deserialize(parts[2])
	if success then
		Amr.db.char.TeamOpt.History = obj
	end
	
	success, obj = Amr:Deserialize(parts[3])
	if success then
		Amr.db.char.TeamOpt.Rolls = obj
	end
	
	success, obj = Amr:Deserialize(parts[4])
	if success then
		Amr.db.global.TeamOpt.Rankings = obj
	end
	
	-- refresh any windows that may be visible
	Amr:RefreshTeamUi()
	Amr:RefreshLootWindow()
	Amr:RefreshLootRolls()
end


function Amr:ProcessTeamMessage(message)

    local parts = {}
	for part in string.gmatch(message, "([^\n]+)") do
		table.insert(parts, part)
	end
    
    local prefix = parts[1]
	
	if prefix == _messagePrefixes.RosterRequestGear then
		-- request for me to send my gear data
		onGearForRosterRequested()
	elseif prefix == _messagePrefixes.ItemExportRequestGear then
		-- request for me to send my gear data
		onGearForLootExportRequested()
	elseif prefix == _messagePrefixes.ItemExportLoot then
		-- the last loot that dropped
		onLootReceived(parts)
	elseif prefix == _messagePrefixes.SyncRequest then
		sendSyncData()
	elseif prefix == _messagePrefixes.Sync then
		receiveSyncData(parts)
	elseif prefix == Amr.LootMessagePrefixes.Start then
		Amr:OnStartLootReceived(parts)
	elseif prefix == Amr.LootMessagePrefixes.Roll then
		Amr:OnLootRollReceived(parts)
	elseif prefix == Amr.LootMessagePrefixes.Veto then
		Amr:OnLootVetoReceived(parts)
	elseif prefix == Amr.LootMessagePrefixes.Rand then
		Amr:OnLootRandReceived(parts)
	elseif prefix == Amr.LootMessagePrefixes.Give then
		Amr:OnLootGiveReceived(parts)
	elseif prefix == Amr.LootMessagePrefixes.Finish then
		Amr:FinishLoot()
	else
		-- message will be of format: prefix\nregion\nrealm\nname\n[stuff]	
		local region = parts[2]
		local realm = parts[3]
		local name = parts[4]
		local data = parts[5]

		if prefix == _messagePrefixes.RosterGear then
			-- receive gear data from someone
			onGearForRosterReceived(region, realm, name, data)
		elseif prefix == _messagePrefixes.ItemExportGear then
			-- receive gear data for item export
			onGearForLootExportReceived(region, realm, name, data)
		end
	end
end

function Amr:InitializeTeamOpt()

	if not IsInGroup() and not IsInRaid() then
		onLeaveGroup()
	end
	
	Amr:AddEventHandler("LOOT_OPENED", scanMasterLoot)
	Amr:AddEventHandler("GROUP_ROSTER_UPDATE", onGroupChanged)
	
	checkSync()
end
