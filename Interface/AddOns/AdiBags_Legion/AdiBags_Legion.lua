--[[
AdiBags_Legion - Adds Legion filters to AdiBags.
Copyright 2016 Dia (mrdiablo@divine-pride.net)
All rights reserved.
--]]

local _, ns = ...

local addon = LibStub('AceAddon-3.0'):GetAddon('AdiBags')
local L = setmetatable({}, {__index = addon.L})
local MatchChampionEquipIDs = {}
local KeystoneId = 138019
local initialized = false

local function AddToSet(Set, List)
	for _, v in ipairs(List) do
		Set[v] = true
	end
end

local championEquip = {
	137209, -- Armor Enhancement Token
	136412, -- Heavy Armor Set
	137207, -- Fortified Armor Set
	137208, -- Indestructible Armor Set
}

local function MatchIDs_Init(self)
	local result = {}
	AddToSet(result, championEquip)
	return result
end

do -- Localization
	L["Legion"] = "Legion"
	L["Toy"] = "Toy"
	L["Artifact Power"] = "Artifact Power"
	L["Artifact Relic"] = "Artifact Relic"
	L["Relic"] = "Relic"
	L["Champion Equipment"] = "Champion Equipment"
	L["Transmog"] = "Transmog"
	L["Mythic+"] = "Mythic+"
	L["Put Legion Stuff in their own sections."] = "Put Legion Stuff in their own sections."
	L["You haven't collected this appearance"] = "You haven't collected this appearance"

	local locale = GetLocale()
	if locale == "frFR" then
		L["Legion"] = "Légion"
		L["Toy"] = "Jouet"
		L["Artifact Power"] = "Puissance prodigieuse"
		L["Artifact Relic"] = "Relique"
		L["Champion Equipment"] = "Équipement de champion"
		L["Transmog"] = "Transmog"
		L["Mythic+"] = "Mythic+"
		L["Put Legion Stuff in their own sections."] = "Range les objets de Légion dans leur catégorie."
		L["You haven't collected this appearance"] = "Vous n'avez pas reçu cette apparence."
	elseif locale == "deDE" then
		L["Legion"] = "Legion"
		L["Toy"] = "Spielzeug"
		L["Artifact Power"] = "Artefaktmacht"
		L["Artifact Relic"] = "Artefaktrelikt"
		L["Champion Equipment"] = "Champion Equipment"
		L["Transmog"] = "Transmog"
		L["Mythic+"] = "Mythic+"
		L["Put Legion Stuff in their own sections."] = "Erzeuge eine Kategorie für Legionspezifische Gegenstände."
		L["You haven't collected this appearance"] = "You haven't collected this appearance"
	elseif locale == 'ptBR' then
		L["Legion"] = "Legião"
		L["Toy"] = "Brinquedo"
		L["Artifact Power"] = "Poder do Artefato"
		L["Artifact Relic"] = "Relíquia do Artefato"
		L["Champion Equipment"] = "Equipamento de Campeão"
		L["Transmog"] = "Transmog"
		L["Mythic+"] = "Mítico"
		L["Put Legion Stuff in their own sections."] = "Coloque as coisas da Legião em sessões próprias."
		L["You haven't collected this appearance"] = "Você não coletou esta apararência"
		L['Enable Artifact Power'] = "Poder do Artefato"
		L['Check this if you want a section for Artifact Power items.'] = "Marque se quiser habilitar a sessão para Poder do Artefato"
		L['Enable Artifact Relic'] = "Relíquia do Poder"
		L['Check this if you want a section for Artifact Relic items.'] = "Marque se quiser habilitar a sessão para Relíquia do Poder"
		L['Enable Toys'] = "Brinquedos"
		L['Check this if you want a section for toy items.'] = "Marque se quiser habilitar a sessão para Brinquedos"
		L['Enable Champion\'s Equipment'] = "Equipamento de Campeão"
		L['Check this if you want a section for Champion\'s Equipment items.'] = "Marque se quiser habilitar a sessão para Equipamento de Campeão"
		L['Mythic+'] = "Mítico"
		L['Check this if you want a section for Mythic+ items.'] = "Marque se quiser habilitar a sessão para Mítico"
		L['Transmog'] = "Transmog"
		L['Check this if you want a section for not collected transmog items.'] = "Marque se quiser habilitar a sessão para Transmog"
	elseif locale == "esMX" then

	elseif locale == "ruRU" then

	elseif locale == "esES" then

	elseif locale == "zhTW" then

	elseif locale == "zhCN" then

	elseif locale == "koKR" then

	end
end

local tooltip
local function create()
	local tip, leftside = CreateFrame("GameTooltip"), {}
	for i = 1,6 do
		local L,R = tip:CreateFontString(), tip:CreateFontString()
		L:SetFontObject(GameFontNormal)
		R:SetFontObject(GameFontNormal)
		tip:AddFontStrings(L,R)
		leftside[i] = L
	end

	tip.leftside = leftside
	return tip
end

-- The filter itself

local legionFilter = addon:RegisterFilter("Legion", 92, 'ABEvent-1.0')
legionFilter.uiName = L['Legion']
legionFilter.uiDesc = L['Put Legion Stuff in their own sections.']

function legionFilter:OnInitialize()
	self.db = addon.db:RegisterNamespace('Legion', {
		profile = { enableAP = true, enableAR = true, enableChampionEquip = true, enableToy = true, enableKeystone = true, enableTransmog = false },
		char = {	},
	})
end

local function unescape(String)
	local Result = tostring(String)
	Result = gsub(Result, "|c........", "") -- Remove color start.
	Result = gsub(Result, "|r", "") -- Remove color end.
	Result = gsub(Result, "|H.-|h(.-)|h", "%1") -- Remove links.
	Result = gsub(Result, "|T.-|t", "") -- Remove textures.
	Result = gsub(Result, "{.-}", "") -- Remove raid target icons.
	return Result
end

function legionFilter:Update()
	MatchChampionEquipIDs = {}
	initialized = false
	self:SendMessage('AdiBags_FiltersChanged')
end

function legionFilter:OnEnable()
	addon:UpdateFilters()
end

function legionFilter:OnDisable()
	addon:UpdateFilters()
end

local setNames = {}

function legionFilter:Filter(slotData)
	if initialized == false then
		MatchChampionEquipIDs = MatchIDs_Init(self)
		initialized = true
	end
	
	if self.db.profile.enableChampionEquip and MatchChampionEquipIDs[slotData.itemId] then
		return L["Champion Equipment"]
	end

	tooltip = tooltip or create()
	tooltip:SetOwner(UIParent,"ANCHOR_NONE")
	tooltip:ClearLines()

	if slotData.bag == BANK_CONTAINER then
		tooltip:SetInventoryItem("player", BankButtonIDToInvSlotID(slotData.slot, nil))
	else
		tooltip:SetBagItem(slotData.bag, slotData.slot)
	end

	for i = 2,6 do
		local t = unescape(tooltip.leftside[i]:GetText())
		if t ~= nil and self.db.profile.enableAP and t == L["Artifact Power"] then
			return L["Artifact Power"]
		elseif t ~= nil and self.db.profile.enableChampionEquip and t == L["Champion Equipment"] then
			return L["Champion Equipment"]
		elseif t ~= nil and self.db.profile.enableToy and t == L["Toy"] then
			return L["Toy"]
		elseif t ~= nil and self.db.profile.enableTransmog and t == L["You haven't collected this appearance"] then
			return L["Transmog"]
		elseif t ~= nil and self.db.profile.enableAR and (string.find(t, L["Artifact Relic"]) ~= nil) then
			return L["Relic"]
		elseif t ~= nil and self.db.profile.enableKeystone and slotData.itemId == KeystoneId then
			return L["Mythic+"]
		end
	end

	tooltip:Hide()
end

function legionFilter:GetOptions()
	return {
		enableAP = {
			name = L['Enable Artifact Power'],
			desc = L['Check this if you want a section for Artifact Power items.'],
			type = 'toggle',
			order = 10,
		},
		enableAR = {
			name = L['Enable Artifact Relic'],
			desc = L['Check this if you want a section for Artifact Relic items.'],
			type = 'toggle',
			order = 20,
		},
		enableToy = {
			name = L['Enable Toys'],
			desc = L['Check this if you want a section for toy items.'],
			type = 'toggle',
			order = 30,
		},
		enableChampionEquip = {
			name = L['Enable Champion\'s Equipment'],
			desc = L['Check this if you want a section for Champion\'s Equipment items.'],
			type = 'toggle',
			order = 40,
		},
		enableKeystone = {
			name = L['Mythic+'],
			desc = L['Check this if you want a section for Mythic+ items.'],
			type = 'toggle',
			order = 50,
		},
		enableTransmog = {
			name = L['Transmog'],
			desc = L['Check this if you want a section for not collected transmog items.'],
			type = 'toggle',
			order = 60,
		},
	}, addon:GetOptionHandler(self, false, function() return self:Update() end)
end
