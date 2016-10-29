
BugGrabberDB = {
	["session"] = 282,
	["lastSanitation"] = 3,
	["errors"] = {
		{
			["message"] = "[ADDON_ACTION_BLOCKED] AddOn 'Auctionator' tried to call the protected function 'UIParent:SetAttribute()'.",
			["time"] = "2016/10/25 21:11:25",
			["locals"] = "",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:573: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:573>\n[C]: in function `SetAttribute'\nInterface\\FrameXML\\UIParent.lua:2470: in function `UpdateUIPanelPositions'\nInterface\\FrameXML\\UIParent.lua:2093: in function <Interface\\FrameXML\\UIParent.lua:2082>\n[C]: in function `SetAttribute'\nInterface\\FrameXML\\UIParent.lua:3112: in function <Interface\\FrameXML\\UIParent.lua:3110>\n[C]: in function `securecall'\nInterface\\FrameXML\\UIParent.lua:2391: in function `MoveUIPanel'\nInterface\\FrameXML\\UIParent.lua:2409: in function `HideUIPanel'\nInterface\\FrameXML\\UIParent.lua:2090: in function <Interface\\FrameXML\\UIParent.lua:2082>\n[C]: in function `SetAttribute'\nInterface\\FrameXML\\UIParent.lua:2884: in function `HideUIPanel'\nInterface\\SharedXML\\SharedUIPanelTemplates.lua:402: in function `HideParentPanel'\n[string \"*:OnClick\"]:1: in function <[string \"*:OnClick\"]:1>",
			["session"] = 254,
			["counter"] = 1,
		}, -- [1]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] AddOn 'AskMrRobot' tried to call the protected function '<unnamed>:Hide()'.",
			["time"] = "2016/10/25 21:12:28",
			["locals"] = "",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:573: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:573>\n[C]: in function `Hide'\nInterface\\FrameXML\\WorldMapActionButton.lua:58: in function `Clear'\nInterface\\FrameXML\\WorldMapActionButton.lua:67: in function `Refresh'\nInterface\\FrameXML\\WorldMapActionButton.lua:19: in function `SetMapAreaID'\nInterface\\FrameXML\\WorldMapFrame.lua:418: in function <Interface\\FrameXML\\WorldMapFrame.lua:381>\n[C]: ?\n[C]: ?\n[C]: in function `Hide'\nInterface\\FrameXML\\UIParent.lua:2358: in function `SetUIPanel'\nInterface\\FrameXML\\UIParent.lua:2385: in function `MoveUIPanel'\nInterface\\FrameXML\\UIParent.lua:2416: in function `HideUIPanel'\nInterface\\FrameXML\\UIParent.lua:2090: in function <Interface\\FrameXML\\UIParent.lua:2082>\n[C]: in function `SetAttribute'\nInterface\\FrameXML\\UIParent.lua:2884: in function `HideUIPanel'\nInterface\\FrameXML\\WorldMapFrame.lua:329: in function <Interface\\FrameXML\\WorldMapFrame.lua:329>",
			["session"] = 257,
			["counter"] = 2,
		}, -- [2]
		{
			["message"] = "Interface\\AddOns\\HealBot\\HealBot-7.0.3.1.lua:1822: Usage: UnitHealth(\"unit\")",
			["time"] = "2016/10/25 20:12:52",
			["locals"] = "(*temporary) = nil\n",
			["stack"] = "[C]: in function `UnitHealth'\nInterface\\AddOns\\HealBot\\HealBot-7.0.3.1.lua:1822: in function `HealBot_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>",
			["session"] = 262,
			["counter"] = 1759,
		}, -- [3]
		{
			["message"] = "Interface\\AddOns\\WorldQuestTracker\\libs\\DF\\math.lua:35: attempt to perform arithmetic on local 'y2' (a nil value)",
			["time"] = "2016/10/28 00:23:41",
			["locals"] = "",
			["stack"] = "Interface\\AddOns\\WorldQuestTracker\\libs\\DF\\math.lua:35: in function <Interface\\AddOns\\WorldQuestTracker\\libs\\DF\\math.lua:34>\n...rface\\AddOns\\WorldQuestTracker\\WorldQuestTracker-r99.lua:6466: in function <...rface\\AddOns\\WorldQuestTracker\\WorldQuestTracker.lua:6447>",
			["session"] = 277,
			["counter"] = 1,
		}, -- [4]
		{
			["message"] = "Interface\\AddOns\\Chatter\\Modules\\AutoPopup.lua:40: attempt to index local 'info' (a nil value)",
			["time"] = "2016/10/25 20:31:50",
			["locals"] = "self = <table> {\n SetDefaultModuleLibraries = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:398\n Enable = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:325\n NewModule = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:266\n EnableModule = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:363\n modules = <table> {\n }\n GetModule = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:241\n IterateEmbeds = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:473\n SecureHookScript = <function> defined @Interface\\AddOns\\Bartender4\\libs\\AceHook-3.0\\AceHook-3.0.lua:410\n defaultModuleLibraries = <table> {\n }\n RawHookScript = <function> defined @Interface\\AddOns\\Bartender4\\libs\\AceHook-3.0\\AceHook-3.0.lua:395\n GetName = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:310\n name = \"Chatter_Automatic Whisper Windows\"\n IsEnabled = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:482\n orderedModules = <table> {\n }\n DisableModule = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:381\n baseName = \"Chatter\"\n ProcessWhisper = <function> defined @Interface\\AddOns\\Chatter\\Modules\\AutoPopup.lua:48\n RegisterMessage = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:118\n HookScript = <function> defined @Interface\\AddOns\\Bartender4\\libs\\AceHook-3.0\\AceHook-3.0.lua:366\n AlwaysDecorate = <function> defined @Interface\\AddOns\\Chatter\\Modules\\AutoPopup.lua:21\n OnDisable = <function> defined @Interface\\AddOns\\Chatter\\Modules\\AutoPopup.lua:14\n IsHooked = <function> defined @Interface\\AddOns\\Bartender4\\libs\\AceHook-3.0\\AceHook-3.0.lua:493\n OnEnable = <function> defined @Interface\\AddOns\\Chatter\\Modules\\AutoPopup.lua:7\n Disable = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:345\n IsModule = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:248\n defaultModuleState = true\n SetDefaultModuleState = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:418\n UnregisterAllEvents = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:202\n SendMessage = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:87\n SetEnabledState = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:455\n Hook = <function> defined @Interface\\AddOns\\Bartender4\\libs\\AceHook-3.0\\AceHook-3.0.lua:274\n enabledState = false\n UnregisterMessage = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:181\n RegisterEvent = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:118\n UnregisterAllMessages = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:202\n hooks = <table> {\n }\n SetDefaultModulePrototype = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:440\n SecureHook = <function> defined @Interface\\AddOns\\Bartender4\\libs\\AceHook-3.0\\AceHook-3.0.lua:336\n IterateModules = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\AceAddon-3.0\\AceAddon-3.0.lua:468\n UnhookAll = <function> defined @Interface\\AddOns\\Bartender4\\libs\\AceHook-3.0\\AceHook-3.0.lua:477\n RawHook = <function> defined @Interface\\AddOns\\Bartender4\\libs\\AceHook-3.0\\AceHook-3.0.lua:313\n Unhook = <function> defined @Interface\\AddOns\\Bartender4\\libs\\AceHook-3.0\\AceHook-3.0.lua:418\n moduleName = \"Automatic Whisper Windows\"\n UnregisterEvent = <function> defined @Interface\\AddOns\\AskMrRobot\\Libs\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:181\n modName = \"Automatic Whisper Windows\"\n}\nframe = ChatFrame11 {\n 0 = <userdata>\n RefreshIfNecessary = <function> defined =[C]:-1\n OnPostShow = <function> defined =[C]:-1\n GetNumVi",
			["stack"] = "Interface\\AddOns\\Chatter\\Modules\\AutoPopup.lua:40: in function `AlwaysDecorate'\nInterface\\AddOns\\Chatter\\Chatter-1.5.2.lua:196: in function <Interface\\AddOns\\Chatter\\Chatter.lua:183>\n(tail call): ?\nInterface\\FrameXML\\FloatingChatFrame.lua:2520: in function <Interface\\FrameXML\\FloatingChatFrame.lua:2509>",
			["session"] = 277,
			["counter"] = 5,
		}, -- [5]
	},
}
