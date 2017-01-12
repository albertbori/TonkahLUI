
GSEOptions = {
	["use2"] = false,
	["STANDARDFUNCS"] = "|cff55ddcc",
	["COMMENT"] = "|cff55cc55",
	["use14"] = true,
	["EQUALS"] = "|cffccddee",
	["use11"] = false,
	["sendDebugOutputToChatWindow"] = false,
	["debug"] = false,
	["use6"] = false,
	["CommandColour"] = "|cFF00FF00",
	["UNKNOWN"] = "|cffff6666",
	["sendDebugOutputToDebugOutput"] = false,
	["hideSoundErrors"] = false,
	["use1"] = false,
	["STRING"] = "|cff888888",
	["clearUIErrors"] = false,
	["AddInPacks"] = {
		["Legacy GSE 1"] = {
			["Version"] = "Legacy 2.0 Adaptor",
			["Name"] = "Legacy GSE 1",
			["SequenceNames"] = {
			},
		},
		["Samples"] = {
			["Version"] = "200",
			["Name"] = "Samples",
			["SequenceNames"] = {
				"SAM_ProtWar", -- [1]
				"SAM_Fury1", -- [2]
				"SAM_Arms_ST", -- [3]
				"SAM_Arms_AOE", -- [4]
				"SAM_FuryAOE", -- [5]
				"SAM_RetAOE", -- [6]
				"SAM_HolyDeeps", -- [7]
				"SAM_Prot_AOE", -- [8]
				"SAM_RetRef", -- [9]
				"SAM_Prot_ST", -- [10]
				"SAM_Ret", -- [11]
				"SAM_Palla_Sera", -- [12]
				"SAM_BMaoe", -- [13]
				"SAM_BMsingle", -- [14]
				"SAM_SURVST", -- [15]
				"SAM_SURVAOE", -- [16]
				"SAM_Marks_AOE", -- [17]
				"SAM_Mm_ST", -- [18]
				"SAM_CalliynOutlaw", -- [19]
				"SAM_Assassin", -- [20]
				"SAM_Subtle", -- [21]
				"SAM_Disc-THeal", -- [22]
				"SAM_HolyPriesty", -- [23]
				"SAM_KTN_MouseOver", -- [24]
				"SAM_Disc-THealAoe", -- [25]
				"SAM_Disc-TDPS", -- [26]
				"SAM_ShadowPriest", -- [27]
				"SAM_FDK2", -- [28]
				"SAM_BloodDK", -- [29]
				"SAM_DKunholy", -- [30]
				"SAM_ElemAoE", -- [31]
				"SAM_MC_Chain", -- [32]
				"SAM_RestoDeeps", -- [33]
				"SAM_enhsingle", -- [34]
				"SAM_Elem", -- [35]
				"SAM_MC_Surge", -- [36]
				"SAM_MC_Wave", -- [37]
				"SAM_Fire", -- [38]
				"SAM_Arcane", -- [39]
				"SAM_Ichthys_Frosty", -- [40]
				"SAM_AFF", -- [41]
				"SAM_DemoAoE", -- [42]
				"SAM_Demon", -- [43]
				"SAM_Destro", -- [44]
				"SAM_DemoSingle", -- [45]
				"SAM_AFF2", -- [46]
				"SAM_BrewMaster_AoE", -- [47]
				"SAM_WW", -- [48]
				"SAM_BrewMaster_ST", -- [49]
				"SAM_winsingle", -- [50]
				"SAM_Feral-AoE", -- [51]
				"SAM_Boomer", -- [52]
				"SAM_KTNDRUHEALS", -- [53]
				"SAM_Bear", -- [54]
				"SAM_Feral-ST", -- [55]
				"SAM_druid_bala_st", -- [56]
				"SAM_DHHavoc", -- [57]
				"SAM_Vengeance", -- [58]
			},
		},
	},
	["INDENT"] = "|cffccaa88",
	["TitleColour"] = "|cFFFF0000",
	["hideUIErrors"] = false,
	["initialised"] = true,
	["saveAllMacrosLocal"] = true,
	["DebugModules"] = {
		["Translator"] = false,
		["GUI"] = false,
		["Storage"] = false,
		["Editor"] = false,
		["API"] = false,
		["Versions"] = false,
		["Viewer"] = false,
		["Transmission"] = false,
	},
	["resetOOC"] = true,
	["CONCAT"] = "|cffcc7777",
	["DisabledSequences"] = {
	},
	["EmphasisColour"] = "|cFFFFFF00",
	["autoCreateMacroStubsClass"] = true,
	["WOWSHORTCUTS"] = "|cffddaaff",
	["RealtimeParse"] = false,
	["deleteOrphansOnLogout"] = false,
	["use12"] = false,
	["NUMBER"] = "|cffffaa00",
	["overflowPersonalMacros"] = false,
	["useTranslator"] = false,
	["requireTarget"] = false,
	["AuthorColour"] = "|cFF00D1FF",
	["DefaultDisabledMacroIcon"] = "Interface\\Icons\\INV_MISC_BOOK_08",
	["use13"] = true,
	["NormalColour"] = "|cFFFFFFFF",
	["filterList"] = {
		["Spec"] = true,
		["Class"] = true,
		["All"] = false,
	},
	["ActiveSequenceVersions"] = {
	},
	["setDefaultIconQuestionMark"] = true,
	["autoCreateMacroStubsGlobal"] = false,
	["KEYWORD"] = "|cff88bbdd",
}
GSELibrary = {
	{
		["FuryAoE"] = {
			["Talents"] = "1213312",
			["Default"] = 1,
			["Author"] = "Taunkah@Doomhammer",
			["SpecID"] = "Fury",
			["MacroVersions"] = {
				{
					"/cast [mod:alt] Charge", -- [1]
					"/cast Dragon Roar", -- [2]
					"/cast Odyn's Fury", -- [3]
					"/cast Execute", -- [4]
					"/cast Rampage", -- [5]
					"/castsequence  reset=4  Bloodthirst, Whirlwind, Whirlwind", -- [6]
					["KeyRelease"] = {
					},
					["StepFunction"] = "Priority",
					["KeyPress"] = {
					},
					["PreMacro"] = {
						"", -- [1]
						"/target  [@focustarget]", -- [2]
						"/targetenemy  [noexists][noharm][dead]", -- [3]
						"/cast [combat] Avatar", -- [4]
						"/cast [combat] Battle Cry", -- [5]
					},
					["PostMacro"] = {
					},
				}, -- [1]
			},
		},
		["ProtAoE"] = {
			["Talents"] = "1213312",
			["Default"] = 1,
			["Author"] = "Taunkah@Doomhammer",
			["SpecID"] = 73,
			["MacroVersions"] = {
				{
					"|cffddaaff/cast|r |cff88bbdd|cff55cc55[mod:alt]|r |cff88bbddIntercept|r|r", -- [1]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddVictory Rush|r|r", -- [2]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddNeltharion's Fury|r|r", -- [3]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddShockwave|r|r", -- [4]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddThunder Clap|r|r", -- [5]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddShield Slam|r|r", -- [6]
					"|cffddaaff/castsequence|r |cff55ddcc|cff55cc55 reset=combat |r|r |cff88bbdd|cff88bbddShield Block|r|r, |cff88bbdd|cff88bbddIgnore Pain|r|r, |cff88bbdd|cff88bbddRevenge|r|r", -- [7]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddDevastate|r|r", -- [8]
					["KeyRelease"] = {
					},
					["StepFunction"] = "Priority",
					["PostMacro"] = {
					},
					["PreMacro"] = {
						"|cffddaaff/target|r  [@focustarget]", -- [1]
						"|cffddaaff/targetenemy|r  [noexists][noharm][dead]", -- [2]
						"|cffddaaff/cast|r |cff88bbdd|cff55cc55[combat]|r |cff88bbddBattle Cry|r|r", -- [3]
					},
					["KeyPress"] = {
					},
				}, -- [1]
			},
		},
		["FurySingle"] = {
			["Talents"] = "1213312",
			["Default"] = 1,
			["Author"] = "Taunkah@Doomhammer",
			["SpecID"] = "Fury",
			["MacroVersions"] = {
				{
					"|cffddaaff/cast|r |cff88bbdd|cff55cc55[mod:alt]|r |cff88bbddCharge|r|r", -- [1]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddDragon Roar|r|r", -- [2]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddOdyn's Fury|r|r", -- [3]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddExecute|r|r", -- [4]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddRampage|r|r", -- [5]
					"|cffddaaff/castsequence|r |cff88bbdd|cff88bbddRaging Blow|r|r, |cff88bbdd|cff88bbddBloodthirst|r|r, |cff88bbdd|cff88bbddFurious Slash|r|r", -- [6]
					["KeyRelease"] = {
					},
					["StepFunction"] = "Priority",
					["KeyPress"] = {
					},
					["PreMacro"] = {
						"", -- [1]
						"|cffddaaff/target|r  [@focustarget]", -- [2]
						"|cffddaaff/targetenemy|r  [noexists][noharm][dead]", -- [3]
						"|cffddaaff/cast|r |cff88bbdd|cff55cc55[combat]|r |cff88bbddAvatar|r|r", -- [4]
						"|cffddaaff/cast|r |cff88bbdd|cff55cc55[combat]|r |cff88bbddBattle Cry|r|r", -- [5]
						"", -- [6]
					},
					["PostMacro"] = {
					},
				}, -- [1]
			},
		},
		["ProtSingle"] = {
			["Talents"] = "1213312",
			["Default"] = 1,
			["Author"] = "Taunkah@Doomhammer",
			["SpecID"] = 73,
			["MacroVersions"] = {
				{
					"|cffddaaff/cast|r |cff88bbdd|cff55cc55[mod:alt]|r |cff88bbddIntercept|r|r", -- [1]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddVictory Rush|r|r", -- [2]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddShield Slam|r|r", -- [3]
					"|cffddaaff/castsequence|r |cff55ddcc|cff55cc55 reset=combat |r|r |cff88bbdd|cff88bbddShield Block|r|r, |cff88bbdd|cff88bbddIgnore Pain|r|r, |cff88bbdd|cff88bbddRevenge|r|r", -- [4]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddDevastate|r|r", -- [5]
					["KeyRelease"] = {
					},
					["StepFunction"] = "Priority",
					["PostMacro"] = {
					},
					["PreMacro"] = {
						"|cffddaaff/target|r  [@focustarget]", -- [1]
						"|cffddaaff/targetenemy|r  [noexists][noharm][dead]", -- [2]
						"|cffddaaff/cast|r |cff88bbdd|cff55cc55[combat]|r |cff88bbddBattle Cry|r|r", -- [3]
					},
					["KeyPress"] = {
					},
				}, -- [1]
			},
		},
	}, -- [1]
	[5] = {
		["HolyDPS"] = {
			["Talents"] = "?,?,?,?,?,?,?",
			["Help"] = "Talents: 2333222",
			["SpecID"] = 258,
			["Author"] = "Holyshnizzle@Doomhammer",
			["MacroVersions"] = {
				{
					"/cast Holy Word: Chastise", -- [1]
					"/cast Holy Fire", -- [2]
					"/cast Divine Star", -- [3]
					"/cast Smite", -- [4]
					["KeyPress"] = {
						"/target [@focustarget]", -- [1]
						"/targetenemy [noexists][help][dead]", -- [2]
						"", -- [3]
					},
					["StepFunction"] = "Priority",
				}, -- [1]
			},
			["Icon"] = "INV_MISC_QUESTIONMARK",
			["Default"] = 1,
		},
	},
}
