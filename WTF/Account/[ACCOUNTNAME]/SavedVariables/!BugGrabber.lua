
BugGrabberDB = {
	["session"] = 72,
	["lastSanitation"] = 3,
	["errors"] = {
		{
			["message"] = "Interface\\AddOns\\LUI\\unitframes\\layout\\layout.lua:2919: attempt to index field 'DruidMana' (a nil value)",
			["time"] = "2016/10/09 22:38:26",
			["locals"] = "(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = \"attempt to index field 'DruidMana' (a nil value)\"\noufdb = <table> {\n Castbar = <table> {\n }\n Icons = <table> {\n }\n Fader = <table> {\n }\n Aura = <table> {\n }\n Bars = <table> {\n }\n Texts = <table> {\n }\n}\nself = oUF_LUI_player {\n 0 = <userdata>\n Highlight = <unnamed> {\n }\n PARTY_LOOT_METHOD_CHANGED = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\masterlooter.lua:73\n UNIT_MAXPOWER = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\power.lua:220\n UNIT_SPELLCAST_CHANNEL_START = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\castbar.lua:256\n Resting = <unnamed> {\n }\n UNIT_MAXHEALTH = <table> {\n }\n PLAYER_UPDATE_RESTING = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\resting.lua:52\n UNIT_POWER_FREQUENT = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\power.lua:220\n UNIT_POWER_BAR_SHOW = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\power.lua:220\n UNIT_SPELLCAST_NOT_INTERRUPTIBLE = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\castbar.lua:204\n PLAYER_REGEN_DISABLED = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\combat.lua:52\n style = \"LUI\"\n RAID_TARGET_UPDATE = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\ricons.lua:58\n UNIT_CONNECTION = <table> {\n }\n Debuffs = <unnamed> {\n }\n BarFade = false\n UNIT_HEAL_PREDICTION = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\healprediction.lua:151\n unit = \"player\"\n UNIT_SPELLCAST_DELAYED = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\castbar.lua:218\n UNIT_SPELLCAST_STOP = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\castbar.lua:238\n XP = <unnamed> {\n }\n UPDATE_FACTION = <function> defined @Interface\\AddOns\\LUI\\unitframes\\plugins\\oUF_Reputation.lua:48\n HealPrediction = <table> {\n }\n Rep = <unnamed> {\n }\n Experience = <unnamed> {\n }\n Overlay = <unnamed> {\n }\n Combat = <unnamed> {\n }\n __tags = <table> {\n }\n PLAYER_ENTERING_WORLD = <table> {\n }\n Full = <unnamed> {\n }\n UNIT_SPELLCAST_INTERRUPTIBLE = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\castbar.lua:190\n PLAYER_FLAGS_CHANGED = <function> defined @Interface\\AddOns\\LUI\\unitframes\\layout\\layout.lua:3812\n __elements = <table> {\n }\n _V2Tex = <unnamed> {\n }\n Power = <unnamed> {\n }\n UNIT_DISPLAYPOWER = <table> {\n }\n UPDATE_EXHAUSTION = <function> defined @Interface\\AddOns\\LUI\\unitframes\\plugins\\oUF_Experience.lua:92\n DruidMana = <unnamed> {\n }\n SmoothBar = <function> defined @Interface\\AddOns\\LUI\\unitframes\\plugins\\oUF_Smooth.lua:17\n UNIT_COMBAT = <function> defined @Interface\\AddOns\\LUI\\unitframes\\plugins\\oUF_CombatFeedback.lua:62\n UNIT_HEALTH = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\healprediction.lua:151\n Fader = <table> {\n }\n PLAYER_REGEN_ENABLED = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\combat.lua:52\n UNIT_SPELLCAST_CHANNEL_STOP = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\castbar.lua:332\n UNIT_SPELLCAST_CHANNEL_UPDATE = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\castbar.lua:309\n UNIT_SPELLCAST_INTERRUPTED = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\castbar.lua:172\n Info = <unnamed> {\n }\n UNIT_SPELLCAST_START = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\castbar.lua:104\n UNIT_PET_EXPERIENCE = <function> defined @Interface\\AddOns\\LUI\\unitframes\\plugins\\oUF_Experience.lua:92\n PLAYER_LEVEL_UP = <function> defined @Interface\\AddOns\\LUI\\unitframes\\plugins\\oUF_Experience.lua:92\n UNIT_ABSORB_AMOUNT_CHANGED = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\healprediction.lua:151\n UNIT_ENTERED_VEHICLE = <table> {\n }\n PLAYER_ROLES_ASSIGNED = <function> defined @Interface\\AddOns\\LUI\\unitframes\\core\\elements\\lfdrole.lua:57\n MoveableFrames = true\n Leader = <unnamed> {\n }\n GROUP_ROSTER_UPDATE = <table> {\n }\n PLAYER_XP_UPDATE = <function> defined @Interface\\AddOns\\LUI\\uni",
			["stack"] = "Interface\\AddOns\\LUI\\unitframes\\layout\\layout.lua:2919: in function <Interface\\AddOns\\LUI\\unitframes\\layout\\layout.lua:2918>\n[C]: in function `Show'\nInterface\\AddOns\\LUI\\unitframes\\layout\\layout.lua:2967: in function `DruidMana'\nInterface\\AddOns\\LUI\\unitframes\\options\\toggle.lua:1020: in function `ApplySettings'\nInterface\\AddOns\\LUI\\unitframes\\options\\toggle.lua:92: in function `?'\nInterface\\AddOns\\LUI\\unitframes\\options\\toggle.lua:57: in function `ToggleUnit'\nInterface\\AddOns\\LUI\\unitframes\\init.lua:123: in function `Refresh'\nInterface\\AddOns\\LUI\\LUI-v3.9.10-781.lua:1890: in function <Interface\\AddOns\\LUI\\LUI.lua:1888>\n...urse\\svn\\CallbackHandler-1.0\\CallbackHandler-1.0-6.lua:155: in function <...urse\\svn\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:155>\n[string \"safecall Dispatcher[3]\"]:4: in function <[string \"safecall Dispatcher[3]\"]:4>\n[C]: ?\n[string \"safecall Dispatcher[3]\"]:13: in function `?'\n...\n[string \"safecall Dispatcher[3]\"]:9: in function <[string \"safecall Dispatcher[3]\"]:5>\n(tail call): ?\n...ntory\\Externals\\curse\\svn\\Ace3-AceGUI\\AceGUI-3.0-34.lua:314: in function `Fire'\n...se\\svn\\Ace3-AceGUI\\widgets\\AceGUIWidget-DropDown.lua:442: in function <...se\\svn\\Ace3-AceGUI\\widgets\\AceGUIWidget-DropDown.lua:433>\n(tail call): ?\n[C]: ?\n[string \"safecall Dispatcher[3]\"]:9: in function <[string \"safecall Dispatcher[3]\"]:5>\n(tail call): ?\n...ntory\\Externals\\curse\\svn\\Ace3-AceGUI\\AceGUI-3.0-34.lua:314: in function `Fire'\n...\\Ace3-AceGUI\\widgets\\AceGUIWidget-DropDown-Items.lua:353: in function <...\\Ace3-AceGUI\\widgets\\AceGUIWidget-DropDown-Items.lua:343>",
			["session"] = 59,
			["counter"] = 4,
		}, -- [1]
		{
			["message"] = "...xternals\\curse\\svn\\SharedMediaWidgets\\prototypes.lua:192: script ran too long",
			["time"] = "2016/10/09 23:01:30",
			["locals"] = "",
			["stack"] = "...xternals\\curse\\svn\\SharedMediaWidgets\\prototypes.lua:192: in function `AddFrame'\n...xternals\\curse\\svn\\SharedMediaWidgets\\FontWidget.lua:152: in function <...xternals\\curse\\svn\\SharedMediaWidgets\\FontWidget.lua:127>",
			["session"] = 61,
			["counter"] = 1,
		}, -- [2]
		{
			["message"] = "Interface\\AddOns\\LUI\\modules\\bags.lua:1449: attempt to index global 'InterfaceOptionsDisplayPanelShowFreeBagSpace' (a nil value)",
			["time"] = "2016/10/10 01:43:51",
			["stack"] = "Interface\\AddOns\\LUI\\modules\\bags.lua:1449: in function <Interface\\AddOns\\LUI\\modules\\bags.lua:1448>\n(tail call): ?\n[C]: ?\n[string \"safecall Dispatcher[1]\"]:9: in function <[string \"safecall Dispatcher[1]\"]:5>\n(tail call): ?\n...y\\Externals\\curse\\svn\\Ace3-AceAddon\\AceAddon-3.0-12.lua:593: in function <...y\\Externals\\curse\\svn\\Ace3-AceAddon\\AceAddon-3.0.lua:586>\n(tail call): ?\nInterface\\AddOns\\LUI\\LUI-r784.lua:1663: in function <Interface\\AddOns\\LUI\\LUI.lua:1652>\n(tail call): ?\n[C]: ?\n[string \"safecall Dispatcher[3]\"]:9: in function <[string \"safecall Dispatcher[3]\"]:5>\n(tail call): ?\n...ceConfig\\AceConfigDialog-3.0\\AceConfigDialog-3.0-61.lua:799: in function <...ceConfig\\AceConfigDialog-3.0\\AceConfigDialog-3.0.lua:614>\n(tail call): ?\n[C]: ?\n[string \"safecall Dispatcher[4]\"]:9: in function <[string \"safecall Dispatcher[4]\"]:5>\n(tail call): ?\n...ntory\\Externals\\curse\\svn\\Ace3-AceGUI\\AceGUI-3.0-34.lua:314: in function `Fire'\n...urse\\svn\\Ace3-AceGUI\\widgets\\AceGUIWidget-Button.lua:22: in function <...urse\\svn\\Ace3-AceGUI\\widgets\\AceGUIWidget-Button.lua:19>",
			["session"] = 71,
			["counter"] = 2,
		}, -- [3]
	},
}
