local L = LibStub( "AceLocale-3.0" ):NewLocale( "ArkInventory", "zhCN" )
if not L then return end

-- post updated translations at http://groups.google.com/group/wow-arkinventory (modify this file and include as an attachment)
-- note: when creating a new locale do not leave any english translations in your file, comment them out by placing -- at the start of the line


-- Translated by: xuxianhe@gmail.com
-- Email: xuxianhe@gmail.com
-- WebSite: http://blog.cwowaddon.com/xuxianhe

-- Translated by: 注册阴阳师@暴风祭坛
-- Email: iiibbbmmm@21cn.com






--	wow zone names - must match exactly what is in game
	L["WOW_ZONE_AHNQIRAJ"] = "安其拉"
	L["WOW_ZONE_VASHJIR"] = "瓦丝琪尔"
	L["WOW_ZONE_KELPTHAR_FOREST"] = "柯尔普萨之森"
	L["WOW_ZONE_SHIMMERING_EXPANSE"] = "烁光海床"
	L["WOW_ZONE_ABYSSAL_DEPTHS"] = "无底海渊"
	
	
--	wow tooltip text - must match exactly what is in game
	L["WOW_ITEM_TOOLTIP_FOOD"] = "进食时必须保持坐姿"
	L["WOW_ITEM_TOOLTIP_DRINK"] = "喝水时必须保持坐姿"
	L["WOW_ITEM_TOOLTIP_POTION_HEAL"] = "恢复%d+到%d+点生命值"
	L["WOW_ITEM_TOOLTIP_POTION_MANA"] = "恢复%d+到%d+点法力值"
	L["WOW_ITEM_TOOLTIP_ELIXIR_BATTLE"] = "战斗药剂"
	L["WOW_ITEM_TOOLTIP_ELIXIR_GUARDIAN"] = "守护药剂"
	
	
--	location names
--	L["LOCATION_ACCOUNT"] = ""
	L["LOCATION_WEARING"] = "装备"
	
	
--	subframe names
	L["SUBFRAME_NAME_TITLE"] = "隐藏标题"
	L["SUBFRAME_NAME_BAGCHANGER"] = "隐藏背包置换框架"
	
	
--	status bar/bag text
	L["STATUS_NO_DATA"] = "无资料"
	L["STATUS_PURCHASE"] = "买"
	
	
--	restack
	L["RESTACK"] = "压缩并重新堆栈"
	L["RESTACK_TEXT"] = "重新堆栈物品以减少物品占用的字段，特殊背包的字段将会优先被使用"
	L["RESTACK_FAIL_WAIT"] = "堆叠行动已经在进行, 请等待完成"
	L["RESTACK_FAIL_ACCESS"] = "你没有权限堆叠 %1$s 里的 %2$s 标签 %1$s"
--	L["RESTACK_FAIL_CLOSED"] = ""
--	L["RESTACK_TYPE"] = ""
--	L["RESTACK_CLEANUP_DEPOSIT"] = ""
--	L["RESTACK_TOPUP_FROM_BAGS"] = ""
--	L["RESTACK_TOPUP_FROM_BAGS_TEXT"] = ""
--	L["RESTACK_FILL_FROM_BAGS_TEXT"] = ""
	
	
--	vault tab tooltips
	L["VAULT_TAB_ACCESS_NONE"] = "没有权限"
	L["VAULT_TAB_NAME"] = "标签: |cffffffff%1$s - %2$s|r"
	L["VAULT_TAB_ACCESS"] = "有权限: |cffffffff%1$s|r"
	L["VAULT_TAB_REMAINING_WITHDRAWALS"] = "当天剩余提取次数: |cffffffff%1$s|r"
	
	
--	system category descriptions
	L["CATEGORY_SYSTEM_CORE_MATS"] = "原始材料"
	
	
--	consumable category descriptions
	L["CATEGORY_CONSUMABLE_FOOD_PET"] = "食物 (宠物)"
	L["CATEGORY_CONSUMABLE_POTION_HEAL"] = "治疗 (药水/石)"
	L["CATEGORY_CONSUMABLE_POTION_MANA"] = "法力 (药水/宝石)"
	L["CATEGORY_CONSUMABLE_ELIXIR_BATTLE"] = "战斗药剂"
	L["CATEGORY_CONSUMABLE_ELIXIR_GUARDIAN"] = "守护药剂"
	
	
--	bag names - used to name the empty slots in the status frame
	L["STATUS_SHORTNAME_BAG"] = "背包"
--	L["STATUS_SHORTNAME_COOKING"] = ""
	L["STATUS_SHORTNAME_CRITTER"] = "宠物"
	L["STATUS_SHORTNAME_ENCHANTING"] = "附魔"
	L["STATUS_SHORTNAME_ENGINEERING"] = "工程"
	L["STATUS_SHORTNAME_GEAR"] = "装备"
	L["STATUS_SHORTNAME_GEM"] = "珠宝"
--	L["STATUS_SHORTNAME_HEIRLOOM"] = ""
	L["STATUS_SHORTNAME_HERB"] = "草药"
	L["STATUS_SHORTNAME_INSCRIPTION"] = "铭文"
	L["STATUS_SHORTNAME_KEY"] = "钥匙"
	L["STATUS_SHORTNAME_LEATHERWORKING"] = "制皮"
	L["STATUS_SHORTNAME_MAIL"] = "邮件"
	L["STATUS_SHORTNAME_MINING"] = "矿石"
	L["STATUS_SHORTNAME_MOUNT"] = "坐骑"
--	L["STATUS_SHORTNAME_REAGENTBANK"] = ""
--	L["STATUS_SHORTNAME_TACKLE"] = ""
	L["STATUS_SHORTNAME_TOKEN"] = "牌子"
--	L["STATUS_SHORTNAME_TOY"] = ""
	
	
--	main menu
	L["MENU"] = "选单"
	
	L["MENU_CHARACTER_SWITCH"] = "切换角色"
	L["MENU_CHARACTER_SWITCH_TEXT"] = "切换显示其他角色"
	L["MENU_CHARACTER_SWITCH_CHOOSE_NONE"] = "没有其他角色数据"
	L["MENU_CHARACTER_SWITCH_CHOOSE_TEXT"] = "切换显示数据为 %1$s"
	L["MENU_CHARACTER_SWITCH_ERASE"] = "清除快照资料"
	L["MENU_CHARACTER_SWITCH_ERASE_TEXT"] = "清除所有 %1$s 的快照数据"
	
	L["MENU_LOCATION_SWITCH"] = "功能切换菜单"
	L["MENU_LOCATION_SWITCH_TEXT"] = "切换到 %1$s 窗口"
	
	
--	actions menu
	L["MENU_ACTION"] = "动作设置"
	L["MENU_ACTION_REFRESH_TEXT"] = "更新及排序窗口内容"
--	L["MENU_ACTION_REFRESH_CLEAR_CACHE"] = ""
--	L["MENU_ACTION_REFRESH_CLEAR_CACHE_TEXT"] = ""
	L["MENU_ACTION_RELOAD_TEXT"] = "重载窗口，当你使用换装软件时使用"
	L["MENU_ACTION_EDITMODE"] = "开启编辑模式"
	L["MENU_ACTION_EDITMODE_TEXT"] = "切换编辑模式，让你指定分组及调整样式"
	L["MENU_ACTION_BAGCHANGER"] = "开启背包置换"
	L["MENU_ACTION_BAGCHANGER_TEXT"] = "切换显示背包置换区，以供你替换背包"
	
	
--	item menu
	L["MENU_ITEM_TITLE"] = "物品信息"
	L["MENU_ITEM_ITEM"] = "物品"
	L["MENU_ITEM_DEFAULT_RESET"] = "重置为默认"
	L["MENU_ITEM_DEFAULT_RESET_TEXT"] = "点击来重置此物品, 让它回到默认的分类(不重置规则)"
	L["MENU_ITEM_ASSIGN_CHOICES"] = "可归入的种类"
	L["MENU_ITEM_ASSIGN_THIS"] = "归入种类"
	L["MENU_ITEM_ASSIGN_THIS_TEXT"] = "将此物品归入指定分类"
	L["MENU_ITEM_RULE_NEW"] = "创建新规则"
	L["MENU_ITEM_RULE_ADD"] = "增加物品至规则"
	L["MENU_ITEM_CUSTOM_NEW"] = "建立一个新的分类"
	L["MENU_ITEM_DEBUG"] = "Debug 信息"
	L["MENU_ITEM_DEBUG_BAG"] = "背包"
	L["MENU_ITEM_DEBUG_SLOT"] = "包格"
	L["MENU_ITEM_DEBUG_BAG_TYPE"] = "背包类别"
--	L["MENU_ITEM_DEBUG_PET_ID"] = ""
--	L["MENU_ITEM_DEBUG_PET_SPECIES"] = ""
	L["MENU_ITEM_DEBUG_AI_ID_SHORT"] = "短ID"
	L["MENU_ITEM_DEBUG_CACHE"] = "缓存ID"
	L["MENU_ITEM_DEBUG_AI_ID_RULE"] = "规则ID"
	L["MENU_ITEM_DEBUG_AI_ID_CATEGORY"] = "AI 类别"
	L["MENU_ITEM_DEBUG_LVL_ITEM"] = "物品等级 (属性等级)"
	L["MENU_ITEM_DEBUG_LVL_USE"] = "物品等级 (使用等级)"
	L["MENU_ITEM_DEBUG_TYPE"] = "类别"
	L["MENU_ITEM_DEBUG_SUBTYPE"] = "子类别"
	L["MENU_ITEM_DEBUG_EQUIP"] = "位置"
	L["MENU_ITEM_DEBUG_ID"] = "ID"
	L["MENU_ITEM_DEBUG_FAMILY"] = "族（Family）"
	L["MENU_ITEM_DEBUG_PT"] = "PT 设置"
	L["MENU_ITEM_DEBUG_PT_TEXT"] = "列出此物品所设置的 PT 类别"
	L["MENU_ITEM_DEBUG_PT_NONE"] = "此物品当前没有设置任何 PT 类别"
	L["MENU_ITEM_DEBUG_PT_TITLE"] = "设置此物品的 PT 类别"
--	L["MENU_ITEM_DEBUG_SOURCE"] = ""
--	L["MENU_ITEM_DEBUG_BONUS"] = ""
--	L["MENU_ITEM_DEBUG_ITEMSTRING"] = ""
	
	
--	bar menu
	L["MENU_BAR_TITLE"] = "分组 %1$s 选项"
	L["MENU_BAR_CATEGORY_TEXT"] = "指定 %1$s 到此分组"
	L["MENU_BAR_CATEGORY_CURRENT"] = "目前使用"
	L["MENU_BAR_CATEGORY_ASSIGN"] = "可使用类别"
	L["MENU_BAR_CATEGORY_REMOVE_TEXT"] = "自分组 %2$s 中移除 %1$s，并将它放回预设分组" -- 1 is the category name, 2 is the bar number
	L["MENU_BAR_CATEGORY_HIDDEN_TEXT"] = "设定此分组是否为隐藏模式\n\n在隐藏分组内的物品，一般情况下将不会显示"
--	L["MENU_BAR_CATEGORY_MOVE_START_TEXT"] = ""
--	L["MENU_BAR_CATEGORY_MOVE_COMPLETE_TEXT"] = ""
--	L["MENU_BAR_CATEGORY_ENABLE_TEXT"] = ""
--	L["MENU_BAR_CATEGORY_DISABLE_TEXT"] = ""
--	L["MENU_BAR_BAG_ASSIGN_TEXT"] = ""
	L["MENU_BAR_OPTIONS"] = "分组选项"
	L["MENU_BAR_RESET_TEXT"] = "移除所有除了预设分类以外指定到此的类别"
	L["MENU_BAR_INSERT_TEXT"] = "插入空白分组，将其他分组往后移"
	L["MENU_BAR_DELETE_TEXT"] = "移除此分组，此分组内的类别将会被放回预设分组"
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
	L["MENU_BAG_TITLE"] = "背包设置"
	L["MENU_BAG_SHOW"] = "显示"
	L["MENU_BAG_SHOW_TEXT"] = "显示此背包容那物"
	L["MENU_BAG_ISOLATE"] = "隔离"
	L["MENU_BAG_ISOLATE_TEXT"] = "只显示此背包容纳物"
	L["MENU_BAG_SHOWALL"] = "显示所有"
	L["MENU_BAG_SHOWALL_TEXT"] = "显示此位置所有背包容纳物"
	L["MENU_BAG_EMPTY_TEXT"] = "将此背包中的物品转移到其他背包"
	
	
--	configuration options
	L["CONFIG"] = "设置"
	L["CONFIG_TEXT"] = "设置菜单"
	
--	configuration options > system
	L["CONFIG_SYSTEM_TEXT"] = "系统选项"
	
	L["CONFIG_SYSTEM_FONT_TEXT"] = "设置 %s 的字体"
	
	L["CONFIG_SYSTEM_FRAMESTRATA"] = "框架优先级"
	L["CONFIG_SYSTEM_FRAMESTRATA_TEXT"] = "选择窗口优先级。"
	L["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_LOW"] = "低"
	L["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_MEDIUM"] = "中等"
	L["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_HIGH"] = "高"
	
--	L["CONFIG_SYSTEM_REPOSITION_ONSHOW"] = "加载时复位"
--	L["CONFIG_SYSTEM_REPOSITION_ONSHOW_TEXT"] = "首次查看时，复位 %1$s 窗口" -- %1$s = location name
	
--	L["CONFIG_SORTING_WHEN"] = ""
--	L["CONFIG_SORTING_WHEN_TEXT"] = ""
--	L["CONFIG_SORTING_WHEN_INSTANT"] = ""
--	L["CONFIG_SORTING_WHEN_INSTANT_TEXT"] = ""
--	L["CONFIG_SORTING_WHEN_OPEN"] = ""
--	L["CONFIG_SORTING_WHEN_OPEN_TEXT"] = ""
--	L["CONFIG_SORTING_WHEN_MANUAL"] = ""
--	L["CONFIG_SORTING_WHEN_MANUAL_TEXT"] = ""
	
	L["CONFIG_SYSTEM_TOOLTIP"] = "提示"
	L["CONFIG_SYSTEM_TOOLTIP_ENABLE_TEXT"] = "是否使用提示"
	L["CONFIG_SYSTEM_TOOLTIP_EMPTY_ADD"] = "空行"
	L["CONFIG_SYSTEM_TOOLTIP_EMPTY_ADD_TEXT"] = "是否在基础提示文字和自定义文字之间显示一个空行"
	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_ADD"] = "显示物品数量"
	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_ADD_TEXT"] = "设定提示中是否显示物品数量"
	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_COLOUR_TEXT"] = "设定物品数量文字颜色"
	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_VAULT_TABS"] = "显示标签"
	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_VAULT_TABS_TEXT"] = "显示 %1$s 中的物品标签ID" -- %1$s = vault
	L["CONFIG_SYSTEM_TOOLTIP_SCALE_TEXT"] = "游戏缩放比例，参照（游戏宽度）"
	L["CONFIG_SYSTEM_TOOLTIP_CLASSCOLOUR_TEXT"] = "使用职业颜色显示玩家名称"
	L["CONFIG_SYSTEM_TOOLTIP_SELF_ONLY"] = "当前角色"
	L["CONFIG_SYSTEM_TOOLTIP_SELF_ONLY_TEXT"] = "只显示当前角色的物品计数"
--	L["CONFIG_SYSTEM_TOOLTIP_HIGHLIGHT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_HIGHLIGHT_TEXT"] = ""
	L["CONFIG_SYSTEM_TOOLTIP_FACTION_ONLY"] = "仅当前阵营"
	L["CONFIG_SYSTEM_TOOLTIP_FACTION_ONLY_TEXT"] = "只显示当前阵营数据"
--	L["CONFIG_SYSTEM_TOOLTIP_REALM_ONLY"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_REALM_ONLY_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_CROSSREALM"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_CROSSREALM_TEXT"] = ""
	L["CONFIG_SYSTEM_TOOLTIP_VAULT_TEXT"] = "包括 %1$s 的数据" -- %1$s = vault
--	L["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_SOURCE_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_DESCRIPTION_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_CUSTOM_ENABLE_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_MOUSEOVER_ENABLE_TEXT"] = ""
	
	L["CONFIG_SYSTEM_WORKAROUND"] = "错误修正/绕开"
	L["CONFIG_SYSTEM_WORKAROUND_TEXT"] = "切换代码修正或者绕开这个问题"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL"] = "框架级别"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_TEXT"] = "一个出自暴雪CreateFrame API的错误, 有可能引致框架背景在前景上出现的情况, 物品提示不会出现, 而且也不可能点击那个窗口里的任何东西."
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_TEXT"] = "改变错误修正警告的显示方式"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE0"] = "禁用"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE0_TEXT"] = "禁用错误修正警告"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE1"] = "短"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE1_TEXT"] = "以简短模式显示错误修正警告"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE2"] = "长"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE2_TEXT"] = "以详细模式显示错误修正警告"
	L["CONFIG_SYSTEM_WORKAROUND_ZEROSIZEBAG"] = "无空间背包"
	L["CONFIG_SYSTEM_WORKAROUND_ZEROSIZEBAG_TEXT"] = "一个未知的bug，导致无法正常获取背包当前空间."
	L["CONFIG_SYSTEM_WORKAROUND_ZEROSIZEBAG_ALERT_TEXT"] = "显示此Bug警告"
--	L["CONFIG_SYSTEM_WORKAROUND_COMBAT_YIELD"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_COMBAT_YIELD_ENABLED_TEXT"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_COMBAT_YIELD_COUNT_TEXT"] = ""
--	L["BUGFIX_TAINTED_ALERT_MOUSEOVER_TEXT"] = ""
--	L["BUGFIX_TAINTED_ALERT_OPEN_TEXT"] = ""
	
	L["CONFIG_SYSTEM_MESSAGES"] = "信息/警告"
--	L["CONFIG_SYSTEM_MESSAGES_RESTACK_TEXT"] = ""
	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION"] = "翻译"
	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION_INTERIM"] = "临时"
	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION_INTERIM_TEXT"] = "显示尝试翻译每个条目的信息"
	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION_FINAL"] = "最终的"
	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION_FINAL_TEXT"] = "显示最终成功翻译的信息"
--	L["CONFIG_SYSTEM_MESSAGES_BATTLEPET_OPPONENT"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_BATTLEPET_OPPONENT_TEXT"] = ""
	
--	L["CONFIG_SYSTEM_TIMERS"] = ""
--	L["CONFIG_SYSTEM_TIMERS_TEXT"] = ""
	
	
--	configuration options > auto
	L["CONFIG_AUTO"] = "自动开关"
	
	L["CONFIG_AUTO_OPEN"] = " %1$s %2$s 将被开启, 当你..."
	L["CONFIG_AUTO_OPEN_BANK"] = "开启银行"
	L["CONFIG_AUTO_OPEN_VAULT"] = "开启公会银行"
	L["CONFIG_AUTO_OPEN_MAIL"] = "开启邮箱"
	L["CONFIG_AUTO_OPEN_MERCHANT"] = "开启一个商人/商店"
	L["CONFIG_AUTO_OPEN_TRADE"] = "开启一个交易"
	L["CONFIG_AUTO_OPEN_AUCTION"] = "开启拍卖行"
--	L["CONFIG_AUTO_OPEN_VOID"] = ""
	
	L["CONFIG_AUTO_CLOSE"] = "%1$s %2$s 将被关闭, 当你..."
	L["CONFIG_AUTO_CLOSE_BANK"] = "关闭银行"
	L["CONFIG_AUTO_CLOSE_VAULT"] = "关闭公会银行"
	L["CONFIG_AUTO_CLOSE_MAIL"] = "关闭邮箱"
	L["CONFIG_AUTO_CLOSE_MERCHANT"] = "关闭商人/商店"
	L["CONFIG_AUTO_CLOSE_TRADE"] = "关闭交易"
	L["CONFIG_AUTO_CLOSE_AUCTION"] = "关闭拍卖行"
--	L["CONFIG_AUTO_CLOSE_VOID"] = ""
	L["CONFIG_AUTO_CLOSE_COMBAT"] = "进入战斗"
	
	
--	configuration options > control
	L["CONFIG_CONTROL_MONITOR"] = "监控"
	L["CONFIG_CONTROL_MONITOR_TEXT"] = "为此角色(%2$s)对 %1$s 数据建立监控."
	L["CONFIG_CONTROL_SAVE_TEXT"] = "记录 %1$s 的数据为 (%2$s) 角色， 使你可以在使用其他角色 (或离线！？)的时候进行查看."
	L["CONFIG_CONTROL_NOTIFY_ERASE_TEXT"] = "删除 %s 数据时，生成一个通知"
	L["CONFIG_CONTROL_OVERRIDE"] = "取代系统框架"
	L["CONFIG_CONTROL_OVERRIDE_TEXT"] = "设定是否取代系统内建背包及银行\n\n停用此项功能的话，你只能在按键设定中设定，才能开启 %1$s"
--	L["CONFIG_CONTROL_SPECIAL_TEXT"] = ""
	L["CONFIG_CONTROL_ANCHOR_LOCK_TEXT"] = "锁定 %1$s 窗口到当前移动的位置"
	L["CONFIG_CONTROL_REPOSITION_NOW"] = "立即复位"
	L["CONFIG_CONTROL_REPOSITION_NOW_TEXT"] = "立即复位 %1$s 窗口" -- %1$s = location name
	L["CONFIG_CONTROL_BLUEPRINT_TEXT"] = "在此窗口应用 %1$s 的设置"
	
	
--	configuration settings > design
--	L["CONFIG_DESIGN"] = ""
--	L["CONFIG_DESIGN_PLURAL"] = ""
	
--	L["CONFIG_STYLE"] = ""
--	L["CONFIG_STYLE_PLURAL"] = ""
--	L["CONFIG_STYLE_DESCRIPTION"] = ""
	
--	L["CONFIG_LAYOUT"] = ""
--	L["CONFIG_LAYOUT_PLURAL"] = ""
--	L["CONFIG_LAYOUT_DESCRIPTION"] = ""
	
	L["CONFIG_DESIGN_WINDOW"] = "窗口"
	L["CONFIG_DESIGN_WINDOW_SCALE_TEXT"] = "设定缩放窗口的大小比例"
	L["CONFIG_DESIGN_WINDOW_PADDING_TEXT"] = "设定窗口边缘至分组的间隔距离"
	L["CONFIG_DESIGN_WINDOW_WIDTH_TEXT"] = "设定一行所能包含的物品格子数目"
--	L["CONFIG_DESIGN_WINDOW_HEIGHT_TEXT"] = ""
	L["CONFIG_DESIGN_WINDOW_BACKGROUND_COLOUR_TEXT"] = "设定主要窗口的背景颜色"
	L["CONFIG_DESIGN_WINDOW_BORDER_SHOW_TEXT"] = "设定主窗口边框是否显示"
	L["CONFIG_DESIGN_WINDOW_BORDER_STYLE_TEXT"] = "设定主窗口边框的风格"
	L["CONFIG_DESIGN_WINDOW_BORDER_COLOUR_TEXT"] = "设定主要窗口的边框颜色"
	
--	L["CONFIG_DESIGN_FRAME_HIDE_TEXT"] = "查看 %1$s 窗口时，不显示 %2$s 的层"
	
	L["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT"] = "背包标示颜色"
	L["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT_TEXT"] = "当鼠标指向背包时，高亮该背包所有包格"
	L["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT_COLOUR_TEXT"] = "设定标示鼠标目前指向的背包的对应格子颜色"
	L["CONFIG_DESIGN_FRAME_CHANGER_FREE"] = "显示数量"
	L["CONFIG_DESIGN_FRAME_CHANGER_FREE_TEXT"] = "是否显示空格数量"
	L["CONFIG_DESIGN_FRAME_CHANGER_FREE_COLOUR_TEXT"] = "设置空格数量文本颜色"
	
	L["CONFIG_DESIGN_FRAME_STATUS_EMPTY"] = "清空标签文字"
	L["CONFIG_DESIGN_FRAME_STATUS_EMPTY_TEXT"] = "显示空标签文字"
	
--	L["CONFIG_DESIGN_FRAME_SEARCH_LABEL_COLOUR_TEXT"] = ""
--	L["CONFIG_DESIGN_FRAME_SEARCH_TEXT_COLOUR_TEXT"] = ""
	
	L["CONFIG_DESIGN_FRAME_TITLE_SIZE_NORMAL"] = "普通"
	L["CONFIG_DESIGN_FRAME_TITLE_SIZE_THIN"] = "细"
--	L["CONFIG_DESIGN_FRAME_TITLE_ONLINE_COLOUR_TEXT"] = ""
--	L["CONFIG_DESIGN_FRAME_TITLE_OFFLINE_COLOUR_TEXT"] = ""
	
	L["CONFIG_DESIGN_BAR"] = "分组"
	L["CONFIG_DESIGN_BAR_PER_ROW"] = "横向分组数目"
	L["CONFIG_DESIGN_BAR_PER_ROW_TEXT"] = "设定横向所能包含的分组数目"
	L["CONFIG_DESIGN_BAR_BACKGROUND_TEXT"] = "设定分组的背景颜色"
	L["CONFIG_DESIGN_BAR_COMPACT"] = "简洁模式"
	L["CONFIG_DESIGN_BAR_COMPACT_TEXT"] = "以现有顺序显示所有非空格子"
	L["CONFIG_DESIGN_BAR_SHOW_EMPTY"] = "显示空格"
	L["CONFIG_DESIGN_BAR_SHOW_EMPTY_TEXT"] = "设定是否显示空白分组"
	L["CONFIG_DESIGN_BAR_PADDING_INTERNAL_TEXT"] = "分组和物品之间的距离"
	L["CONFIG_DESIGN_BAR_PADDING_EXTERNAL_TEXT"] = "分组之间的距离"
	L["CONFIG_DESIGN_BAR_BORDER_TEXT"] = "设定是否显示分组边框"
	L["CONFIG_DESIGN_BAR_BORDER_STYLE_TEXT"] = "设定分组边框的风格"
	L["CONFIG_DESIGN_BAR_BORDER_COLOUR_TEXT"] = "设定分组的边框颜色"
	L["CONFIG_DESIGN_BAR_NAME_TEXT"] = "分组名称设置"
	L["CONFIG_DESIGN_BAR_NAME_SHOW_TEXT"] = "是否显示分组名称"
	L["CONFIG_DESIGN_BAR_NAME_COLOUR_TEXT"] = "分组外框颜色设置"
	L["CONFIG_DESIGN_BAR_NAME_HEIGHT_TEXT"] = "设置标签名称空间尺寸"
	L["CONFIG_DESIGN_BAR_NAME_ANCHOR_TEXT"] = "设置标签名称锚点"
	
	L["CONFIG_DESIGN_ITEM_PADDING_TEXT"] = "设定物品格子的间隔距离"
	L["CONFIG_DESIGN_ITEM_HIDDEN"] = "显示隐藏物品"
	L["CONFIG_DESIGN_ITEM_HIDDEN_TEXT"] = "设定是否显示在隐藏分组内的物品"
	L["CONFIG_DESIGN_ITEM_FADE"] = "淡化脱机物品"
	L["CONFIG_DESIGN_ITEM_FADE_TEXT"] = "设定是否淡化显示脱机物品"
	L["CONFIG_DESIGN_ITEM_TINT_USABLE"] = "着色无效物品"
	L["CONFIG_DESIGN_ITEM_TINT_USABLE_TEXT"] = "给不能使用的物品蒙上红色"
--	L["CONFIG_DESIGN_ITEM_ITEMLEVEL_SHOW"] = ""
--	L["CONFIG_DESIGN_ITEM_ITEMLEVEL_SHOW_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_COMPRESS"] = ""
--	L["CONFIG_DESIGN_ITEM_COMPRESS_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_ITEMCOUNT_SHOW"] = ""
--	L["CONFIG_DESIGN_ITEM_ITEMCOUNT_SHOW_TEXT"] = ""
	
--	L["CONFIG_DESIGN_ITEM_COOLDOWN_SHOW_TEXT"] = "显示 %1$s 窗口中的物品冷却"
	L["CONFIG_DESIGN_ITEM_COOLDOWN_GLOBAL"] = "按照 GCD 更新"
	L["CONFIG_DESIGN_ITEM_COOLDOWN_GLOBAL_TEXT"] = "GCD 更新时，刷新 窗口内物品冷却"
	L["CONFIG_DESIGN_ITEM_COOLDOWN_COMBAT"] = "战斗时刷新"
	L["CONFIG_DESIGN_ITEM_COOLDOWN_COMBAT_TEXT"] = "战斗时，或战斗结束时刷新 窗口内物品冷却"
	
	L["CONFIG_DESIGN_ITEM_BORDER_SHOW_TEXT"] = "设置物品边框是否显示"
	L["CONFIG_DESIGN_ITEM_BORDER_STYLE_TEXT"] = "设置物品边框的风格"
	L["CONFIG_DESIGN_ITEM_BORDER_RARITY"] = "稀有物品边框着色"
	L["CONFIG_DESIGN_ITEM_BORDER_RARITY_TEXT"] = "物品边框是否按照稀有度进行着色"
	L["CONFIG_DESIGN_ITEM_BORDER_RARITY_CUTOFF"] = "稀有度界线"
	L["CONFIG_DESIGN_ITEM_BORDER_RARITY_CUTOFF_TEXT"] = "只对稀有度不低于 %s 的物品边框进行染色"
	L["CONFIG_DESIGN_ITEM_BORDER_TEXTURE_OFFSET_TEXT"] = "设置物品边框平滑度采用的像素数量 (用于与物品材质融合)"
	
--	L["CONFIG_DESIGN_ITEM_NEW"] = ""
--	L["CONFIG_DESIGN_ITEM_NEW_ENABLED_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_NEW_CUTOFF_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_NEW_RESET_TEXT"] = ""
	
	L["CONFIG_DESIGN_ITEM_AGE"] = "新物品"
	L["CONFIG_DESIGN_ITEM_AGE_SHOW_TEXT"] = "显示新物品文字"
	L["CONFIG_DESIGN_ITEM_AGE_COLOUR_TEXT"] = "设定新物品文字颜色"
	L["CONFIG_DESIGN_ITEM_AGE_CUTOFF_TEXT"] = "显示低于此时间的物品获取时间. 0 表示始终显示"
	
	L["CONFIG_DESIGN_ITEM_EMPTY"] = "空格"
	L["CONFIG_DESIGN_ITEM_EMPTY_ICON_TEXT"] = "切换是否使用图示来表示空格子"
	L["CONFIG_DESIGN_ITEM_EMPTY_CLUMP"] = "整合空格"
	L["CONFIG_DESIGN_ITEM_EMPTY_CLUMP_TEXT"] = "设定是否将同背包的空格跟非空格凑在一起，或将不同背包的空格视为一个特殊类别"
	L["CONFIG_DESIGN_ITEM_EMPTY_BORDER"] = "边框着色"
	L["CONFIG_DESIGN_ITEM_EMPTY_BORDER_TEXT"] = "切换是否依空格子的背包类别来着色边框"
	L["CONFIG_DESIGN_ITEM_EMPTY_COLOUR"] = "空格着色"
	L["CONFIG_DESIGN_ITEM_EMPTY_COLOUR_TEXT"] = "设定空 %1$s 格子的边框和背景颜色"
--	L["CONFIG_DESIGN_ITEM_EMPTY_ALPHA"] = ""
--	L["CONFIG_DESIGN_ITEM_EMPTY_ALPHA_TEXT"] = ""
	L["CONFIG_DESIGN_ITEM_EMPTY_STATUS"] = "显示格式"
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
	
	L["CONFIG_SORTING_SORT"] = "排序"
	
--	L["CONFIG_SORTING_METHOD"] = ""
--	L["CONFIG_SORTING_METHOD_PLURAL"] = ""
	L["CONFIG_SORTING_METHOD_TEXT"] = "选择物品排序规则"
	L["CONFIG_SORTING_METHOD_BAGSLOT"] = "依背包/格子"
	L["CONFIG_SORTING_METHOD_BAGSLOT_TEXT"] = "依背包/格子编号排序物品"
	L["CONFIG_SORTING_METHOD_USER"] = "自定义"
	L["CONFIG_SORTING_METHOD_USER_TEXT"] = "排列物品时是否包含自定义排列"
	
--	L["CONFIG_SORTING_BAG"] = ""
--	L["CONFIG_SORTING_BAGS"] = ""
--	L["CONFIG_SORTING_BAG_TEXT"] = ""
	
	L["CONFIG_SORTING_INCLUDE_NAME"] = "物品名称"
	L["CONFIG_SORTING_INCLUDE_NAME_TEXT"] = "排列物品时是否包含物品名称"
	L["CONFIG_SORTING_INCLUDE_NAME_REVERSE"] = "包括反转(!?)的名称"
	L["CONFIG_SORTING_INCLUDE_NAME_REVERSE_TEXT"] = "是否包括反转名称开关.\n\n例如超级法力合剂 -> 法力超级合剂"
	L["CONFIG_SORTING_INCLUDE_QUALITY"] = "包括物品稀有度"
	L["CONFIG_SORTING_INCLUDE_QUALITY_TEXT"] = "排列物品时是否包含物品稀有度"
	L["CONFIG_SORTING_INCLUDE_LOCATION"] = "包括物品装备位置"
	L["CONFIG_SORTING_INCLUDE_LOCATION_TEXT"] = "排列物品时是否包含物品装备位置.\n\n注：只影响可以装备的物品"
	L["CONFIG_SORTING_INCLUDE_ITEMTYPE"] = "物品类型和子类型"
	L["CONFIG_SORTING_INCLUDE_ITEMTYPE_TEXT"] = "排列物品时是否包含物品类型和子类型."
	L["CONFIG_SORTING_INCLUDE_CATEGORY"] = "包括物品分类"
	L["CONFIG_SORTING_INCLUDE_CATEGORY_TEXT"] = "排列物品时是否包含物品分类"
	L["CONFIG_SORTING_INCLUDE_ITEMUSELEVEL"] = "物品（需要）等级"
	L["CONFIG_SORTING_INCLUDE_ITEMUSELEVEL_TEXT"] = "排列物品时是否包含物品（需要）等级."
	L["CONFIG_SORTING_INCLUDE_ITEMSTATLEVEL"] = "物品 (本身) 等级"
	L["CONFIG_SORTING_INCLUDE_ITEMSTATLEVEL_TEXT"] = "排列物品时是否包含物品 (本身) 等级."
	L["CONFIG_SORTING_INCLUDE_ITEMAGE"] = "物品时间"
	L["CONFIG_SORTING_INCLUDE_ITEMAGE_TEXT"] = "排列物品时是否包含物品时间."
	L["CONFIG_SORTING_INCLUDE_VENDORPRICE"] = "商店价格"
	L["CONFIG_SORTING_INCLUDE_VENDORPRICE_TEXT"] = "排列物品时是否参考商店价格（当前堆叠数量价格）."
--	L["CONFIG_SORTING_INCLUDE_ID"] = ""
--	L["CONFIG_SORTING_INCLUDE_ID_TEXT"] = ""
	
	L["CONFIG_SORTING_DIRECTION_TEXT"] = "设置物品升序、降序排列"
	L["CONFIG_SORTING_ORDER"] = "分类排序"
	L["CONFIG_SORTING_MOVE_UP_TEXT"] = "将 %1$s 在分类排序中上移"
	L["CONFIG_SORTING_MOVE_DOWN_TEXT"] = "将 %1$s 在分类排序中下移"
	L["CONFIG_SORTING_NOT_INCLUDED"] = "* 没有包含到当前排序 *"
	
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
	
	L["CATEGORY_RULE"] = "规则"
	L["CONFIG_RULE_PLURAL"] = "规则"
	
	L["CONFIG_RULE_SHOWDISABLED"] = "显示禁用的规则"
	L["CONFIG_RULE_SHOWDISABLED_TEXT"] = "禁用规则显示开关"
	
--	L["CONFIG_CATEGORY_CUSTOM"] = ""
	L["CONFIG_CATEGORY_CUSTOM_PLURAL"] = "自定义分类"
	
--	L["CONFIG_CATEGORY_SET"] = ""
--	L["CONFIG_CATEGORY_SET_PLURAL"] = ""
--	L["CONFIG_CATEGORY_SET_DESCRIPTION"] = ""
	
--	L["CONFIG_PROFILE"] = ""
--	L["CONFIG_PROFILE_PLURAL"] = ""
--	L["CONFIG_PROFILE_CURRENT"] = ""
	
	
--	L["CONFIG_OBJECT_DELETED"] = ""
	
	
--	configuration options > debug
	L["CONFIG_DEBUG"] = "Debug 模式"
	L["CONFIG_DEBUG_TEXT"] = "Debug 模式开关"
	
	
--	configuration options > generic
	L["CONFIG_BORDER_SCALE_TEXT"] = "设置边框材质缩放"
	L["CONFIG_BORDER_TEXTURE_TEXT"] = "物品材质选项"
	L["CONFIG_BORDER_TEXTURE_FILE_TEXT"] = "用于边框的材质 (改变此设置重置缩放比例为 100%)"
	L["CONFIG_BORDER_TEXTURE_HEIGHT_TEXT"] = "材质高度 (像素) "
	
	
--	rules frame
	L["RULE"] = "规则"
	L["RULE_HIDDEN"] = "隐藏"
	L["RULE_FORMULA"] = "公式"
	L["RULE_LIST_ENABLED"] = "使用"
	L["RULE_LIST_DAMAGED"] = "损坏"
	L["RULE_LIST_ID"] = "规则"
	
	L["RULE_DAMAGED"] = "当期规则设置 %s 为损坏的，除非修理不能使用"
--	L["RULE_DAMAGED_TEXT"] = ""
	L["RULE_FAILED"] = "错误验证规则 %s"
	L["RULE_FAILED_KEY_NIL"] = "旧的关键字为空"
	L["RULE_FAILED_DATA_NIL"] = "旧数据为空"
	L["RULE_FAILED_DESCRIPTION_NIL"] = "无法找到描述信息"
	L["RULE_FAILED_FORMULA_NIL"] = "无法找到格式"
	L["RULE_FAILED_FORMULA_BAD"] = "无效的格式"
	L["RULE_FAILED_ARGUMENT_IS_NIL"] = "%1$s( ... ), 原因 %2$i 为 nil"
--	L["RULE_FAILED_ARGUMENT_IS_NOT"] = ""
	L["RULE_FAILED_ARGUMENT_IS_INVALID"] = "%1$s( ... ), 原因 %2$i 不是 %3$s"
	L["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"] = "%1$s( ... ), 未指定的错误原因"
	
	
--	new item indicators
	L["NEW_ITEM_INCREASE"] = "增"
	L["NEW_ITEM_DECREASE"] = "减"
--	L["NEW_ITEM_GLOW"] = ""
	
	
--	slash commands
	L["SLASH_UI"] = "UI"
	L["SLASH_UI_TEXT"] = "UI 设置"
	L["SLASH_UI_RESET"] = "重置"
	L["SLASH_UI_RESET_TEXT"] = "将界面重置到屏幕中心"
	L["SLASH_UI_RESET_COMPLETE_TEXT"] = "所有 UI 窗口将重置到屏幕中心"
	L["SLASH_DB"] = "数据"
	L["SLASH_DB_TEXT"] = "数据设置"
	L["SLASH_DB_RESET"] = "重置"
	L["SLASH_DB_RESET_TEXT"] = "重置所有设置为默认设置 - defaults "
	L["SLASH_DB_RESET_CONFIRM"] = "确认"
	L["SLASH_DB_RESET_CONFIRM_TEXT"] = "确认数据重置"
	L["SLASH_DB_RESET_COMPLETE_TEXT"] = "配置已重置，所有设置已设为默认 - defaults "
	L["SLASH_CACHE"] = "缓存"
	L["SLASH_CACHE_TEXT"] = "缓存设置"
	L["SLASH_CACHE_ERASE"] = "清除"
	L["SLASH_CACHE_ERASE_TEXT"] = "清除所有缓存数据"
	L["SLASH_CACHE_ERASE_CONFIRM"] = "确认"
	L["SLASH_CACHE_ERASE_CONFIRM_TEXT"] = "确认清除缓存数据"
	L["SLASH_CACHE_ERASE_COMPLETE_TEXT"] = "所有缓存数据清除！"
	L["SLASH_MISC"] = "杂类"
	L["SLASH_MISC_TEXT"] = "杂类选项"
	L["SLASH_TRACK"] = "追踪"
	L["SLASH_TRACK_TEXT"] = "从追踪列表中添加或移除物品"
--	L["SLASH_TRACK_ADD_TEXT"] = ""
--	L["SLASH_TRACK_REMOVE_TEXT"] = ""

	
--	misc chat stuff
	L["UPGRADE_PROFILE"] = "更新配置文件 %1$s 到 %2$d"
	L["UPGRADE_GLOBAL"] = "更新全局配置文件 %1$s 到 v%2$d"
	L["UPGRADE_CHAR"] = "更新角色 %1$s 的数据到 v%2$d"
	
	L["MISC_ALERT"] = "警告!"
	L["MISC_ALERT_FRAMELEVEL_1"] = "Bug 修正完毕."
	L["MISC_ALERT_FRAMELEVEL_2"] = "当前 %1$s 窗口界面级别在 %2$s 并且被重置到 %3$s 以确保回收模式.  由于此 bug 修正带来的 lag 现象向您道歉."
	
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
	
	
--	generic text
	L["AUTOMATIC"] = "自动"
	L["BOTTOMLEFT"] = "左下角"
	L["BOTTOMRIGHT"] = "右下角"
	L["TOPLEFT"] = "左上角"
	L["TOPRIGHT"] = "右上角"
	L["TOP"] = "上"
	L["BOTTOM"] = "下"
	L["LEFT"] = "左"
	L["RIGHT"] = "右"
	L["HORIZONTAL"] = "水平"
	L["VERTICAL"] = "垂直"
	L["CLOSE_MENU"] = "关闭选单"
	L["ANCHOR"] = "锚点"
	L["ANCHOR_TEXT1"] = "设置锚点"
	L["ANCHOR_TEXT2"] = "将 %1$s 的锚点设置在 %2$s"
	L["BORDER_TEXT"] = "边框设置"
	L["FILE"] = "文件"
	L["HEIGHT"] = "高"
	L["SCALE"] = "缩放"
	L["TEXTURE"] = "材质"
	L["FONT"] = "字体"
	L["BACKGROUND_COLOUR"] = "背景颜色"
	L["STYLE"] = "风格"
	L["ALERT"] = "警报"
	L["PADDING"] = "间隔"
	L["INTERNAL"] = "内部"
	L["EXTERNAL"] = "外部"
	L["WIDTH"] = "格子数目"
	L["DIRECTION"] = "排列方向"
	L["ASCENDING"] = "升序"
	L["DECENDING"] = "降序"
	L["LOCATION"] = "位置"
	L["CLEAR"] = "清除"
--	L["DHMS"] = "DHMS"
	L["OPEN"] = "打开"
	L["RANDOM"] = "随机"
	L["RELOAD"] = "重载"
	L["MOVE_UP"] = "上移"
	L["MOVE_DOWN"] = "下移"
	L["SORT_METHOD"] = "排序规则"
	L["SORT_BY_NAME"] = "按名称排序"
	L["SORT_BY_NUMBER"] = "按数字排序"
	L["INSERT"] = "插入空白分组"
	L["CURRENT"] = "目前指定"
	L["OFFSET"] = "附加设置"
	L["NUMBER"] = "数字"
	L["STRING"] = "字符串"
	L["COOLDOWN"] = "冷却"
	L["FRAMES"] = "框架"
	L["CLICK_TO_SELECT"] = "点击选取"
	L["CLICK_TO_DESELECT"] = "点击放弃选取"
	L["CLICK_TO_IGNORE"] = "点击忽略"
	L["ORDER"] = "顺序"
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
	L["NOTIFY"] = "通知"
--	L["ACTION"] = ""
--	L["FIRST"] = ""
--	L["LAST"] = ""
--	L["NONE_USABLE"] = ""
--	L["NONE_OWNED"] = ""
	
	
--	libdatabroker
--	L["LDB"] = ""
	L["LDB_BAGS_COLOUR_USE"] = "使用颜色"
	L["LDB_BAGS_COLOUR_USE_TEXT"] = "使用空格颜色标记文本"
	L["LDB_BAGS_STYLE"] = "全部显示"
	L["LDB_BAGS_STYLE_TEXT"] = "显示所有使用的包格以及包格总数"
	L["LDB_BAGS_INCLUDE_TYPE"] = "包括背包类型"
	L["LDB_BAGS_INCLUDE_TYPE_TEXT"] = "在文本中显示背包类型"
	L["LDB_TRACKING_CURRENCY"] = "货币/牌子"
	L["LDB_PETS_SUMMON"] = "召唤宠物"
	L["LDB_MOUNTS_NOT_HERE"] = "没有可用的坐骑"
	L["LDB_MOUNTS_TYPE_L"] = "陆地"
--	L["LDB_MOUNTS_TYPE_U"] = ""
--	L["LDB_MOUNTS_TYPE_S"] = ""
--	L["LDB_MOUNTS_TYPE_X"] = ""
--	L["LDB_MOUNTS_FLYING_USEFORLAND"] = ""
--	L["LDB_MOUNTS_FLYING_USEFORLAND_TEXT"] = ""
	L["LDB_MOUNTS_FLYING_DISMOUNT"] = "取消飞行"
	L["LDB_MOUNTS_FLYING_DISMOUNT_TEXT"] = "Enabled = 允许取消飞行.\n\nDisabled = 取消飞行时必须着陆"
	L["LDB_MOUNTS_FLYING_DISMOUNT_WARNING"] = "飞行中，请着陆后选择其他坐骑"
	L["LDB_MOUNTS_SUMMON"] = "召唤坐骑"
	L["LDB_MOUNTS_NODATA"] = "未知/改变"
	L["LDB_MOUNTS_TOOLTIP_SELECTION"] = "选择"
--	L["LDB_MOUNTS_TRAVEL_FORM"] = ""
--	L["LDB_MOUNTS_TRAVEL_FORM_TEXT"] = ""
	L["LDB_COMPANION_MISSING"] = "你丢失了坐骑，重置为随机"
	L["LDB_COMPANION_NONE"] = "无可用"
	L["LDB_COMPANION_RESTRICTED"] = "%s\n%s\n\n你需要或不需要满足坐骑所需的合适环境|r"
	L["LDB_COMPANION_RESTRICTED_ZONE"] = "需要特别情况召唤"
	L["LDB_COMPANION_RESTRICTED_ITEM"] = "尝试召唤"
	L["LDB_COMPANION_RESTRICTED_EVENT"] = "需要特殊事件召唤"
--	L["LDB_COMPANION_RESTRICTED_UNKNOWN"] = ""
	L["LDB_COMPANION_NODATA_TEXT"] = "\n%s [%s] 的坐骑数据不存在.\n\n请通知作者更新以上数据."
	L["LDB_COMPANION_SELECT"] = "\n添加 %s 到已选择组, 以便能随机召唤坐骑.\n\n全选坐骑将打开随机召唤选项"
	L["LDB_COMPANION_DESELECT"] = "\n从已选择组移除 %s .\n\n全部移除坐骑也可以打开随机选项"
	L["LDB_COMPANION_IGNORE"] = "\n随机模式时不召唤 %s "
