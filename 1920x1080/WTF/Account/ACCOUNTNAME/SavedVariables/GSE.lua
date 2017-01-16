
GSEOptions = {
	["use2"] = false,
	["STANDARDFUNCS"] = "|cff55ddcc",
	["UnfoundSpellIDs"] = {
	},
	["COMMENT"] = "|cff55cc55",
	["use14"] = true,
	["EQUALS"] = "|cffccddee",
	["use11"] = false,
	["sendDebugOutputToChatWindow"] = false,
	["debug"] = false,
	["use6"] = false,
	["CommandColour"] = "|cFF00FF00",
	["UNKNOWN"] = "|cffff6666",
	["KEYWORD"] = "|cff88bbdd",
	["AddInPacks"] = {
		["Legacy GSE 1"] = {
			["Name"] = "Legacy GSE 1",
			["Version"] = "Legacy 2.0 Adaptor",
			["SequenceNames"] = {
			},
		},
		["Samples"] = {
			["Name"] = "Samples",
			["Version"] = "206",
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
	["sendDebugOutputToDebugOutput"] = false,
	["hideSoundErrors"] = false,
	["ErroneousSpellID"] = {
	},
	["autoCreateMacroStubsGlobal"] = false,
	["STRING"] = "|cff888888",
	["clearUIErrors"] = false,
	["ActiveSequenceVersions"] = {
	},
	["autoCreateMacroStubsClass"] = true,
	["TitleColour"] = "|cFFFF0000",
	["hideUIErrors"] = false,
	["initialised"] = true,
	["CONCAT"] = "|cffcc7777",
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
	["resetOOC"] = true,
	["filterList"] = {
		["Spec"] = true,
		["Class"] = true,
		["Global"] = true,
		["All"] = false,
	},
	["DefaultDisabledMacroIcon"] = "Interface\\Icons\\INV_MISC_BOOK_08",
	["EmphasisColour"] = "|cFFFFFF00",
	["INDENT"] = "|cffccaa88",
	["WOWSHORTCUTS"] = "|cffddaaff",
	["RealtimeParse"] = false,
	["deleteOrphansOnLogout"] = false,
	["overflowPersonalMacros"] = false,
	["UnfoundSpells"] = {
	},
	["AuthorColour"] = "|cFF00D1FF",
	["requireTarget"] = false,
	["NUMBER"] = "|cffffaa00",
	["DisabledSequences"] = {
	},
	["use12"] = false,
	["use13"] = true,
	["NormalColour"] = "|cFFFFFFFF",
	["useTranslator"] = false,
	["saveAllMacrosLocal"] = true,
	["setDefaultIconQuestionMark"] = true,
	["CreateGlobalButtons"] = false,
	["use1"] = false,
}
GSELibrary = {
	{
		["ProtAoE"] = {
			["Talents"] = "1213312",
			["Default"] = 1,
			["Author"] = "Taunkah@Doomhammer",
			["MacroVersions"] = {
				{
					"/cast [mod:alt] Intercept", -- [1]
					"/cast Victory Rush", -- [2]
					"/cast Neltharion's Fury", -- [3]
					"/cast Shockwave", -- [4]
					"/cast Thunder Clap", -- [5]
					"/cast Shield Slam", -- [6]
					"/castsequence  reset=combat  Shield Block, Ignore Pain, Revenge", -- [7]
					"/cast Devastate", -- [8]
					["KeyRelease"] = {
						"/cast [combat] Battle Cry", -- [1]
					},
					["StepFunction"] = "Priority",
					["PostMacro"] = {
					},
					["PreMacro"] = {
						"/target  [@focustarget]", -- [1]
						"/targetenemy  [noexists][noharm][dead]", -- [2]
					},
					["KeyPress"] = {
					},
				}, -- [1]
			},
			["SpecID"] = 73,
		},
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
						"/cast [combat] Avatar", -- [1]
						"/cast [combat] Battle Cry", -- [2]
					},
					["StepFunction"] = "Sequential",
					["PostMacro"] = {
					},
					["PreMacro"] = {
						"/target  [@focustarget]", -- [1]
						"/targetenemy  [noexists][noharm][dead]", -- [2]
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
					"/castsequence Odyn's Fury, Dragon Roar, Dragon Roar", -- [1]
					"/cast Execute", -- [2]
					"/cast Rampage", -- [3]
					"/castsequence Raging Blow, Bloodthirst, Furious Slash", -- [4]
					["KeyRelease"] = {
						"/cast [combat] Avatar", -- [1]
						"/cast [combat] Battle Cry", -- [2]
					},
					["StepFunction"] = "Sequential",
					["PostMacro"] = {
					},
					["PreMacro"] = {
						"/target  [@focustarget]", -- [1]
						"/targetenemy  [noexists][noharm][dead]", -- [2]
					},
					["KeyPress"] = {
					},
				}, -- [1]
			},
			["SpecID"] = 73,
		},
		["ProtSingle"] = {
			["Talents"] = "1213312",
			["Default"] = 1,
			["Author"] = "Taunkah@Doomhammer",
			["MacroVersions"] = {
				{
					"/cast [mod:alt] Intercept", -- [1]
					"/cast Victory Rush", -- [2]
					"/cast Shield Slam", -- [3]
					"/castsequence  reset=combat  Shield Block, Ignore Pain, Revenge", -- [4]
					"/cast Devastate", -- [5]
					["KeyRelease"] = {
						"/cast [combat] Battle Cry", -- [1]
					},
					["StepFunction"] = "Priority",
					["PostMacro"] = {
					},
					["PreMacro"] = {
						"/target  [@focustarget]", -- [1]
						"/targetenemy  [noexists][noharm][dead]", -- [2]
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
					"/cast Wake of Ashes", -- [1]
					"/cast [mod:alt] Justicar's Vengeance; Divine Storm", -- [2]
					"/cast Judgment", -- [3]
					"/cast Blade of Justice", -- [4]
					"/cast Crusader Strike", -- [5]
					["KeyRelease"] = {
						"/cast Avenging Wrath", -- [1]
						"/cast Shield of Vengeance", -- [2]
					},
					["StepFunction"] = "Priority",
					["PostMacro"] = {
					},
					["PreMacro"] = {
						"/target  [@focustarget]", -- [1]
						"/targetenemy  [noexists][noharm][dead]", -- [2]
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
					"/cast [mod:alt] Justicar's Vengeance; Templar's Verdict", -- [1]
					"/cast Judgment", -- [2]
					"/cast Blade of Justice", -- [3]
					"/cast Crusader Strike", -- [4]
					["KeyRelease"] = {
						"/cast Avenging Wrath", -- [1]
					},
					["StepFunction"] = "Priority",
					["PostMacro"] = {
					},
					["PreMacro"] = {
						"/target  [@focustarget]", -- [1]
						"/targetenemy  [noexists][noharm][dead]", -- [2]
					},
					["KeyPress"] = {
					},
				}, -- [1]
			},
			["SpecID"] = 70,
		},
	}, -- [2]
	{
		["BeastMasterSingle"] = {
			["Talents"] = "3132111",
			["Default"] = 1,
			["Author"] = "Marmit@Doomhammer",
			["MacroVersions"] = {
				{
					"/cast [combat,talent:7/1] Stampede", -- [1]
					"/cast [combat] A Murder of Crows", -- [2]
					"/cast Kill Command", -- [3]
					"/cast Titan's Thunder", -- [4]
					"/cast [talent:2/2] Dire Frenzy; Dire Beast", -- [5]
					"/cast Cobra Shot", -- [6]
					"/cast Kill Command", -- [7]
					["KeyRelease"] = {
						"/cast [combat] Bestial Wrath", -- [1]
						"/cast [combat] Aspect of the Wild", -- [2]
					},
					["StepFunction"] = "Priority",
					["KeyPress"] = {
					},
					["PreMacro"] = {
						"/target  [@focustarget]", -- [1]
						"/targetenemy  [noexists][noharm][dead]", -- [2]
					},
					["PostMacro"] = {
					},
				}, -- [1]
			},
			["SpecID"] = 253,
		},
		["BeastMasterAoE"] = {
			["Talents"] = "3132111",
			["Default"] = 1,
			["Author"] = "Marmit@Doomhammer",
			["SpecID"] = 253,
			["MacroVersions"] = {
				{
					"/cast [combat,talent:7/1] Stampede", -- [1]
					"/cast Titan's Thunder", -- [2]
					"/cast [talent:2/2] Dire Frenzy; Dire Beast", -- [3]
					"/castsequence Multi-Shot, Kill Command, Multi-Shot", -- [4]
					["KeyRelease"] = {
						"/cast [combat] Bestial Wrath", -- [1]
						"/cast [combat] Aspect of the Wild", -- [2]
					},
					["StepFunction"] = "Priority",
					["KeyPress"] = {
					},
					["PreMacro"] = {
						"/target  [@focustarget]", -- [1]
						"/targetenemy  [noexists][noharm][dead]", -- [2]
					},
					["PostMacro"] = {
					},
				}, -- [1]
			},
		},
	}, -- [3]
	nil, -- [4]
	{
		["HolySingle"] = {
			["Talents"] = "",
			["Default"] = 1,
			["SpecID"] = 257,
			["MacroVersions"] = {
				{
					"/cast Holy Word: Chastise", -- [1]
					"/cast Holy Fire", -- [2]
					"/cast Divine Star", -- [3]
					"/cast Smite", -- [4]
					["KeyRelease"] = {
					},
					["StepFunction"] = "Priority",
					["KeyPress"] = {
						"/target  [@focustarget]", -- [1]
						"/targetenemy  [noexists][help][dead]", -- [2]
					},
					["PreMacro"] = {
					},
					["PostMacro"] = {
					},
				}, -- [1]
			},
			["Icon"] = "INV_MISC_QUESTIONMARK",
			["Author"] = "Holyshnizzle@Doomhammer",
		},
		["HolyAoE"] = {
			["Talents"] = "2333222",
			["Default"] = 1,
			["Author"] = "Holyshnizzle@Doomhammer",
			["SpecID"] = 257,
			["MacroVersions"] = {
				{
					"/cast Holy Word: Chastise", -- [1]
					"/cast Holy Nova", -- [2]
					"/cast Divine Star", -- [3]
					["KeyRelease"] = {
					},
					["StepFunction"] = "Priority",
					["KeyPress"] = {
					},
					["PreMacro"] = {
						"/target  [@focustarget]", -- [1]
						"/targetenemy  [noexists][help][dead]", -- [2]
					},
					["PostMacro"] = {
					},
				}, -- [1]
			},
		},
		["ShadowAoE"] = {
			["Talents"] = "1322231",
			["Default"] = 1,
			["Author"] = "Holyshnizzle@Doomhammer",
			["SpecID"] = 258,
			["MacroVersions"] = {
				{
					"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
					"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
					"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
					"/cast Void Torrent", -- [4]
					"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
					"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
					"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Sear, Mind Sear, Mind Sear, Mind Sear, Mind Sear", -- [7]
					["KeyRelease"] = {
					},
					["StepFunction"] = "Priority",
					["KeyPress"] = {
					},
					["PreMacro"] = {
						"/target  [@focustarget]", -- [1]
						"/targetenemy  [noexists][noharm][dead]", -- [2]
					},
					["PostMacro"] = {
					},
				}, -- [1]
			},
		},
		["ShadowSingle"] = {
			["Talents"] = "1322231",
			["Default"] = 1,
			["Author"] = "Holyshnizzle@Doomhammer",
			["SpecID"] = 258,
			["MacroVersions"] = {
				{
					"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
					"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
					"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
					"/cast Void Torrent", -- [4]
					"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
					"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
					"/castsequence [nochanneling,mod:alt] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch", -- [7]
					"/cast [nochanneling,nomod] Mind Flay", -- [8]
					["KeyRelease"] = {
					},
					["StepFunction"] = "Priority",
					["KeyPress"] = {
					},
					["PreMacro"] = {
						"/target  [@focustarget]", -- [1]
						"/targetenemy  [noexists][noharm][dead]", -- [2]
					},
					["PostMacro"] = {
					},
				}, -- [1]
			},
		},
	}, -- [5]
	nil, -- [6]
	nil, -- [7]
	{
	}, -- [8]
}
