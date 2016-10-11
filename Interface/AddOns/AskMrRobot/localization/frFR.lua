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
local L = LibStub("AceLocale-3.0"):NewLocale("AskMrRobot", "frFR", false)

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
    ["Haste"] = "Hâte",
    ["Mastery"] = "Maitrise",
    ["Multistrike"] = "FM",
    ["Versatility"] = "Poly",
    ["BonusArmor"] = "Armure",
    ["Spirit"] = "Esprit",
    ["Dodge"] = "Esquive",
    ["Parry"] = "Parade",
    ["MovementSpeed"] = "Vitesse",
    ["Avoidance"] = "Evitement",
    ["Stamina"] = "Endu",
    ["Armor"] = "Armure",
    ["AttackPower"] = "PA",
    ["SpellPower"] = "PS",
    ["PvpResilience"] = "JcJ Res",
    ["PvpPower"] = "JcJ Power",
}

L.InstanceNames = {
	[1520] = "Emerald Nightmare",
	[1530] = "Nighthold"
}

L.DifficultyNames = {
	[17] = "LFR",
	[14] = "Normal",
	[15] = "Héroïque",
	[16] = "Mythique"
}

L.WeaponTypes = {
	None     = "Aucun",
	Axe      = "Hache",
	Mace     = "Masse",
	Sword    = "Epée",
	Fist     = "Arme de pugilat",
	Dagger   = "Dague",
	Staff    = "Bâton",
	Polearm  = "Arme d'hast",
	OffHand  = "Main Gauche",
	Shield   = "Bouclier",
	Wand     = "Baguette",
	Bow      = "Arc",
	Gun      = "Arme à feu",
	Crossbow = "Arbalète"
}

L.ArmorTypes = {
	None    = "Aucun",
	Plate   = "Plaques",
	Mail    = "Mailles",
	Leather = "Cuit",
	Cloth   = "Tissu"
}

L.OneHand = "Une Main"
L.TwoHand = "Deux Mains"
L.OffHand = "Main Gauche"


--[[----------------------------------------------------------------------
Main UI
------------------------------------------------------------------------]]
L.AlertOk = "OK"
L.CoverCancel = "annuler"

L.MinimapTooltip = 
[[Clic gauche pour ouvrir la fenêtre Ask Mr. Robot.

Clic droit pour changer de spé et equipper le stuff sauvegardé pour cette spé.

Ctrl + Clic gauche pour marquer un essai comme wipe.]]

L.MainStatusText = function(version, url)
	return version .. " chargée. Documentation disponible à " .. url
end

L.TabExportText = "Exporter"
L.TabGearText = "Stuff"
L.TabLogText = "Combat Logs"
L.TabTeamText = "Team Optimizer"
L.TabOptionsText = "Options"

L.VersionChatTitle = "Version Add-on AMR:"
L.VersionChatNotInstalled = "PAS INSTALLE"
L.VersionChatNotGrouped = "Tu n'es pas dans un groupe ou un raid !"


--[[----------------------------------------------------------------------
Export Tab
------------------------------------------------------------------------]]
L.ExportTitle = "Instructions pour exporter"
L.ExportHelp1 = "1. Copie le texte ci-dessous en appuyant Ctrl+C (ou Cmd+C sur un Mac)"
L.ExportHelp2 = "2. Va sur http://www.askmrrobot.com/wow/player et charge ton perso"
L.ExportHelp3 = "3. Clique le lien \"IMPORT (from addon)\" juste au dessus du nom de ton perso"
L.ExportHelp4 = "4. Colle le texte dans la zone de texte sur le site et clique sur \"Import!\""

L.ExportSplashTitle = "Comment Démarrer"
L.ExportSplashSubtitle = "S'il s'agit de ta première utilisation de cette nouvelle version de l'add-on, procède comme suit pour initialiser la base de données d'items :"
L.ExportSplash1 = "1. Active chacune de tes spés une fois et pour chaque spé, équippe le stuff approprié"
L.ExportSplash2 = "2. Ouvre la fenêtre de ta banque et laisse la ouverte pendant au moins deux secondes"
L.ExportSplash3 = "3. Si tu as du stuff dans ta banque du vide (void storage), ouvre la fenêtre et laisse la ouverte pendant au moins deux secondes"
L.ExportSplashClose = "Continuer"


--[[----------------------------------------------------------------------
Gear Tab
------------------------------------------------------------------------]]
L.GearImportNote = "Clique Importer pour coller des données du site."
L.GearBlank = "Tu n'as pas encore chargé de stuff pour cette spé."
L.GearBlank2 = "Va sur askmrrobot.com pour optimiser ton stuff. Ensuite, utilise le bouton Importer sur la gauche."
L.GearButtonEquip = function(spec)
	return string.format("Activer la spé %s et équipper le stuff", spec)
end
L.GearButtonShop = "Voir Shopping List"

L.GearEquipErrorCombat = "Impossible de changer de spé/stuff pendant un combat !"
L.GearEquipErrorEmpty = "Pas de stuff sauvegardé pour la spé active."
L.GearEquipErrorNotFound = "Un item de ton stuff sauvegardé pour la spee n'a pas pu être équippé."
L.GearEquipErrorNotFound2 = "Essaie d'ouvrir la fenêtre de la banque et de lancer cette commande de nouveau, ou bien vérifie ta banque du vide."
L.GearEquipErrorBagFull = "Pas assez de place dans tes sacs pour équipper ton stuff sauvegardé."
L.GearEquipErrorSoulbound = function(itemLink)
	return itemLink .. " n'a pas pu être équippé car il n'est pas lié quand ramassé."
end

L.GearButtonImportText = "Importer"
L.GearButtonCleanText = "Nettoyer les Sacs"

L.GearTipTitle = "Infobulle !"
L.GearTipText = 
[[Dans les options, tu peux activer l'équippement automatique de ton stuff quand tu changes de spé.

Ou, tu peux faire un clic droit sur l'icône de la minimap pour changer de spé et equipper ton stuff.

OU! Tu peux utiliser des commandes /:]]

L.GearTipCommands = 
[[/amr equip [1-4]
pas d'argument = cycle]]
-- note to translators: the slash commands are literal and should stay as english


--[[----------------------------------------------------------------------
Import Dialog on Gear Tab
------------------------------------------------------------------------]]
L.ImportHeader = "Appuie sur Ctrl+V (ou Cmd+V sur un Mac) pour coller les données du site dans la zone de texte ci-dessous."
L.ImportButtonOk = "Importer"
L.ImportButtonCancel = "Annuler"

L.ImportErrorEmpty = "La zone de texte est vide."
L.ImportErrorFormat = "Les données ne sont pas dans le bon format."
L.ImportErrorVersion = "Les données ont été générées pour une version antérieure de l'add-on. Rends-toi sur le site pour générer des données à jour."
L.ImportErrorChar = function(importChar, yourChar)
	return "Les données sont pour " .. importChar .. ", mais tu as " .. yourChar .. "!"
end
L.ImportErrorRace = "On dirait que tu as changé de race. Rends-toi sur le site pour ré-optimiser."
L.ImportErrorFaction = "On dirait que tu as changé de faction. Rends-toi sur le site pour ré-optimiser."
L.ImportErrorLevel = "On dirait que tu as changé de niveau. Rends-toi sur le site pour ré-optimiser."

L.ImportOverwolfWait = "Performing Best in Bags optimization.  Please do not press Escape or close the addon until it has completed!"


--[[----------------------------------------------------------------------
Shopping List
------------------------------------------------------------------------]]
L.ShopTitle = "Shopping List"
L.ShopEmpty = "Il n'existe pas de données de shopping list pour ce perso."
L.ShopSpecLabel = "Spé"
L.ShopHeaderGems = "Gemmes"
L.ShopHeaderEnchants  = "Enchantements"
L.ShopHeaderMaterials = "Matériaux d'Enchantement"


--[[----------------------------------------------------------------------
Combat Log Tab
------------------------------------------------------------------------]]
L.LogChatStart = "Le log des données de combat a commencé et Mr. Robot enregistre les données de ton raid."
L.LogChatStop = "Le log des données de combat est maintenant arrêté."

L.LogChatWipe = function(wipeTime)
	return "Wipe manuel demandé à " .. wipeTime .. "."
end
L.LogChatUndoWipe = function(wipeTime)
	return "Wipe manuel à " .. wipeTime .. " a été effacé."
end
L.LogChatNoWipes = "Il n'y a pas de wipe manuel récent à effacer."

L.LogButtonStartText = "Commencer le log"
L.LogButtonStopText = "Arrêter le log"
L.LogButtonReloadText = "Recharger l'interface utilisateur"
L.LogButtonWipeText = "Wipe !"
L.LogButtonUndoWipeText = "Annuler Wipe"

L.LogNote = "Tu enregistres maintenant les logs des données de combat et de stuff."
L.LogReloadNote = "Avant d'uploader un fichier de log, il faut soit quitter WoW soit recharger l'interface utilisateur."
L.LogWipeNote = "La personne qui uploade les logs doit être celle qui utilise la commande de wipe."
L.LogWipeNote2 = function(cmd)
	return "'" .. cmd .. "' vont aussi faire ça."
end
L.LogUndoWipeNote = "Dernier wipe demandé:"
L.LogUndoWipeDate = function(day, timeOfDay)
	return day .. " à " .. timeOfDay
end

L.LogAutoTitle = "Auto-Logging"
L.LogAutoAllText = "Afficher/Cacher"

L.LogInstructionsTitle = "Instructions !"
L.LogInstructions = 
[[1.) Clique ``Commencer le log'' ou active Auto-Logging pour les instances désirées.

2.) Quand tu es prêt à uploader, quitte World of Warcraft* ou recharge l'interface utilisateur.**

3.) Lance le client AMR et upload tes logs.


*Il n'est pas nécessaire de quitter WoW, mais c'est recommandé. Cela permet au client AMR d'éviter que ton fichier de log devienne trop gros.

**L'add-on AMR collecte des données additionnelles au début de chaque combat pour tous les joueurs du raid. Les autres joueurs n'ont pas besoin d'activer les logs de combats ! Ils ont simplement besoin d'avoir l'add-on installé. Les données sont sauvegardées seulement lorsque tu quittes WoW ou que tu recharges l'interface utilisateur avant d'uploader.
]]


--[[----------------------------------------------------------------------
Team Optimizer Tab
------------------------------------------------------------------------]]
L.TeamTabLeaderText = "Master Loot"
L.TeamTabMemberText = "Membre du Raid"

L.TeamSplashHeader = "Comment utilises-tu d'habitude le Team Optimizer ?"
L.TeamSplashLeaderLabel = "Je suis la personne qui utilise askmrrobot.com pour classer et distributer le loot pour notre groupe."
L.TeamSplashMemberLabel = "Quelqu'un d'autre utilise l'optimiseur de Groupe / Raid pour moi."

L.TeamMemberText = "Tu peux te relaxer, tout est géré par les leaders de ton groupe."
L.TeamMemberShowLootLabel = "Loot en cours !"
L.TeamMemberShowLoot = "Voir la fenêtre de loot"

L.TeamButtonVersionText = "Vérifier la version de l'add-on"
L.TeamButtonExportRosterText = "Exporter Roster"
L.TeamButtonExportLootText = "Exporter Loot"
L.TeamButtonExportClose = "Fermer"
L.TeamButtonImportRankingsText = "Importer Rankings"
L.TeamButtonStartLootText = "Commencer Loot"
L.TeamButtonResumeLootText = "Continuer Loot"

L.TeamExportVersionLabel = "Le Team Optimizer est plus précis et plus facile à utiliser si tout le monde dans le groupe utilise l'add-on AskMrRobot."
L.TeamExportRosterLabel = "Fais ceci une fois au début du raid pour initialiser l'Optimizer sur le site. Si quelqu'un rejoint le groupe ou le quitte, refais cette étape et appuie sur ``Import without Reload'' sur le site pour prendre en compte les joueurs qui ont changé."
L.TeamExportLootLabel = "Exporte tous les drops du dernier boss looté et les classe tous sur le site. Les classements prennent en compte le loot précédemment gagné ainsi que les bonus rolls !"
L.TeamExportLootLabel2 = "Requiert Master Loot"
L.TeamImportRankingsLabel = "Importe les données de classement depuis askmrrobot.com, afin que tu puisses facilement voir comment distribuer le loot."
L.TeamStartLootLabel = function(numItems)
	return numItems .. " items importés."
end

L.TeamHistoryTitle = "Historique de loot"
L.TeamHistoryNoGroup = "Tu n'es pas dans un groupe ou un raid."
L.TeamHistoryEmpty = "L'add-on n'a pas encore enregistré de distribution de loot."

L.TeamVersionTitle = "Version Check"
L.TeamVersionNoGroup = "Tu n'es pas dans un groupe ou un raid."
L.TeamVersionGood = "Tout le monde dans ton groupe a l'add-on !"
L.TeamVersionMissing = "PAS INSTALLE"
L.TeamVersionOld = "PAS A JOUR"

L.TeamExportRosterLoading = "En train d'obtenir les données des joueurs..."

L.TeamAlertNoGroup = "Tu n'es pas dans un groupe !"
L.TeamAlertNoLoot = "Il n'y a pas eu de loot distribué par master-loot recémment dans ton groupe ou raid !"

L.TeamExportHelp = "Appuie sur Ctrl+C (ou Cmd+C sur un Mac) pour copier le texte ci-dessous."
L.TeamExportRosterText = "Ensuite va dans le Team Optimizer sur le site et colle le texte dans la zone de texte pour importer le roster."
L.TeamExportLootText = "Ensuite va dans le Team Optimizer sur le site et colle le texte dans la zone de texte pour importer le loot."
-- note to translators: leave "Team Optimizer" in english in the above two texts because our website is not localized yet

L.TeamImportRankingsHeader = "Appuie sur Ctrl+V (ou Cmd+V sur un Mac) pour coller les données du site dans la zone de texte ci-dessous."

L.TeamLootOptionNeed = "Need"
L.TeamLootOptionOff = "Off Spé"
L.TeamLootOptionGreed = "Greed"
L.TeamLootOptionPass = "Pass"
L.TeamLootOptionDisenchant = "Désenchanter"


--[[----------------------------------------------------------------------
Loot Window
------------------------------------------------------------------------]]
L.LootTitle = "Loot!"
L.LootEmpty = "Il n'y a pas de loot à distribuer actuellement !"
L.LootHelpItems = "Pour chaque drop..."
L.LootHelpRanks = "Choisis une option :"
L.LootHelpMaster = "Puis master loot :"

L.LootIneligible = "Tu n'es pas éligible pour ce drop."

L.LootRankHeaderRank = "Classement"
L.LootRankHeaderScore = "Pourcentage d'upgrade"
L.LootRankHeaderScoreDisenchant = "Joueur"

-- note to translators: these column headers should be short, abbreviate if necessary, keep to 5 characters max
L.LootRankHeaderNeed = "Need"
L.LootRankHeaderOff = "Off"
L.LootRankHeaderGreed = "Greed"
L.LootRankHeaderPass = "Pass"
L.LootRankHeaderRoll = "Roll"

L.LootRankLabelOff = "off spé"
L.LootRankLabelDisenchant = "désenchanteur"
L.LootRankLabelMasterLooter = "master looter"
L.LootRankLabelNoAddon = "add-on pas activé"

L.LootMasterRollText = "Roll"
L.LootMasterDisenchantText = "Désenchanter/Vendre"

L.LootMasterRollLabel = "/roll automatique pour tout le monde"
L.LootMasterDisenchantLabel = "coche si personne ne veut de l'item"
L.LootMasterGiveLoot = "Donner Loot"
L.LootMasterGiveDisenchant = "Donner pour désenchanter/vendre"

L.LootMasterGiveFail = "Soit cet item, soit le joueur à qui il aurait du être donné n'a pas été trouvé."


--[[----------------------------------------------------------------------
Options Tab
------------------------------------------------------------------------]]
L.OptionsHeaderGeneral = "Options Générales"

L.OptionsHideMinimapName = "Cacher icône minimap"
L.OptionsHideMinimapDesc = "L'icône de minimap est là pour te simplifier la vie, mais sache que toutes les actions peuvent lancées par des commandes / ou depuis l'interface utilisateur."

L.OptionsAutoGearName = "Equippe le stuff automatiquement lors d'un changement de spé"
L.OptionsAutoGearDesc = "Quand tu changes de spé (via l'interface utilisateur, un autre add-on, etc.) le stuff importé depuis AMR (onglet Gear) pour cette spé est automatiquement équippé."

L.OptionsShopAhName = "Voir la shopping list automatiquement à l'hôtel des ventes"
L.OptionsShopAhDesc = "Quand tu ouvres l'hôtel des ventes, la fenêtre de la shopping list s'ouvre automatiquement. Tu peux cliquer sur un item dans la shopping list pour le chercher automatiquement dans l'hôtel des ventes."

L.OptionsUiScaleName = "Ask Mr. Robot UI scale"
L.OptionsUiScaleDesc = "Enter a value between 0.5 and 1.5 to change the scale of the Ask Mr. Robot user interface, press Enter, then close/open the window for it take effect. If the positioning gets messed up, use the /amr reset command."

end
