
AdiBagsDB = {
	["namespaces"] = {
		["ItemLevel"] = {
			["profiles"] = {
				["Tonkah LUI"] = {
					["minLevel"] = 700,
				},
			},
		},
		["FilterOverride"] = {
			["profiles"] = {
				["Default"] = {
					["version"] = 3,
				},
				["Tonkah LUI"] = {
					["version"] = 3,
					["overrides"] = {
						[137623] = "Consumable#Consumable",
						[137604] = "Consumable#Consumable",
						[68775] = "Miscellaneous#Tools",
						[31091] = "Equipment#Equipment",
						[20815] = "Miscellaneous#Tools",
						[63206] = "Miscellaneous#Miscellaneous",
						[32427] = "Quest#Quest",
						[139376] = "Champion Equipment#Champion Equipment",
						[140248] = "Consumable#Consumable",
						[32506] = "Quest#Quest",
						[31096] = "Equipment#Equipment",
						[42421] = "Miscellaneous#Tools",
						[31100] = "Equipment#Equipment",
						[45645] = "Equipment#Equipment",
						[45798] = "Miscellaneous#Miscellaneous",
						[140222] = "Consumable#Consumable",
						[46110] = "Consumable#Consumable",
						[9149] = "Miscellaneous#Tools",
						[141350] = "Consumable#Consumable",
						[31094] = "Equipment#Equipment",
						[31095] = "Equipment#Equipment",
					},
				},
			},
		},
		["ItemCategory"] = {
			["profiles"] = {
				["Tonkah LUI"] = {
					["splitBySubclass"] = {
						["Item Enhancement!"] = false,
					},
				},
			},
		},
		["NewItem"] = {
			["profiles"] = {
				["Tonkah LUI"] = {
					["glowColor"] = {
						0.301960784313726, -- [1]
						nil, -- [2]
						0.301960784313726, -- [3]
						0.75, -- [4]
					},
					["ignoreJunk"] = true,
					["highlight"] = "blizzard",
				},
			},
		},
		["AdiBags_TooltipInfo"] = {
		},
		["Legion"] = {
		},
		["MoneyFrame"] = {
			["profiles"] = {
				["Tonkah LUI"] = {
					["small"] = true,
				},
			},
		},
		["CurrencyFrame"] = {
			["profiles"] = {
				["Tonkah LUI"] = {
					["shown"] = {
						["Garrison Resources"] = false,
						["Darkmoon Prize Ticket"] = false,
						["Curious Coin"] = false,
						["Nethershard"] = false,
						["Timeworn Artifact"] = false,
						["Lingering Soul Fragment"] = false,
						["Lesser Charm of Good Fortune"] = false,
					},
					["text"] = {
						["name"] = "Prototype",
						["size"] = 12,
					},
				},
			},
		},
		["DataSource"] = {
		},
		["ItemSets"] = {
		},
		["Junk"] = {
			["profiles"] = {
				["Default"] = {
					["exclude"] = {
						[140744] = true,
						[140745] = true,
						[140746] = true,
						[140743] = true,
						[140731] = true,
					},
				},
				["Tonkah LUI"] = {
					["exclude"] = {
						[140743] = true,
						[32427] = true,
						[140744] = true,
						[140731] = true,
						[140745] = true,
						[140746] = true,
					},
				},
			},
		},
		["Equipment"] = {
			["profiles"] = {
				["Tonkah LUI"] = {
					["dispatchRule"] = "one",
				},
			},
		},
	},
	["char"] = {
		["Holyshnizzle - Doomhammer"] = {
			["collapsedSections"] = {
				["Miscellaneous#Miscellaneous"] = true,
			},
		},
	},
	["profileKeys"] = {
		["Marmit - Doomhammer"] = "Tonkah LUI",
		["Tareva - Doomhammer"] = "Tonkah LUI",
		["Bartholamue - Doomhammer"] = "Tonkah LUI",
		["Holyshnizzle - Doomhammer"] = "Tonkah LUI",
		["Alfalpha - Doomhammer"] = "Tonkah LUI",
		["Taunkah - Doomhammer"] = "Tonkah LUI",
		["Brooslee - Doomhammer"] = "Tonkah LUI",
		["Nilrum - Doomhammer"] = "Tonkah LUI",
		["Dfbdeffbw - Doomhammer"] = "Default",
		["Bahlar - Doomhammer"] = "Tonkah LUI",
		["Eamesey - Doomhammer"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["maxHeight"] = 0.9,
			["skin"] = {
				["border"] = "Stripped_hard",
			},
			["columnWidth"] = {
				["Backpack"] = 10,
			},
			["virtualStacks"] = {
				["others"] = true,
				["stackable"] = true,
			},
			["scale"] = 1,
			["bagFont"] = {
				["name"] = "Prototype",
			},
			["positions"] = {
				["anchor"] = {
					["xOffset"] = -21,
					["yOffset"] = 35.0001449584961,
				},
			},
			["sectionFont"] = {
				["name"] = "Prototype",
			},
		},
		["Tonkah LUI"] = {
			["virtualStacks"] = {
				["others"] = true,
				["stackable"] = true,
				["incomplete"] = true,
			},
			["columnWidth"] = {
				["Bank"] = 20,
				["Backpack"] = 10,
			},
			["maxHeight"] = 0.9,
			["skin"] = {
				["ReagentBankColor"] = {
					nil, -- [1]
					0, -- [2]
				},
				["BankColor"] = {
					[3] = 0,
				},
				["border"] = "Stripped_hard",
			},
			["bagFont"] = {
				["name"] = "Prototype",
			},
			["positions"] = {
				["anchor"] = {
					["xOffset"] = -21,
					["yOffset"] = 35.0001449584961,
				},
				["Bank"] = {
					["xOffset"] = 106.376411437988,
					["yOffset"] = -105.5595703125,
				},
				["Backpack"] = {
					["xOffset"] = -22,
					["yOffset"] = 35.9998741149902,
				},
			},
			["filterPriorities"] = {
				["Legion"] = 79,
				["NewItem"] = 100,
				["Junk"] = 95,
			},
			["sectionFont"] = {
				["name"] = "Prototype",
			},
			["compactLayout"] = true,
			["hideAnchor"] = true,
			["scale"] = 1,
			["positionMode"] = "manual",
			["qualityOpacity"] = 0.5,
		},
	},
}
