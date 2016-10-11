local L = LibStub( "AceLocale-3.0" ):NewLocale( "ArkInventory", "enUS", true, false )
if not L then return end

-- game client based localisations and internal stuff
L["TOC_FAIL"] = "*****  This is a Legion Beta version, it will not work on the live servers, please downgrade to 3.05.12  *****"

-- class names
L["WOW_CLASS_DRUID"] = LOCALIZED_CLASS_NAMES_MALE["DRUID"] or true
L["WOW_CLASS_HUNTER"] = LOCALIZED_CLASS_NAMES_MALE["HUNTER"] or true
L["WOW_CLASS_MAGE"] = LOCALIZED_CLASS_NAMES_MALE["MAGE"] or true
L["WOW_CLASS_PALADIN"] = LOCALIZED_CLASS_NAMES_MALE["PALADIN"] or true
L["WOW_CLASS_PRIEST"] = LOCALIZED_CLASS_NAMES_MALE["PRIEST"] or true
L["WOW_CLASS_ROGUE"] = LOCALIZED_CLASS_NAMES_MALE["ROGUE"] or true
L["WOW_CLASS_SHAMAN"] = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"] or true
L["WOW_CLASS_WARLOCK"] = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"] or true
L["WOW_CLASS_WARRIOR"] = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"] or true
L["WOW_CLASS_DEATHKNIGHT"] = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"] or true
L["WOW_CLASS_MONK"] = LOCALIZED_CLASS_NAMES_MALE["MONK"] or true
L["WOW_CLASS_DEMONHUNTER"] = LOCALIZED_CLASS_NAMES_MALE["DEMONHUNTER"] or true


--	periodictable: set names for default class categories
L["PT_CLASS_GUILD"] = ""
L["PT_CLASS_DRUID"] = "Misc.Reagent.Class.Druid"
L["PT_CLASS_HUNTER"] = "Misc.Reagent.Class.Hunter"
L["PT_CLASS_MAGE"] = "Misc.Reagent.Class.Mage"
L["PT_CLASS_PALADIN"] = "Misc.Reagent.Class.Paladin"
L["PT_CLASS_PRIEST"] = "Misc.Reagent.Class.Priest"
L["PT_CLASS_ROGUE"] = "Misc.Reagent.Class.Rogue"
L["PT_CLASS_SHAMAN"] = "Misc.Reagent.Class.Shaman"
L["PT_CLASS_WARLOCK"] = "Misc.Reagent.Class.Warlock"
L["PT_CLASS_WARRIOR"] = "Misc.Reagent.Class.Warrior"
L["PT_CLASS_DEATHKNIGHT"] = "Misc.Reagent.Class.DeathKnight"
L["PT_CLASS_MONK"] = "Misc.Reagent.Class.Monk"
L["PT_CLASS_DEMONHUNTER"] = "Misc.Reagent.Class.DemonHunter"


--	periodictable: other
L["PT_CATEGORY_CONSUMABLE_FOOD"] = "Consumable.Food.Edible"
L["PT_CATEGORY_CONSUMABLE_DRINK"] = "Consumable.Water"
L["PT_CATEGORY_CONTAINER"] = "Misc.Bag"
L["PT_CATEGORY_MOUNT"] = "Misc.Mount"
L["PT_CATEGORY_POTION"] = "Consumable.Potion"
L["PT_CATEGORY_POTION_HEAL"] = "Consumable.Potion.Recovery.Healing,Consumable.Warlock.Healthstone"
L["PT_CATEGORY_POTION_MANA"] = "Consumable.Potion.Recovery.Mana"
L["PT_CATEGORY_QUEST"] = "Misc.QuestMats"
L["PT_CATEGORY_REPUTATION"] = "Reputation.Turnin"
L["PT_CATEGORY_PET"] = "Misc.Minipet"


-- skills that we dont need to lookup
L["WOW_SKILL_ARCHAEOLOGY"] = PROFESSIONS_ARCHAEOLOGY or true
L["WOW_SKILL_COOKING"] = PROFESSIONS_COOKING or true
L["WOW_SKILL_FIRSTAID"] = PROFESSIONS_FIRST_AID or true
L["WOW_SKILL_FISHING"] = PROFESSIONS_FISHING or true


-- locations
L["LOCATION_BAG"] = INVTYPE_BAG or true
L["LOCATION_BANK"] = BANK or true
L["LOCATION_VAULT"] = GUILD_BANK or true
L["LOCATION_VOIDSTORAGE"] = VOID_STORAGE or true
L["LOCATION_REAGENTBANK"] = REAGENT_BANK or true


--	category descriptions
L["CATEGORY_SYSTEM"] = CHAT_MSG_SYSTEM or true
L["CATEGORY_CONSUMABLE"] = AUCTION_CATEGORY_CONSUMABLES or true
L["CATEGORY_TRADEGOODS"] = AUCTION_CATEGORY_TRADE_GOODS or true
L["CATEGORY_SKILL"] = SKILL or true
L["CATEGORY_CLASS"] = CLASS or true
L["CATEGORY_CUSTOM"] = CUSTOM or true
L["CATEGORY_EMPTY"] = EMPTY or true

L["CATEGORY_SYSTEM_SOULBOUND"] = ITEM_SOULBOUND or true
L["CATEGORY_CONSUMABLE_FOOD"] = TUTORIAL_TITLE11 or true
L["CATEGORY_CONSUMABLE_DRINK"] = TUTORIAL_TITLE12 or true

L["CATEGORY_SYSTEM_EQUIPMENT"] = TUTORIAL_TITLE24 or true
L["CATEGORY_SYSTEM_EQUIPMENT_SOULBOUND"] = ( TUTORIAL_TITLE24 and ITEM_SOULBOUND and string.format( "%s (%s)", TUTORIAL_TITLE24, ITEM_SOULBOUND ) ) or true
L["CATEGORY_SYSTEM_EQUIPMENT_ACCOUNTBOUND"] = ( TUTORIAL_TITLE24 and ITEM_ACCOUNTBOUND and string.format( "%s (%s)", TUTORIAL_TITLE24, ITEM_ACCOUNTBOUND ) ) or true


-- ldb
L["LDB_MOUNTS_TYPE_A"] = BATTLE_PET_NAME_3 or true -- calculated keyword


-- generic words
L["ACCEPT"] = ACCEPT or true
L["ACTIVE"] = ACTIVE_PETS or true
L["ADD"] = ADD or true
L["ALL"] = ALL or true
L["ALREADY_KNOWN"] = ITEM_SPELL_KNOWN or true
L["APPEARANCE"] = APPEARANCE_LABEL or true
L["ARTIFACT_POWER"] = ARTIFACT_POWER or true
L["BAG"] = INVTYPE_BAG or true
L["BLIZZARD"] = "Blizzard"
L["AQUATIC"] = BATTLE_PET_NAME_9 or true
L["BACKGROUND"] = EMBLEM_BACKGROUND or true
L["BATTLEPET"] = TOOLTIP_BATTLE_PET or true
L["BORDER"] = EMBLEM_BORDER or true
L["CANCEL"] = CANCEL or true
L["CATEGORIES"] = CATEGORIES or true
L["CATEGORY"] = CATEGORY or true
L["CHARACTER"] = CHARACTER or true
L["CLEANUP"] = BAG_FILTER_CLEANUP or true
L["CLOSE"] = CLOSE or true
L["COLOUR"] = COLOR or true
L["COLLECTED"] = COLLECTED or true
L["COMPLETE"] = COMPLETE or true
L["CONTROLS"] = CONTROLS_LABEL or true
L["CURRENCY"] = CURRENCY or true
L["CUSTOM"] = CUSTOM or true
L["DEFAULT"] = DEFAULT or true
L["DEBUG"] = BINDING_HEADER_DEBUG or true
L["DEFAULT"] = DEFAULT or true
L["DELETE"] = DELETE or true
L["DESCRIPTION"] = QUEST_DESCRIPTION or true
L["DISABLED"] = ADDON_DISABLED or true
L["DISPLAY"] = DISPLAY or true
L["DURATION"] = AUCTION_DURATION or true
L["EDIT"] = EDIT or true
L["EMPTY"] = EMPTY or true
L["ENABLED"] = VIDEO_OPTIONS_ENABLED or true
L["FILTER"] = FILTER or true
L["FONT_SIZE"] = FONT_SIZE or true
L["FULL"] = LOC_TYPE_FULL or true
L["GENERAL"] = GENERAL or true
L["HEIRLOOM"] = ITEM_QUALITY7_DESC or true
L["HIDE"] = HIDE or true
L["ICON"] = EMBLEM_SYMBOL or true
L["IGNORE"] = IGNORE or true
L["INSTANT"] = SPELL_CAST_TIME_INSTANT or true
L["ITEMS"] = ITEMS or true
L["JUNK"] = BAG_FILTER_JUNK or true
L["LOCK"] = LOCK or true
L["LOCKED"] = LOCKED or true
L["MAIL"] = MAIL_LABEL or true
L["MOUNT"] = MOUNT or true
L["MODE"] = MODE or true
L["MOVE"] = NPE_MOVE or true
L["NAME"] = NAME or true
L["NEW"] = NEW or true
L["NO"] = NO or true
L["NONE"] = NONE or true
L["NOT_COLLECTED"] = NOT_COLLECTED or true
L["OFFLINE"] = FRIENDS_LIST_OFFLINE or true
L["OKAY"] = OKAY or true
L["ONLINE"] = FRIENDS_LIST_ONLINE or true
L["OPTIONS"] = GAMEOPTIONS_MENU or true
L["PET"] = PET or true
L["REALM"] = VAS_REALM_LABEL or true
L["REFRESH"] = REFRESH or true
L["REMOVE"] = REMOVE or true
L["RENAME"] = PET_RENAME or true
L["REPUTATION"] = REPUTATION or true
L["RESET"] = RESET or true
L["SAVE"] = SAVE or true
L["SEARCH"] = SEARCH or true
L["SETTINGS"] = SETTINGS or true
L["SHOW"] = SHOW or true
L["SORT_BY"] = RAID_FRAME_SORT_LABEL or true
L["SPECIAL"] = SPECIAL or true
L["START"] = START or true
L["STATUS"] = STATUS or true
L["SUMMON"] = BATTLE_PET_SUMMON or true
L["TEXT"] = LOCALE_TEXT_LABEL or true
L["TOTAL"] = TOTAL or true
L["TOY"] = TOY or true
L["TOYBOX"] = TOY_BOX or true
L["TRACKING"] = TRACKING or true
L["TYPE"] = TYPE or true
L["UNKNOWN"] = UNKNOWNOBJECT or true
L["VIEW"] = VIEW or true
L["WEEKLY"] = CALENDAR_REPEAT_WEEKLY or true
L["YES"] = YES or true


local function ConvertToCapture( text )
	text = string.gsub( text, "%d%$", "" ) -- remove 1$ / 2$
	text = string.gsub( text, "%(", "%%%(" ) -- replace ( with %(
	text = string.gsub( text, "%)", "%%%)" ) -- replace ) with %)
	text = string.gsub( text, "%%s", "(.+)" ) -- replace %s with (.+)
	text = string.gsub( text, "%%d", "%(%%d+%)" ) -- replace %d with (%d+)
	return string.format( "^%s$", text )
end

-- calculated
L["WOW_TOOLTIP_REQUIRES_SKILL"] = ConvertToCapture( ITEM_MIN_SKILL )
L["WOW_TOOLTIP_REQUIRES_LEVEL"] = ConvertToCapture( ITEM_MIN_LEVEL )
L["WOW_TOOLTIP_REQUIRES_CLASS"] = ConvertToCapture( ITEM_CLASSES_ALLOWED )
L["WOW_TOOLTIP_REQUIRES"] = ConvertToCapture( ITEM_REQ_SKILL )
L["WOW_TOOLTIP_ITEMUPGRADELEVEL"] = ConvertToCapture( ITEM_UPGRADE_TOOLTIP_FORMAT )
L["WOW_TOOLTIP_ITEM_LEVEL"] = ConvertToCapture( ITEM_LEVEL )
L["WOW_TOOLTIP_ANCIENT_MANA"] = string.format( "%%d %s", ( GetCurrencyInfo( 1155 ) ) )
L["WOW_TOOLTIP_ARTIFACT_POWER"] = ARTIFACT_POWER
L["WOW_TOOLTIP_CRAFTING_REAGENT"] = PROFESSIONS_USED_IN_COOKING

L["WOW_TOOLTIP_CLASS"] = string.format( "^%s", string.gsub( ITEM_CLASSES_ALLOWED, "%%s", "(.+)", 1 ) )
L["PET_BATTLE_BOUND"] = string.format( "%s (%s)", TOOLTIP_BATTLE_PET, ITEM_ACCOUNTBOUND )
L["PET_COMPANION_BOUND"] = string.format( "%s (%s)", PET, ITEM_ACCOUNTBOUND )
L["PET_CANNOT_BATTLE"] = string.gsub( BATTLE_PET_CANNOT_BATTLE, "\n", " " )

L["MINUTES"] = string.match( D_MINUTES, ":(.-);$" ) or true
L["SECONDS"] = string.match( D_SECONDS, ":(.-);$" ) or true

L["SPELL_DRUID_TRAVEL_FORM"] = ( GetSpellInfo( 783 ) ) or true


-- generated from item class table

local itemClassTable = {
	
	{ "WOW_ITEM_CLASS_WEAPON", ArkInventory.Const.ItemClass.WEAPON },
	
	{ "WOW_ITEM_CLASS_ARMOR", ArkInventory.Const.ItemClass.ARMOR },
	
	{ "WOW_ITEM_CLASS_CONTAINER", ArkInventory.Const.ItemClass.CONTAINER },
	{ "WOW_ITEM_CLASS_CONTAINER_BAG", ArkInventory.Const.ItemClass.CONTAINER, ArkInventory.Const.ItemClass.CONTAINER_BAG },
	{ "WOW_ITEM_CLASS_CONTAINER_SOUL", ArkInventory.Const.ItemClass.CONTAINER, ArkInventory.Const.ItemClass.CONTAINER_SOUL },
	{ "WOW_ITEM_CLASS_CONTAINER_HERB", ArkInventory.Const.ItemClass.CONTAINER, ArkInventory.Const.ItemClass.CONTAINER_HERB },
	{ "WOW_ITEM_CLASS_CONTAINER_ENCHANTING", ArkInventory.Const.ItemClass.CONTAINER, ArkInventory.Const.ItemClass.CONTAINER_ENCHANTING },
	{ "WOW_ITEM_CLASS_CONTAINER_ENGINEERING", ArkInventory.Const.ItemClass.CONTAINER, ArkInventory.Const.ItemClass.CONTAINER_ENGINEERING },
	{ "WOW_ITEM_CLASS_CONTAINER_GEM", ArkInventory.Const.ItemClass.CONTAINER, ArkInventory.Const.ItemClass.CONTAINER_GEM },
	{ "WOW_ITEM_CLASS_CONTAINER_MINING", ArkInventory.Const.ItemClass.CONTAINER, ArkInventory.Const.ItemClass.CONTAINER_MINING },
	{ "WOW_ITEM_CLASS_CONTAINER_LEATHERWORKING", ArkInventory.Const.ItemClass.CONTAINER, ArkInventory.Const.ItemClass.CONTAINER_LEATHERWORKING },
	{ "WOW_ITEM_CLASS_CONTAINER_INSCRIPTION", ArkInventory.Const.ItemClass.CONTAINER, ArkInventory.Const.ItemClass.CONTAINER_INSCRIPTION },
	{ "WOW_ITEM_CLASS_CONTAINER_TACKLE", ArkInventory.Const.ItemClass.CONTAINER, ArkInventory.Const.ItemClass.CONTAINER_TACKLE },
	{ "WOW_ITEM_CLASS_CONTAINER_COOKING", ArkInventory.Const.ItemClass.CONTAINER, ArkInventory.Const.ItemClass.CONTAINER_COOKING },
	
	{ "WOW_ITEM_CLASS_CONSUMABLE", ArkInventory.Const.ItemClass.CONSUMABLE },
	{ "WOW_ITEM_CLASS_CONSUMABLE_EXPLOSIVES_AND_DEVICES", ArkInventory.Const.ItemClass.CONSUMABLE, ArkInventory.Const.ItemClass.CONSUMABLE_EXPLOSIVES_AND_DEVICES },
	{ "WOW_ITEM_CLASS_CONSUMABLE_POTION", ArkInventory.Const.ItemClass.CONSUMABLE, ArkInventory.Const.ItemClass.CONSUMABLE_POTION },
	{ "WOW_ITEM_CLASS_CONSUMABLE_ELIXIR", ArkInventory.Const.ItemClass.CONSUMABLE, ArkInventory.Const.ItemClass.CONSUMABLE_ELIXIR },
	{ "WOW_ITEM_CLASS_CONSUMABLE_FLASK", ArkInventory.Const.ItemClass.CONSUMABLE, ArkInventory.Const.ItemClass.CONSUMABLE_FLASK },
	{ "WOW_ITEM_CLASS_CONSUMABLE_FOOD_AND_DRINK", ArkInventory.Const.ItemClass.CONSUMABLE, ArkInventory.Const.ItemClass.CONSUMABLE_FOOD_AND_DRINK },
	{ "WOW_ITEM_CLASS_CONSUMABLE_BANDAGE", ArkInventory.Const.ItemClass.CONSUMABLE, ArkInventory.Const.ItemClass.CONSUMABLE_BANDAGE },
	{ "WOW_ITEM_CLASS_CONSUMABLE_OTHER", ArkInventory.Const.ItemClass.CONSUMABLE, ArkInventory.Const.ItemClass.CONSUMABLE_OTHER },
	{ "WOW_ITEM_CLASS_CONSUMABLE_VANTUSRUNE", ArkInventory.Const.ItemClass.CONSUMABLE, ArkInventory.Const.ItemClass.CONSUMABLE_VANTUSRUNE }, -- ADDED IN LEGION
	
	{ "WOW_ITEM_CLASS_GLYPH", ArkInventory.Const.ItemClass.GLYPH },
	
	{ "WOW_ITEM_CLASS_TRADEGOODS", ArkInventory.Const.ItemClass.TRADEGOODS },
	{ "WOW_ITEM_CLASS_TRADEGOODS_PARTS", ArkInventory.Const.ItemClass.TRADEGOODS, ArkInventory.Const.ItemClass.TRADEGOODS_PARTS },
	{ "WOW_ITEM_CLASS_TRADEGOODS_JEWELCRAFTING", ArkInventory.Const.ItemClass.TRADEGOODS, ArkInventory.Const.ItemClass.TRADEGOODS_JEWELCRAFTING },
	{ "WOW_ITEM_CLASS_TRADEGOODS_CLOTH", ArkInventory.Const.ItemClass.TRADEGOODS, ArkInventory.Const.ItemClass.TRADEGOODS_CLOTH },
	{ "WOW_ITEM_CLASS_TRADEGOODS_LEATHER", ArkInventory.Const.ItemClass.TRADEGOODS, ArkInventory.Const.ItemClass.TRADEGOODS_LEATHER },
	{ "WOW_ITEM_CLASS_TRADEGOODS_METAL_AND_STONE", ArkInventory.Const.ItemClass.TRADEGOODS, ArkInventory.Const.ItemClass.TRADEGOODS_METAL_AND_STONE },
	{ "WOW_ITEM_CLASS_TRADEGOODS_COOKING", ArkInventory.Const.ItemClass.TRADEGOODS, ArkInventory.Const.ItemClass.TRADEGOODS_COOKING },
	{ "WOW_ITEM_CLASS_TRADEGOODS_HERB", ArkInventory.Const.ItemClass.TRADEGOODS, ArkInventory.Const.ItemClass.TRADEGOODS_HERB },
	{ "WOW_ITEM_CLASS_TRADEGOODS_ELEMENTAL", ArkInventory.Const.ItemClass.TRADEGOODS, ArkInventory.Const.ItemClass.TRADEGOODS_ELEMENTAL },
	{ "WOW_ITEM_CLASS_TRADEGOODS_OTHER", ArkInventory.Const.ItemClass.TRADEGOODS, ArkInventory.Const.ItemClass.TRADEGOODS_OTHER },
	{ "WOW_ITEM_CLASS_TRADEGOODS_ENCHANTING", ArkInventory.Const.ItemClass.TRADEGOODS, ArkInventory.Const.ItemClass.TRADEGOODS_ENCHANTING },
	{ "WOW_ITEM_CLASS_TRADEGOODS_INSCRIPTION", ArkInventory.Const.ItemClass.TRADEGOODS, ArkInventory.Const.ItemClass.TRADEGOODS_INSCRIPTION },
	
	{ "WOW_ITEM_CLASS_RECIPE", ArkInventory.Const.ItemClass.RECIPE },
	{ "WOW_ITEM_CLASS_RECIPE_LEATHERWORKING", ArkInventory.Const.ItemClass.RECIPE, ArkInventory.Const.ItemClass.RECIPE_LEATHERWORKING },
	{ "WOW_ITEM_CLASS_RECIPE_TAILORING", ArkInventory.Const.ItemClass.RECIPE, ArkInventory.Const.ItemClass.RECIPE_TAILORING },
	{ "WOW_ITEM_CLASS_RECIPE_ENGINEERING", ArkInventory.Const.ItemClass.RECIPE, ArkInventory.Const.ItemClass.RECIPE_ENGINEERING },
	{ "WOW_ITEM_CLASS_RECIPE_BLACKSMITHING", ArkInventory.Const.ItemClass.RECIPE, ArkInventory.Const.ItemClass.RECIPE_BLACKSMITHING },
	{ "WOW_ITEM_CLASS_RECIPE_ALCHEMY", ArkInventory.Const.ItemClass.RECIPE, ArkInventory.Const.ItemClass.RECIPE_ALCHEMY },
	{ "WOW_ITEM_CLASS_RECIPE_INSCRIPTION", ArkInventory.Const.ItemClass.RECIPE, ArkInventory.Const.ItemClass.RECIPE_INSCRIPTION },
	
	{ "WOW_ITEM_CLASS_GEM", ArkInventory.Const.ItemClass.GEM },
	{ "WOW_ITEM_CLASS_GEM_ARTIFACT_RELIC", ArkInventory.Const.ItemClass.GEM, ArkInventory.Const.ItemClass.GEM_ARTIFACT_RELIC },
	
	{ "WOW_ITEM_CLASS_ITEM_ENHANCEMENT", ArkInventory.Const.ItemClass.ITEM_ENHANCEMENT },
	
	{ "WOW_ITEM_CLASS_PET", ArkInventory.Const.ItemClass.BATTLEPET },
	
	{ "WOW_ITEM_CLASS_MISC", ArkInventory.Const.ItemClass.MISC },
	{ "WOW_ITEM_CLASS_MISC_JUNK", ArkInventory.Const.ItemClass.MISC, 0 },
	{ "WOW_ITEM_CLASS_MISC_REAGENT", ArkInventory.Const.ItemClass.MISC, ArkInventory.Const.ItemClass.MISC_REAGENT },
	{ "WOW_ITEM_CLASS_MISC_PET", ArkInventory.Const.ItemClass.MISC, ArkInventory.Const.ItemClass.MISC_PET },
	{ "WOW_ITEM_CLASS_MISC_HOLIDAY", ArkInventory.Const.ItemClass.MISC, ArkInventory.Const.ItemClass.MISC_HOLIDAY },
	{ "WOW_ITEM_CLASS_MISC_OTHER", ArkInventory.Const.ItemClass.MISC, ArkInventory.Const.ItemClass.MISC_OTHER },
	{ "WOW_ITEM_CLASS_MISC_MOUNT", ArkInventory.Const.ItemClass.MISC, ArkInventory.Const.ItemClass.MISC_MOUNT },
	
	{ "WOW_ITEM_CLASS_QUEST", ArkInventory.Const.ItemClass.QUEST },
	
}

for _, v in ipairs( itemClassTable ) do
	
	local key, i1, i2 = v[1], v[2], v[3]
	
	if key then
		
		local text = nil
		
		if i1 and i2 then
			text = GetItemSubClassInfo( i1, i2 )
		elseif i1 then
			text = GetItemClassInfo( i1 )
		end
		
		if text then
			L[key] = text
		end
		
		--print( string.format( "%s (%s-%s) = %s", key, i1, i2 or 0, text or "nil" ) )
		
	end
	
end

table.wipe( itemClassTable )
itemClassTable = nil


-- set all to true so that they exist and can be over-ridden by the translation update code, wont get over-ridden here because the api wont allow it

L["WOW_ITEM_CLASS_WEAPON"] = true

L["WOW_ITEM_CLASS_ARMOR"] = true

L["WOW_ITEM_CLASS_CONSUMABLE"] = true
L["WOW_ITEM_CLASS_CONSUMABLE_EXPLOSIVES_AND_DEVICES"] = true
L["WOW_ITEM_CLASS_CONSUMABLE_POTION"] = true
L["WOW_ITEM_CLASS_CONSUMABLE_ELIXIR"] = true
L["WOW_ITEM_CLASS_CONSUMABLE_FLASK"] = true
L["WOW_ITEM_CLASS_CONSUMABLE_FOOD_AND_DRINK"] = true
L["WOW_ITEM_CLASS_CONSUMABLE_BANDAGE"] = true
L["WOW_ITEM_CLASS_CONSUMABLE_OTHER"] = true
L["WOW_ITEM_CLASS_CONSUMABLE_VANTUSRUNE"] = true

L["WOW_ITEM_CLASS_CONTAINER"] = true
L["WOW_ITEM_CLASS_CONTAINER_BAG"] = true
L["WOW_ITEM_CLASS_CONTAINER_ENCHANTING"] = true
L["WOW_ITEM_CLASS_CONTAINER_ENGINEERING"] = true
L["WOW_ITEM_CLASS_CONTAINER_GEM"] = true
L["WOW_ITEM_CLASS_CONTAINER_HERB"] = true
L["WOW_ITEM_CLASS_CONTAINER_INSCRIPTION"] = true
L["WOW_ITEM_CLASS_CONTAINER_LEATHERWORKING"] = true
L["WOW_ITEM_CLASS_CONTAINER_MINING"] = true
L["WOW_ITEM_CLASS_CONTAINER_TACKLE"] = true
L["WOW_ITEM_CLASS_CONTAINER_COOKING"] = true

L["WOW_ITEM_CLASS_GEM"] = true
L["WOW_ITEM_CLASS_GEM_ARTIFACT_RELIC"] = true

L["WOW_ITEM_CLASS_ITEM_ENHANCEMENT"] = true

L["WOW_ITEM_CLASS_GLYPH"] = true

L["WOW_ITEM_CLASS_MISC"] = true
L["WOW_ITEM_CLASS_MISC_MOUNT"] = true
L["WOW_ITEM_CLASS_PET"] = true
L["WOW_ITEM_CLASS_MISC_REAGENT"] = true
L["WOW_ITEM_CLASS_MISC_JUNK"] = true

L["WOW_ITEM_CLASS_QUEST"] = true

L["WOW_ITEM_CLASS_TRADEGOODS"] = true
L["WOW_ITEM_CLASS_TRADEGOODS_ELEMENTAL"] = true
L["WOW_ITEM_CLASS_TRADEGOODS_CLOTH"] = true
L["WOW_ITEM_CLASS_TRADEGOODS_LEATHER"] = true
L["WOW_ITEM_CLASS_TRADEGOODS_METAL_AND_STONE"] = true
L["WOW_ITEM_CLASS_TRADEGOODS_COOKING"] = true
L["WOW_ITEM_CLASS_TRADEGOODS_HERB"] = true
L["WOW_ITEM_CLASS_TRADEGOODS_ENCHANTING"] = true
L["WOW_ITEM_CLASS_TRADEGOODS_JEWELCRAFTING"] = true
L["WOW_ITEM_CLASS_TRADEGOODS_PARTS"] = true
L["WOW_ITEM_CLASS_TRADEGOODS_OTHER"] = true
L["WOW_ITEM_CLASS_TRADEGOODS_INSCRIPTION"] = true

L["WOW_ITEM_CLASS_RECIPE"] = true
L["WOW_ITEM_CLASS_RECIPE_ALCHEMY"] = true
L["WOW_ITEM_CLASS_RECIPE_BLACKSMITHING"] = true
L["WOW_ITEM_CLASS_RECIPE_ENGINEERING"] = true
L["WOW_ITEM_CLASS_RECIPE_INSCRIPTION"] = true
L["WOW_ITEM_CLASS_RECIPE_LEATHERWORKING"] = true
L["WOW_ITEM_CLASS_RECIPE_TAILORING"] = true

L["WOW_SKILL_HERBALISM"] = true
L["WOW_SKILL_MINING"] = true
L["WOW_SKILL_SKINNING"] = true

L["CATEGORY_CONSUMABLE"] = true
L["CATEGORY_TRADEGOODS"] = true
