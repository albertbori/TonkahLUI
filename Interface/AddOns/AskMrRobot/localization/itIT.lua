--[[-------------------------------------------------------------------------------------------------------------
Master Localization File (English)

Instructions for Translators:
1. Copy this entire file into a new file in the same folder, named with your locale, e.g. deDE.lua for German.
2. At the top, replace "enUS" in the first code line with your locale.
3. Change all the English strings in your file as appropriate.

Note that a couple of the "strings" are functions that are provided variables.  Feel free to modify these
functions as necessary to output an appropriately worded statement in your language (but don't change the parameters).  
If you need assistance with the syntax of any used methods like string.format, please contact Team Robot and we will gladly assist you.
---------------------------------------------------------------------------------------------------------------]]

-- replace enUS with your locale
local L = LibStub("AceLocale-3.0"):NewLocale("AskMrRobot", "itIT", false)

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
    ["Strength"] = "For",
    ["Agility"] = "Agi",
    ["Intellect"] = "Int",
    ["CriticalStrike"] = "Crit",
    ["Haste"] = "Celerità",
    ["Mastery"] = "Maestria",
    ["Multistrike"] = "Repli",
    ["Versatility"] = "Vers",
    ["BonusArmor"] = "Bonus Armor",
    ["Spirit"] = "Spirito",
    ["Dodge"] = "Schivata",
    ["Parry"] = "Parata",
    ["MovementSpeed"] = "Velocità",
    ["Avoidance"] = "Elusione",
    ["Stamina"] = "Stam",
    ["Armor"] = "Armor",
    ["AttackPower"] = "AP",
    ["SpellPower"] = "SP",
    ["PvpResilience"] = "PvP Res",
    ["PvpPower"] = "PvP Pot",
}

L.InstanceNames = {
	[1520] = "Emerald Nightmare",
	[1530] = "Nighthold"
}

L.DifficultyNames = {
	[17] = "LFR",
	[14] = "Normale",
	[15] = "Eroico",
	[16] = "Mitico"
}

L.WeaponTypes = {
	None     = "None",
	Axe      = "Ascia",
	Mace     = "Mazza",
	Sword    = "Spada",
	Fist     = "Tirapugni",
	Dagger   = "Pugnale",
	Staff    = "Bastone",
	Polearm  = "Arma ad Asta",
	OffHand  = "Mano Secondaria",
	Shield   = "Scudo",
	Wand     = "Bacchetta",
	Bow      = "Arco",
	Gun      = "Fucile",
	Crossbow = "Balestra"
}

L.ArmorTypes = {
	None    = "None",
	Plate   = "Piastre",
	Mail    = "Maglia",
	Leather = "Cuoio",
	Cloth   = "Stoffa"
}

L.OneHand = "Una Mano"
L.TwoHand = "Due Mani"
L.OffHand = "Mano Secondaria"


--[[----------------------------------------------------------------------
Main UI
------------------------------------------------------------------------]]
L.AlertOk = "OK"
L.CoverCancel = "Annulla"

L.MinimapTooltip = 
[[Clic Sinistro per aprire l'interfaccia di Ask Mr Robot.

Tasto Destro per cambiare spec ed equip collegato.

Ctrl + Clic Sinistro per segnare il wipe.]]

L.MainStatusText = function(version, url)
	return version .. " loaded. Documentazione disponibile su " .. url
end

L.TabExportText = "Esporta"
L.TabGearText = "Equip"
L.TabLogText = "Combat Logs"
L.TabTeamText = "Ottimizzatore Raid"
L.TabOptionsText = "Opzioni"

L.VersionChatTitle = "Versione Addon AMR:"
L.VersionChatNotInstalled = "NON INSTALLATO"
L.VersionChatNotGrouped = "Non sei in un gruppo o in incursione!"


--[[----------------------------------------------------------------------
Export Tab
------------------------------------------------------------------------]]
L.ExportTitle = "Istruzioni di Esportazione"
L.ExportHelp1 = "1. Copia il testo qui sotto premendo Ctrl+C (o Cmd+C su un Mac)"
L.ExportHelp2 = "2. Vai su http://www.askmrrobot.com/wow/player e carica il tuo personaggio"
L.ExportHelp3 = "3. Premi la scritta verde IMPORT (from addon) subito sopra il nome del tuo personaggio"
L.ExportHelp4 = "4. Incolla all'interno dell'area di testoe premi il tasto Import!"

L.ExportSplashTitle = "Per Cominciare"
L.ExportSplashSubtitle = "Questa è la tua prima volta con la nuova versione dell'addon. Esegui queste operazioni per creare il Database del tuo equipaggiamento:"
L.ExportSplash1 = "1. Attiva Ognuna delle tue spec ed equipaggia gli oggetti migliori che hai"
L.ExportSplash2 = "2. Apri la tua banca e lasciala aperta almeno per 2 secondi"
L.ExportSplash3 = "3. Se hai dell'equipaggiamento nella Banca Eterea, Aprila e lasciala aperta per almeno due secondi"
L.ExportSplashClose = "Continua"


--[[----------------------------------------------------------------------
Gear Tab
------------------------------------------------------------------------]]
L.GearImportNote = "Clicca Importa per importare i dati dal sito."
L.GearBlank = "Non hai caricato nessun equipaggiamento per questa specializzazione."
L.GearBlank2 = "Vai su askmrrobot.com per ottimizzare l'equipaggiamento, quindi usa il pulsante Importa sulla sinistra."
L.GearButtonEquip = function(spec)
	return string.format("Attiva %s Spec ed Equip", spec)
end
L.GearButtonShop = "Show Shopping List"

L.GearEquipErrorCombat = "Non puoi cambiare spec/eqiup mentre sei in combattimento!"
L.GearEquipErrorEmpty = "Nessun equipaggiamento salvato per questa Spec."
L.GearEquipErrorNotFound = "Un oggetto nel tuo equipaggiamento salvato non può essere indossato."
L.GearEquipErrorNotFound2 = "Prova ad aprire la banca e ad eseguire di nuovo questo comando, oppure controlla la tua Banca Eterea."
L.GearEquipErrorBagFull = "Non c'è abbastanza spazio nel tuo inventario per effettuare il cambio di equipaggiamento."
L.GearEquipErrorSoulbound = function(itemLink)
	return itemLink .. " non può essere indossato perche non è vincolato a te."
end

L.GearButtonImportText = "Importa"
L.GearButtonCleanText = "Pulisci Borse"

L.GearTipTitle = "CONSIGLIO!"
L.GearTipText = 
[[Nelle opzioni, puoi abilitare il cambio automatico di equip quando cambi spec.

Oppure, puoi cliccare con il tasto destro sul pulsante sulla minimappa per cambiare equip e spec.

Oppure! Puoi usare i seguenti comandi:]]

L.GearTipCommands = 
[[/amr equip [1-4]
no arg = cycle]]
-- note to translators: the slash commands are literal and should stay as english


--[[----------------------------------------------------------------------
Import Dialog on Gear Tab
------------------------------------------------------------------------]]
L.ImportHeader = "Premi Ctrl+V (Cmd+V su un Mac) per incollare i dati dal sito nel box qui sotto."
L.ImportButtonOk = "Importa"
L.ImportButtonCancel = "Annulla"

L.ImportErrorEmpty = "La stringa dei dati è vuota."
L.ImportErrorFormat = "La stringa dei dati non è nel formato corretto."
L.ImportErrorVersion = "La stringa dei dati proviene da una vecchia versione dell'addon.  Per piacere, vai sul sito e generane una nuova."
L.ImportErrorChar = function(importChar, yourChar)
	return "La stringa dei dati è relativa a " .. importChar .. ", Ma tu sei " .. yourChar .. "!"
end
L.ImportErrorRace = "Sembra che la tua razza sia cambiata.  Vai sul sito e riottimizza."
L.ImportErrorFaction = "Sembra che la tua fazione sia cambiata.  Vai sul sito e riottimizza."
L.ImportErrorLevel = "Sembra che il tuo livello sia cambiato.  Vai sul sito e riottimizza."

L.ImportOverwolfWait = "Performing Best in Bags optimization.  Please do not press Escape or close the addon until it has completed!"


--[[----------------------------------------------------------------------
Shopping List
------------------------------------------------------------------------]]
L.ShopTitle = "Lista della spesa"
L.ShopEmpty = "La lista della spesa è vuota."
L.ShopSpecLabel = "Spec"
L.ShopHeaderGems = "Gemme"
L.ShopHeaderEnchants  = "Incantamenti"
L.ShopHeaderMaterials = "Materiale di Incantamento"


--[[----------------------------------------------------------------------
Combat Log Tab
------------------------------------------------------------------------]]
L.LogChatStart = "Stai registrando il combattimento, e Mr. Robot sta salvando i dati relativi ai componenti della tua incursione."
L.LogChatStop = "La registrazione del combattimento è stata interrotta."

L.LogChatWipe = function(wipeTime)
	return "Ricevuto comando WIPE alle " .. wipeTime .. "."
end
L.LogChatUndoWipe = function(wipeTime)
	return "Il comando WIPE ricevuto alle " .. wipeTime .. " è stato rimosso."
end
L.LogChatNoWipes = "Non c'è nessun comando WIPE da rimuovere."

L.LogButtonStartText = "Inizia Registrazione"
L.LogButtonStopText = "Ferma Registrazione"
L.LogButtonReloadText = "Ricarica IU"
L.LogButtonWipeText = "Wipe!"
L.LogButtonUndoWipeText = "Rimuovi Wipe"

L.LogNote = "Stai registrando il combattimento e i dati dell'equipaggiamento."
L.LogReloadNote = "Puoi uscire da wow completamente, oppure ricaricare la IU prima di caricare i file di log."
L.LogWipeNote = "La persona incaricata di caricare il log deve essere la stessa ad utilizzare il comando wipe."
L.LogWipeNote2 = function(cmd)
	return "'" .. cmd .. "' deve fare anche questo."
end
L.LogUndoWipeNote = "Ultimo wipe chiamato:"
L.LogUndoWipeDate = function(day, timeOfDay)
	return day .. " alle " .. timeOfDay
end

L.LogAutoTitle = "Auto-Logging"
L.LogAutoAllText = "Disabilita Tutto"

L.LogInstructionsTitle = "Istruzioni!"
L.LogInstructions = 
[[1.) Clicca su Inizia Registrazione o abilita Auto-Logging per le Incursioni desiderate.

2.) Quando sei pronto a fare l'upload, esci da World of Warcraft* oppure ricarica la IU.**

3.) Lancia il client di AMR per effettuare l'upload.


*Non è necessario uscire da Wow ma è altamente raccomandato. Questo permette al client di AMR di evitare che il tuo file diventi di dimensioni troppo grosse.

**L'addon di AMR colleziona dati relativi a tutti i giocatori nella tua incursione con l'addon AMR. Gli altri giocatori non devono abilitare la registrazione! Devono solo avere l'addon installato ed abilitato. Questi dati vengono salvati su disco solo se esci da Wow o ricarichi la IU prima di caricarli.
]]


--[[----------------------------------------------------------------------
Team Optimizer Tab
------------------------------------------------------------------------]]
L.TeamTabLeaderText = "Loot Ranker"
L.TeamTabMemberText = "Membro"

L.TeamSplashHeader = "Come uso di solito l'ottimizzatore di Incursione?"
L.TeamSplashLeaderLabel = "Sono la persona che usa askmrrobot.com per determinare il miglior utilizzatore per il bottino"
L.TeamSplashMemberLabel = "Qualcun'altro utilizza l'ottimizzatore per me"

L.TeamMemberText = "Rilassati, tutto è gestito dal master looter."
L.TeamMemberShowLootLabel = "Looting in progress!"
L.TeamMemberShowLoot = "Mostra finestra Bottino"

L.TeamButtonVersionText = "Verifica L'addon"
L.TeamButtonExportRosterText = "Esporta Lista"
L.TeamButtonExportLootText = "Esporta Bottino"
L.TeamButtonExportClose = "Chiudi"
L.TeamButtonImportRankingsText = "Importa Punteggi"
L.TeamButtonStartLootText = "Inizia Predazione"
L.TeamButtonResumeLootText = "Continua Predazione"

L.TeamExportVersionLabel = "L'ottimizzatore di Incursione è più accurato e facile da utilizzare se tutti nel tuo gruppo hanno installato l'addon di AskMrRobot."
L.TeamExportRosterLabel = "Fallo una volta all'inizio del raid per inizializzare l'addon sul web. Se qualcuno entra od esce dal tuo gruppo durante un'incursione, fallo di nuovo e premi 'Import without Reload' sul web per effettuare un aggiornamento rapido dei giocatori che sono cambiati."
L.TeamExportLootLabel = "Esporta tutti i drop dell'ultimo boss lootato ed inseriscili nella graduatoria sul web.  L'inserimento tiene conto automaticamente dei loot vinti dai boss precedenti o con un tiro bonus!"
L.TeamExportLootLabel2 = "Richiedere Master Loot"
L.TeamImportRankingsLabel = "Importa i punteggi da askmrrobot.com così da semplificarti la distribuzione del bottino in gioco."
L.TeamStartLootLabel = function(numItems)
	return numItems .. " oggetti sono stati importati."
end

L.TeamHistoryTitle = "Loot History"
L.TeamHistoryNoGroup = "Non sei in gruppo o in incursione."
L.TeamHistoryEmpty = "Nessun loot è ancora stato assegnato."

L.TeamVersionTitle = "Controlla Versione"
L.TeamVersionNoGroup = "Non sei in gruppo o in incursione."
L.TeamVersionGood = "Tutti nel tuo gruppo hanno l'addon!"
L.TeamVersionMissing = "NON INSTALLATO"
L.TeamVersionOld = "VERSIONE OBSOLETA"

L.TeamExportRosterLoading = "Gathering player data, please wait..."

L.TeamAlertNoGroup = "Non sei in un gruppo!"
L.TeamAlertNoLoot = "Non è stato lootato niente recentemente nel tuo gruppo o incursione!"

L.TeamExportHelp = "Premi Ctrl+C (o Cmd+C su un Mac) per copiatre il testo seguente."
L.TeamExportRosterText = "Quindi vai sul Team Optimizer sul sito ed incolla all'interno della roster import box."
L.TeamExportLootText = "Quindi vai sul Team Optimizer sul sito ed incolla all'interno della loot import box."
-- note to translators: leave "Team Optimizer" in english in the above two texts because our website is not localized yet

L.TeamImportRankingsHeader = "Premi Ctrl+V (Cmd+V su un Mac) per incollare i dati nella textbox."

L.TeamLootOptionNeed = "Need"
L.TeamLootOptionOff = "Off Spec"
L.TeamLootOptionGreed = "Greed"
L.TeamLootOptionPass = "Pass"
L.TeamLootOptionDisenchant = "Disenchant"


--[[----------------------------------------------------------------------
Loot Window
------------------------------------------------------------------------]]
L.LootTitle = "Loot!"
L.LootEmpty = " Non c'è nessun loot da gestire!"
L.LootHelpItems = "Per ogni drop..."
L.LootHelpRanks = "Scegli un opzione:"
L.LootHelpMaster = "Quindi master loota:"

L.LootIneligible = "Non sei eleggibile per questo Loot."

L.LootRankHeaderRank = "Rank"
L.LootRankHeaderScore = "Percentuale di Upgrade"
L.LootRankHeaderScoreDisenchant = "Giocatore"

-- note to translators: these column headers should be short, abbreviate if necessary, keep to 5 characters max
L.LootRankHeaderNeed = "Need"
L.LootRankHeaderOff = "Off"
L.LootRankHeaderGreed = "Greed"
L.LootRankHeaderPass = "Pass"
L.LootRankHeaderRoll = "Roll"

L.LootRankLabelOff = "off spec"
L.LootRankLabelDisenchant = "disenchanter"
L.LootRankLabelMasterLooter = "master looter"
L.LootRankLabelNoAddon = "addon non funzionante"

L.LootMasterRollText = "Roll"
L.LootMasterDisenchantText = "Disenchant/Sell"

L.LootMasterRollLabel = "/roll automatico per tutti"
L.LootMasterDisenchantLabel = "Clicca qui se nessuno vuole il loot"
L.LootMasterGiveLoot = "Dai Loot"
L.LootMasterGiveDisenchant = "Dai loot per Disenchant/Sell"

L.LootMasterGiveFail = "Questo item o il vincitore non possono esser trovati :("


--[[----------------------------------------------------------------------
Options Tab
------------------------------------------------------------------------]]
L.OptionsHeaderGeneral = "General Options"

L.OptionsHideMinimapName = "Nascondi icona della minimappa"
L.OptionsHideMinimapDesc = "L'icona della minimappa è per convenienza, tutte le azioni possono essere eseguite tramite comandi da tastiera o IU."

L.OptionsAutoGearName = "Equipaggia automaticamente al cambio spec"
L.OptionsAutoGearDesc = "Ogni volta che cambi spec (tramite l'interfaccia di gioco, addon o AMR.), i tuoi set importati su AMR saranno equipaggiati automaticamente."

L.OptionsShopAhName = "Mostra automaticamente la lista della spesa quando sei all'asta"
L.OptionsShopAhDesc = "Ogni volta che apri l'asta, mostra automaticamente la lista della spesa. Puoi cliccare sugli oggetti nella lista della spesa per cercarli velocemente all'asta."

L.OptionsUiScaleName = "Ask Mr. Robot dimensione IU"
L.OptionsUiScaleDesc = "Inserisci un valore tra 0.5 e 1.5 per cambiare la dimensione del l'interfaccia di Ask Mr. Robot, premi Invio, quindi chiudi e riapri la finestra. se non riesci ad interagire con la finestra, usa il comando /amr reset."

end
