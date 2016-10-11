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
local L = LibStub("AceLocale-3.0"):NewLocale("AskMrRobot", "ruRU", false)

if L then


--[[----------------------------------------------------------------------
General
------------------------------------------------------------------------]]

L.SpecsShort = {
	[1] = "Кровь", -- DeathKnightBlood
    [2] = "Лёд", -- DeathKnightFrost
    [3] = "Нечестивость", -- DeathKnightUnholy
	[4] = "Сокрушение", -- DemonHunterHavoc
	[5] = "Месть", -- DemonHunterVengeance
    [6] = "Сова", -- DruidBalance
    [7] = "Кот", -- DruidFeral
    [8] = "Медведь", -- DruidGuardian
    [9] = "Дерево", -- DruidRestoration
    [10] = "БМ", -- HunterBeastMastery
    [11] = "Стрельба", -- HunterMarksmanship
    [12] = "Выживание", -- HunterSurvival
    [13] = "Тайная Магия", -- MageArcane
    [14] = "Огонь", -- MageFire
    [15] = "Лёд", -- MageFrost
    [16] = "Хмелевар", -- MonkBrewmaster
    [17] = "ТТ", -- MonkMistweaver
    [18] = "Танцующий с ветром", -- MonkWindwalker
    [19] = "Свет", -- PaladinHoly
    [20] = "Защита", -- PaladinProtection
    [21] = "Воздояние", -- PaladinRetribution
    [22] = "Послушание", -- PriestDiscipline
    [23] = "Свет", -- PriestHoly
    [24] = "Тьма", -- PriestShadow
    [25] = "Ликвидация", -- RogueAssassination
    [26] = "Головорез", -- RogueOutlaw
    [27] = "Скрытность", -- RogueSubtlety
    [28] = "Стихии", -- ShamanElemental
    [29] = "Энх", -- ShamanEnhancement
    [30] = "Исцеление", -- ShamanRestoration
    [31] = "Колдовство", -- WarlockAffliction
    [32] = "Демонология", -- WarlockDemonology
    [33] = "Разрушение", -- WarlockDestruction
    [34] = "Оружие", -- WarriorArms
    [35] = "Фури", -- WarriorFury
    [36] = "Защита", -- WarriorProtection
}

-- stat strings for e.g. displaying gem/enchant abbreviations, make as short as possible without being confusing/ambiguous
L.StatsShort = {
    ["Strength"] = "Сила",
    ["Agility"] = "Аги",
    ["Intellect"] = "Инта",
    ["CriticalStrike"] = "Крит",
    ["Haste"] = "Скорость",
    ["Mastery"] = "Искусность",
    ["Multistrike"] = "Мульти",
    ["Versatility"] = "Универс",
    ["BonusArmor"] = "Бонус брони",
    ["Spirit"] = "Дух",
    ["Dodge"] = "Уклон",
    ["Parry"] = "Пари",
    ["MovementSpeed"] = "Скор. перед.",
    ["Avoidance"] = "Избегание",
    ["Stamina"] = "Вынос",
    ["Armor"] = "Броня",
    ["AttackPower"] = "СА",
    ["SpellPower"] = "СЗ",
    ["PvpResilience"] = "PvP Устойчивость",
    ["PvpPower"] = "PvP Сила",
}

L.InstanceNames = {
	[1520] = "Emerald Nightmare",
	[1530] = "Nighthold"
}

L.DifficultyNames = {
	[17] = "ЛФР",
	[14] = "Нормал",
	[15] = "Героический",
	[16] = "Мифический"
}

L.WeaponTypes = {
	None     = "Нет",
	Axe      = "Топор",
	Mace     = "Дробящее",
	Sword    = "Меч",
	Fist     = "Кистевое",
	Dagger   = "Кинжал",
	Staff    = "Посох",
	Polearm  = "Древковое",
	OffHand  = "Левая Рука",
	Shield   = "Щит",
	Wand     = "Жезл",
	Bow      = "Лук",
	Gun      = "Огнестрельное",
	Crossbow = "Арбалет",
	Warglaive= "Боевые клинки"
}

L.ArmorTypes = {
	None    = "Нет",
	Plate   = "Латы",
	Mail    = "Кольчуга",
	Leather = "Кожа",
	Cloth   = "Ткань"
}

L.OneHand = "Одноручное"
L.TwoHand = "Двуручное"
L.OffHand = "Левая Рука"


--[[----------------------------------------------------------------------
Main UI
------------------------------------------------------------------------]]
L.AlertOk = "OK"
L.CoverCancel = "отмена"

L.MinimapTooltip = 
[[Левый клик для открытия окна Ask Mr. Robot.

Правый клик для смены спека и экипирования актуальных предметов.

Ctrl + ЛКМ отметить бой как вайп.]]

L.MainStatusText = function(version, url)
	return version .. " загружен. Инструкции доступны на " .. url
end

L.TabExportText = "Экспорт"
L.TabGearText = "Экипировка"
L.TabLogText = "Логи"
L.TabTeamText = "Оптимизатор"
L.TabOptionsText = "Опции"

L.VersionChatTitle = "AMR Addon Version:"
L.VersionChatNotInstalled = "НЕ УСТАНОВЛЕН"
L.VersionChatNotGrouped = "Вы находитесь вне группы или рейда!"


--[[----------------------------------------------------------------------
Export Tab
------------------------------------------------------------------------]]
L.ExportTitle = "Инструкции Экспорта"
L.ExportHelp1 = "1. Скопируйте текст ниже нажав Ctrl+C (или Cmd+C на Mac)"
L.ExportHelp2 = "2. Перейдите на http://www.askmrrobot.com/wow/player и выберете своего персонажа"
L.ExportHelp3 = "3. Вставьте это в тектовое поле в разделее ADDON"

L.ExportSplashTitle = "Начало работы"
L.ExportSplashSubtitle = "Это Ваше первое использование данного аддона. Выполните следующее шаги для инициализации Ваших предметов:"
L.ExportSplash1 = "1. Активируйте каждый спек и оденьте последнюю экипировку для каждого спека"
L.ExportSplash2 = "2. Оденьте и откройте ваш Артифакт для каждого спека"
L.ExportSplash3 = "3. Откройте Ваш банк и оставьте его открытым по крайней мере на пару секунд"
L.ExportSplash4 = "4. Если вы имеете предметы экпировки, которые находятся у Вас в Хранилище бездны, то откройте его и оставьте его открытым по крайней мере на пару секунд"
L.ExportSplashClose = "Продолжить"


--[[----------------------------------------------------------------------
Gear Tab
------------------------------------------------------------------------]]
L.GearImportNote = "Нажмите на Импорт, и вставьте туда даные с сайта."
L.GearBlank = "Пока что вы ничего не загружали для этого спека."
L.GearBlank2 = "Перейдите на askmrrobot.com для оптимизации Вашей экипировки, используя кнопку Импорт левее."
L.GearButtonEquip = function(spec)
	return string.format("Активировать %s спек и одеть экипировку", spec)
end
L.GearButtonShop = "Показать список покупок"

L.GearEquipErrorCombat = "Вы не можете сменить спек/экипировку в бою!"
L.GearEquipErrorEmpty = "Нет сохраненной экипировки для этого спека."
L.GearEquipErrorNotFound = "Предметы, сохраненные у Вас в экипировке не могут быть одеты."
L.GearEquipErrorNotFound2 = "Попробуйте открыть банк и запустить команду заново, или проверьте Ваше Хранилище бездны."
L.GearEquipErrorBagFull = "У Вас не хватает места в сумках, чтобы мы могли Вас переодеть."
L.GearEquipErrorSoulbound = function(itemLink)
	return itemLink .. " не может быть одет, так как он является не персональным."
end

L.GearButtonImportText = "Импорт"
L.GearButtonCleanText = "Очистить сумки"

L.GearTipTitle = "Совет!"
L.GearTipText = 
[[В Опциях, вы можете включить автоматическое экипирование при смене спека.

Или вы можете сменить спек и надеть эквип нажав ПКМ по иконке на миникарте.

ИЛИ! Вы можете использовать слеш команды:]]

L.GearTipCommands = 
[[/amr equip [1-4]
без аргументов = циклично]]
-- note to translators: the slash commands are literal and should stay as english


--[[----------------------------------------------------------------------
Import Dialog on Gear Tab
------------------------------------------------------------------------]]
L.ImportHeader = "Нажмите Ctrl+V (Cmd+V на Mac), чтобы вставить данные с сайта в поле ниже."
L.ImportButtonOk = "Импорт"
L.ImportButtonCancel = "Отмена"

L.ImportErrorEmpty = "Строка данных пуста."
L.ImportErrorFormat = "Данные находятся в неверном формате."
L.ImportErrorVersion = "Эта строка для старой версии аддона.  Пожалуйста, перейдите на сайт, и попробуйте ещё раз."
L.ImportErrorChar = function(importChar, yourChar)
	return "Эти данные для персонажа " .. importChar .. ", а вы " .. yourChar .. ", не хорошо себя выдавать за других людей!"
end
L.ImportErrorRace = "Похоже, что Вы изменили расу. Пожалуйста, посетите снова сайт и заново сделайте оптимизацию."
L.ImportErrorFaction = "Похоже, что Вы изменили фракцию. Пожалуйста, посетите снова сайт и заново сделайте оптимизацию."
L.ImportErrorLevel = "Похоже, что у Вас изменился уровень.  Пожалуйста, посетите снова сайт и заново сделайте оптимизацию."

L.ImportOverwolfWait = "Выполняется оптимизация BestInBag.  Пожалуйста не нажимайте Esc и не закрывайте аддон пока операция не будет завершена!"


--[[----------------------------------------------------------------------
Shopping List
------------------------------------------------------------------------]]
L.ShopTitle = "Список покупок"
L.ShopEmpty = "Здесь нет списка покупок для этого игрока."
L.ShopSpecLabel = "Спек"
L.ShopHeaderGems = "Камни"
L.ShopHeaderEnchants  = "Чары"
L.ShopHeaderMaterials = "Материалы для чар"


--[[----------------------------------------------------------------------
Combat Log Tab
------------------------------------------------------------------------]]
L.LogChatStart = "Сейчас вы записываете бой, и Mr. Robot записывает данные о персонажах в бою."
L.LogChatStop = "Запись боя остановлена."

L.LogChatWipe = function(wipeTime)
	return "Последний указанный Вайп был в " .. wipeTime .. "."
end
L.LogChatUndoWipe = function(wipeTime)
	return "Вайп в " .. wipeTime .. " был удален."
end
L.LogChatNoWipes = "У Вас нет указанных Вами вайпов для удаления."

L.LogButtonStartText = "Начать запись"
L.LogButtonStopText = "Остановить запись"
L.LogButtonReloadText = "Перезагрузить UI"
L.LogButtonWipeText = "ВАЙП!!"
L.LogButtonUndoWipeText = "Отменить Wipe"

L.LogNote = "В настоящее время ведется запись боев и данных персонажей."
L.LogReloadNote = "Перед загрузкой логов, всегда перезагружайте интерфейс или выйдите из WoW."
L.LogWipeNote = "Человек записывающий логи, единственный кто использует команду Вайп."
L.LogWipeNote2 = function(cmd)
	return "'" .. cmd .. "' будет делать так же."
end
L.LogUndoWipeNote = "Последний вайп был:"
L.LogUndoWipeDate = function(day, timeOfDay)
	return day .. " в " .. timeOfDay
end

L.LogAutoTitle = "Автоматическое ведение журнала"
L.LogAutoAllText = "Выбрать всё"

L.LogInstructionsTitle = "Инструкции!"
L.LogInstructions = 
[[1.) Нажмите Начать запись или включить Автоматическое ведение журнала для нужных рейдов.

2.) Если вы закончили, и готовы загрузить логи, выйдите из World of Warcraft* или перезагрузите интерфейс.**

3.) Запустите AMR Client чтобы загрузить Ваши логи.


*Не обязательно выходить из WoW, но очень рекомендуется. Это позволит клиенту AskMrRobot не допустить очень большого размера файла логов.

**AMR собирает дополнительные данные для всех игроков в рейде кто использует AskMrRobot. Другим игрокам включать запись логов не нужно! Аддон должен быть просто установлен и включен. Эти данные сохраняются только на диске, после того как вы выйдите из WoW или перезагрузите интерфейс.
]]


--[[----------------------------------------------------------------------
Team Optimizer Tab
------------------------------------------------------------------------]]
L.TeamTabLeaderText = "Распределить добычу"
L.TeamTabMemberText = "Команда"

L.TeamSplashHeader = "Как вы планируете использовать Team Optimizer?"
L.TeamSplashLeaderLabel = "Я тот, кто использует AskMrRobot для распределения добычи в рейде"
L.TeamSplashMemberLabel = "Пускай другие используют Team Optimizer за меня"

L.TeamMemberText = "Всё, бобер, выдыхай. Просто сядь и расслабься, все будет сделано Вашим лидером."
L.TeamMemberShowLootLabel = "Распределние добычи в процессе!"
L.TeamMemberShowLoot = "Показать окно добычи"

L.TeamButtonVersionText = "Наличии аддона"
L.TeamButtonExportRosterText = "Экспорт ростера"
L.TeamButtonExportLootText = "Экспорт добычи"
L.TeamButtonExportClose = "Закрыть"
L.TeamButtonImportRankingsText = "Импорт Ранкинга"
L.TeamButtonStartLootText = "Начать распределение"
L.TeamButtonResumeLootText = "Продолжить распределять"

L.TeamExportVersionLabel = "Team Optimizer является более точным и простыв в использовании если у всех в группе есть аддон AskMrRobot."
L.TeamExportRosterLabel = "Сделайте это один раз в начале рейда для инициализации ростера в Team Optimizer на сайте. Если кто-то присоединяется или уходит из рейда во время РТ, сделайте тоже самое, только нажмите 'Import without Reload' на сайте, для быстрого обновления игроков который поменялись."
L.TeamExportLootLabel = "Экспорт всего лута с последнего убитого босса на сайт AskMrRobot для дальнейшей работы с ним. Rankings automatically account for loot won on previous bosses or bonus rolls!"
L.TeamExportLootLabel2 = "Требуется Мастер Лут"
L.TeamImportRankingsLabel = "Импорт данных лута с сайта askmrrobot.com чтобы вы могли просматривать и легко распределять добычу в рейде."
L.TeamStartLootLabel = function(numItems)
	return numItems .. " предметов было импортировано."
end

L.TeamHistoryTitle = "История добычи"
L.TeamHistoryNoGroup = "Вы находитесь вне группы или рейда."
L.TeamHistoryEmpty = "Добыча ещё не была распределена."

L.TeamVersionTitle = "Проверка версий"
L.TeamVersionNoGroup = "Вы находитесь вне группы или рейда."
L.TeamVersionGood = "У всех участников группы/рейда установлен аддон!"
L.TeamVersionMissing = "НЕ УСТАНОВЛЕН"
L.TeamVersionOld = "УСТАРЕВШИЙ"

L.TeamExportRosterLoading = "Собираем Ваших рейдеров по крупице, пожалуйста подождите..."

L.TeamAlertNoGroup = "Вы находитесь без группы!"
L.TeamAlertNoLoot = "В последнее время с помощью мастер лута нечего не было распределено!"

L.TeamExportHelp = "Нажмите Ctrl+C (или Cmd+C на Mac) чтобы скопировать текст ниже."
L.TeamExportRosterText = "Далее идете на сайт, вкладка Team Optimizer, и вставляете в поле во вкладке Roster."
L.TeamExportLootText = "Далее переходите во вкладке Team Optimizer на Rank Items и вставляете так же туда Лут."
-- note to translators: leave "Team Optimizer" in english in the above two texts because our website is not localized yet

L.TeamImportRankingsHeader = "Нажмите Ctrl+V (Cmd+V на Mac) чтобы вставить данные с сайта в поле ниже."

L.TeamLootOptionNeed = "Нужно"
L.TeamLootOptionOff = "Офф спек"
L.TeamLootOptionGreed = "Продать"
L.TeamLootOptionPass = "Пропуск"
L.TeamLootOptionDisenchant = "Распылить"


--[[----------------------------------------------------------------------
Loot Window
------------------------------------------------------------------------]]
L.LootTitle = "Лут!"
L.LootEmpty = "Здесь нет лута для раздачи прямо сейчас!"
L.LootHelpItems = "For each drop..."
L.LootHelpRanks = "Выберите опцию:"
L.LootHelpMaster = "Мастер лут:"

L.LootIneligible = "У Вас нет прав на этот предмет."

L.LootRankHeaderRank = "Ранг"
L.LootRankHeaderScore = "Процент улучшения"
L.LootRankHeaderScoreDisenchant = "Игрок"

-- note to translators: these column headers should be short, abbreviate if necessary, keep to 5 characters max
L.LootRankHeaderNeed = "Нужно"
L.LootRankHeaderOff = "Офф"
L.LootRankHeaderGreed = "Продать"
L.LootRankHeaderPass = "Пас"
L.LootRankHeaderRoll = "Ролл"

L.LootRankLabelOff = "офф спек"
L.LootRankLabelDisenchant = "дизинчантер"
L.LootRankLabelMasterLooter = "Мастер лутер"
L.LootRankLabelNoAddon = "АДДОН НЕ УСТАНОВЛЕН"

L.LootMasterRollText = "Ролл"
L.LootMasterDisenchantText = "Распылить/Продать"

L.LootMasterRollLabel = "автоматически делает /roll за всех"
L.LootMasterDisenchantLabel = "выберете это, если предмет никому не нужен"
L.LootMasterGiveLoot = "Отдать"
L.LootMasterGiveDisenchant = "Отдать на Распыл/Продажу"

L.LootMasterGiveFail = "Этот предмет или выбранный игрок не найден :("


--[[----------------------------------------------------------------------
Options Tab
------------------------------------------------------------------------]]
L.OptionsHeaderGeneral = "Основные настройки"

L.OptionsHideMinimapName = "Скрыть значок у миникарты"
L.OptionsHideMinimapDesc = "Значок около миникарты создан для удобства, все действия Вы также можете выполнить с помощью косой команды или пользовательского интерфейса."

L.OptionsAutoGearName = "Автоматически одевать экипировку при смене спека"
L.OptionsAutoGearDesc = "Если вы смените спек (посредством игрового меню, другого аддона, и т.д.), Ваши загруженные наборы (вкладка Экипировка) будут автоматически экипированы."

L.OptionsShopAhName = "Автоматически показывать список покупок при открытии аукциона"
L.OptionsShopAhDesc = "При открытии окна аукциона, автоматически показывать список покупок.  Вы можете кликнуть по предмету в списке покупок для быстрого поиска на аукционе."

L.OptionsUiScaleName = "Ask Mr. Robot масштаб UI"
L.OptionsUiScaleDesc = "Введите занчение от 0.5 до 1.5 для изменения масштаба интерфейса Ask Mr. Robot, нажмите Enter, откройте/закройте окно для достижения эффекта. Если вдруг у Вас сбилось позиционирование, используйте команду /amr reset."

end
