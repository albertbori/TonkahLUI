
GnomeOptions = {
	["use2"] = false,
	["STANDARDFUNCS"] = "|cff55ddcc",
	["COMMENT"] = "|cff55cc55",
	["use14"] = true,
	["EQUALS"] = "|cffccddee",
	["use11"] = false,
	["sendDebugOutputToChatWindow"] = false,
	["SequenceLibrary"] = {
		["UnholySoulReaper"] = {
			{
				["source"] = "Local",
				["author"] = "Alfalpha@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["version"] = 1,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 1221233",
				["specID"] = 252,
				["lang"] = "enUS",
				["PostMacro"] = "/cast [combat] Summon Gargoyle\n/cast [combat] Dark Transformation\n",
			}, -- [1]
			{
				"/cast Outbreak", -- [1]
				"/cast Festering Strike", -- [2]
				"/cast Soul Reaper", -- [3]
				"/cast Apocalypse", -- [4]
				"/cast Scourge Strike", -- [5]
				"/cast Death Coil", -- [6]
				["source"] = "Local",
				["author"] = "Alfalpha@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["version"] = 2,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 1221233",
				["specID"] = 252,
				["lang"] = "enUS",
				["PostMacro"] = "/cast [combat] Summon Gargoyle\n/cast [combat] Dark Transformation\n",
			}, -- [2]
			{
				"/cast Outbreak", -- [1]
				"/cast Festering Strike", -- [2]
				"/cast Soul Reaper", -- [3]
				"/cast Apocalypse", -- [4]
				"/cast Scourge Strike", -- [5]
				"/cast Death Coil", -- [6]
				["source"] = "Local",
				["author"] = "Alfalpha@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["version"] = 3,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 1221233",
				["specID"] = 252,
				["lang"] = "enUS",
				["PostMacro"] = "/cast [combat] Dark Transformation\n/cast [combat] Summon Gargoyle\n",
			}, -- [3]
			{
				"/cast [nochanneling] Outbreak", -- [1]
				"/cast [nochanneling] Dark Transformation", -- [2]
				"/cast [nochanneling] Festering Strike", -- [3]
				"/cast [nochanneling] Scourge Strike", -- [4]
				"/cast [nochanneling] Soul Reaper", -- [5]
				"/cast [nochanneling] Death Strike", -- [6]
				"/cast [nochanneling] Summon Gargoyle", -- [7]
				"/cast [nochanneling] Death Coil", -- [8]
				["source"] = "Local",
				["author"] = "Alfalpha@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 4,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 1221233",
				["specID"] = 252,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [4]
			{
				"/cast [nochanneling] Outbreak", -- [1]
				"/cast [nochanneling] Dark Transformation", -- [2]
				"/cast [nochanneling] Festering Strike", -- [3]
				"/cast [nochanneling] Scourge Strike", -- [4]
				"/cast [nochanneling] Soul Reaper", -- [5]
				"/cast [nochanneling] Summon Gargoyle", -- [6]
				"/cast [nochanneling,nomod] Death Coil; Death Strike", -- [7]
				["source"] = "Local",
				["author"] = "Alfalpha@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 5,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 1221233",
				["specID"] = 252,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [5]
			{
				"/cast [nochanneling] Apocalypse", -- [1]
				"/cast [nochanneling] Outbreak", -- [2]
				"/cast [nochanneling] Dark Transformation", -- [3]
				"/cast [nochanneling] Festering Strike", -- [4]
				"/cast [nochanneling] Scourge Strike", -- [5]
				"/cast [nochanneling] Soul Reaper", -- [6]
				"/cast [nochanneling] Summon Gargoyle", -- [7]
				"/cast [nochanneling,nomod] Death Coil; Death Strike", -- [8]
				["source"] = "Local",
				["author"] = "Alfalpha@Doomhammer",
				["PostMacro"] = "",
				["version"] = 6,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 1221233",
				["specID"] = 252,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [6]
		},
		["HolyDPSAoE"] = {
			{
				"/cast Divine Star", -- [1]
				"/cast Holy Nova", -- [2]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["lang"] = "enUS",
				["version"] = 1,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [1]
			{
				"/cast Divine Star", -- [1]
				"/cast Holy Nova", -- [2]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 2,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
			}, -- [2]
			{
				"/cast Divine Star", -- [1]
				"/cast Holy Nova", -- [2]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 3,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 257,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [3]
		},
		["ShadowDPS"] = {
			{
				"/cast [reset=12] Shadow Word: Pain", -- [1]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "",
				["version"] = 1,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 1322233",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [1]
			{
				"/cast Mindbender", -- [1]
				"/cast Void Eruption", -- [2]
				"/cast Shadow Word: Death", -- [3]
				"/cast Mind Blast", -- [4]
				"/cast [nochanneling] Mind Flay", -- [5]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "",
				["version"] = 2,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 1322233",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [2]
			{
				"/castsequence [reset=12] Shadow Word: Pain, Vampiric Touch", -- [1]
				"/cast Mindbender", -- [2]
				"/cast Void Eruption", -- [3]
				"/cast Shadow Word: Death", -- [4]
				"/cast Mind Blast", -- [5]
				"/cast [nochanneling] Mind Flay", -- [6]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "",
				["version"] = 3,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [3]
			{
				"/cast Mindbender", -- [1]
				"/cast Void Eruption", -- [2]
				"/cast Shadow Word: Death", -- [3]
				"/cast Mind Blast", -- [4]
				"/castsequence [nochanneling,reset=12] Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay", -- [5]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 4,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["PreMacro"] = "",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [4]
			{
				"/cast Mindbender", -- [1]
				"/cast Void Eruption", -- [2]
				"/cast Shadow Word: Death", -- [3]
				"/cast Mind Blast", -- [4]
				"/castsequence [nochanneling,reset=12] Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay", -- [5]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PreMacro"] = "",
				["version"] = 5,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [5]
			{
				"/cast Mindbender", -- [1]
				"/cast Void Eruption", -- [2]
				"/cast Shadow Word: Death", -- [3]
				"/cast Mind Blast", -- [4]
				"/castsequence [nochanneling,reset=12] Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay", -- [5]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PreMacro"] = "/target [@focustarget,nohelp,nodead]\n/targetenemy [@target,help,dead]\n",
				["version"] = 6,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [6]
			{
				"/cast Mindbender", -- [1]
				"/cast Void Eruption", -- [2]
				"/cast Shadow Word: Death", -- [3]
				"/cast Mind Blast", -- [4]
				"/castsequence [nochanneling,reset=12] Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay", -- [5]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 7,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget,nohelp,nodead]\n/targetenemy [@target,help,dead]\n",
			}, -- [7]
			{
				"/cast Mindbender", -- [1]
				"/cast Void Eruption", -- [2]
				"/cast Shadow Word: Death", -- [3]
				"/cast Mind Blast", -- [4]
				"/castsequence [nochanneling,reset=12] Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay", -- [5]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 8,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
			}, -- [8]
			{
				"/cast Mindbender", -- [1]
				"/cast Void Eruption", -- [2]
				"/cast Shadow Word: Death", -- [3]
				"/cast Mind Blast", -- [4]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [5]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 9,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [9]
			{
				"/cast [nochanneling] Mindbender", -- [1]
				"/cast [nochanneling] Void Eruption", -- [2]
				"/cast [nochanneling] Shadow Word: Death", -- [3]
				"/cast [nochanneling] Mind Blast", -- [4]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [5]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 10,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [10]
			{
				"/cast [nochanneling] Mindbender", -- [1]
				"/cast [nochanneling] Void Eruption", -- [2]
				"/cast [nochanneling] Shadow Word: Death", -- [3]
				"/cast [nochanneling] Mind Blast", -- [4]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay", -- [5]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
				["version"] = 11,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [11]
			{
				"/cast Mindbender", -- [1]
				"/cast Void Eruption", -- [2]
				"/cast Shadow Word: Death", -- [3]
				"/cast Mind Blast", -- [4]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [5]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 12,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
			}, -- [12]
			{
				"/cast Vampiric Embrace", -- [1]
				"/cast Mindbender", -- [2]
				"/cast Void Eruption", -- [3]
				"/cast Shadow Word: Death", -- [4]
				"/cast Mind Blast", -- [5]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [6]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 13,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
			}, -- [13]
			{
				"/cast Vampiric Embrace", -- [1]
				"/cast Mindbender", -- [2]
				"/cast Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast Shadow Word: Death", -- [5]
				"/cast Mind Blast", -- [6]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [7]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 14,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [14]
			{
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
				"/cast Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [7]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 15,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [15]
			{
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [7]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
				["version"] = 16,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [16]
			{
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [7]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 17,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
			}, -- [17]
			{
				"/cast [nochanneling:Void Torrent] Power Word: Shield", -- [1]
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [2]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [3]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [4]
				"/cast Void Torrent", -- [5]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [6]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [7]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 18,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [18]
			{
				"/cast [nochanneling:Void Torrent] Power Word: Shield", -- [1]
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [2]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [3]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [4]
				"/cast Void Torrent", -- [5]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [6]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [7]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 19,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [19]
			{
				"/cast [nochanneling:Void Torrent] Power Word: Shield", -- [1]
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [2]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [3]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [4]
				"/cast Void Torrent", -- [5]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [6]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [7]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["lang"] = "enUS",
				["version"] = 20,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [20]
			{
				"/cast [nochanneling:Void Torrent] Power Word: Shield", -- [1]
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [2]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [3]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [4]
				"/cast Void Torrent", -- [5]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [6]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [7]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 21,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
			}, -- [21]
			{
				"/cast [nochanneling:Void Torrent] Power Word: Shield", -- [1]
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [2]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [3]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [4]
				"/cast Void Torrent", -- [5]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [6]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [7]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 22,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [22]
			{
				"/cast [nochanneling:Void Torrent] Power Word: Shield", -- [1]
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [2]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [3]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [4]
				"/cast Void Torrent", -- [5]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [6]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [7]
				"/castsequence [nochanneling,nomod] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [8]
				"/cast [nochanneling,mod:alt] Mind Flay", -- [9]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 23,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [23]
			{
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
				"/castsequence [nochanneling,nomod] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [7]
				"/cast [nochanneling,mod:alt] Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 24,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [24]
			{
				"/cast [nochanneling] Vampiric Embrace", -- [1]
				"/cast [nochanneling] Mindbender", -- [2]
				"/cast [nochanneling] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling] Shadow Word: Death", -- [5]
				"/cast [nochanneling] Mind Blast", -- [6]
				"/castsequence [nochanneling,nomod] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [7]
				"/cast [nochanneling,mod:alt] Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 25,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [25]
			{
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
				"/castsequence [nochanneling,mod:alt] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [7]
				"/cast [nochanneling,nomod] Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 26,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [26]
			{
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
				"/castsequence [nochanneling,nomod] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [7]
				"/cast [nochanneling,mod:alt] Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 27,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [27]
			{
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
				"/castsequence [nochanneling,nomod] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [7]
				"/cast [nochanneling,mod:alt] Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 28,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [28]
			{
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
				"/castsequence [nochanneling,nomod] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [7]
				"/cast [nochanneling,mod:alt] Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 29,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [29]
			{
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
				"/castsequence [nochanneling,nomod] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [7]
				"/cast [nochanneling,mod:alt] Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 30,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [30]
			{
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
				"/castsequence [nochanneling,nomod] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [7]
				"/cast [nochanneling,mod:alt] Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 31,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [31]
			{
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
				"/castsequence [nochanneling,nomod] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [7]
				"/cast [nochanneling,mod:alt] Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 32,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [32]
		},
		["HolyDPS"] = {
			{
				"/cast Holy Word: Chastise", -- [1]
				"/cast Holy Fire", -- [2]
				"/cast Divine Star", -- [3]
				"/cast Smite", -- [4]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["lang"] = "enUS",
				["version"] = 1,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [1]
			{
				"/cast Holy Word: Chastise", -- [1]
				"/cast Holy Fire", -- [2]
				"/cast Divine Star", -- [3]
				"/cast Smite", -- [4]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 2,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
			}, -- [2]
			{
				"/cast Holy Word: Chastise", -- [1]
				"/cast Holy Fire", -- [2]
				"/cast Divine Star", -- [3]
				"/cast Smite", -- [4]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 3,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
			}, -- [3]
			{
				"/cast Holy Word: Chastise", -- [1]
				"/cast Holy Fire", -- [2]
				"/cast Divine Star", -- [3]
				"/cast Smite", -- [4]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 4,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 257,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [4]
		},
		["ShadowDPSHeal"] = {
			{
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
				"/castsequence [nochanneling,nomod] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [7]
				"/cast [nochanneling,mod:alt] Mind Flay", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 1,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [1]
			{
				"/cast [nochanneling:Void Torrent] Power Word: Shield", -- [1]
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [2]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [3]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [4]
				"/cast Void Torrent", -- [5]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [6]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [7]
				"/castsequence [nochanneling,nomod] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Flay, Mind Flay, Mind Flay, Mind Flay, Mind Flay", -- [8]
				"/cast [nochanneling,mod:alt] Mind Flay", -- [9]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 2,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [2]
		},
		["FurySingleDPS"] = {
			{
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PostMacro"] = "",
				["lang"] = "enUS",
				["version"] = 1,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2332233",
				["specID"] = 72,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "",
			}, -- [1]
			{
				"/cast Execute", -- [1]
				"/castsequence  reset=60  Rampage, Battle Cry", -- [2]
				"/cast Rampage", -- [3]
				"/cast [talent:7/1] Bladestorm; [talent:7/3] Dragon Roar", -- [4]
				"/cast Bloodthirst", -- [5]
				"/cast Raging Blow", -- [6]
				"/cast Furious Slash", -- [7]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PostMacro"] = "",
				["lang"] = "enUS",
				["version"] = 2,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2332233",
				["specID"] = 72,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Berserker Rage\n/cast [combat] Bloodbath\n/cast [combat] Avatar\n",
			}, -- [2]
			{
				"/cast Odyn's Fury", -- [1]
				"/cast Execute", -- [2]
				"/castsequence  reset=60  Rampage, Battle Cry", -- [3]
				"/cast Rampage", -- [4]
				"/cast [talent:7/1] Bladestorm; [talent:7/3] Dragon Roar", -- [5]
				"/cast Bloodthirst", -- [6]
				"/cast Raging Blow", -- [7]
				"/cast Odyn's Fury", -- [8]
				"/cast Execute", -- [9]
				"/castsequence  reset=60  Rampage, Battle Cry", -- [10]
				"/cast Rampage", -- [11]
				"/cast [talent:7/1] Bladestorm; [talent:7/3] Dragon Roar", -- [12]
				"/cast Bloodthirst", -- [13]
				"/cast Raging Blow", -- [14]
				"/cast Furious Slash", -- [15]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PostMacro"] = "",
				["lang"] = "enUS",
				["version"] = 3,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2332233",
				["specID"] = 72,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Berserker Rage\n/cast [combat] Bloodbath\n/cast [combat] Avatar\n",
			}, -- [3]
			{
				"/cast Odyn's Fury", -- [1]
				"/cast Execute", -- [2]
				"/castsequence  reset=60  Rampage, Battle Cry", -- [3]
				"/cast Rampage", -- [4]
				"/cast [talent:7/1] Bladestorm; [talent:7/3] Dragon Roar", -- [5]
				"/cast Bloodthirst", -- [6]
				"/cast Bloodthirst", -- [7]
				"/cast Raging Blow", -- [8]
				"/cast Raging Blow", -- [9]
				"/cast Furious Slash", -- [10]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Berserker Rage\n/cast [combat] Bloodbath\n/cast [combat] Avatar\n",
				["version"] = 4,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2332233",
				["specID"] = 72,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [4]
			{
				"/cast Odyn's Fury", -- [1]
				"/cast Execute", -- [2]
				"/castsequence  reset=60  Rampage, Battle Cry", -- [3]
				"/cast Dragon Roar", -- [4]
				"/cast Rampage", -- [5]
				"/cast Bloodthirst", -- [6]
				"/cast Raging Blow", -- [7]
				"/cast Furious Slash", -- [8]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PostMacro"] = "",
				["lang"] = "enUS",
				["version"] = 5,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2332233",
				["specID"] = 72,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Berserker Rage\n/cast [combat] Bloodbath\n/cast [combat] Avatar\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [5]
			{
				"/cast Odyn's Fury", -- [1]
				"/cast Execute", -- [2]
				"/castsequence  reset=60  Rampage, Battle Cry", -- [3]
				"/cast Dragon Roar", -- [4]
				"/cast Rampage", -- [5]
				"/cast Bloodthirst", -- [6]
				"/cast Raging Blow", -- [7]
				"/cast Furious Slash", -- [8]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PostMacro"] = "",
				["lang"] = "enUS",
				["version"] = 6,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2332233",
				["specID"] = 72,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Bloodbath\n/cast [combat] Avatar\n/cast [combat] Battle Cry\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [6]
			{
				"/cast Dragon Roar", -- [1]
				"/cast Odyn's Fury", -- [2]
				"/cast Execute", -- [3]
				"/cast Rampage", -- [4]
				"/cast Bloodthirst", -- [5]
				"/cast Raging Blow", -- [6]
				"/cast Furious Slash", -- [7]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PostMacro"] = "",
				["lang"] = "enUS",
				["version"] = 7,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2332233",
				["specID"] = 72,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Avatar\n/cast [combat] Battle Cry\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [7]
			{
				"/cast Dragon Roar", -- [1]
				"/cast Odyn's Fury", -- [2]
				"/cast Execute", -- [3]
				"/cast Rampage", -- [4]
				"/cast Rampage", -- [5]
				"/cast Bloodthirst", -- [6]
				"/cast Bloodthirst", -- [7]
				"/cast Raging Blow", -- [8]
				"/cast Raging Blow", -- [9]
				"/cast Furious Slash", -- [10]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PostMacro"] = "",
				["lang"] = "enUS",
				["version"] = 8,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2332233",
				["specID"] = 72,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Avatar\n/cast [combat] Battle Cry\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [8]
			{
				"/cast Dragon Roar", -- [1]
				"/cast Odyn's Fury", -- [2]
				"/cast Execute", -- [3]
				"/cast Rampage", -- [4]
				"/cast Rampage", -- [5]
				"/cast Bloodthirst", -- [6]
				"/cast Raging Blow", -- [7]
				"/cast Raging Blow", -- [8]
				"/cast Furious Slash", -- [9]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PostMacro"] = "",
				["lang"] = "enUS",
				["version"] = 9,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2332233",
				["specID"] = 72,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Avatar\n/cast [combat] Battle Cry\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [9]
			{
				"/cast Dragon Roar", -- [1]
				"/cast Odyn's Fury", -- [2]
				"/cast Execute", -- [3]
				"/cast Rampage", -- [4]
				"/cast Rampage", -- [5]
				"/castsequence Bloodthirst, Raging Blow, Furious Slash", -- [6]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PostMacro"] = "",
				["lang"] = "enUS",
				["version"] = 10,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2332233",
				["specID"] = 72,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Avatar\n/cast [combat] Battle Cry\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [10]
			{
				"/cast Dragon Roar", -- [1]
				"/cast Odyn's Fury", -- [2]
				"/cast Execute", -- [3]
				"/cast Rampage", -- [4]
				"/castsequence Raging Blow, Bloodthirst, Furious Slash", -- [5]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PostMacro"] = "",
				["lang"] = "enUS",
				["version"] = 11,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2332233",
				["specID"] = 72,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Avatar\n/cast [combat] Battle Cry\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
			}, -- [11]
		},
		["ShadowDPSAoE"] = {
			{
				"/cast Vampiric Embrace", -- [1]
				"/cast Mindbender", -- [2]
				"/cast Void Eruption", -- [3]
				"/cast Shadow Word: Death", -- [4]
				"/cast Mind Blast", -- [5]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Sear, Mind Sear, Mind Sear, Mind Sear, Mind Sear", -- [6]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 1,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
			}, -- [1]
			{
				"/cast Vampiric Embrace", -- [1]
				"/cast Mindbender", -- [2]
				"/cast Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast Shadow Word: Death", -- [5]
				"/cast Mind Blast", -- [6]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Sear, Mind Sear, Mind Sear, Mind Sear, Mind Sear", -- [7]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 2,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [2]
			{
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Sear, Mind Sear, Mind Sear, Mind Sear, Mind Sear", -- [7]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 3,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
			}, -- [3]
			{
				"/cast [nochanneling:Void Torrent] Power Word: Shield", -- [1]
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [2]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [3]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [4]
				"/cast Void Torrent", -- [5]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [6]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [7]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Sear, Mind Sear, Mind Sear, Mind Sear, Mind Sear", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 4,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
				["helpTxt"] = "Talents: 1322231",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [4]
			{
				"/cast [nochanneling:Void Torrent] Power Word: Shield", -- [1]
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [2]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [3]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [4]
				"/cast Void Torrent", -- [5]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [6]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [7]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Sear, Mind Sear, Mind Sear, Mind Sear, Mind Sear", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PostMacro"] = "",
				["version"] = 5,
				["lang"] = "enUS",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][help][dead]\n",
			}, -- [5]
			{
				"/cast [nochanneling:Void Torrent] Power Word: Shield", -- [1]
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [2]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [3]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [4]
				"/cast Void Torrent", -- [5]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [6]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [7]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Sear, Mind Sear, Mind Sear, Mind Sear, Mind Sear", -- [8]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 6,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [6]
			{
				"/cast [nochanneling:Void Torrent] Vampiric Embrace", -- [1]
				"/cast [nochanneling:Void Torrent] Mindbender", -- [2]
				"/cast [nochanneling:Void Torrent] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling:Void Torrent] Shadow Word: Death", -- [5]
				"/cast [nochanneling:Void Torrent] Mind Blast", -- [6]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Sear, Mind Sear, Mind Sear, Mind Sear, Mind Sear", -- [7]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 7,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [7]
			{
				"/cast [nochanneling] Vampiric Embrace", -- [1]
				"/cast [nochanneling] Mindbender", -- [2]
				"/cast [nochanneling] Void Eruption", -- [3]
				"/cast Void Torrent", -- [4]
				"/cast [nochanneling] Shadow Word: Death", -- [5]
				"/cast [nochanneling] Mind Blast", -- [6]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Sear, Mind Sear, Mind Sear, Mind Sear, Mind Sear", -- [7]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 8,
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [8]
			{
				"/cast [nochanneling] Vampiric Embrace", -- [1]
				"/cast [nochanneling] Mindbender", -- [2]
				"/cast [nochanneling] Void Eruption", -- [3]
				"/cast [nochanneling] Shadow Word: Death", -- [4]
				"/cast [nochanneling] Mind Blast", -- [5]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Sear, Mind Sear, Mind Sear, Mind Sear, Mind Sear", -- [6]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["version"] = 9,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [9]
			{
				"/cast [nochanneling] Vampiric Embrace", -- [1]
				"/cast [nochanneling] Mindbender", -- [2]
				"/cast [nochanneling] Void Eruption", -- [3]
				"/cast [nochanneling] Shadow Word: Death", -- [4]
				"/cast [nochanneling] Mind Blast", -- [5]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Sear, Mind Sear, Mind Sear, Mind Sear, Mind Sear", -- [6]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["version"] = 10,
				["icon"] = "INV_MISC_QUESTIONMARK",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [10]
			{
				"/cast [nochanneling] Vampiric Embrace", -- [1]
				"/cast [nochanneling] Mindbender", -- [2]
				"/cast [nochanneling] Void Eruption", -- [3]
				"/cast [nochanneling] Shadow Word: Death", -- [4]
				"/cast [nochanneling] Mind Blast", -- [5]
				"/castsequence [nochanneling] reset=combat/target/12  Shadow Word: Pain, Vampiric Touch, Mind Sear, Mind Sear, Mind Sear, Mind Sear, Mind Sear", -- [6]
				["source"] = "Local",
				["author"] = "Holyshnizzle@Doomhammer",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 11,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2333222",
				["specID"] = 258,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [11]
		},
		["FuryAoEDPS"] = {
			{
				"/cast Dragon Roar", -- [1]
				"/cast Odyn's Fury", -- [2]
				"/cast Execute", -- [3]
				"/cast Rampage", -- [4]
				"/castsequence Raging Blow, Bloodthirst, Whirlwind", -- [5]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Avatar\n/cast [combat] Battle Cry\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 1,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2333333",
				["specID"] = 72,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [1]
			{
				"/cast Dragon Roar", -- [1]
				"/cast Odyn's Fury", -- [2]
				"/cast Whirlwind", -- [3]
				"/cast Rampage", -- [4]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Avatar\n/cast [combat] Battle Cry\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 2,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2333333",
				["specID"] = 72,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [2]
			{
				"/cast Dragon Roar", -- [1]
				"/cast Odyn's Fury", -- [2]
				"/cast Whirlwind", -- [3]
				"/cast Rampage", -- [4]
				"/cast Bloodthirst", -- [5]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Avatar\n/cast [combat] Battle Cry\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 3,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2333333",
				["specID"] = 72,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [3]
			{
				"/cast Dragon Roar", -- [1]
				"/cast Odyn's Fury", -- [2]
				"/cast Execute", -- [3]
				"/cast Rampage", -- [4]
				"/castsequence  reset=5  Bloodthirst, Whirlwind, Whirlwind", -- [5]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Avatar\n/cast [combat] Battle Cry\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 4,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2333333",
				["specID"] = 72,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [4]
			{
				"/cast Dragon Roar", -- [1]
				"/cast Odyn's Fury", -- [2]
				"/cast Execute", -- [3]
				"/cast Rampage", -- [4]
				"/castsequence  reset=4  Bloodthirst, Whirlwind, Whirlwind", -- [5]
				["source"] = "Local",
				["author"] = "Taunkah@Doomhammer",
				["PreMacro"] = "/target [@focustarget]\n/targetenemy [noexists][noharm][dead]\n/cast [combat] Avatar\n/cast [combat] Battle Cry\n",
				["icon"] = "INV_MISC_QUESTIONMARK",
				["version"] = 5,
				["StepFunction"] = "  limit = limit or 1\n  if step == limit then\n    limit = limit % #macros + 1\n    step = 1\n  else\n    step = step % #macros + 1\n  end\n",
				["helpTxt"] = "Talents: 2333333",
				["specID"] = 72,
				["lang"] = "enUS",
				["PostMacro"] = "",
			}, -- [5]
		},
	},
	["debug"] = false,
	["use6"] = false,
	["CommandColour"] = "|cFF00FF00",
	["UNKNOWN"] = "|cffff6666",
	["CONCAT"] = "|cffcc7777",
	["hideSoundErrors"] = false,
	["sendDebugOutputToChat"] = true,
	["resetOOC"] = true,
	["STRING"] = "|cff888888",
	["requireTarget"] = false,
	["autoCreateMacroStubsGlobal"] = false,
	["autoCreateMacroStubsClass"] = true,
	["TitleColour"] = "|cFFFF0000",
	["useTranslator"] = false,
	["initialised"] = true,
	["filterList"] = {
		["Spec"] = true,
		["All"] = false,
		["Class"] = true,
	},
	["DebugModules"] = {
		["GS-SequenceTranslator"] = false,
		["Transmission"] = false,
		["GS-SequenceEditor"] = false,
		["GS-Core"] = true,
	},
	["INDENT"] = "|cffccaa88",
	["DisabledSequences"] = {
	},
	["ActiveSequenceVersions"] = {
		["DB_Frosty"] = 1,
		["FurySingleDPS"] = 11,
		["DB_Arcane"] = 1,
		["DB_Prot_ST"] = 1,
		["DB_enhsingle"] = 1,
		["DB_Arms_ST"] = 1,
		["DB_Prot_AOE"] = 1,
		["DB_ENLegi"] = 1,
		["DB_DRoutlaw"] = 1,
		["DB_Fury3"] = 1,
		["DB_AFF2"] = 1,
		["DB_DF"] = 1,
		["DB_SurvivelH"] = 1,
		["DB_SquishyDK"] = 1,
		["DB_Fury4"] = 1,
		["DB_AFF"] = 1,
		["DB_BloodDK"] = 1,
		["DB_BMAOE"] = 1,
		["DB_Boomer"] = 1,
		["DB_Palla_Sera"] = 1,
		["DB_DemoAoE"] = 1,
		["DB_ProtWar"] = 1,
		["DB_Fury1"] = 1,
		["DB_Blood"] = 1,
		["DB_Feral-AoE"] = 1,
		["DB_AaslaanFire"] = 1,
		["DB_MC_ElemST"] = 1,
		["DB_KTNRestoBoom"] = 1,
		["DB_SURVST"] = 1,
		["DB_RetAoE_Raid"] = 1,
		["DB_KTN_DiscDeeps"] = 1,
		["DB_KTN_MouseOver"] = 1,
		["DB_BMaoe"] = 1,
		["DB_bear1"] = 1,
		["FuryAoEDPS"] = 5,
		["DB_havocsingle"] = 1,
		["DB_BMH"] = 1,
		["DB_Arms_AOE"] = 1,
		["ShadowDPSAoE"] = 11,
		["DB_Assassin"] = 1,
		["ShadowDPSHeal"] = 2,
		["DB_BM_ST"] = 1,
		["DB_bear2"] = 1,
		["DB_BrewMaster_AoE"] = 1,
		["DB_Disc-THealAoe"] = 1,
		["ShadowDPS"] = 32,
		["HolyDPS"] = 4,
		["UnholySoulReaper"] = 6,
		["DB_Single_Marls"] = 1,
		["DB_HolyPriesty"] = 1,
		["DB_Ret_Raid"] = 1,
		["DB_Tank_Heal"] = 1,
		["DB_Fury2"] = 1,
		["DB_winsingle"] = 1,
		["DB_WW"] = 1,
		["DB_Disc-TDPS"] = 1,
		["DB_ShadowPriest"] = 1,
		["DB_EnhST"] = 1,
		["DB_BMsingle"] = 1,
		["DB_MC_Chain"] = 1,
		["DB_BrewMaster_ST"] = 1,
		["DB_Ichthys_Frosty"] = 1,
		["DB_DBFrost"] = 1,
		["DB_KTNDRUAOEHEALS"] = 1,
		["DB_DiscDeeps"] = 1,
		["DB_Marks_AOE"] = 1,
		["DB_SURVAOE"] = 1,
		["DB_Destro"] = 1,
		["DB_HolyDeeps"] = 1,
		["DB_DHHavoc"] = 1,
		["DB_Disc-THeal"] = 1,
		["DB_CalliynOutlaw"] = 1,
		["DB_druid_bala_st"] = 1,
		["DB_Subtle"] = 1,
		["DB_feralsingle"] = 1,
		["DB_KTNDRUHEALS"] = 1,
		["DB_Mm_ST"] = 1,
		["HolyDPSAoE"] = 3,
		["DB_ElemAoE"] = 1,
		["DB_Feral-ST"] = 1,
		["DB_DKunholy"] = 1,
		["DB_RestoBoomer"] = 1,
		["DB_Prot_ST2"] = 1,
		["DB_Demon"] = 1,
		["DB_feralaoe"] = 1,
		["DB_RestoDeeps"] = 1,
		["DB_Vengeance"] = 1,
		["DB_RetAoE"] = 1,
		["DB_MC_ElemAoE"] = 1,
		["DB_FDK2"] = 1,
		["DB_Fire"] = 1,
		["DB_DemoSingle"] = 1,
		["DB_MC_Wave"] = 1,
		["DB_MC_Surge"] = 1,
		["DB_Outlaw"] = 1,
		["DB_TLAssassin"] = 1,
		["DB_Ret"] = 1,
		["DB_Elem"] = 1,
	},
	["EmphasisColour"] = "|cFFFFFF00",
	["overflowPersonalMacros"] = false,
	["WOWSHORTCUTS"] = "|cffddaaff",
	["RealtimeParse"] = false,
	["deleteOrphansOnLogout"] = false,
	["clearUIErrors"] = false,
	["NUMBER"] = "|cffffaa00",
	["AuthorColour"] = "|cFF00D1FF",
	["seedInitialMacro"] = false,
	["hideUIErrors"] = false,
	["debugSequenceEx"] = false,
	["use12"] = false,
	["use13"] = true,
	["NormalColour"] = "|cFFFFFFFF",
	["KEYWORD"] = "|cff88bbdd",
	["saveAllMacrosLocal"] = true,
	["setDefaultIconQuestionMark"] = true,
	["sendDebugOutputGSDebugOutput"] = false,
	["use1"] = false,
}
