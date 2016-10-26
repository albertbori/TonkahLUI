local L = LibStub( "AceLocale-3.0" ):NewLocale( "ArkInventory", "ruRU" )
if not L then return end

-- post updated translations at http://groups.google.com/group/wow-arkinventory (modify this file and include as an attachment)
-- note: when creating a new locale do not leave any english translations in your file, comment them out by placing -- at the start of the line


-- Translated by: Anton P. Mukhin aka McFLY











--	wow zone names - must match exactly what is in game
	L["WOW_ZONE_AHNQIRAJ"] = "Ан'Кираж"
	L["WOW_ZONE_VASHJIR"] = "Вайш'ир"
	L["WOW_ZONE_KELPTHAR_FOREST"] = "Лес Келп’тар"
	L["WOW_ZONE_SHIMMERING_EXPANSE"] = "Мерцающий простор"
	L["WOW_ZONE_ABYSSAL_DEPTHS"] = "Бездонные глубины"
	
	
--	wow tooltip text - must match exactly what is in game
	L["WOW_ITEM_TOOLTIP_FOOD"] = "Действие эффекта прерывается, если персонаж встает с места"
	L["WOW_ITEM_TOOLTIP_DRINK"] = "Действие эффекта прерывается, если персонаж встает с места"
	L["WOW_ITEM_TOOLTIP_POTION_HEAL"] = "Восполнение %d+ - %d+ ед. здоровья"
	L["WOW_ITEM_TOOLTIP_POTION_MANA"] = "Восполнение %d+ - %d+ ед. маны"
	L["WOW_ITEM_TOOLTIP_ELIXIR_BATTLE"] = "Боевой эликсир"
	L["WOW_ITEM_TOOLTIP_ELIXIR_GUARDIAN"] = "Охранный эликсир"
	
	
--	location names
--	L["LOCATION_ACCOUNT"] = ""
	L["LOCATION_WEARING"] = "Одето"
	
	
--	subframe names
	L["SUBFRAME_NAME_TITLE"] = "Заголовочный"
	L["SUBFRAME_NAME_BAGCHANGER"] = "Сумки"
	
	
--	status bar/bag text
	L["STATUS_NO_DATA"] = "???"
	L["STATUS_PURCHASE"] = "КУП"
	
	
--	restack
	L["RESTACK"] = "Сжать и собрать"
	L["RESTACK_TEXT"] = "собрать предметы в как можно меньшее количество стэков, используя по возможности слоты специальных сумок"
	L["RESTACK_FAIL_WAIT"] = "Операция пересборки уже выполняется, пожалуйста подождите"
	L["RESTACK_FAIL_ACCESS"] = "У вас недостаточно прав, чтобы пересобрать закладку %2$s в %1$s" -- 1 = guild bank, 2 = tab number
--	L["RESTACK_FAIL_CLOSED"] = ""
--	L["RESTACK_TYPE"] = ""
--	L["RESTACK_CLEANUP_DEPOSIT"] = ""
--	L["RESTACK_TOPUP_FROM_BAGS"] = ""
--	L["RESTACK_TOPUP_FROM_BAGS_TEXT"] = ""
--	L["RESTACK_FILL_FROM_BAGS_TEXT"] = ""
	
	
--	vault tab tooltips
--	L["VAULT_TAB_ACCESS_NONE"] = ""
--	L["VAULT_TAB_NAME"] = ""
--	L["VAULT_TAB_ACCESS"] = ""
--	L["VAULT_TAB_REMAINING_WITHDRAWALS"] = ""
	
	
--	system category descriptions
	L["CATEGORY_SYSTEM_CORE_MATS"] = "Материалы"
	
	
--	consumable category descriptions
	L["CATEGORY_CONSUMABLE_FOOD_PET"] = "Еда (питомцев)"
	L["CATEGORY_CONSUMABLE_POTION_HEAL"] = "Здоровье (зелье/камень)"
	L["CATEGORY_CONSUMABLE_POTION_MANA"] = "Мана (зелье/камень)"
	L["CATEGORY_CONSUMABLE_ELIXIR_BATTLE"] = "Эликсир (боевой)"
	L["CATEGORY_CONSUMABLE_ELIXIR_GUARDIAN"] = "Эликсир (охранный)"
	
	
--	bag names - used to name the empty slots in the status frame
	L["STATUS_SHORTNAME_BAG"] = "Сумка"
--	L["STATUS_SHORTNAME_COOKING"] = ""
--	L["STATUS_SHORTNAME_CRITTER"] = ""
	L["STATUS_SHORTNAME_ENCHANTING"] = "Чары"
	L["STATUS_SHORTNAME_ENGINEERING"] = "Инжен"
--	L["STATUS_SHORTNAME_GEAR"] = ""
	L["STATUS_SHORTNAME_GEM"] = "Ювел"
--	L["STATUS_SHORTNAME_HEIRLOOM"] = ""
	L["STATUS_SHORTNAME_HERB"] = "Трава"
	L["STATUS_SHORTNAME_INSCRIPTION"] = "Начер"
	L["STATUS_SHORTNAME_KEY"] = "Ключ"
	L["STATUS_SHORTNAME_LEATHERWORKING"] = "Кожа"
	L["STATUS_SHORTNAME_MAIL"] = "Почта"
	L["STATUS_SHORTNAME_MINING"] = "Руда"
--	L["STATUS_SHORTNAME_MOUNT"] = ""
--	L["STATUS_SHORTNAME_REAGENTBANK"] = ""
--	L["STATUS_SHORTNAME_TACKLE"] = ""
--	L["STATUS_SHORTNAME_TOKEN"] = ""
--	L["STATUS_SHORTNAME_TOY"] = ""
	
	
--	main menu
	L["MENU"] = "Меню"
	
	L["MENU_CHARACTER_SWITCH"] = "Сменить персонажа"
	L["MENU_CHARACTER_SWITCH_TEXT"] = "Изменяет, вещи какого персонажа отображать"
	L["MENU_CHARACTER_SWITCH_CHOOSE_NONE"] = "нет данных о персонажах"
	L["MENU_CHARACTER_SWITCH_CHOOSE_TEXT"] = "Изменяет отображаемые данные на %1$s"
	L["MENU_CHARACTER_SWITCH_ERASE"] = "Удалить данные %s"
	L["MENU_CHARACTER_SWITCH_ERASE_TEXT"] = "Удаляет данные %1$s для %2$s"
	
	L["MENU_LOCATION_SWITCH"] = "Отобразить окно"
	L["MENU_LOCATION_SWITCH_TEXT"] = "отображает или скрывает окно %1$s"
	
	
--	actions menu
	L["MENU_ACTION"] = "Действия"
	L["MENU_ACTION_REFRESH_TEXT"] = "обновляет окно"
--	L["MENU_ACTION_REFRESH_CLEAR_CACHE"] = ""
--	L["MENU_ACTION_REFRESH_CLEAR_CACHE_TEXT"] = ""
	L["MENU_ACTION_RELOAD_TEXT"] = "перезагрузить окно. Используйти это действие, когда вы меняете сеты аутфита"
	L["MENU_ACTION_EDITMODE"] = "Режим редактирования"
	L["MENU_ACTION_EDITMODE_TEXT"] = "включает и выключает режим редактирования для изменения настроек наборов ячеек."
	L["MENU_ACTION_BAGCHANGER"] = "Сумки"
	L["MENU_ACTION_BAGCHANGER_TEXT"] = "показать/скрыть фрейм сумок, в котором Вы можете добавлять или менять сумки"
	
	
--	item menu
	L["MENU_ITEM_TITLE"] = "Информация о предмете"
	L["MENU_ITEM_ITEM"] = "Предмет"
	L["MENU_ITEM_DEFAULT_RESET"] = "Назначить по умолчанию"
	L["MENU_ITEM_DEFAULT_RESET_TEXT"] = "Установить категории по умолчанию для этого предмета (не сбрасывает правила)"
	L["MENU_ITEM_ASSIGN_CHOICES"] = "Применяемые категории"
	L["MENU_ITEM_ASSIGN_THIS"] = "Применить категорию"
	L["MENU_ITEM_ASSIGN_THIS_TEXT"] = "Назначить этот предмет в особую категорию"
	L["MENU_ITEM_RULE_NEW"] = "Создать новое правило"
	L["MENU_ITEM_RULE_ADD"] = "Добавить предмет в правило"
	L["MENU_ITEM_CUSTOM_NEW"] = "Создать новую пользовательскую категорию"
	L["MENU_ITEM_DEBUG"] = "Отладочная информация"
	L["MENU_ITEM_DEBUG_BAG"] = "Сумка"
	L["MENU_ITEM_DEBUG_SLOT"] = "Ячейка"
	L["MENU_ITEM_DEBUG_BAG_TYPE"] = "Тип"
--	L["MENU_ITEM_DEBUG_PET_ID"] = ""
--	L["MENU_ITEM_DEBUG_PET_SPECIES"] = ""
	L["MENU_ITEM_DEBUG_AI_ID_SHORT"] = "Короткий ID"
	L["MENU_ITEM_DEBUG_CACHE"] = "ID кэша"
--	L["MENU_ITEM_DEBUG_AI_ID_RULE"] = ""
	L["MENU_ITEM_DEBUG_AI_ID_CATEGORY"] = "Категория AI"
	L["MENU_ITEM_DEBUG_LVL_ITEM"] = "Уровень предмета (парам)"
	L["MENU_ITEM_DEBUG_LVL_USE"] = "Уровень предмета (исп)"
	L["MENU_ITEM_DEBUG_TYPE"] = "Тип"
	L["MENU_ITEM_DEBUG_SUBTYPE"] = "Подтип"
	L["MENU_ITEM_DEBUG_EQUIP"] = "Расположение"
--	L["MENU_ITEM_DEBUG_ID"] = ""
	L["MENU_ITEM_DEBUG_FAMILY"] = "Семейство"
	L["MENU_ITEM_DEBUG_PT"] = "PT Сеты"
	L["MENU_ITEM_DEBUG_PT_TEXT"] = "Показывает в каких PT сетах находится этот предмет"
	L["MENU_ITEM_DEBUG_PT_NONE"] = "этот предмет не состоит ни в одном PT сете"
	L["MENU_ITEM_DEBUG_PT_TITLE"] = "PT сеты, в которых есть этот предмет"
--	L["MENU_ITEM_DEBUG_SOURCE"] = ""
--	L["MENU_ITEM_DEBUG_BONUS"] = ""
--	L["MENU_ITEM_DEBUG_ITEMSTRING"] = ""
	
	
--	bar menu
	L["MENU_BAR_TITLE"] = "Настройки набора %1$s"
	L["MENU_BAR_CATEGORY_TEXT"] = "Закрепить категорию %1$s за этим набором"
	L["MENU_BAR_CATEGORY_CURRENT"] = "текущее назначение"
	L["MENU_BAR_CATEGORY_ASSIGN"] = "Возможные Категории"
	L["MENU_BAR_CATEGORY_REMOVE_TEXT"] = "клик для удаления %1$s из набора %2$s и возврата в набор по умолчанию" -- 1 is the category name, 2 is the bar number
	L["MENU_BAR_CATEGORY_HIDDEN_TEXT"] = "клик для назначения данной категории статуса скрытой.\n\nпредметы в скрытых категориях не будут видны в обычном режиме."
--	L["MENU_BAR_CATEGORY_MOVE_START_TEXT"] = ""
--	L["MENU_BAR_CATEGORY_MOVE_COMPLETE_TEXT"] = ""
--	L["MENU_BAR_CATEGORY_ENABLE_TEXT"] = ""
--	L["MENU_BAR_CATEGORY_DISABLE_TEXT"] = ""
--	L["MENU_BAR_BAG_ASSIGN_TEXT"] = ""
	L["MENU_BAR_OPTIONS"] = "Настройки полос"
	L["MENU_BAR_RESET_TEXT"] = "убирает все категории, закрепленные за этим набором, за исключением категории по умолчанию."
	L["MENU_BAR_INSERT_TEXT"] = "добавить пустой набор ячеек сюда, сдвигая все категории на один набор вверх."
	L["MENU_BAR_DELETE_TEXT"] = "перемещает все категории, закрепленные за этим набором в их наборы по умолчанию и сдвигает все категории над этим набором на 1 набор вниз.\n\nЕсли категория по умолчанию находится в этом наборе, то она будет закреплена за набором 1"
--	L["MENU_BAR_MOVE_START_TEXT"] = ""
--	L["MENU_BAR_MOVE_COMPLETE_TEXT"] = ""
--	L["MENU_BAR_MOVE_FAIL_OUTSIDE"] = ""
--	L["MENU_BAR_MOVE_FAIL_SAME"] = ""
--	L["MENU_BAR_SORTKEY_TEXT"] = ""
--	L["MENU_BAR_SORTKEY_DEFAULT_RESET_TEXT"] = ""
--	L["MENU_BAR_COLOUR_BACKGROUND_DEFAULT_TEXT"] = ""
--	L["MENU_BAR_COLOUR_BACKGROUND_CUSTOM_TEXT"] = ""
--	L["MENU_BAR_COLOUR_BACKGROUND_TEXT"] = ""
--	L["MENU_BAR_COLOUR_NAME_DEFAULT_TEXT"] = ""
--	L["MENU_BAR_COLOUR_NAME_CUSTOM_TEXT"] = ""
--	L["MENU_BAR_COLOUR_NAME_TEXT"] = ""
--	L["MENU_LOCKED_TEXT"] = ""
	
	
--	changer bag menu
	L["MENU_BAG_TITLE"] = "Настройки сумки"
	L["MENU_BAG_SHOW"] = "Показывать"
	L["MENU_BAG_SHOW_TEXT"] = "показывать содержимое этой сумки"
	L["MENU_BAG_ISOLATE"] = "Изолировать"
	L["MENU_BAG_ISOLATE_TEXT"] = "показывать содержимое только этой сумки"
	L["MENU_BAG_SHOWALL"] = "Показывать всё"
	L["MENU_BAG_SHOWALL_TEXT"] = "показывать содержимое всех сумок в этом окне"
--	L["MENU_BAG_EMPTY_TEXT"] = ""
	
	
--	configuration options
	L["CONFIG"] = "Опции"
	L["CONFIG_TEXT"] = "Меню опций"
	
--	configuration options > system
	L["CONFIG_SYSTEM_TEXT"] = "Системные опции"
	
	L["CONFIG_SYSTEM_FONT_TEXT"] = "задает шрифт для %s"
	
--	L["CONFIG_SYSTEM_FRAMESTRATA"] = ""
--	L["CONFIG_SYSTEM_FRAMESTRATA_TEXT"] = ""
--	L["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_LOW"] = ""
--	L["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_MEDIUM"] = ""
--	L["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_HIGH"] = ""
	
--	L["CONFIG_SYSTEM_REPOSITION_ONSHOW"] = ""
--	L["CONFIG_SYSTEM_REPOSITION_ONSHOW_TEXT"] = ""
	
--	L["CONFIG_SORTING_WHEN"] = ""
--	L["CONFIG_SORTING_WHEN_TEXT"] = ""
--	L["CONFIG_SORTING_WHEN_INSTANT"] = ""
--	L["CONFIG_SORTING_WHEN_INSTANT_TEXT"] = ""
--	L["CONFIG_SORTING_WHEN_OPEN"] = ""
--	L["CONFIG_SORTING_WHEN_OPEN_TEXT"] = ""
--	L["CONFIG_SORTING_WHEN_MANUAL"] = ""
--	L["CONFIG_SORTING_WHEN_MANUAL_TEXT"] = ""
	
	L["CONFIG_SYSTEM_TOOLTIP"] = "Тултипы"
	L["CONFIG_SYSTEM_TOOLTIP_ENABLE_TEXT"] = "включить тултипы"
	L["CONFIG_SYSTEM_TOOLTIP_EMPTY_ADD"] = "Пустая строка"
	L["CONFIG_SYSTEM_TOOLTIP_EMPTY_ADD_TEXT"] = "Показывать пустую строку между основным текстом окошка и любым другим текстов"
	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_ADD"] = "Показывать количество предметов"
	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_ADD_TEXT"] = "показывать ли количество предметов в тултипе?"
	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_COLOUR_TEXT"] = "задает цвет текста для количества предметов."
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_VAULT_TABS"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_VAULT_TABS_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_SCALE_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_CLASSCOLOUR_TEXT"] = ""
	L["CONFIG_SYSTEM_TOOLTIP_SELF_ONLY"] = "Только у себя"
	L["CONFIG_SYSTEM_TOOLTIP_SELF_ONLY_TEXT"] = "Показывать количество предметов только для текущего персонажа"
--	L["CONFIG_SYSTEM_TOOLTIP_HIGHLIGHT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_HIGHLIGHT_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_FACTION_ONLY"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_FACTION_ONLY_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_REALM_ONLY"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_REALM_ONLY_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_CROSSREALM"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_CROSSREALM_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_VAULT_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_SOURCE_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_DESCRIPTION_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_CUSTOM_ENABLE_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_MOUSEOVER_ENABLE_TEXT"] = ""
	
--	L["CONFIG_SYSTEM_WORKAROUND"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_TEXT"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_TEXT"] = ""
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_TEXT"] = "изменяет как будут показаны сообщения о багфиксах"
--	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE0"] = ""
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE0_TEXT"] = "отключает сообщения о багфиксах"
--	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE1"] = ""
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE1_TEXT"] = "показывать сокращённую версию сообщений о багфиксах"
--	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE2"] = ""
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE2_TEXT"] = "показывать полную версию сообщений о багфиксах"
--	L["CONFIG_SYSTEM_WORKAROUND_ZEROSIZEBAG"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_ZEROSIZEBAG_TEXT"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_ZEROSIZEBAG_ALERT_TEXT"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_COMBAT_YIELD"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_COMBAT_YIELD_ENABLED_TEXT"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_COMBAT_YIELD_COUNT_TEXT"] = ""
--	L["BUGFIX_TAINTED_ALERT_MOUSEOVER_TEXT"] = ""
--	L["BUGFIX_TAINTED_ALERT_OPEN_TEXT"] = ""
	
--	L["CONFIG_SYSTEM_MESSAGES"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_RESTACK_TEXT"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION_INTERIM"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION_INTERIM_TEXT"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION_FINAL"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION_FINAL_TEXT"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_BATTLEPET_OPPONENT"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_BATTLEPET_OPPONENT_TEXT"] = ""
	
--	L["CONFIG_SYSTEM_TIMERS"] = ""
--	L["CONFIG_SYSTEM_TIMERS_TEXT"] = ""
	
	
--	configuration options > auto
	L["CONFIG_AUTO"] = "Автоматически открывать/закрывать"
	
--	L["CONFIG_AUTO_OPEN"] = "Открывать сумку %1$s, когда вы %3$s" -- program, bag, action
	L["CONFIG_AUTO_OPEN_BANK"] = "открываете банк"
	L["CONFIG_AUTO_OPEN_VAULT"] = "открываете банк гильдии"
	L["CONFIG_AUTO_OPEN_MAIL"] = "открываете почту"
	L["CONFIG_AUTO_OPEN_MERCHANT"] = "открываете окно продавца"
	L["CONFIG_AUTO_OPEN_TRADE"] = "открываете окно обмена"
	L["CONFIG_AUTO_OPEN_AUCTION"] = "открываете аукцион"
--	L["CONFIG_AUTO_OPEN_VOID"] = ""
	
--	L["CONFIG_AUTO_CLOSE"] = "Закрывать сумку %1$s, кода вы %3$s"
	L["CONFIG_AUTO_CLOSE_BANK"] = "закрываете банк"
	L["CONFIG_AUTO_CLOSE_VAULT"] = "закрываете банк гильдии"
	L["CONFIG_AUTO_CLOSE_MAIL"] = "закрываете почту"
	L["CONFIG_AUTO_CLOSE_MERCHANT"] = "закрываете окно продавца"
	L["CONFIG_AUTO_CLOSE_TRADE"] = "закрываете окно обмена"
	L["CONFIG_AUTO_CLOSE_AUCTION"] = "закрываете аукцион"
--	L["CONFIG_AUTO_CLOSE_VOID"] = ""
	L["CONFIG_AUTO_CLOSE_COMBAT"] = "вступаете в бой"
	
	
--	configuration options > control
	L["CONFIG_CONTROL_MONITOR"] = "Следить"
	L["CONFIG_CONTROL_MONITOR_TEXT"] = "отслеживать ли изменения в данных %1$s для этого персонажа (%2$s)?"
	L["CONFIG_CONTROL_SAVE_TEXT"] = "сохранять ли данные %1$s для этого персонажа (%2$s), чтобы они были доступны когда вы играете за другого персонажа?"
--	L["CONFIG_CONTROL_NOTIFY_ERASE_TEXT"] = ""
--	L["CONFIG_CONTROL_OVERRIDE"] = ""
	L["CONFIG_CONTROL_OVERRIDE_TEXT"] = "скрыть стандартный интерфейс %2$s чтобы окно %1$s могло обрабатывать его действия.\n\nОтключение этой опции вернёт функционал стандартного %2$s.\n\nВы всё ещё сможете открыть %1$s %2$s когда эта опция выключена, но только используя специально назначенную клавишу"
--	L["CONFIG_CONTROL_SPECIAL_TEXT"] = ""
	L["CONFIG_CONTROL_ANCHOR_LOCK_TEXT"] = "фиксирует положение окна %1$s"
--	L["CONFIG_CONTROL_REPOSITION_NOW"] = ""
--	L["CONFIG_CONTROL_REPOSITION_NOW_TEXT"] = ""
	L["CONFIG_CONTROL_BLUEPRINT_TEXT"] = "выбрать, какие настройки использовать при создании окна %1$s"	
	
	
--	configuration settings > design
--	L["CONFIG_DESIGN"] = ""
--	L["CONFIG_DESIGN_PLURAL"] = ""
	
--	L["CONFIG_STYLE"] = ""
--	L["CONFIG_STYLE_PLURAL"] = ""
--	L["CONFIG_STYLE_DESCRIPTION"] = ""
	
--	L["CONFIG_LAYOUT"] = ""
--	L["CONFIG_LAYOUT_PLURAL"] = ""
--	L["CONFIG_LAYOUT_DESCRIPTION"] = ""
	
	L["CONFIG_DESIGN_WINDOW"] = "Окно"
	L["CONFIG_DESIGN_WINDOW_SCALE_TEXT"] = "устанавливает масштаб, делая окно меньше или больше"
	L["CONFIG_DESIGN_WINDOW_PADDING_TEXT"] = "устанавливает зазор между краем окна и наборами ячеек"
	L["CONFIG_DESIGN_WINDOW_WIDTH_TEXT"] = "устанавливает количество столбцов для отображения"
--	L["CONFIG_DESIGN_WINDOW_HEIGHT_TEXT"] = ""
	L["CONFIG_DESIGN_WINDOW_BACKGROUND_COLOUR_TEXT"] = "Устанавливает фоновый цвет главного окна"
	L["CONFIG_DESIGN_WINDOW_BORDER_SHOW_TEXT"] = "показать или скрыть кромку главного окна"
	L["CONFIG_DESIGN_WINDOW_BORDER_STYLE_TEXT"] = "стиль кромки главного окна"
	L["CONFIG_DESIGN_WINDOW_BORDER_COLOUR_TEXT"] = "устанавливает цвет кромки главного окна"
	
--	L["CONFIG_DESIGN_FRAME_HIDE_TEXT"] = ""
	
	L["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT"] = "Цвет подсветки сумок"
--	L["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT_TEXT"] = ""
	L["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT_COLOUR_TEXT"] = "Устанавливает цвет, который используется для подсветки ячеек сумки, над которой курсор мыши"
	L["CONFIG_DESIGN_FRAME_CHANGER_FREE"] = "Показывать количество"
	L["CONFIG_DESIGN_FRAME_CHANGER_FREE_TEXT"] = "отображать ли количество пустых ячеек на иконке сумки"
	L["CONFIG_DESIGN_FRAME_CHANGER_FREE_COLOUR_TEXT"] = "задает цвет текста для количества пустых ячеек"
	
--	L["CONFIG_DESIGN_FRAME_STATUS_EMPTY"] = ""
--	L["CONFIG_DESIGN_FRAME_STATUS_EMPTY_TEXT"] = ""
	
--	L["CONFIG_DESIGN_FRAME_SEARCH_LABEL_COLOUR_TEXT"] = ""
--	L["CONFIG_DESIGN_FRAME_SEARCH_TEXT_COLOUR_TEXT"] = ""
	
--	L["CONFIG_DESIGN_FRAME_TITLE_SIZE_NORMAL"] = ""
--	L["CONFIG_DESIGN_FRAME_TITLE_SIZE_THIN"] = ""
--	L["CONFIG_DESIGN_FRAME_TITLE_ONLINE_COLOUR_TEXT"] = ""
--	L["CONFIG_DESIGN_FRAME_TITLE_OFFLINE_COLOUR_TEXT"] = ""
	
	L["CONFIG_DESIGN_BAR"] = "Наборы ячеек"
	L["CONFIG_DESIGN_BAR_PER_ROW"] = "В ряду"
	L["CONFIG_DESIGN_BAR_PER_ROW_TEXT"] = "задает количество наборов ячеек в каждом ряду"
	L["CONFIG_DESIGN_BAR_BACKGROUND_TEXT"] = "задает цвет фона наборов ячеек"
	L["CONFIG_DESIGN_BAR_COMPACT"] = "Компактно"
	L["CONFIG_DESIGN_BAR_COMPACT_TEXT"] = "отображает все непустые наборы ячеек в последовательном порядке"
	L["CONFIG_DESIGN_BAR_SHOW_EMPTY"] = "Показывать пустые"
	L["CONFIG_DESIGN_BAR_SHOW_EMPTY_TEXT"] = "отображать или нет пустые наборы ячеек"
--	L["CONFIG_DESIGN_BAR_PADDING_INTERNAL_TEXT"] = ""
--	L["CONFIG_DESIGN_BAR_PADDING_EXTERNAL_TEXT"] = ""
	L["CONFIG_DESIGN_BAR_BORDER_TEXT"] = "показать или скрыть кромку вокруг каждого набора ячеек"
	L["CONFIG_DESIGN_BAR_BORDER_STYLE_TEXT"] = "стиль кромки вокруг каждого набора ячеек"
	L["CONFIG_DESIGN_BAR_BORDER_COLOUR_TEXT"] = "задает цвет кромки наборов ячеек"
	L["CONFIG_DESIGN_BAR_NAME_TEXT"] = "Задает название для этого набора ячеек"
	L["CONFIG_DESIGN_BAR_NAME_SHOW_TEXT"] = "отображать или нет названия наборов ячеек"
	L["CONFIG_DESIGN_BAR_NAME_COLOUR_TEXT"] = "задает цвет кромки наборов ячеек"
--	L["CONFIG_DESIGN_BAR_NAME_HEIGHT_TEXT"] = ""
--	L["CONFIG_DESIGN_BAR_NAME_ANCHOR_TEXT"] = ""
	
	L["CONFIG_DESIGN_ITEM_PADDING_TEXT"] = "задает расстояние медлу ячейками"
	L["CONFIG_DESIGN_ITEM_HIDDEN"] = "Показывать скрытые"
	L["CONFIG_DESIGN_ITEM_HIDDEN_TEXT"] = "показывать ли предметы, находящиеся в скрытых категориях"
	L["CONFIG_DESIGN_ITEM_FADE"] = "Затемнять недоступное"
	L["CONFIG_DESIGN_ITEM_FADE_TEXT"] = "затемнять ли недоступные в данный момент ячейки"
--	L["CONFIG_DESIGN_ITEM_TINT_USABLE"] = ""
--	L["CONFIG_DESIGN_ITEM_TINT_USABLE_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_ITEMLEVEL_SHOW"] = ""
--	L["CONFIG_DESIGN_ITEM_ITEMLEVEL_SHOW_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_COMPRESS"] = ""
--	L["CONFIG_DESIGN_ITEM_COMPRESS_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_ITEMCOUNT_SHOW"] = ""
--	L["CONFIG_DESIGN_ITEM_ITEMCOUNT_SHOW_TEXT"] = ""
	
--	L["CONFIG_DESIGN_ITEM_COOLDOWN_SHOW_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_COOLDOWN_GLOBAL"] = ""
--	L["CONFIG_DESIGN_ITEM_COOLDOWN_GLOBAL_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_COOLDOWN_COMBAT"] = ""
--	L["CONFIG_DESIGN_ITEM_COOLDOWN_COMBAT_TEXT"] = ""
	
	L["CONFIG_DESIGN_ITEM_BORDER_SHOW_TEXT"] = "отображать ли кромку вокруг каждой ячейки"
--	L["CONFIG_DESIGN_ITEM_BORDER_STYLE_TEXT"] = ""
	L["CONFIG_DESIGN_ITEM_BORDER_RARITY"] = "Кромка в цвет качества"
	L["CONFIG_DESIGN_ITEM_BORDER_RARITY_TEXT"] = "окрашивать ли кромку каждой ячейки в соответствии с качеством вещи"
--	L["CONFIG_DESIGN_ITEM_BORDER_RARITY_CUTOFF"] = ""
--	L["CONFIG_DESIGN_ITEM_BORDER_RARITY_CUTOFF_TEXT"] = ""
	L["CONFIG_DESIGN_ITEM_BORDER_TEXTURE_OFFSET_TEXT"] = "расстояние в пикселях между краем картинки предмета и внутренней стороной кромки ячейки"
	
--	L["CONFIG_DESIGN_ITEM_NEW"] = ""
--	L["CONFIG_DESIGN_ITEM_NEW_ENABLED_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_NEW_CUTOFF_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_NEW_RESET_TEXT"] = ""
	
	L["CONFIG_DESIGN_ITEM_AGE"] = "Новые предметы"
	L["CONFIG_DESIGN_ITEM_AGE_SHOW_TEXT"] = "отображать индикатор нового предмета в окне %s"
	L["CONFIG_DESIGN_ITEM_AGE_COLOUR_TEXT"] = "задает цвет текста для индикатора нового предмета."
--	L["CONFIG_DESIGN_ITEM_AGE_CUTOFF_TEXT"] = ""
	
	L["CONFIG_DESIGN_ITEM_EMPTY"] = "Пустые ячейки"
	L["CONFIG_DESIGN_ITEM_EMPTY_ICON_TEXT"] = "использовать иконку или сплошной цвет в качестве фона пустой ячейки?"
	L["CONFIG_DESIGN_ITEM_EMPTY_CLUMP"] = "Вместе"
	L["CONFIG_DESIGN_ITEM_EMPTY_CLUMP_TEXT"] = "помещать ли пустые ячейки в тот же набор, что и непустые ячейки того же типа или расценивать их как отдельный тип?"
	L["CONFIG_DESIGN_ITEM_EMPTY_BORDER"] = "Цветная кромка"
	L["CONFIG_DESIGN_ITEM_EMPTY_BORDER_TEXT"] = "красить ли кромку пустой ячейки в соответствии с цветом типа сумки?"
	L["CONFIG_DESIGN_ITEM_EMPTY_COLOUR"] = "Цвета ячеек"
	L["CONFIG_DESIGN_ITEM_EMPTY_COLOUR_TEXT"] = "устанавливает цвет кромки и фона для пустых %1$s ячеек"
--	L["CONFIG_DESIGN_ITEM_EMPTY_ALPHA"] = ""
--	L["CONFIG_DESIGN_ITEM_EMPTY_ALPHA_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_EMPTY_STATUS"] = ""
--	L["CONFIG_DESIGN_ITEM_EMPTY_FIRST"] = ""
--	L["CONFIG_DESIGN_ITEM_EMPTY_FIRST_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_EMPTY_POSITION"] = ""
--	L["CONFIG_DESIGN_ITEM_EMPTY_POSITION_TEXT"] = ""
	
	
-- junk
--	L["CONFIG_JUNK"] = ""
--	L["CONFIG_JUNK_SELL"] = ""
--	L["CONFIG_JUNK_SELL_TEXT"] = ""
--	L["CONFIG_JUNK_SELL_NOTIFY_SOLD"] = ""
--	L["CONFIG_JUNK_SELL_NOTIFY_DESTROYED"] = ""
--	L["CONFIG_JUNK_LIMIT"] = ""
--	L["CONFIG_JUNK_LIMIT_TEXT"] = ""
--	L["CONFIG_JUNK_DELETE_TEXT"] = ""
--	L["CONFIG_JUNK_NOTIFY_TEXT"] = ""
	
	
-- sorting
--	L["CONFIG_SORTING"] = ""
	
	L["CONFIG_SORTING_SORT"] = "Сортировка"
	
--	L["CONFIG_SORTING_METHOD"] = ""
--	L["CONFIG_SORTING_METHOD_PLURAL"] = ""
--	L["CONFIG_SORTING_METHOD_TEXT"] = ""
	L["CONFIG_SORTING_METHOD_BAGSLOT"] = "Сумка / Ячейка"
	L["CONFIG_SORTING_METHOD_BAGSLOT_TEXT"] = "сортирует инвентарь по номеру сумки и ячейки"
	L["CONFIG_SORTING_METHOD_USER"] = "Ручная"
	L["CONFIG_SORTING_METHOD_USER_TEXT"] = "сортирует инвентарь тем способом, который выберите Вы"
	
--	L["CONFIG_SORTING_BAG"] = ""
--	L["CONFIG_SORTING_BAGS"] = ""
--	L["CONFIG_SORTING_BAG_TEXT"] = ""
	
	L["CONFIG_SORTING_INCLUDE_NAME"] = "название предмета"
	L["CONFIG_SORTING_INCLUDE_NAME_TEXT"] = "использовать ли имя предмета при сортировке"
	L["CONFIG_SORTING_INCLUDE_NAME_REVERSE"] = "Обратить названия"
	L["CONFIG_SORTING_INCLUDE_NAME_REVERSE_TEXT"] = "использовать ли обращение названий предметов\n\nнапример вместо Super Mana Potion использовать Potion Mana Super"
	L["CONFIG_SORTING_INCLUDE_QUALITY"] = "качество вещи"
	L["CONFIG_SORTING_INCLUDE_QUALITY_TEXT"] = "использовать ли качество предмета при сортировке"
	L["CONFIG_SORTING_INCLUDE_LOCATION"] = "слот одеваемой вещи"
	L["CONFIG_SORTING_INCLUDE_LOCATION_TEXT"] = "использовать ли слот на который одевается вещь при сортировке\n\nвнимание: действует только на вещи, которые можно одеть"
	L["CONFIG_SORTING_INCLUDE_ITEMTYPE"] = "тип и подтип предмета"
	L["CONFIG_SORTING_INCLUDE_ITEMTYPE_TEXT"] = "использовать ли тип и подтип предмета при сортировке"
	L["CONFIG_SORTING_INCLUDE_CATEGORY"] = "категория предмета"
	L["CONFIG_SORTING_INCLUDE_CATEGORY_TEXT"] = "использовать ли категорию предмета при сортировке"
	L["CONFIG_SORTING_INCLUDE_ITEMUSELEVEL"] = "уровень (исп) предмета"
	L["CONFIG_SORTING_INCLUDE_ITEMUSELEVEL_TEXT"] = "использовать ли уровень (использования) предмета при сортировке"
	L["CONFIG_SORTING_INCLUDE_ITEMSTATLEVEL"] = "уровень (парам) предмета"
	L["CONFIG_SORTING_INCLUDE_ITEMSTATLEVEL_TEXT"] = "использовать ли уровень (по параметрам) предмета при сортировке"
--	L["CONFIG_SORTING_INCLUDE_ITEMAGE"] = ""
--	L["CONFIG_SORTING_INCLUDE_ITEMAGE_TEXT"] = ""
	L["CONFIG_SORTING_INCLUDE_VENDORPRICE"] = "цена продажи"
	L["CONFIG_SORTING_INCLUDE_VENDORPRICE_TEXT"] = "использовать ли цену продажи предмета NPC-торговцу при сортировке"
--	L["CONFIG_SORTING_INCLUDE_ID"] = ""
--	L["CONFIG_SORTING_INCLUDE_ID_TEXT"] = ""
	
	L["CONFIG_SORTING_DIRECTION_TEXT"] = "производить сортировку в порядке увеличения или убывания?"
	L["CONFIG_SORTING_ORDER"] = "Порядок сортировки"
	L["CONFIG_SORTING_MOVE_UP_TEXT"] = "перемещает %1$s вверх в порядке сортировки"
	L["CONFIG_SORTING_MOVE_DOWN_TEXT"] = "перемещает %1$s вниз в порядке сортировки"
	L["CONFIG_SORTING_NOT_INCLUDED"] = "* не включено в сортировку *"
	
--	L["CONFIG_LIST_ADD_TEXT"] = ""
--	L["CONFIG_LIST_ADD_LIMIT_TEXT"] = ""
--	L["CONFIG_LIST_ADD_UPGRADE_TEXT"] = ""
--	L["CONFIG_LIST_DELETE_TEXT"] = ""
--	L["CONFIG_LIST_RESTORE_TEXT"] = ""
--	L["CONFIG_LIST_RENAME_TEXT"] = ""
--	L["CONFIG_LIST_COPY_TEXT"] = ""
--	L["CONFIG_LIST_PURGE_TEXT"] = ""
--	L["CONFIG_LIST_IMPORT_TEXT"] = ""
--	L["CONFIG_LIST_EXPORT_TEXT"] = ""
	
	
	
--	L["CONFIG_CATEGORY"] = ""
--	L["CONFIG_CATEGORY_PLURAL"] = ""
	
	L["CATEGORY_RULE"] = "Правило"
	L["CONFIG_RULE_PLURAL"] = "Правила"
	
	L["CONFIG_RULE_SHOWDISABLED"] = "Показывать отключенные правила"
	L["CONFIG_RULE_SHOWDISABLED_TEXT"] = "отображать ли отключенные правила?"
	
--	L["CONFIG_CATEGORY_CUSTOM"] = ""
	L["CONFIG_CATEGORY_CUSTOM_PLURAL"] = "Пользовательские категории"
	
--	L["CONFIG_CATEGORY_SET"] = ""
--	L["CONFIG_CATEGORY_SET_PLURAL"] = ""
--	L["CONFIG_CATEGORY_SET_DESCRIPTION"] = ""
	
--	L["CONFIG_PROFILE"] = ""
--	L["CONFIG_PROFILE_PLURAL"] = ""
--	L["CONFIG_PROFILE_CURRENT"] = ""
	
	
--	L["CONFIG_OBJECT_DELETED"] = ""
	
	
--	configuration options > debug
	L["CONFIG_DEBUG"] = "Режим отладки"
	L["CONFIG_DEBUG_TEXT"] = "использовать ли код режима отладки?"
	
	
--	configuration options > generic
--	L["CONFIG_BORDER_SCALE_TEXT"] = ""
	L["CONFIG_BORDER_TEXTURE_TEXT"] = "настройки текстуры кромки"
	L["CONFIG_BORDER_TEXTURE_FILE_TEXT"] = "текстура, для использования на кромке (изменение этого параметра сбросит масштаб на 100%)"
	L["CONFIG_BORDER_TEXTURE_HEIGHT_TEXT"] = "высота (в пикселах) текстуры"
	
	
--	rules frame
	L["RULE"] = "Правило"
	L["RULE_HIDDEN"] = "Скрыто"
	L["RULE_FORMULA"] = "Формула"
	L["RULE_LIST_ENABLED"] = "Использовать"
	L["RULE_LIST_DAMAGED"] = "Повреждено"
	L["RULE_LIST_ID"] = "Правило"
	
	L["RULE_DAMAGED"] = "Правило %s помечено как повреждённое и более не будет работать, пока Вы его не исправите."
--	L["RULE_DAMAGED_TEXT"] = ""
--	L["RULE_FAILED"] = ""
	L["RULE_FAILED_KEY_NIL"] = "нет ключа"
	L["RULE_FAILED_DATA_NIL"] = "нет данных"
	L["RULE_FAILED_DESCRIPTION_NIL"] = "отсутствует описание"
	L["RULE_FAILED_FORMULA_NIL"] = "отсутствует формула"
--	L["RULE_FAILED_FORMULA_BAD"] = ""
--	L["RULE_FAILED_ARGUMENT_IS_NIL"] = ""
--	L["RULE_FAILED_ARGUMENT_IS_NOT"] = ""
--	L["RULE_FAILED_ARGUMENT_IS_INVALID"] = ""
--	L["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"] = ""
	
	
--	new item indicators
--	L["NEW_ITEM_INCREASE"] = ""
--	L["NEW_ITEM_DECREASE"] = ""
--	L["NEW_ITEM_GLOW"] = ""
	
	
--	slash commands
--	L["SLASH_UI"] = ""
--	L["SLASH_UI_TEXT"] = ""
--	L["SLASH_UI_RESET"] = ""
	L["SLASH_UI_RESET_TEXT"] = "перемещает всё в центр экрана"
	L["SLASH_UI_RESET_COMPLETE_TEXT"] = "все окна интерфейса перемещаются в центр экрана"
--	L["SLASH_DB"] = ""
--	L["SLASH_DB_TEXT"] = ""
--	L["SLASH_DB_RESET"] = ""
	L["SLASH_DB_RESET_TEXT"] = "сбросить все настройки"
--	L["SLASH_DB_RESET_CONFIRM"] = ""
	L["SLASH_DB_RESET_CONFIRM_TEXT"] = "подтверждает сброс базы данных"
	L["SLASH_DB_RESET_COMPLETE_TEXT"] = "Профиль сброшен. Все настройки возвращены к значению по умолчанию."
--	L["SLASH_CACHE"] = ""
--	L["SLASH_CACHE_TEXT"] = ""
--	L["SLASH_CACHE_ERASE"] = ""
	L["SLASH_CACHE_ERASE_TEXT"] = "очищает весь кэш"
--	L["SLASH_CACHE_ERASE_CONFIRM"] = ""
	L["SLASH_CACHE_ERASE_CONFIRM_TEXT"] = "подтверждает очистку кэша"
	L["SLASH_CACHE_ERASE_COMPLETE_TEXT"] = "Сбросить все данные для всех персонажей"
--	L["SLASH_MISC"] = ""
--	L["SLASH_MISC_TEXT"] = ""
--	L["SLASH_TRACK"] = ""
--	L["SLASH_TRACK_TEXT"] = ""
--	L["SLASH_TRACK_ADD_TEXT"] = ""
--	L["SLASH_TRACK_REMOVE_TEXT"] = ""
	
	
--	misc chat stuff
	L["UPGRADE_PROFILE"] = "Обновление профиля [%1$s] до %2$d"
	L["UPGRADE_GLOBAL"] = "Обновление общей %1$s информации до v%2$d"
--	L["UPGRADE_CHAR"] = ""
	
	L["MISC_ALERT"] = "Внимание!"
	L["MISC_ALERT_FRAMELEVEL_1"] = "Выполнен багфикс."
	L["MISC_ALERT_FRAMELEVEL_2"] = "FrameLevel для окна %1$s был равен %2$s и сброшен до %3$s для уверенной работоспособности. Извините за небольшой лаг, вызванный этим фиксом."
	
--	L["BATTLEPET_OPPONENT_IMMUNE"] = ""
--	L["BATTLEPET_OPPONENT_KNOWN_MAX"] = ""
--	L["BATTLEPET_OPPONENT_UPGRADE"] = ""
--	L["BATTLEPET_OPPONENT_FORMAT_STRONG"] = ""
--	L["BATTLEPET_OPPONENT_FORMAT_WEAK"] = ""
--	L["BATTLEPET_OPPONENT_FORMAT_ABILITY1"] = ""
--	L["BATTLEPET_OPPONENT_FORMAT_ABILITY2"] = ""
	
	
--	item count tooltip
--	L["TOOLTIP_VAULT_TABS"] = ""
--	L["TOOLTIP_GOLD_AMOUNT"] = ""
	
	
--	generic menu text
	L["AUTOMATIC"] = "непроизвольный"
	L["BOTTOMLEFT"] = "Снизу слева"
	L["BOTTOMRIGHT"] = "Снизу справа"
	L["TOPLEFT"] = "Сверху слева"
	L["TOPRIGHT"] = "Сверху справа"
--	L["TOP"] = ""
--	L["BOTTOM"] = ""
--	L["LEFT"] = ""
--	L["RIGHT"] = ""
	L["HORIZONTAL"] = "Горизонтально"
	L["VERTICAL"] = "Вертикально"
	L["CLOSE_MENU"] = "Закрыть меню"
	L["ANCHOR"] = "Якорь"
	L["ANCHOR_TEXT1"] = "задает якорь (точку закрепления)"
	L["ANCHOR_TEXT2"] = "прикрепляет %1$s к %2$s"
	L["BORDER_TEXT"] = "настройки кромки"
	L["FILE"] = "Файл"
	L["HEIGHT"] = "Высота"
	L["SCALE"] = "Масштаб"
	L["TEXTURE"] = "Текстура"
	L["FONT"] = "Шрифт"
	L["BACKGROUND_COLOUR"] = "Цвет фона"
	L["STYLE"] = "Стиль"
	L["ALERT"] = "Тревога"
	L["PADDING"] = "Зазор"
	L["INTERNAL"] = "Внутренняя"
	L["EXTERNAL"] = "Внешняя"
	L["WIDTH"] = "Ширина"
	L["DIRECTION"] = "Направление"
--	L["ASCENDING"] = ""
--	L["DECENDING"] = ""
--	L["LOCATION"] = ""
	L["CLEAR"] = "Сбросить"
--	L["DHMS"] = ""
--	L["OPEN"] = "Open"
--	L["RANDOM"] = "Random"
	L["RELOAD"] = "Перезагрузить"
	L["MOVE_UP"] = "Переместить вверх"
	L["MOVE_DOWN"] = "Переместить вниз"
--	L["SORT_METHOD"] = ""
--	L["SORT_BY_NAME"] = ""
--	L["SORT_BY_NUMBER"] = ""
	L["INSERT"] = "Добавить пустой набор"
	L["CURRENT"] = "Текущее назначение"
	L["OFFSET"] = "Сдвиг"
--	L["NUMBER"] = ""
--	L["STRING"] = ""
--	L["COOLDOWN"] = ""
--	L["FRAMES"] = ""
--	L["CLICK_TO_SELECT"] = ""
--	L["CLICK_TO_DESELECT"] = ""
--	L["CLICK_TO_IGNORE"] = ""	
	L["ORDER"] = "Порядок"
--	L["MOUSEOVER"] = ""
--	L["NO_DATA_AVAILABLE"] = ""
--	L["TOOLTIP_PURCHASE_BANK_BAG_SLOT"] = ""
--	L["TOOLTIP_PURCHASE_BANK_TAB_REAGENT"] = ""
--	L["LABEL"] = ""
--	L["ABORTED"] = ""
--	L["RESTORE"] = ""
--	L["PURGE"] = ""
--	L["COPY_FROM"] = ""
--	L["DELETED"] = ""
--	L["IMPORT"] = ""
--	L["EXPORT"] = ""
--	L["NOTIFY"] = ""
--	L["ACTION"] = ""
--	L["FIRST"] = ""
--	L["LAST"] = ""
--	L["NONE_USABLE"] = ""
--	L["NONE_OWNED"] = ""
	
	
-- libdatabroker
--	L["LDB"] = ""
--	L["LDB_BAGS_COLOUR_USE"] = ""
--	L["LDB_BAGS_COLOUR_USE_TEXT"] = ""
--	L["LDB_BAGS_STYLE"] = ""
--	L["LDB_BAGS_STYLE_TEXT"] = ""
--	L["LDB_BAGS_INCLUDE_TYPE"] = ""
--	L["LDB_BAGS_INCLUDE_TYPE_TEXT"] = ""
--	L["LDB_TRACKING_CURRENCY"] = ""
--	L["LDB_PETS_SUMMON"] = ""
--	L["LDB_MOUNTS_NOT_HERE"] = ""
--	L["LDB_MOUNTS_TYPE_L"] = ""
--	L["LDB_MOUNTS_TYPE_U"] = ""
--	L["LDB_MOUNTS_TYPE_S"] = ""
--	L["LDB_MOUNTS_TYPE_X"] = ""
--	L["LDB_MOUNTS_FLYING_USEFORLAND"] = ""
--	L["LDB_MOUNTS_FLYING_USEFORLAND_TEXT"] = ""
--	L["LDB_MOUNTS_FLYING_DISMOUNT"] = ""
--	L["LDB_MOUNTS_FLYING_DISMOUNT_TEXT"] = ""
--	L["LDB_MOUNTS_FLYING_DISMOUNT_WARNING"] = ""
--	L["LDB_MOUNTS_SUMMON"] = ""
--	L["LDB_MOUNTS_NODATA"] = ""
--	L["LDB_MOUNTS_TOOLTIP_SELECTION"] = ""
--	L["LDB_MOUNTS_TRAVEL_FORM"] = ""
--	L["LDB_MOUNTS_TRAVEL_FORM_TEXT"] = ""
--	L["LDB_COMPANION_MISSING"] = ""
--	L["LDB_COMPANION_NONE"] = ""
--	L["LDB_COMPANION_RESTRICTED"] = ""
--	L["LDB_COMPANION_RESTRICTED_ZONE"] = ""
--	L["LDB_COMPANION_RESTRICTED_ITEM"] = ""
--	L["LDB_COMPANION_RESTRICTED_EVENT"] = ""
--	L["LDB_COMPANION_RESTRICTED_UNKNOWN"] = ""
--	L["LDB_COMPANION_NODATA_TEXT"] = ""
--	L["LDB_COMPANION_SELECT"] = ""
--	L["LDB_COMPANION_DESELECT"] = ""
--	L["LDB_COMPANION_IGNORE"] = ""
