--[[-------------------------------------------------------------------------------------------------------------
Master Localization File (English)

Instructions for Translators:
1. Copy this entire file into a new file in the same folder, named with your locale, e.g. deDE.lua for German.
2. At the top, replace "enUS" in the first code line with your locale, and change the next parameter from true to false.
3. Change all the English strings in your file as appropriate.

Note that a couple of the "strings" are functions that are provided variables.  Feel free to modify these
functions as necessary to output an appropriately worded statement in your language (but don't change the parameters).  
If you need assistance with the syntax of any used methods like string.format, please contact Team Robot and we will gladly assist you.
---------------------------------------------------------------------------------------------------------------]]

-- replace enUS with your locale
local L = LibStub("AceLocale-3.0"):NewLocale("AskMrRobot", "enUS", true)

if L then


--[[----------------------------------------------------------------------
General
------------------------------------------------------------------------]]

L.SpecsShort = {
	[1] = "Blood", -- DeathKnightBlood
    [2] = "Frost", -- DeathKnightFrost
    [3] = "Unholy", -- DeathKnightUnholy
	[4] = "Havoc", -- DemonHunterHavoc
	[5] = "Vengeance", -- DemonHunterVengeance
    [6] = "Moon", -- DruidBalance
    [7] = "Feral", -- DruidFeral
    [8] = "Bear", -- DruidGuardian
    [9] = "Resto", -- DruidRestoration
    [10] = "BM", -- HunterBeastMastery
    [11] = "Marks", -- HunterMarksmanship
    [12] = "Survival", -- HunterSurvival
    [13] = "Arcane", -- MageArcane
    [14] = "Fire", -- MageFire
    [15] = "Frost", -- MageFrost
    [16] = "Brew", -- MonkBrewmaster
    [17] = "Mist", -- MonkMistweaver
    [18] = "Wind", -- MonkWindwalker
    [19] = "Holy", -- PaladinHoly
    [20] = "Prot", -- PaladinProtection
    [21] = "Ret", -- PaladinRetribution
    [22] = "Disc", -- PriestDiscipline
    [23] = "Holy", -- PriestHoly
    [24] = "Shadow", -- PriestShadow
    [25] = "Assn", -- RogueAssassination
    [26] = "Outlaw", -- RogueOutlaw
    [27] = "Sub", -- RogueSubtlety
    [28] = "Elem", -- ShamanElemental
    [29] = "Enh", -- ShamanEnhancement
    [30] = "Resto", -- ShamanRestoration
    [31] = "Aff", -- WarlockAffliction
    [32] = "Demo", -- WarlockDemonology
    [33] = "Destro", -- WarlockDestruction
    [34] = "Arms", -- WarriorArms
    [35] = "Fury", -- WarriorFury
    [36] = "Prot", -- WarriorProtection
}

-- stat strings for e.g. displaying gem/enchant abbreviations, make as short as possible without being confusing/ambiguous
L.StatsShort = {
    ["Strength"] = "Str",
    ["Agility"] = "Agi",
    ["Intellect"] = "Int",
    ["CriticalStrike"] = "Crit",
    ["Haste"] = "Haste",
    ["Mastery"] = "Mastery",
    ["Multistrike"] = "Multi",
    ["Versatility"] = "Vers",
    ["BonusArmor"] = "Armor",
    ["Spirit"] = "Spirit",
    ["Dodge"] = "Dodge",
    ["Parry"] = "Parry",
    ["MovementSpeed"] = "Speed",
    ["Avoidance"] = "Avoid",
    ["Stamina"] = "Stam",
    ["Armor"] = "Armor",
    ["AttackPower"] = "AP",
    ["SpellPower"] = "SP",
    ["PvpResilience"] = "PvP Res",
    ["PvpPower"] = "PvP Pow",
}

L.InstanceNames = {
	[1520] = "Emerald Nightmare",
	[1530] = "Nighthold"
}

L.DifficultyNames = {
	[17] = "LFR",
	[14] = "Normal",
	[15] = "Heroic",
	[16] = "Mythic"
}

L.WeaponTypes = {
	None     = "None",
	Axe      = "Axe",
	Mace     = "Mace",
	Sword    = "Sword",
	Fist     = "Fist",
	Dagger   = "Dagger",
	Staff    = "Staff",
	Polearm  = "Polearm",
	OffHand  = "Off Hand",
	Shield   = "Shield",
	Wand     = "Wand",
	Bow      = "Bow",
	Gun      = "Gun",
	Crossbow = "Crossbow",
	Warglaive= "Warglaive"
}

L.ArmorTypes = {
	None    = "None",
	Plate   = "Plate",
	Mail    = "Mail",
	Leather = "Leather",
	Cloth   = "Cloth"
}

L.OneHand = "One-Hand"
L.TwoHand = "Two-Hand"
L.OffHand = "Off Hand"


--[[----------------------------------------------------------------------
Main UI
------------------------------------------------------------------------]]
L.AlertOk = "OK"
L.CoverCancel = "cancel"

L.MinimapTooltip = 
[[Left Click to open the Ask Mr. Robot window.

Right Click to cycle specs and equip your saved gear for that spec.]]

L.MainStatusText = function(version, url)
	return version .. " loaded. Documentation available at " .. url
end

L.TabExportText = "Export"
L.TabGearText = "Gear"
L.TabLogText = "Combat Logs"
L.TabTeamText = "Team Optimizer"
L.TabOptionsText = "Options"

L.VersionChatTitle = "AMR Addon Version:"
L.VersionChatNotInstalled = "NOT INSTALLED"
L.VersionChatNotGrouped = "You are not in a group or raid!"


--[[----------------------------------------------------------------------
Export Tab
------------------------------------------------------------------------]]
L.ExportTitle = "Export Instructions"
L.ExportHelp1 = "1. Copy the text below by pressing Ctrl+C (or Cmd+C on a Mac)"
L.ExportHelp2 = "2. Go to http://beta.askmrrobot.com/wow/simulator/run and open the character picker"
L.ExportHelp3 = "3. Paste into the textbox under the ADDON section"

L.ExportSplashTitle = "Getting Started"
L.ExportSplashSubtitle = "This is your first time using the new version of the addon. Do the following things to initialize your item database:"
L.ExportSplash1 = "1. Activate each of your specs once and equip your latest gear for each spec"
L.ExportSplash2 = "2. Equip and open your artifact weapon for each spec"
L.ExportSplash3 = "3. Open your bank and leave it open for at least two seconds"
L.ExportSplash4 = "4. If you have gear in void storage, open it and leave it open for at least two seconds"
L.ExportSplashClose = "Continue"


--[[----------------------------------------------------------------------
Gear Tab
------------------------------------------------------------------------]]
L.GearImportNote = "Click Import to paste data from the website."
L.GearBlank = "You have not loaded any gear for this spec yet."
L.GearBlank2 = "Go to askmrrobot.com to optimize your gear, then use the Import button to the left."
L.GearButtonEquip = function(spec)
	return string.format("Activate %s Spec and Equip Gear", spec)
end
L.GearButtonShop = "Show Shopping List"

L.GearEquipErrorCombat = "Cannot change spec/gear while in combat!"
L.GearEquipErrorEmpty = "No saved gear set could be found for the current spec."
L.GearEquipErrorNotFound = "An item in your saved gear set could not be equipped."
L.GearEquipErrorNotFound2 = "Try opening your bank and running this command again, or check your void storage."
L.GearEquipErrorBagFull = "There is not enough room in your bags to equip your saved gear set."
L.GearEquipErrorSoulbound = function(itemLink)
	return itemLink .. " could not be equipped because it is not bound to you."
end

L.GearButtonImportText = "Import"
L.GearButtonCleanText = "Clean Bags"

L.GearTipTitle = "TIP!"
L.GearTipText = 
[[In Options, you can enable automatic equipping of your gear sets whenever you change spec.

Or, you can right click the minimap icon to switch spec and equip gear.

OR! You can use slash commands:]]

L.GearTipCommands = 
[[/amr equip [1-4]
no arg = cycle]]
-- note to translators: the slash commands are literal and should stay as english


--[[----------------------------------------------------------------------
Import Dialog on Gear Tab
------------------------------------------------------------------------]]
L.ImportHeader = "Press Ctrl+V (Cmd+V on a Mac) to paste data from the website into the box below."
L.ImportButtonOk = "Import"
L.ImportButtonCancel = "Cancel"

L.ImportErrorEmpty = "The data string is empty."
L.ImportErrorFormat = "The data string is not in the correct format."
L.ImportErrorVersion = "The data string is from an old version of the addon.  Please go to the website and generate a new one."
L.ImportErrorChar = function(importChar, yourChar)
	return "The data string is for " .. importChar .. ", but you are " .. yourChar .. "!"
end
L.ImportErrorRace = "It looks your race may have changed.  Please go the website and re-optimize."
L.ImportErrorFaction = "It looks your faction may have changed.  Please go the website and re-optimize."
L.ImportErrorLevel = "It looks your level may have changed.  Please go the website and re-optimize."

L.ImportOverwolfWait = "Performing Best in Bags optimization.  Please do not press Escape or close the addon until it has completed!"


--[[----------------------------------------------------------------------
Shopping List
------------------------------------------------------------------------]]
L.ShopTitle = "Shopping List"
L.ShopEmpty = "There is no shopping list data for this player."
L.ShopSpecLabel = "Spec"
L.ShopHeaderGems = "Gems"
L.ShopHeaderEnchants  = "Enchants"
L.ShopHeaderMaterials = "Enchanting Materials"


--[[----------------------------------------------------------------------
Combat Log Tab
------------------------------------------------------------------------]]
L.LogChatStart = "You are now logging combat." -- , and Mr. Robot is logging character data for your raid
L.LogChatStop = "Combat logging has been stopped."

L.LogChatWipe = function(wipeTime)
	return "Manual wipe called at " .. wipeTime .. "."
end
L.LogChatUndoWipe = function(wipeTime)
	return "Manual wipe at " .. wipeTime .. " was removed."
end
L.LogChatNoWipes = "There is no recent manual wipe to remove."

L.LogButtonStartText = "Start Logging"
L.LogButtonStopText = "Stop Logging"
L.LogButtonReloadText = "Reload UI"
L.LogButtonWipeText = "Wipe!"
L.LogButtonUndoWipeText = "Undo Wipe"

L.LogNote = "You are currently logging combat data."
L.LogReloadNote = "Either exit WoW entirely, or reload your UI just before uploading a log file."
L.LogWipeNote = "The person uploading the log must be the one to use this wipe command."
L.LogWipeNote2 = function(cmd)
	return "'" .. cmd .. "' will also do this."
end
L.LogUndoWipeNote = "Last wipe called:"
L.LogUndoWipeDate = function(day, timeOfDay)
	return day .. " at " .. timeOfDay
end

L.LogAutoTitle = "Auto-Logging"
L.LogAutoAllText = "Toggle All"

L.LogInstructionsTitle = "Instructions!"
L.LogInstructions = 
[[1.) Click Start Logging or enable Auto-Logging for your desired raids.

2.) When you are ready to upload, exit World of Warcraft* or reload your UI.**

3.) Launch the AMR Client to upload your log.


*It is not necessary to exit WoW, but it is highly recommended. This will allow the AMR client to prevent your log file from getting very large.

**The AMR addon collects extra data at the start of each encounter for all players in your raid with the AMR addon. Other players do not need to enable logging! They just need to have the addon installed and enabled. This data is only saved to disk if you exit WoW or reload your UI before uploading.
]]


--[[----------------------------------------------------------------------
Team Optimizer Tab
------------------------------------------------------------------------]]
L.TeamTabLeaderText = "Loot Ranker"
L.TeamTabMemberText = "Team Member"

L.TeamSplashHeader = "How do you usually use the Team Optimizer?"
L.TeamSplashLeaderLabel = "I am the person who uses askmrrobot.com to rank the loot for our group"
L.TeamSplashMemberLabel = "Someone else handles using the Team Optimizer for me"

L.TeamMemberText = "Just sit back and relax, everything is being handled by your team leaders."
L.TeamMemberShowLootLabel = "Looting is in progress!"
L.TeamMemberShowLoot = "Show Loot Window"

L.TeamButtonVersionText = "Check for Addon"
L.TeamButtonExportRosterText = "Export Roster"
L.TeamButtonExportLootText = "Export Loot"
L.TeamButtonExportClose = "Close"
L.TeamButtonImportRankingsText = "Import Rankings"
L.TeamButtonStartLootText = "Start Looting"
L.TeamButtonResumeLootText = "Resume Looting"

L.TeamExportVersionLabel = "The Team Optimizer is more accurate and easier to use if everyone in your group has the AskMrRobot addon."
L.TeamExportRosterLabel = "Do this once at the beginning of your raid to initialize the Team Optimizer on the web. If someone joins or leaves your group during a raid, do it again and press 'Import without Reload' on the web to do a quick update of just the players that changed."
L.TeamExportLootLabel = "Export all drops from the last looted boss and rank them all at once on the web.  Rankings automatically account for loot won on previous bosses or bonus rolls!"
L.TeamExportLootLabel2 = "Requires Master Loot"
L.TeamImportRankingsLabel = "Import ranking data from askmrrobot.com so that you can easily view and distribute loot in-game."
L.TeamStartLootLabel = function(numItems)
	return numItems .. " items were imported."
end

L.TeamHistoryTitle = "Loot History"
L.TeamHistoryNoGroup = "You are not in a group or raid."
L.TeamHistoryEmpty = "No loot has been handed out yet."

L.TeamVersionTitle = "Version Check"
L.TeamVersionNoGroup = "You are not in a group or raid."
L.TeamVersionGood = "Everyone in your group has the addon!"
L.TeamVersionMissing = "NOT INSTALLED"
L.TeamVersionOld = "OUT OF DATE"

L.TeamExportRosterLoading = "Gathering player data, please wait..."

L.TeamAlertNoGroup = "You are not in a group!"
L.TeamAlertNoLoot = "Nothing has been master-looted recently in your party or raid!"

L.TeamExportHelp = "Press Ctrl+C (or Cmd+C on a Mac) to copy the text below."
L.TeamExportRosterText = "Then go to the Team Optimizer on the website and paste into the roster import box."
L.TeamExportLootText = "Then go to the Team Optimizer on the website and paste into the loot import box."
-- note to translators: leave "Team Optimizer" in english in the above two texts because our website is not localized yet

L.TeamImportRankingsHeader = "Press Ctrl+V (Cmd+V on a Mac) to paste data from the website into the box below."

L.TeamLootOptionNeed = "Need"
L.TeamLootOptionOff = "Off Spec"
L.TeamLootOptionGreed = "Greed"
L.TeamLootOptionPass = "Pass"
L.TeamLootOptionDisenchant = "Disenchant"


--[[----------------------------------------------------------------------
Loot Window
------------------------------------------------------------------------]]
L.LootTitle = "Loot!"
L.LootEmpty = "There is no loot to hand out right now!"
L.LootHelpItems = "For each drop..."
L.LootHelpRanks = "Choose an option:"
L.LootHelpMaster = "Then master loot:"

L.LootIneligible = "You are not eligible for this drop."

L.LootRankHeaderRank = "Rank"
L.LootRankHeaderScore = "Percent Upgrade"
L.LootRankHeaderScoreDisenchant = "Player"

-- note to translators: these column headers should be short, abbreviate if necessary, keep to 5 characters max
L.LootRankHeaderNeed = "Need"
L.LootRankHeaderOff = "Off"
L.LootRankHeaderGreed = "Greed"
L.LootRankHeaderPass = "Pass"
L.LootRankHeaderRoll = "Roll"

L.LootRankLabelOff = "off spec"
L.LootRankLabelDisenchant = "disenchanter"
L.LootRankLabelMasterLooter = "master looter"
L.LootRankLabelNoAddon = "addon not running"

L.LootMasterRollText = "Roll"
L.LootMasterDisenchantText = "Disenchant/Sell"

L.LootMasterRollLabel = "automatic /roll for everyone"
L.LootMasterDisenchantLabel = "check this if no one wants this item"
L.LootMasterGiveLoot = "Give Loot"
L.LootMasterGiveDisenchant = "Give for Disenchant/Sell"

L.LootMasterGiveFail = "Either this item or this master loot candidate could not be found :("


--[[----------------------------------------------------------------------
Options Tab
------------------------------------------------------------------------]]
L.OptionsHeaderGeneral = "General Options"

L.OptionsHideMinimapName = "Hide minimap icon"
L.OptionsHideMinimapDesc = "The minimap icon is for convenience, all actions can also be performed via slash commands or the UI."

L.OptionsAutoGearName = "Automatically equip gear on spec change"
L.OptionsAutoGearDesc = "Whenever you change spec (via the in-game UI, another addon, etc.), your imported AMR gear sets (on the Gear tab) will be automatically equipped."

L.OptionsShopAhName = "Automatically show shopping list at auction house"
L.OptionsShopAhDesc = "Whenever you open the auction house, automatically show the shopping list window.  You can click on items in the shopping list to quickly search for them in the auction house."

L.OptionsDisableEmName = "Disable creating Equipment Manager sets"
L.OptionsDisableEmDesc = "A Blizzard Equipment Manager set is created whenever you equip an AMR gear set, useful for marking items in your optimized sets. Check to disable this behavior if desired."

L.OptionsUiScaleName = "Ask Mr. Robot UI scale"
L.OptionsUiScaleDesc = "Enter a value between 0.5 and 1.5 to change the scale of the Ask Mr. Robot user interface, press Enter, then close/open the window for it take effect. If the positioning gets messed up, use the /amr reset command."

end
