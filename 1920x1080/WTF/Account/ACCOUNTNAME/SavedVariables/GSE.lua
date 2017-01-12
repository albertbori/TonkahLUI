
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
	["KEYWORD"] = "|cff88bbdd",
	["STRING"] = "|cff888888",
	["clearUIErrors"] = false,
	["autoCreateMacroStubsGlobal"] = false,
	["resetOOC"] = true,
	["TitleColour"] = "|cFFFF0000",
	["hideUIErrors"] = false,
	["initialised"] = true,
	["ActiveSequenceVersions"] = {
	},
	["DebugModules"] = {
		["Translator"] = false,
		["GUI"] = false,
		["Storage"] = false,
		["Editor"] = false,
		["Versions"] = false,
		["API"] = false,
		["Viewer"] = false,
		["Transmission"] = false,
	},
	["INDENT"] = "|cffccaa88",
	["filterList"] = {
		["Spec"] = true,
		["All"] = false,
		["Class"] = true,
	},
	["DisabledSequences"] = {
	},
	["EmphasisColour"] = "|cFFFFFF00",
	["autoCreateMacroStubsClass"] = true,
	["WOWSHORTCUTS"] = "|cffddaaff",
	["RealtimeParse"] = false,
	["deleteOrphansOnLogout"] = false,
	["DefaultDisabledMacroIcon"] = "Interface\\Icons\\INV_MISC_BOOK_08",
	["AuthorColour"] = "|cFF00D1FF",
	["overflowPersonalMacros"] = false,
	["requireTarget"] = false,
	["useTranslator"] = false,
	["NUMBER"] = "|cffffaa00",
	["use12"] = false,
	["use13"] = true,
	["NormalColour"] = "|cFFFFFFFF",
	["CONCAT"] = "|cffcc7777",
	["saveAllMacrosLocal"] = true,
	["setDefaultIconQuestionMark"] = true,
	["AddInPacks"] = {
		["Legacy GSE 1"] = {
			["Name"] = "Legacy GSE 1",
			["Version"] = "Legacy 2.0 Adaptor",
			["SequenceNames"] = {
			},
		},
		["Samples"] = {
			["Name"] = "Samples",
			["Version"] = "200",
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
	["use1"] = false,
}
GSELibrary = {
	{
		["FuryAoE"] = {
			["Talents"] = "1213312",
			["Default"] = 1,
			["Author"] = "Taunkah@Doomhammer",
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
					["PostMacro"] = {
					},
					["PreMacro"] = {
						"", -- [1]
						"/target  [@focustarget]", -- [2]
						"/targetenemy  [noexists][noharm][dead]", -- [3]
						"/cast [combat] Avatar", -- [4]
						"/cast [combat] Battle Cry", -- [5]
					},
					["KeyPress"] = {
					},
				}, -- [1]
			},
			["SpecID"] = "Fury",
		},
		["ProtAoE"] = {
			["Talents"] = "1213312",
			["Default"] = 1,
			["Author"] = "Taunkah@Doomhammer",
			["MacroVersions"] = {
				{
					"/cast [mod:alt] Intercept", -- [1]
					"/cast Victory Rush", -- [2]
					"/cast Neltharion's Fury", -- [3]
					"/cast Revenge", -- [4]
					"/cast Shockwave", -- [5]
					"/cast Thunder Clap", -- [6]
					"/cast [mod:alt] Focused Rage; Ignore Pain", -- [7]
					"/cast Shield Block", -- [8]
					"/cast Shield Slam", -- [9]
					"/cast Devastate", -- [10]
					["KeyRelease"] = {
					},
					["StepFunction"] = "Priority",
					["PostMacro"] = {
					},
					["PreMacro"] = {
						"", -- [1]
						"/target  [@focustarget]", -- [2]
						"/targetenemy  [noexists][noharm][dead]", -- [3]
						"/cast [combat] Battle Cry", -- [4]
					},
					["KeyPress"] = {
					},
				}, -- [1]
			},
			["SpecID"] = 73,
		},
		["FurySingle"] = {
			["Talents"] = "1213312",
			["Default"] = 1,
			["Author"] = "Taunkah@Doomhammer",
			["MacroVersions"] = {
				{
					"/cast [mod:alt] Charge", -- [1]
					"/cast Dragon Roar", -- [2]
					"/cast Odyn's Fury", -- [3]
					"/cast Execute", -- [4]
					"/cast Rampage", -- [5]
					"/castsequence Raging Blow, Bloodthirst, Furious Slash", -- [6]
					["KeyRelease"] = {
					},
					["StepFunction"] = "Priority",
					["PostMacro"] = {
					},
					["PreMacro"] = {
						"", -- [1]
						"/target  [@focustarget]", -- [2]
						"/targetenemy  [noexists][noharm][dead]", -- [3]
						"/cast [combat] Avatar", -- [4]
						"/cast [combat] Battle Cry", -- [5]
						"", -- [6]
					},
					["KeyPress"] = {
					},
				}, -- [1]
			},
			["SpecID"] = "Fury",
		},
		["ProtSingle"] = {
			["Talents"] = "1213312",
			["Default"] = 1,
			["Author"] = "Taunkah@Doomhammer",
			["MacroVersions"] = {
				{
					"/cast [mod:alt] Intercept", -- [1]
					"/cast Victory Rush", -- [2]
					"/cast [mod:alt] Focused Rage; Ignore Pain", -- [3]
					"/cast Shield Block", -- [4]
					"/cast Shield Slam", -- [5]
					"/cast Revenge", -- [6]
					"/cast Devastate", -- [7]
					["KeyRelease"] = {
					},
					["StepFunction"] = "Priority",
					["PostMacro"] = {
					},
					["PreMacro"] = {
						"/target  [@focustarget]", -- [1]
						"/targetenemy  [noexists][noharm][dead]", -- [2]
						"/cast [combat] Battle Cry", -- [3]
					},
					["KeyPress"] = {
					},
				}, -- [1]
			},
			["SpecID"] = 73,
		},
	}, -- [1]
	{
		["RetAoE"] = {
			["Talents"] = "1131111",
			["Default"] = 1,
			["Author"] = "Bartholamue@Doomhammer",
			["MacroVersions"] = {
				{
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddWake of Ashes|r|r", -- [1]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbdd|cff55cc55[mod:alt]|r |cff88bbddJusticar's Vengeance|r|r; |cff88bbdd|cff88bbddDivine Storm|r|r|r", -- [2]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddJudgment|r|r", -- [3]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddBlade of Justice|r|r", -- [4]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddCrusader Strike|r|r", -- [5]
					["KeyRelease"] = {
					},
					["StepFunction"] = "Priority",
					["PostMacro"] = {
					},
					["PreMacro"] = {
						"|cffddaaff/target|r  [@focustarget]", -- [1]
						"|cffddaaff/targetenemy|r  [noexists][noharm][dead]", -- [2]
						"|cffddaaff/cast|r |cff88bbdd|cff88bbddAvenging Wrath|r|r", -- [3]
						"|cffddaaff/cast|r Shield of Vengeance", -- [4]
					},
					["KeyPress"] = {
					},
				}, -- [1]
			},
			["SpecID"] = 70,
		},
		["RetSingle"] = {
			["Talents"] = "1131111",
			["Default"] = 1,
			["Author"] = "Bartholamue@Doomhammer",
			["MacroVersions"] = {
				{
					"|cffddaaff/cast|r |cff88bbdd|cff88bbdd|cff55cc55[mod:alt]|r |cff88bbddJusticar's Vengeance|r|r; |cff88bbdd|cff88bbddTemplar's Verdict|r|r|r", -- [1]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddJudgment|r|r", -- [2]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddBlade of Justice|r|r", -- [3]
					"|cffddaaff/cast|r |cff88bbdd|cff88bbddCrusader Strike|r|r", -- [4]
					["KeyRelease"] = {
					},
					["StepFunction"] = "Priority",
					["PostMacro"] = {
					},
					["PreMacro"] = {
						"|cffddaaff/target|r  [@focustarget]", -- [1]
						"|cffddaaff/targetenemy|r  [noexists][noharm][dead]", -- [2]
						"|cffddaaff/cast|r |cff88bbdd|cff88bbddAvenging Wrath|r|r", -- [3]
					},
					["KeyPress"] = {
					},
				}, -- [1]
			},
			["SpecID"] = 70,
		},
	}, -- [2]
	[5] = {
		["HolyDPS"] = {
			["Talents"] = "?,?,?,?,?,?,?",
			["Help"] = "Talents: 2333222",
			["Default"] = 1,
			["MacroVersions"] = {
				{
					"/cast Holy Word: Chastise", -- [1]
					"/cast Holy Fire", -- [2]
					"/cast Divine Star", -- [3]
					"/cast Smite", -- [4]
					["PostMacro"] = {
					},
					["StepFunction"] = "Priority",
					["KeyPress"] = {
						"/target [@focustarget]", -- [1]
						"/targetenemy [noexists][help][dead]", -- [2]
						"", -- [3]
					},
					["PreMacro"] = {
					},
					["KeyRelease"] = {
					},
				}, -- [1]
			},
			["SpecID"] = 258,
			["Icon"] = "INV_MISC_QUESTIONMARK",
			["Author"] = "Holyshnizzle@Doomhammer",
		},
	},
}
