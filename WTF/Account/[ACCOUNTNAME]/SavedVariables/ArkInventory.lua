
ARKINVDB = {
	["global"] = {
		["option"] = {
			["catset"] = {
				["data"] = {
					[1000] = {
						["category"] = {
							["active"] = {
								[3] = {
									[1001] = true,
									[1003] = true,
									[1005] = true,
									[1002] = true,
									[1004] = true,
								},
							},
						},
					},
				},
			},
			["sort"] = {
				["method"] = {
					["data"] = {
						[9998] = {
							["order"] = {
								nil, -- [1]
								nil, -- [2]
								nil, -- [3]
								nil, -- [4]
								"itemstatlevel", -- [5]
								"id", -- [6]
								"itemuselevel", -- [7]
								"itemage", -- [8]
								"itemtype", -- [9]
								"slottype", -- [10]
								"vendorprice", -- [11]
							},
						},
						[9995] = {
							["order"] = {
								"itemstatlevel", -- [1]
								"id", -- [2]
								"itemuselevel", -- [3]
								"itemage", -- [4]
								"itemtype", -- [5]
								"name", -- [6]
								"category", -- [7]
								"location", -- [8]
								"slottype", -- [9]
								"vendorprice", -- [10]
								"quality", -- [11]
							},
						},
						[9999] = {
							["order"] = {
								"itemstatlevel", -- [1]
								"id", -- [2]
								"itemuselevel", -- [3]
								"itemage", -- [4]
								"itemtype", -- [5]
								"name", -- [6]
								"category", -- [7]
								"location", -- [8]
								"slottype", -- [9]
								"vendorprice", -- [10]
								"quality", -- [11]
							},
						},
						[9996] = {
							["order"] = {
								nil, -- [1]
								"itemstatlevel", -- [2]
								"id", -- [3]
								"itemuselevel", -- [4]
								"itemage", -- [5]
								"itemtype", -- [6]
								"name", -- [7]
								"category", -- [8]
								"location", -- [9]
								"slottype", -- [10]
								"quality", -- [11]
							},
						},
						[9997] = {
							["order"] = {
								nil, -- [1]
								"itemstatlevel", -- [2]
								"id", -- [3]
								"itemuselevel", -- [4]
								"itemage", -- [5]
								"itemtype", -- [6]
								"category", -- [7]
								"location", -- [8]
								"slottype", -- [9]
								"vendorprice", -- [10]
								"quality", -- [11]
							},
						},
						[9994] = {
							["order"] = {
								nil, -- [1]
								"itemstatlevel", -- [2]
								"id", -- [3]
								"itemuselevel", -- [4]
								"itemage", -- [5]
								"itemtype", -- [6]
								"category", -- [7]
								"location", -- [8]
								"slottype", -- [9]
								"vendorprice", -- [10]
								"quality", -- [11]
							},
						},
					},
				},
			},
			["category"] = {
				[3] = {
					["data"] = {
						[1001] = {
							["formula"] = "outfit( \"Holy\" )",
							["name"] = "Holy Set",
							["order"] = 100,
							["used"] = "D",
						},
						[1003] = {
							["formula"] = "equip( ) and sb( ) and not outfit( ) and not trash( )",
							["name"] = "Soulbound Gear",
							["order"] = 100,
							["used"] = "Y",
						},
						[1005] = {
							["name"] = "Saved Outfit",
							["formula"] = "outfit( )",
							["used"] = "Y",
							["order"] = 100,
						},
						[1002] = {
							["formula"] = "outfit( \"Shadow\" )",
							["name"] = "Shadow Set",
							["order"] = 100,
							["used"] = "D",
						},
						[1004] = {
							["formula"] = "type( \"armor\", \"weapon\") and quality( 2, 3, 4, 5, 6, 7 ) and not soulbound( ) and not accountbound( )",
							["name"] = "BoE Gear",
							["order"] = 100,
							["used"] = "Y",
						},
					},
					["next"] = 1005,
				},
			},
			["junk"] = {
				["delete"] = true,
				["sell"] = true,
			},
			["version"] = 30715,
			["profile"] = {
				["data"] = {
					[9999] = {
						["location"] = {
							{
								["anchor"] = {
									["b"] = 23.5366039276123,
									["l"] = 1251.68103027344,
									["r"] = 1943.68103027344,
									["t"] = 552.53662109375,
								},
							}, -- [1]
							nil, -- [2]
							{
								["anchor"] = {
									["b"] = 176.976593017578,
									["l"] = 18.7214393615723,
									["t"] = 1033.9765625,
									["r"] = 694.721435546875,
								},
							}, -- [3]
							{
								["anchor"] = {
									["b"] = 1293.59329223633,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
									["t"] = 1473.59326171875,
								},
							}, -- [4]
							{
								["anchor"] = {
									["b"] = 1293.59329223633,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
									["t"] = 1473.59326171875,
								},
							}, -- [5]
							{
								["anchor"] = {
									["b"] = 1293.59329223633,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
									["t"] = 1473.59326171875,
								},
							}, -- [6]
							{
								["anchor"] = {
									["b"] = 1293.59329223633,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
									["t"] = 1473.59326171875,
								},
							}, -- [7]
							{
								["anchor"] = {
									["b"] = 1293.59329223633,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
									["t"] = 1473.59326171875,
								},
							}, -- [8]
							{
								["anchor"] = {
									["b"] = 1293.59329223633,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
									["t"] = 1473.59326171875,
								},
							}, -- [9]
							{
								["anchor"] = {
									["b"] = 1293.59329223633,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
									["t"] = 1473.59326171875,
								},
							}, -- [10]
							[13] = {
								["anchor"] = {
									["b"] = 1293.59329223633,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
									["t"] = 1473.59326171875,
								},
							},
							[14] = {
								["anchor"] = {
									["b"] = 1293.59329223633,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
									["t"] = 1473.59326171875,
								},
							},
							[15] = {
								["anchor"] = {
									["b"] = 1293.59329223633,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
									["t"] = 1473.59326171875,
								},
							},
						},
					},
					[1001] = {
						["location"] = {
							{
								["anchor"] = {
									["b"] = 41.0000686645508,
									["t"] = 529,
									["l"] = 1254.65783691406,
									["r"] = 1942.65759277344,
								},
							}, -- [1]
							nil, -- [2]
							{
								["anchor"] = {
									["b"] = 53.9764976501465,
									["t"] = 1033.9765625,
									["r"] = 694.721435546875,
									["l"] = 14.7214794158936,
								},
							}, -- [3]
							{
								["anchor"] = {
									["b"] = 1293.59329223633,
									["t"] = 1473.59326171875,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
								},
							}, -- [4]
							{
								["anchor"] = {
									["b"] = 1293.59329223633,
									["t"] = 1473.59326171875,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
								},
							}, -- [5]
							{
								["anchor"] = {
									["b"] = 1293.59329223633,
									["t"] = 1473.59326171875,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
								},
							}, -- [6]
							{
								["anchor"] = {
									["b"] = 1293.59329223633,
									["t"] = 1473.59326171875,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
								},
							}, -- [7]
							{
								["anchor"] = {
									["b"] = 1293.59329223633,
									["t"] = 1473.59326171875,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
								},
							}, -- [8]
							{
								["anchor"] = {
									["b"] = 1293.59329223633,
									["t"] = 1473.59326171875,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
								},
							}, -- [9]
							{
								["anchor"] = {
									["b"] = 1293.59329223633,
									["t"] = 1473.59326171875,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
								},
							}, -- [10]
							[14] = {
								["anchor"] = {
									["b"] = 1293.59329223633,
									["t"] = 1473.59326171875,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
								},
							},
							[13] = {
								["anchor"] = {
									["b"] = 1293.59329223633,
									["t"] = 1473.59326171875,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
								},
							},
							[15] = {
								["anchor"] = {
									["b"] = 1293.59329223633,
									["t"] = 1473.59326171875,
									["l"] = 2219.72151692708,
									["r"] = 2619.72151692708,
								},
							},
						},
						["used"] = "Y",
						["name"] = "Tonkah LUI",
					},
				},
				["next"] = 1001,
			},
			["design"] = {
				["data"] = {
					[1000] = {
						["changer"] = {
							["hide"] = true,
						},
						["window"] = {
							["pad"] = 4,
							["border"] = {
								["offset"] = 3,
								["style"] = "ArkInventory Square 1",
								["colour"] = {
									["b"] = 0.22,
									["g"] = 0.22,
									["r"] = 0.22,
								},
								["size"] = 16,
							},
						},
						["title"] = {
							["colour"] = {
								["online"] = {
									["b"] = 0.878,
									["g"] = 0.878,
									["r"] = 0.878,
								},
							},
							["size"] = 2,
						},
						["category"] = {
							["1!448"] = 2,
							["3!1005"] = 4,
							["3!1002"] = 4,
							["1!412"] = 3,
							["3!1001"] = 4,
							["1!431"] = 7,
							["1!404"] = 7,
							["1!512"] = 3,
							["1!420"] = 7,
							["1!426"] = 7,
							["1!424"] = 7,
							["3!1003"] = 2,
							["1!501"] = 3,
							["1!435"] = 7,
							["1!432"] = 7,
							["1!419"] = 7,
							["1!418"] = 7,
							["1!437"] = 7,
							["1!503"] = 3,
							["1!513"] = 3,
							["1!450"] = 8,
							["1!438"] = 5,
							["1!502"] = 3,
							["1!506"] = 3,
							["1!504"] = 3,
							["1!505"] = 3,
							["1!402"] = 6,
							["1!430"] = 7,
							["1!409"] = 5,
							["3!1004"] = 9,
							["1!427"] = 3,
							["1!417"] = 7,
							["1!436"] = 7,
							["1!411"] = 5,
							["1!449"] = 7,
							["1!408"] = 3,
						},
						["status"] = {
							["emptytext"] = {
								["includetype"] = false,
							},
						},
						["sort"] = {
							["method"] = 9998,
						},
						["slot"] = {
							["data"] = {
								{
									["colour"] = {
										["a"] = 1,
										["b"] = 0.078,
										["g"] = 0.078,
										["r"] = 0.078,
									},
								}, -- [1]
								[27] = {
									["colour"] = {
										["a"] = 1,
									},
								},
							},
							["anchor"] = 3,
							["empty"] = {
								["icon"] = false,
							},
						},
						["bar"] = {
							["per"] = 7,
							["data"] = {
								[3] = {
									["name"] = {
										["text"] = "Profession",
									},
								},
							},
							["pad"] = {
								["external"] = 0,
								["internal"] = 4,
							},
							["border"] = {
								["colour"] = {
									["b"] = 0.22,
									["g"] = 0.22,
									["r"] = 0.22,
								},
							},
							["background"] = {
								["colour"] = {
									["a"] = 0,
								},
							},
						},
					},
				},
			},
		},
		["player"] = {
			["data"] = {
				["!ACCOUNT - !ACCOUNT"] = {
					["info"] = {
						["class"] = "ACCOUNT",
						["player_id"] = "!ACCOUNT - !ACCOUNT",
						["name"] = "Account",
						["faction"] = "",
						["realm"] = "Doomhammer",
						["level"] = 7,
						["class_local"] = "Account",
						["faction_local"] = "",
					},
					["location"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						nil, -- [4]
						nil, -- [5]
						nil, -- [6]
						{
							["bag"] = {
								{
									["type"] = 17,
									["count"] = 83,
									["slot"] = {
										{
											["q"] = 2,
											["index"] = 5,
											["guid"] = "BattlePet-0-000004FC9AC9",
											["bag_id"] = 1,
											["slot_id"] = 1,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:272:1:2:159:9:10:BattlePet-0-000004FC9AC9|h[Armadillo Pup]|h|r",
										}, -- [1]
										{
											["q"] = 3,
											["index"] = 6,
											["guid"] = "BattlePet-0-000005094B02",
											["bag_id"] = 1,
											["slot_id"] = 2,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:1706:1:3:168:10:10:BattlePet-0-000005094B02|h[Ashmaw Cub]|h|r",
										}, -- [2]
										{
											["q"] = 3,
											["index"] = 7,
											["guid"] = "BattlePet-0-000005083297",
											["bag_id"] = 1,
											["slot_id"] = 3,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:1884:1:3:158:12:10:BattlePet-0-000005083297|h[Baby Elderhorn]|h|r",
										}, -- [3]
										{
											["q"] = 3,
											["index"] = 1,
											["guid"] = "BattlePet-0-000004D704EE",
											["bag_id"] = 1,
											["slot_id"] = 4,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = true,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:1828:7:3:494:83:73:BattlePet-0-000004D704EE|h[Baby Winston]|h|r",
										}, -- [4]
										{
											["q"] = 3,
											["index"] = 8,
											["guid"] = "BattlePet-0-000004FB8869",
											["bag_id"] = 1,
											["slot_id"] = 5,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:1934:1:3:161:12:10:BattlePet-0-000004FB8869|h[Benax]|h|r",
										}, -- [5]
										{
											["q"] = 2,
											["wp"] = 1,
											["index"] = 9,
											["guid"] = "BattlePet-0-0000035FEC38",
											["bag_id"] = 1,
											["slot_id"] = 6,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:374:2:2:207:21:19:BattlePet-0-0000035FEC38|h[Black Lamb]|h|r",
										}, -- [6]
										{
											["q"] = 1,
											["wp"] = 1,
											["index"] = 11,
											["guid"] = "BattlePet-0-000004FC9DE6",
											["bag_id"] = 1,
											["slot_id"] = 7,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cffffffff|Hbattlepet:374:1:1:146:10:9:BattlePet-0-000004FC9DE6|h[Black Lamb]|h|r",
										}, -- [7]
										{
											["q"] = 3,
											["wp"] = 1,
											["index"] = 10,
											["guid"] = "BattlePet-0-000004FFA491",
											["bag_id"] = 1,
											["slot_id"] = 8,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:374:2:3:216:22:22:BattlePet-0-000004FFA491|h[Black Lamb]|h|r",
										}, -- [8]
										{
											["q"] = 3,
											["index"] = 12,
											["guid"] = "BattlePet-0-000004F7152A",
											["bag_id"] = 1,
											["slot_id"] = 9,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:1753:1:3:150:12:11:BattlePet-0-000004F7152A|h[Bleakwater Jelly]|h|r",
										}, -- [9]
										{
											["q"] = 2,
											["index"] = 13,
											["guid"] = "BattlePet-0-0000035FEC27",
											["bag_id"] = 1,
											["slot_id"] = 10,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:259:1:2:156:9:10:BattlePet-0-0000035FEC27|h[Blue Mini Jouster]|h|r",
										}, -- [10]
										{
											["q"] = 2,
											["index"] = 14,
											["guid"] = "BattlePet-0-0000035FEC2E",
											["bag_id"] = 1,
											["slot_id"] = 11,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:259:1:2:156:9:10:BattlePet-0-0000035FEC2E|h[Blue Mini Jouster]|h|r",
										}, -- [11]
										{
											["q"] = 2,
											["index"] = 15,
											["guid"] = "BattlePet-0-000004D70733",
											["bag_id"] = 1,
											["slot_id"] = 12,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:40:1:2:142:11:11:BattlePet-0-000004D70733|h[Bombay Cat]|h|r",
										}, -- [12]
										{
											["q"] = 1,
											["wp"] = 1,
											["index"] = 16,
											["guid"] = "BattlePet-0-0000035FEC3B",
											["bag_id"] = 1,
											["slot_id"] = 13,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cffffffff|Hbattlepet:646:3:1:240:28:28:BattlePet-0-0000035FEC3B|h[Chicken]|h|r",
										}, -- [13]
										{
											["q"] = 1,
											["wp"] = 1,
											["index"] = 17,
											["guid"] = "BattlePet-0-000004FFA86F",
											["bag_id"] = 1,
											["slot_id"] = 14,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cffffffff|Hbattlepet:646:6:1:381:56:56:BattlePet-0-000004FFA86F|h[Chicken]|h|r",
										}, -- [14]
										{
											["q"] = 2,
											["index"] = 18,
											["guid"] = "BattlePet-0-0000035FEC21",
											["bag_id"] = 1,
											["slot_id"] = 15,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:47:1:2:151:10:11:BattlePet-0-0000035FEC21|h[Cockatiel]|h|r",
										}, -- [15]
										{
											["q"] = 3,
											["index"] = 2,
											["guid"] = "BattlePet-0-0000035FEC28",
											["bag_id"] = 1,
											["slot_id"] = 16,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = true,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:244:7:3:528:90:59:BattlePet-0-0000035FEC28|h[Core Hound Pup]|h|r",
										}, -- [16]
										{
											["q"] = 2,
											["index"] = 19,
											["guid"] = "BattlePet-0-000004D70734",
											["bag_id"] = 1,
											["slot_id"] = 17,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:41:1:2:142:13:10:BattlePet-0-000004D70734|h[Cornish Rex Cat]|h|r",
										}, -- [17]
										{
											["q"] = 3,
											["index"] = 20,
											["guid"] = "BattlePet-0-000004FC9AB9",
											["bag_id"] = 1,
											["slot_id"] = 18,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:270:1:3:161:11:10:BattlePet-0-000004FC9AB9|h[Dark Phoenix Hatchling]|h|r",
										}, -- [18]
										{
											["q"] = 3,
											["wp"] = 1,
											["index"] = 21,
											["guid"] = "BattlePet-0-000004F952B3",
											["bag_id"] = 1,
											["slot_id"] = 19,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:1720:1:3:152:11:12:BattlePet-0-000004F952B3|h[Emmigosa]|h|r",
										}, -- [19]
										{
											["q"] = 2,
											["wp"] = 1,
											["index"] = 23,
											["guid"] = "BattlePet-0-0000035FEC35",
											["bag_id"] = 1,
											["slot_id"] = 20,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:447:1:2:151:10:11:BattlePet-0-0000035FEC35|h[Fawn]|h|r",
										}, -- [20]
										{
											["q"] = 1,
											["wp"] = 1,
											["index"] = 22,
											["guid"] = "BattlePet-0-0000035FEC39",
											["bag_id"] = 1,
											["slot_id"] = 21,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cffffffff|Hbattlepet:447:2:1:198:17:21:BattlePet-0-0000035FEC39|h[Fawn]|h|r",
										}, -- [21]
										{
											["q"] = 0,
											["wp"] = 1,
											["index"] = 24,
											["guid"] = "BattlePet-0-000004FC9D29",
											["bag_id"] = 1,
											["slot_id"] = 22,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff9d9d9d|Hbattlepet:447:1:0:140:8:11:BattlePet-0-000004FC9D29|h[Fawn]|h|r",
										}, -- [22]
										{
											["q"] = 3,
											["index"] = 25,
											["guid"] = "BattlePet-0-000004F117D0",
											["bag_id"] = 1,
											["slot_id"] = 23,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:1889:1:3:155:11:12:BattlePet-0-000004F117D0|h[Felbat Pup]|h|r",
										}, -- [23]
										{
											["q"] = 3,
											["index"] = 27,
											["guid"] = "BattlePet-0-000004F31658",
											["bag_id"] = 1,
											["slot_id"] = 24,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:1889:1:3:155:11:12:BattlePet-0-000004F31658|h[Felbat Pup]|h|r",
										}, -- [24]
										{
											["q"] = 3,
											["index"] = 26,
											["guid"] = "BattlePet-0-000004F3558D",
											["bag_id"] = 1,
											["slot_id"] = 25,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:1889:1:3:155:11:12:BattlePet-0-000004F3558D|h[Felbat Pup]|h|r",
										}, -- [25]
										{
											["q"] = 0,
											["wp"] = 1,
											["index"] = 29,
											["guid"] = "BattlePet-0-000004FFAFE3",
											["bag_id"] = 1,
											["slot_id"] = 26,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff9d9d9d|Hbattlepet:395:5:0:363:40:38:BattlePet-0-000004FFAFE3|h[Fledgling Buzzard]|h|r",
										}, -- [26]
										{
											["q"] = 1,
											["wp"] = 1,
											["index"] = 28,
											["guid"] = "BattlePet-0-000004FFAF80",
											["bag_id"] = 1,
											["slot_id"] = 27,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cffffffff|Hbattlepet:395:6:1:447:53:50:BattlePet-0-000004FFAF80|h[Fledgling Buzzard]|h|r",
										}, -- [27]
										{
											["q"] = 2,
											["wp"] = 1,
											["index"] = 30,
											["guid"] = "BattlePet-0-0000035FEC3E",
											["bag_id"] = 1,
											["slot_id"] = 28,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:395:4:2:326:43:36:BattlePet-0-0000035FEC3E|h[Fledgling Buzzard]|h|r",
										}, -- [28]
										{
											["q"] = 2,
											["index"] = 31,
											["guid"] = "BattlePet-0-0000035FEC30",
											["bag_id"] = 1,
											["slot_id"] = 29,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:630:1:2:148:10:12:BattlePet-0-0000035FEC30|h[Gilnean Raven]|h|r",
										}, -- [29]
										{
											["q"] = 2,
											["index"] = 32,
											["guid"] = "BattlePet-0-000004FC9ACE",
											["bag_id"] = 1,
											["slot_id"] = 30,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:282:1:2:151:10:10:BattlePet-0-000004FC9ACE|h[Guild Herald]|h|r",
										}, -- [30]
										{
											["q"] = 2,
											["index"] = 33,
											["guid"] = "BattlePet-0-000004FC9ACB",
											["bag_id"] = 1,
											["slot_id"] = 31,
											["h"] = "|cff1eff00|Hbattlepet:280:1:2:151:10:10:BattlePet-0-000004FC9ACB|h[Guild Page]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [31]
										{
											["q"] = 2,
											["index"] = 34,
											["guid"] = "BattlePet-0-0000035FEC2D",
											["bag_id"] = 1,
											["slot_id"] = 32,
											["h"] = "|cff1eff00|Hbattlepet:792:1:2:153:11:9:BattlePet-0-0000035FEC2D|h[Jade Crane Chick]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [32]
										{
											["q"] = 3,
											["index"] = 3,
											["guid"] = "BattlePet-0-000004D7072C",
											["bag_id"] = 1,
											["slot_id"] = 33,
											["h"] = "|cff0070dd|Hbattlepet:249:7:3:528:86:64:BattlePet-0-000004D7072C|h[Lil' K.T.]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = true,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [33]
										{
											["q"] = 3,
											["index"] = 35,
											["guid"] = "BattlePet-0-0000035FEC2C",
											["bag_id"] = 1,
											["slot_id"] = 34,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:256:2:3:216:26:18:BattlePet-0-0000035FEC2C|h[Lil' XT]|h|r",
										}, -- [34]
										{
											["q"] = 3,
											["index"] = 36,
											["guid"] = "BattlePet-0-000004FD6809",
											["bag_id"] = 1,
											["slot_id"] = 35,
											["h"] = "|cff0070dd|Hbattlepet:1922:1:3:150:12:12:BattlePet-0-000004FD6809|h[Lurking Owl Kitten]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [35]
										{
											["q"] = 2,
											["wp"] = 1,
											["index"] = 38,
											["guid"] = "BattlePet-0-000004FFAA83",
											["bag_id"] = 1,
											["slot_id"] = 36,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:391:5:2:367:42:59:BattlePet-0-000004FFAA83|h[Mountain Cottontail]|h|r",
										}, -- [36]
										{
											["q"] = 0,
											["wp"] = 1,
											["index"] = 39,
											["guid"] = "BattlePet-0-000004FFAA13",
											["bag_id"] = 1,
											["slot_id"] = 37,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff9d9d9d|Hbattlepet:391:6:0:367:42:59:BattlePet-0-000004FFAA13|h[Mountain Cottontail]|h|r",
										}, -- [37]
										{
											["q"] = 0,
											["wp"] = 1,
											["index"] = 37,
											["guid"] = "BattlePet-0-000004FFA93A",
											["bag_id"] = 1,
											["slot_id"] = 38,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff9d9d9d|Hbattlepet:391:6:0:367:42:59:BattlePet-0-000004FFA93A|h[Mountain Cottontail]|h|r",
										}, -- [38]
										{
											["q"] = 0,
											["wp"] = 1,
											["index"] = 40,
											["guid"] = "BattlePet-0-0000035FEC3A",
											["bag_id"] = 1,
											["slot_id"] = 39,
											["h"] = "|cff9d9d9d|Hbattlepet:385:4:0:270:32:36:BattlePet-0-0000035FEC3A|h[Mouse]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [39]
										{
											["q"] = 2,
											["index"] = 41,
											["guid"] = "BattlePet-0-0000035FEC22",
											["bag_id"] = 1,
											["slot_id"] = 40,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:192:6:2:420:58:64:BattlePet-0-0000035FEC22|h[Mr. Chilly]|h|r",
										}, -- [40]
										{
											["q"] = 2,
											["index"] = 42,
											["guid"] = "BattlePet-0-000004D70732",
											["bag_id"] = 1,
											["slot_id"] = 41,
											["h"] = "|cff1eff00|Hbattlepet:43:1:2:145:11:10:BattlePet-0-000004D70732|h[Orange Tabby Cat]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [41]
										{
											["q"] = 3,
											["index"] = 43,
											["guid"] = "BattlePet-0-0000035FEC29",
											["bag_id"] = 1,
											["slot_id"] = 42,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:301:7:3:437:81:86:BattlePet-0-0000035FEC29|h[Panther Cub]|h|r",
										}, -- [42]
										{
											["q"] = 2,
											["index"] = 44,
											["guid"] = "BattlePet-0-0000035FEC2A",
											["bag_id"] = 1,
											["slot_id"] = 43,
											["h"] = "|cff1eff00|Hbattlepet:250:1:2:145:12:10:BattlePet-0-0000035FEC2A|h[Perky Pug]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [43]
										{
											["q"] = 2,
											["wp"] = 1,
											["index"] = 45,
											["guid"] = "BattlePet-0-0000035FEC3D",
											["bag_id"] = 1,
											["slot_id"] = 44,
											["h"] = "|cff1eff00|Hbattlepet:386:4:2:302:38:45:BattlePet-0-0000035FEC3D|h[Prairie Dog]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [44]
										{
											["q"] = 3,
											["index"] = 47,
											["guid"] = "BattlePet-0-00000509AB9D",
											["bag_id"] = 1,
											["slot_id"] = 45,
											["h"] = "|cff0070dd|Hbattlepet:1907:1:3:152:12:11:BattlePet-0-00000509AB9D|h[Pygmy Owl]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [45]
										{
											["q"] = 3,
											["index"] = 46,
											["guid"] = "BattlePet-0-000004FA6063",
											["bag_id"] = 1,
											["slot_id"] = 46,
											["h"] = "|cff0070dd|Hbattlepet:1907:1:3:152:12:11:BattlePet-0-000004FA6063|h[Pygmy Owl]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [46]
										{
											["q"] = 1,
											["wp"] = 1,
											["index"] = 49,
											["guid"] = "BattlePet-0-000004FC9E32",
											["bag_id"] = 1,
											["slot_id"] = 47,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cffffffff|Hbattlepet:378:2:1:194:17:21:BattlePet-0-000004FC9E32|h[Rabbit]|h|r",
										}, -- [47]
										{
											["q"] = 0,
											["wp"] = 1,
											["index"] = 50,
											["guid"] = "BattlePet-0-000004FFA253",
											["bag_id"] = 1,
											["slot_id"] = 48,
											["h"] = "|cff9d9d9d|Hbattlepet:378:2:0:189:14:20:BattlePet-0-000004FFA253|h[Rabbit]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [48]
										{
											["q"] = 1,
											["wp"] = 1,
											["index"] = 48,
											["guid"] = "BattlePet-0-0000035FEC33",
											["bag_id"] = 1,
											["slot_id"] = 49,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cffffffff|Hbattlepet:378:2:1:194:17:21:BattlePet-0-0000035FEC33|h[Rabbit]|h|r",
										}, -- [49]
										{
											["q"] = 3,
											["index"] = 51,
											["guid"] = "BattlePet-0-0000035FEC2B",
											["bag_id"] = 1,
											["slot_id"] = 50,
											["h"] = "|cff0070dd|Hbattlepet:239:5:3:360:65:52:BattlePet-0-0000035FEC2B|h[Razzashi Hatchling]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [50]
										{
											["q"] = 0,
											["wp"] = 1,
											["index"] = 52,
											["guid"] = "BattlePet-0-000004FFACEA",
											["bag_id"] = 1,
											["slot_id"] = 51,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff9d9d9d|Hbattlepet:392:4:0:278:30:38:BattlePet-0-000004FFACEA|h[Redridge Rat]|h|r",
										}, -- [51]
										{
											["q"] = 1,
											["wp"] = 1,
											["index"] = 53,
											["guid"] = "BattlePet-0-000004FFA977",
											["bag_id"] = 1,
											["slot_id"] = 52,
											["h"] = "|cffffffff|Hbattlepet:392:4:1:276:33:46:BattlePet-0-000004FFA977|h[Redridge Rat]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [52]
										{
											["q"] = 2,
											["wp"] = 1,
											["index"] = 54,
											["guid"] = "BattlePet-0-000004FFB110",
											["bag_id"] = 1,
											["slot_id"] = 53,
											["h"] = "|cff1eff00|Hbattlepet:392:5:2:355:48:54:BattlePet-0-000004FFB110|h[Redridge Rat]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [53]
										{
											["q"] = 3,
											["index"] = 56,
											["guid"] = "BattlePet-0-000004FA8AD3",
											["bag_id"] = 1,
											["slot_id"] = 54,
											["h"] = "|cff0070dd|Hbattlepet:1804:1:3:149:12:12:BattlePet-0-000004FA8AD3|h[Risen Saber Kitten]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [54]
										{
											["q"] = 3,
											["index"] = 55,
											["guid"] = "BattlePet-0-0000050AEFB2",
											["bag_id"] = 1,
											["slot_id"] = 55,
											["h"] = "|cff0070dd|Hbattlepet:1804:1:3:149:12:12:BattlePet-0-0000050AEFB2|h[Risen Saber Kitten]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [55]
										{
											["q"] = 0,
											["wp"] = 1,
											["index"] = 59,
											["guid"] = "BattlePet-0-000004FFB187",
											["bag_id"] = 1,
											["slot_id"] = 56,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff9d9d9d|Hbattlepet:424:5:0:363:35:43:BattlePet-0-000004FFB187|h[Roach]|h|r",
										}, -- [56]
										{
											["q"] = 0,
											["wp"] = 1,
											["index"] = 58,
											["guid"] = "BattlePet-0-0000035FEC3F",
											["bag_id"] = 1,
											["slot_id"] = 57,
											["h"] = "|cff9d9d9d|Hbattlepet:424:5:0:335:35:47:BattlePet-0-0000035FEC3F|h[Roach]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [57]
										{
											["q"] = 1,
											["wp"] = 1,
											["index"] = 57,
											["guid"] = "BattlePet-0-000004FFAD3C",
											["bag_id"] = 1,
											["slot_id"] = 58,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cffffffff|Hbattlepet:424:5:1:334:39:58:BattlePet-0-000004FFAD3C|h[Roach]|h|r",
										}, -- [58]
										{
											["q"] = 2,
											["index"] = 60,
											["guid"] = "BattlePet-0-0000035FEC26",
											["bag_id"] = 1,
											["slot_id"] = 59,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:51:1:2:151:10:11:BattlePet-0-0000035FEC26|h[Senegal]|h|r",
										}, -- [59]
										{
											["q"] = 0,
											["wp"] = 1,
											["index"] = 61,
											["guid"] = "BattlePet-0-0000035FEC37",
											["bag_id"] = 1,
											["slot_id"] = 60,
											["h"] = "|cff9d9d9d|Hbattlepet:388:6:0:382:53:45:BattlePet-0-0000035FEC37|h[Shore Crab]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [60]
										{
											["q"] = 2,
											["index"] = 62,
											["guid"] = "BattlePet-0-000004D70736",
											["bag_id"] = 1,
											["slot_id"] = 61,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:45:1:2:145:11:11:BattlePet-0-000004D70736|h[Silver Tabby Cat]|h|r",
										}, -- [61]
										{
											["q"] = 3,
											["index"] = 63,
											["guid"] = "BattlePet-0-000004FFBE20",
											["bag_id"] = 1,
											["slot_id"] = 62,
											["h"] = "|cff0070dd|Hbattlepet:1467:1:3:152:10:13:BattlePet-0-000004FFBE20|h[Sky-Bo]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [62]
										{
											["q"] = 2,
											["index"] = 64,
											["guid"] = "BattlePet-0-00000501F845",
											["bag_id"] = 1,
											["slot_id"] = 63,
											["h"] = "|cff1eff00|Hbattlepet:1711:1:2:152:11:9:BattlePet-0-00000501F845|h[Skyhorn Nestling]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [63]
										{
											["q"] = 1,
											["wp"] = 1,
											["index"] = 65,
											["guid"] = "BattlePet-0-0000035FEC3C",
											["bag_id"] = 1,
											["slot_id"] = 64,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cffffffff|Hbattlepet:419:2:1:199:18:19:BattlePet-0-0000035FEC3C|h[Small Frog]|h|r",
										}, -- [64]
										{
											["q"] = 0,
											["wp"] = 1,
											["index"] = 66,
											["guid"] = "BattlePet-0-0000035FEC2F",
											["bag_id"] = 1,
											["slot_id"] = 65,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff9d9d9d|Hbattlepet:419:4:0:280:32:34:BattlePet-0-0000035FEC2F|h[Small Frog]|h|r",
										}, -- [65]
										{
											["q"] = 1,
											["wp"] = 1,
											["index"] = 67,
											["guid"] = "BattlePet-0-000004FFA165",
											["bag_id"] = 1,
											["slot_id"] = 66,
											["h"] = "|cffffffff|Hbattlepet:419:2:1:198:17:20:BattlePet-0-000004FFA165|h[Small Frog]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [66]
										{
											["q"] = 0,
											["wp"] = 1,
											["index"] = 68,
											["guid"] = "BattlePet-0-0000035FEC32",
											["bag_id"] = 1,
											["slot_id"] = 67,
											["h"] = "|cff9d9d9d|Hbattlepet:387:4:0:250:32:42:BattlePet-0-0000035FEC32|h[Snake]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [67]
										{
											["q"] = 2,
											["index"] = 70,
											["guid"] = "BattlePet-0-000004EA9B2D",
											["bag_id"] = 1,
											["slot_id"] = 68,
											["h"] = "|cff1eff00|Hbattlepet:72:1:2:148:8:13:BattlePet-0-000004EA9B2D|h[Snowshoe Rabbit]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [68]
										{
											["q"] = 2,
											["index"] = 69,
											["guid"] = "BattlePet-0-000004EA7C51",
											["bag_id"] = 1,
											["slot_id"] = 69,
											["h"] = "|cff1eff00|Hbattlepet:72:1:2:148:8:13:BattlePet-0-000004EA7C51|h[Snowshoe Rabbit]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [69]
										{
											["q"] = 0,
											["wp"] = 1,
											["index"] = 73,
											["guid"] = "BattlePet-0-000004FFA500",
											["bag_id"] = 1,
											["slot_id"] = 70,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff9d9d9d|Hbattlepet:379:2:0:180:15:21:BattlePet-0-000004FFA500|h[Squirrel]|h|r",
										}, -- [70]
										{
											["q"] = 1,
											["wp"] = 1,
											["index"] = 71,
											["guid"] = "BattlePet-0-0000035FEC31",
											["bag_id"] = 1,
											["slot_id"] = 71,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cffffffff|Hbattlepet:379:1:1:146:9:10:BattlePet-0-0000035FEC31|h[Squirrel]|h|r",
										}, -- [71]
										{
											["q"] = 2,
											["wp"] = 1,
											["index"] = 72,
											["guid"] = "BattlePet-0-0000035FEC36",
											["bag_id"] = 1,
											["slot_id"] = 72,
											["h"] = "|cff1eff00|Hbattlepet:379:1:2:148:9:13:BattlePet-0-0000035FEC36|h[Squirrel]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [72]
										{
											["q"] = 3,
											["index"] = 74,
											["guid"] = "BattlePet-0-00000501F846",
											["bag_id"] = 1,
											["slot_id"] = 73,
											["h"] = "|cff0070dd|Hbattlepet:160:1:3:152:13:10:BattlePet-0-00000501F846|h[Stinker]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [73]
										{
											["q"] = 3,
											["index"] = 75,
											["guid"] = "BattlePet-0-000004F7B170",
											["bag_id"] = 1,
											["slot_id"] = 74,
											["loc_id"] = 7,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff0070dd|Hbattlepet:1721:1:3:152:12:11:BattlePet-0-000004F7B170|h[Stormborne Whelpling]|h|r",
										}, -- [74]
										{
											["q"] = 3,
											["index"] = 76,
											["guid"] = "BattlePet-0-00000507FBAF",
											["bag_id"] = 1,
											["slot_id"] = 75,
											["h"] = "|cff0070dd|Hbattlepet:211:1:3:168:10:10:BattlePet-0-00000507FBAF|h[Strand Crawler]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [75]
										{
											["q"] = 3,
											["index"] = 77,
											["guid"] = "BattlePet-0-000005021608",
											["bag_id"] = 1,
											["slot_id"] = 76,
											["h"] = "|cff0070dd|Hbattlepet:1231:1:3:155:12:11:BattlePet-0-000005021608|h[Tainted Waveling]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [76]
										{
											["q"] = 2,
											["index"] = 79,
											["guid"] = "BattlePet-0-0000035FEC25",
											["bag_id"] = 1,
											["slot_id"] = 77,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff1eff00|Hbattlepet:287:1:2:151:10:11:BattlePet-0-0000035FEC25|h[Tiny Flamefly]|h|r",
										}, -- [77]
										{
											["q"] = 2,
											["index"] = 78,
											["guid"] = "BattlePet-0-000004ECE8BF",
											["bag_id"] = 1,
											["slot_id"] = 78,
											["h"] = "|cff1eff00|Hbattlepet:287:1:2:151:10:11:BattlePet-0-000004ECE8BF|h[Tiny Flamefly]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [78]
										{
											["q"] = 2,
											["index"] = 80,
											["guid"] = "BattlePet-0-0000050D0E1A",
											["bag_id"] = 1,
											["slot_id"] = 79,
											["h"] = "|cff1eff00|Hbattlepet:652:1:2:150:10:11:BattlePet-0-0000050D0E1A|h[Tiny Goldfish]|h|r",
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["loc_id"] = 7,
										}, -- [79]
										{
											["q"] = 0,
											["wp"] = 1,
											["index"] = 81,
											["guid"] = "BattlePet-0-0000035FEC34",
											["bag_id"] = 1,
											["slot_id"] = 80,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["ab"] = 1,
											["h"] = "|cff9d9d9d|Hbattlepet:389:3:0:258:23:24:BattlePet-0-0000035FEC34|h[Tiny Harvester]|h|r",
										}, -- [80]
										{
											["q"] = 3,
											["index"] = 82,
											["guid"] = "BattlePet-0-00000504FB86",
											["bag_id"] = 1,
											["slot_id"] = 81,
											["ab"] = 1,
											["count"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["loc_id"] = 7,
											["h"] = "|cff0070dd|Hbattlepet:1921:1:3:154:13:10:BattlePet-0-00000504FB86|h[Untethered Wyrmling]|h|r",
										}, -- [81]
										{
											["q"] = 2,
											["index"] = 4,
											["guid"] = "BattlePet-0-0000035FEC23",
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = true,
											["slot_id"] = 82,
											["h"] = "|cff1eff00|Hbattlepet:227:1:2:148:12:10:BattlePet-0-0000035FEC23|h[Warbot]|h|r",
										}, -- [82]
										{
											["q"] = 2,
											["index"] = 83,
											["guid"] = "BattlePet-0-0000035FEC24",
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 7,
											["count"] = 1,
											["sb"] = 1,
											["bp"] = 1,
											["fav"] = false,
											["slot_id"] = 83,
											["h"] = "|cff1eff00|Hbattlepet:84:1:2:153:10:10:BattlePet-0-0000035FEC24|h[Westfall Chicken]|h|r",
										}, -- [83]
									},
									["status"] = -3,
									["bag_id"] = 1,
									["loc_id"] = 7,
								}, -- [1]
							},
							["slot_count"] = 83,
						}, -- [7]
						{
							["bag"] = {
								{
									["type"] = 18,
									["count"] = 33,
									["slot"] = {
										{
											["q"] = 1,
											["index"] = 492,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:127286:0|h[Black Dragon Turtle]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 1,
											["loc_id"] = 8,
										}, -- [1]
										{
											["q"] = 1,
											["index"] = 9,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:470:0|h[Black Stallion]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 2,
											["loc_id"] = 8,
										}, -- [2]
										{
											["q"] = 1,
											["index"] = 493,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:127287:0|h[Blue Dragon Turtle]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 3,
											["loc_id"] = 8,
										}, -- [3]
										{
											["q"] = 1,
											["index"] = 40,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:10969:0|h[Blue Mechanostrider]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 4,
											["loc_id"] = 8,
										}, -- [4]
										{
											["q"] = 1,
											["index"] = 494,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:127288:0|h[Brown Dragon Turtle]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 5,
											["loc_id"] = 8,
										}, -- [5]
										{
											["q"] = 1,
											["index"] = 6,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:458:0|h[Brown Horse]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 6,
											["loc_id"] = 8,
										}, -- [6]
										{
											["q"] = 1,
											["index"] = 18,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:6648:0|h[Chestnut Mare]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 7,
											["loc_id"] = 8,
										}, -- [7]
										{
											["q"] = 1,
											["index"] = 130,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:32239:0|h[Ebon Gryphon]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 8,
											["loc_id"] = 8,
										}, -- [8]
										{
											["q"] = 1,
											["index"] = 129,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:32235:0|h[Golden Gryphon]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 9,
											["loc_id"] = 8,
										}, -- [9]
										{
											["q"] = 1,
											["index"] = 498,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:127295:0|h[Great Black Dragon Turtle]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 10,
											["loc_id"] = 8,
										}, -- [10]
										{
											["q"] = 1,
											["index"] = 499,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:127302:0|h[Great Blue Dragon Turtle]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 11,
											["loc_id"] = 8,
										}, -- [11]
										{
											["q"] = 1,
											["index"] = 500,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:127308:0|h[Great Brown Dragon Turtle]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 12,
											["loc_id"] = 8,
										}, -- [12]
										{
											["q"] = 1,
											["index"] = 497,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:127293:0|h[Great Green Dragon Turtle]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 13,
											["loc_id"] = 8,
										}, -- [13]
										{
											["q"] = 1,
											["index"] = 501,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:127310:0|h[Great Purple Dragon Turtle]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 14,
											["loc_id"] = 8,
										}, -- [14]
										{
											["q"] = 1,
											["index"] = 453,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:120822:0|h[Great Red Dragon Turtle]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 15,
											["loc_id"] = 8,
										}, -- [15]
										{
											["q"] = 1,
											["index"] = 452,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:120395:0|h[Green Dragon Turtle]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 16,
											["loc_id"] = 8,
										}, -- [16]
										{
											["q"] = 1,
											["index"] = 57,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:17453:0|h[Green Mechanostrider]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 17,
											["loc_id"] = 8,
										}, -- [17]
										{
											["q"] = 1,
											["index"] = 547,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:142073:0|h[Hearthsteed]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 18,
											["loc_id"] = 8,
										}, -- [18]
										{
											["q"] = 1,
											["index"] = 364,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:72807:0|h[Icebound Frostbrood Vanquisher]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = true,
											["slot_id"] = 19,
											["loc_id"] = 8,
										}, -- [19]
										{
											["q"] = 1,
											["index"] = 306,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:63956:0|h[Ironbound Proto-Drake]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = true,
											["slot_id"] = 20,
											["loc_id"] = 8,
										}, -- [20]
										{
											["q"] = 1,
											["index"] = 656,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:171850:0|h[Llothien Prowler]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = true,
											["slot_id"] = 21,
											["loc_id"] = 8,
										}, -- [21]
										{
											["q"] = 1,
											["index"] = 11,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:472:0|h[Pinto]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 22,
											["loc_id"] = 8,
										}, -- [22]
										{
											["q"] = 1,
											["index"] = 495,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:127289:0|h[Purple Dragon Turtle]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 23,
											["loc_id"] = 8,
										}, -- [23]
										{
											["q"] = 1,
											["index"] = 496,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:127290:0|h[Red Dragon Turtle]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 24,
											["loc_id"] = 8,
										}, -- [24]
										{
											["q"] = 1,
											["index"] = 39,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:10873:0|h[Red Mechanostrider]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 25,
											["loc_id"] = 8,
										}, -- [25]
										{
											["q"] = 1,
											["index"] = 131,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:32240:0|h[Snowy Gryphon]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 26,
											["loc_id"] = 8,
										}, -- [26]
										{
											["q"] = 1,
											["index"] = 440,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:107516:0|h[Spectral Gryphon]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 27,
											["loc_id"] = 8,
										}, -- [27]
										{
											["q"] = 1,
											["index"] = 93,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:23229:0|h[Swift Brown Steed]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 28,
											["loc_id"] = 8,
										}, -- [28]
										{
											["q"] = 1,
											["index"] = 91,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:23227:0|h[Swift Palomino]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 29,
											["loc_id"] = 8,
										}, -- [29]
										{
											["q"] = 1,
											["index"] = 139,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:32292:0|h[Swift Purple Gryphon]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 30,
											["loc_id"] = 8,
										}, -- [30]
										{
											["q"] = 1,
											["index"] = 92,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:23228:0|h[Swift White Steed]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 31,
											["loc_id"] = 8,
										}, -- [31]
										{
											["q"] = 1,
											["index"] = 58,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:17454:0|h[Unpainted Mechanostrider]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["fav"] = false,
											["slot_id"] = 32,
											["loc_id"] = 8,
										}, -- [32]
										{
											["q"] = 1,
											["index"] = 373,
											["bag_id"] = 1,
											["h"] = "|cff71d5ff|Hspell:75207:0|h[Vashj'ir Seahorse]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 8,
											["fav"] = false,
											["slot_id"] = 33,
											["ab"] = 1,
										}, -- [33]
									},
									["status"] = -3,
									["bag_id"] = 1,
									["loc_id"] = 8,
								}, -- [1]
							},
							["slot_count"] = 33,
						}, -- [8]
						[14] = {
							["bag"] = {
								{
									["type"] = 26,
									["count"] = 19,
									["slot"] = {
										{
											["q"] = 1,
											["index"] = 260,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 1,
											["fav"] = false,
											["item"] = 37460,
											["h"] = "|cffffffff|Hitem:37460::::::::110:257::::::|h[]|h|r",
										}, -- [1]
										{
											["q"] = 1,
											["index"] = 239,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 2,
											["fav"] = false,
											["item"] = 123851,
											["h"] = "|cffffffff|Hitem:123851::::::::110:257::::::|h[]|h|r",
										}, -- [2]
										{
											["q"] = 1,
											["index"] = 319,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 3,
											["fav"] = false,
											["item"] = 130147,
											["h"] = "|cffffffff|Hitem:130147::::::::110:257::::::|h[]|h|r",
										}, -- [3]
										{
											["q"] = 1,
											["index"] = 231,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 4,
											["fav"] = false,
											["item"] = 130158,
											["h"] = "|cffffffff|Hitem:130158::::::::110:257::::::|h[]|h|r",
										}, -- [4]
										{
											["q"] = 1,
											["index"] = 309,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 5,
											["fav"] = false,
											["item"] = 130170,
											["h"] = "|cffffffff|Hitem:130170::::::::110:257::::::|h[]|h|r",
										}, -- [5]
										{
											["q"] = 1,
											["index"] = 79,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 6,
											["fav"] = false,
											["item"] = 130171,
											["h"] = "|cffffffff|Hitem:130171::::::::110:257::::::|h[]|h|r",
										}, -- [6]
										{
											["q"] = 1,
											["index"] = 216,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 7,
											["fav"] = false,
											["item"] = 130209,
											["h"] = "|cffffffff|Hitem:130209::::::::110:257::::::|h[]|h|r",
										}, -- [7]
										{
											["q"] = 1,
											["index"] = 361,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 8,
											["fav"] = false,
											["item"] = 130214,
											["h"] = "|cffffffff|Hitem:130214::::::::110:257::::::|h[]|h|r",
										}, -- [8]
										{
											["q"] = 1,
											["index"] = 88,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 9,
											["fav"] = false,
											["item"] = 131812,
											["h"] = "|cffffffff|Hitem:131812::::::::110:257::::::|h[]|h|r",
										}, -- [9]
										{
											["q"] = 1,
											["index"] = 352,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 10,
											["fav"] = false,
											["item"] = 131814,
											["h"] = "|cff0070dd|Hitem:131814::::::::110:257::::::|h[Whitewater Carp]|h|r",
										}, -- [10]
										{
											["q"] = 1,
											["index"] = 1,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 11,
											["fav"] = true,
											["item"] = 131900,
											["h"] = "|cffffffff|Hitem:131900::::::::110:257::::::|h[]|h|r",
										}, -- [11]
										{
											["q"] = 1,
											["index"] = 76,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 12,
											["fav"] = false,
											["item"] = 131933,
											["h"] = "|cffffffff|Hitem:131933::::::::110:257::::::|h[]|h|r",
										}, -- [12]
										{
											["q"] = 1,
											["index"] = 29,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 13,
											["fav"] = false,
											["item"] = 133997,
											["h"] = "|cffffffff|Hitem:133997::::::::110:257::::::|h[]|h|r",
										}, -- [13]
										{
											["q"] = 1,
											["index"] = 213,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 14,
											["fav"] = false,
											["item"] = 138873,
											["h"] = "|cffffffff|Hitem:138873::::::::110:257::::::|h[]|h|r",
										}, -- [14]
										{
											["q"] = 1,
											["index"] = 261,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 15,
											["fav"] = false,
											["item"] = 138876,
											["h"] = "|cffffffff|Hitem:138876::::::::110:257::::::|h[]|h|r",
										}, -- [15]
										{
											["q"] = 1,
											["index"] = 63,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 16,
											["fav"] = false,
											["item"] = 138878,
											["h"] = "|cffffffff|Hitem:138878::::::::110:257::::::|h[]|h|r",
										}, -- [16]
										{
											["q"] = 1,
											["index"] = 202,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 17,
											["fav"] = false,
											["item"] = 140324,
											["h"] = "|cffffffff|Hitem:140324::::::::110:257::::::|h[]|h|r",
										}, -- [17]
										{
											["q"] = 1,
											["index"] = 12,
											["bag_id"] = 1,
											["ab"] = 1,
											["loc_id"] = 14,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 18,
											["fav"] = false,
											["item"] = 141296,
											["h"] = "|cffffffff|Hitem:141296::::::::110:257::::::|h[]|h|r",
										}, -- [18]
										{
											["q"] = 1,
											["index"] = 341,
											["bag_id"] = 1,
											["h"] = "|cffffffff|Hitem:141301::::::::110:257::::::|h[]|h|r",
											["ab"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["item"] = 141301,
											["fav"] = false,
											["slot_id"] = 19,
											["loc_id"] = 14,
										}, -- [19]
									},
									["status"] = -3,
									["bag_id"] = 1,
									["loc_id"] = 14,
								}, -- [1]
							},
							["slot_count"] = 19,
						},
						[15] = {
							["bag"] = {
								{
									["type"] = 28,
									["count"] = 16,
									["slot"] = {
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122352::::::::110:257::::::|h[Charmed Ancient Bone Bow]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["ab"] = 1,
											["slot_id"] = 1,
											["loc_id"] = 15,
											["item"] = 122352,
										}, -- [1]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122385::::::::110:257:::1:582:::|h[Venerable Mass of McGowan]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 122385,
											["loc_id"] = 15,
											["slot_id"] = 2,
											["ab"] = 1,
										}, -- [2]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:140773::::::::110:257::::::|h[Eagletalon Spear]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 140773,
											["loc_id"] = 15,
											["slot_id"] = 3,
											["ab"] = 1,
										}, -- [3]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122245::::::::110:257:::1:582:::|h[Polished Helm of Valor]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 122245,
											["loc_id"] = 15,
											["slot_id"] = 4,
											["ab"] = 1,
										}, -- [4]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122379::::::::110:257:::1:582:::|h[Champion's Deathdealer Breastplate]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 122379,
											["loc_id"] = 15,
											["slot_id"] = 5,
											["ab"] = 1,
										}, -- [5]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122374::::::::110:257::::::|h[Prized Beastmaster's Mantle]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 122374,
											["loc_id"] = 15,
											["slot_id"] = 6,
											["ab"] = 1,
										}, -- [6]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122246::::::::110:257:::1:582:::|h[Tarnished Raging Berserker's Helm]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 122246,
											["loc_id"] = 15,
											["slot_id"] = 7,
											["ab"] = 1,
										}, -- [7]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122376::::::::110:257::::::|h[Exceptional Stormshroud Shoulders]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 122376,
											["loc_id"] = 15,
											["slot_id"] = 8,
											["ab"] = 1,
										}, -- [8]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122248::::::::110:257:::1:582:::|h[Stained Shadowcraft Cap]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 122248,
											["loc_id"] = 15,
											["slot_id"] = 9,
											["ab"] = 1,
										}, -- [9]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122254::::::::110:257::::::|h[Stained Shadowcraft Pants]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 122254,
											["loc_id"] = 15,
											["slot_id"] = 10,
											["ab"] = 1,
										}, -- [10]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122358::::::::110:257:::1:582:::|h[Stained Shadowcraft Spaulders]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 122358,
											["loc_id"] = 15,
											["slot_id"] = 11,
											["ab"] = 1,
										}, -- [11]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122383::::::::110:257:::1:582:::|h[Stained Shadowcraft Tunic]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 122383,
											["loc_id"] = 15,
											["slot_id"] = 12,
											["ab"] = 1,
										}, -- [12]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122261::::::::110:257:::1:582:::|h[Inherited Cape of the Black Baron]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 122261,
											["loc_id"] = 15,
											["slot_id"] = 13,
											["ab"] = 1,
										}, -- [13]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122260::::::::110:257:::1:582:::|h[Worn Stoneskin Gargoyle Cape]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 122260,
											["loc_id"] = 15,
											["slot_id"] = 14,
											["ab"] = 1,
										}, -- [14]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122668::::::::110:257::::::|h[Eternal Will of the Martyr]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 122668,
											["loc_id"] = 15,
											["slot_id"] = 15,
											["ab"] = 1,
										}, -- [15]
										{
											["q"] = 7,
											["bag_id"] = 1,
											["h"] = "|cff00ccff|Hitem:122361::::::::110:257:::1:582:::|h[Swift Hand of Justice]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["item"] = 122361,
											["loc_id"] = 15,
											["slot_id"] = 16,
											["ab"] = 1,
										}, -- [16]
									},
									["status"] = -3,
									["bag_id"] = 1,
									["loc_id"] = 15,
								}, -- [1]
							},
							["slot_count"] = 16,
						},
					},
				},
				["+Defiant - Doomhammer"] = {
					["info"] = {
						["money"] = 585755639,
						["class"] = "GUILD",
						["player_id"] = "+Defiant - Doomhammer",
						["realm"] = "Doomhammer",
						["name"] = "Defiant",
						["faction"] = "Alliance",
						["class_local"] = "Guild",
						["level"] = 1,
						["guild_id"] = "+Defiant - Doomhammer",
						["faction_local"] = "Alliance",
					},
				},
				["Bartholamue - Doomhammer"] = {
					["info"] = {
						["realm"] = "Doomhammer",
						["isplayer"] = true,
						["guid"] = "Player-1190-09083DB1",
						["money"] = 24704583,
						["class"] = "PALADIN",
						["player_id"] = "Bartholamue - Doomhammer",
						["gender"] = 2,
						["skills"] = {
							171, -- [1]
							755, -- [2]
							nil, -- [3]
							356, -- [4]
							185, -- [5]
							129, -- [6]
						},
						["race"] = "Human",
						["name"] = "Bartholamue",
						["faction"] = "Alliance",
						["race_local"] = "Human",
						["level"] = 100,
						["class_local"] = "Paladin",
						["faction_local"] = "Alliance",
					},
					["location"] = {
						{
							["bag"] = {
								{
									["q"] = 0,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:46177::::::::100:66::14::::|h[Conqueror's Aegis Shoulderguards]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 1,
											["age"] = 24595431,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:46176::::::::100:66::14::::|h[Conqueror's Aegis Legguards]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 1,
											["age"] = 24595431,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:46154::::::::100:66::14::::|h[Conqueror's Aegis Battleplate]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 1,
											["age"] = 24595431,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:46180::::::::100:66::14::::|h[Conqueror's Aegis Headpiece]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 1,
											["age"] = 24595431,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:46175::::::::100:66::14::::|h[Conqueror's Aegis Faceguard]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 1,
											["age"] = 24595431,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:140192::::::::100:66::11::::|h[Dalaran Hearthstone]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 1,
											["age"] = 24595432,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:143785::::::::100:66::::::|h[]|h|r",
											["count"] = 5,
											["loc_id"] = 1,
											["age"] = 24595432,
											["bag_id"] = 1,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["count"] = 1,
											["h"] = "|cff0070dd|Hitem:45087::::::::100:66::::::|h[Runed Orb]|h|r",
											["bag_id"] = 1,
											["age"] = 24595471,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:45149::::::::100:66::::::|h[Bracers of the Broodmother]|h|r",
											["slot_id"] = 9,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 1,
											["age"] = 24595471,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:45138::::::::100:66::::::|h[Drape of the Drakerider]|h|r",
											["slot_id"] = 10,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 1,
											["age"] = 24595471,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:45146::::::::100:66::::::|h[Shackles of the Odalisque]|h|r",
											["slot_id"] = 11,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 1,
											["age"] = 24595471,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [16]
									},
									["bag_id"] = 1,
									["loc_id"] = 1,
									["count"] = 16,
									["status"] = -3,
									["empty"] = 5,
									["texture"] = "Interface\\Icons\\INV_Misc_Bag_07_Green",
								}, -- [1]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 2,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 5,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 17,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 18,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 19,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 20,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [20]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 21,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [21]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 22,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [22]
									},
									["bag_id"] = 2,
									["loc_id"] = 1,
									["count"] = 22,
									["status"] = -3,
									["empty"] = 22,
									["h"] = "|cff1eff00|Hitem:54443::::::::100:66::::::|h[Embersilk Bag]|h|r",
									["texture"] = 348522,
								}, -- [2]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 2,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 5,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 17,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 18,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 19,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 20,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [20]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 21,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [21]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 22,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [22]
									},
									["bag_id"] = 3,
									["loc_id"] = 1,
									["count"] = 22,
									["status"] = -3,
									["empty"] = 22,
									["h"] = "|cff1eff00|Hitem:54443::::::::100:66::::::|h[Embersilk Bag]|h|r",
									["texture"] = 348522,
								}, -- [3]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 2,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 5,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 17,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 18,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 19,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 20,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [20]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 21,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [21]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 22,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [22]
									},
									["bag_id"] = 4,
									["loc_id"] = 1,
									["count"] = 22,
									["status"] = -3,
									["empty"] = 22,
									["h"] = "|cff1eff00|Hitem:54443::::::::100:66::::::|h[Embersilk Bag]|h|r",
									["texture"] = 348522,
								}, -- [4]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:6948::::::::100:66::::::|h[Hearthstone]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 5,
											["age"] = 24595431,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 2,
											["h"] = "|cffffffff|Hitem:108920::::::::100:66::::::|h[Lemon Flower Pudding]|h|r",
											["age"] = 24595431,
											["bag_id"] = 5,
											["count"] = 20,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:141595::::::::100:66::9:3:3447:1815:1820:::|h[Eredar Battle Blade]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 5,
											["age"] = 24595431,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 18,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 19,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 20,
										}, -- [20]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 21,
										}, -- [21]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:141603::::::::100:66::9:3:3447:1814:1820:::|h[Fel Lord's Warmace]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 5,
											["age"] = 24595449,
											["slot_id"] = 22,
										}, -- [22]
									},
									["bag_id"] = 5,
									["loc_id"] = 1,
									["count"] = 22,
									["status"] = -3,
									["empty"] = 18,
									["h"] = "|cff1eff00|Hitem:54443::::::::100:66::::::|h[Embersilk Bag]|h|r",
									["texture"] = 348522,
								}, -- [5]
							},
							["slot_count"] = 104,
						}, -- [1]
						[3] = {
							["bag"] = {
								[9] = {
									["q"] = 0,
									["type"] = 27,
									["bag_id"] = 9,
									["loc_id"] = 3,
									["status"] = -5,
									["texture"] = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Bag",
								},
							},
						},
						[6] = {
							["bag"] = {
								{
									["type"] = 14,
									["count"] = 18,
									["slot"] = {
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 1,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138155::::::::100:70:512:9:1:3387:100:::|h[Felforged Helmet]|h|r",
											["age"] = 24595431,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 2,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138160::::::::100:70::14::::|h[Infernal Cord]|h|r",
											["age"] = 24595431,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:138157::::::::100:70:512:9:1:3387:100:::|h[Felforged Pauldrons]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 3,
											["bag_id"] = 1,
											["age"] = 24595431,
											["loc_id"] = 6,
										}, -- [3]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 4,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138188::::::::100:70::14::::|h[Demon Commander's Drape]|h|r",
											["age"] = 24595431,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 5,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138152::::::::100:70:512:9:1:3387:100:::|h[Felforged Chestplate]|h|r",
											["age"] = 24595431,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 6,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 2,
											["loc_id"] = 6,
											["slot_id"] = 7,
											["sb"] = 1,
											["h"] = "|cff1eff00|Hitem:5976::::::::100:70::14::::|h[Guild Tabard]|h|r",
											["age"] = 24595431,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 8,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138159::::::::100:70:512:9:1:3387:100:::|h[Felforged Vambraces]|h|r",
											["age"] = 24595431,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 9,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138153::::::::100:70:512:9:2:3387:3388:100:::|h[Felforged Gauntlets]|h|r",
											["age"] = 24595431,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 10,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138154::::::::100:70:512:9:2:3387:3388:100:::|h[Felforged Waistplate]|h|r",
											["age"] = 24595431,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 11,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138156::::::::100:70:512:9:2:3387:3389:100:::|h[Felforged Legplates]|h|r",
											["age"] = 24595431,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 12,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138158::::::::100:70:512:9:1:3387:100:::|h[Felforged Warboots]|h|r",
											["age"] = 24595431,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:138450::::::::100:70:512:11:1:3387:98:::|h[Signet of Stormwind]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 1,
											["age"] = 24595431,
											["loc_id"] = 6,
										}, -- [13]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 14,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138162::::::::100:70::14::::|h[Legion Bound Ring]|h|r",
											["age"] = 24595431,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 15,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138774::::::::100:70::11::::|h[Accolade of House Wrynn]|h|r",
											["age"] = 24595431,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 16,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138171::::::::100:70::14::::|h[Inquisitor's Talisman]|h|r",
											["age"] = 24595431,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [16]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 17,
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24595449,
										}, -- [17]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 18,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [18]
									},
									["status"] = -3,
									["empty"] = 3,
									["bag_id"] = 1,
									["loc_id"] = 6,
								}, -- [1]
							},
							["slot_count"] = 18,
						},
						[9] = {
							["bag"] = {
								{
									["type"] = 19,
									["count"] = 1,
									["slot"] = {
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 1,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:1226|h[Nethershard]|h|r",
											["bag_id"] = 1,
											["age"] = 24595431,
											["count"] = 9,
										}, -- [1]
									},
									["status"] = -3,
									["bag_id"] = 1,
									["loc_id"] = 9,
								}, -- [1]
								{
									["loc_id"] = 9,
									["status"] = -6,
									["bag_id"] = 2,
									["type"] = 19,
								}, -- [2]
							},
							["slot_count"] = 1,
						},
						[10] = {
							["bag"] = {
								{
									["bag_id"] = 1,
									["loc_id"] = 10,
								}, -- [1]
							},
						},
					},
				},
				["Holyshnizzle - Doomhammer"] = {
					["info"] = {
						["guid"] = "Player-1190-075136D8",
						["class"] = "PRIEST",
						["class_local"] = "Priest",
						["race"] = "Gnome",
						["level"] = 110,
						["realm"] = "Doomhammer",
						["isplayer"] = true,
						["money"] = 216917223,
						["gender"] = 2,
						["player_id"] = "Holyshnizzle - Doomhammer",
						["name"] = "Holyshnizzle",
						["faction"] = "Alliance",
						["race_local"] = "Gnome",
						["skills"] = {
							171, -- [1]
							333, -- [2]
							nil, -- [3]
							356, -- [4]
							185, -- [5]
							129, -- [6]
						},
						["faction_local"] = "Alliance",
					},
					["location"] = {
						{
							["bag"] = {
								{
									["q"] = 0,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["slot_id"] = 2,
											["count"] = 1,
											["bag_id"] = 1,
											["loc_id"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["count"] = 1,
											["bag_id"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["slot_id"] = 5,
											["bag_id"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["count"] = 1,
											["bag_id"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["slot_id"] = 8,
											["bag_id"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["slot_id"] = 9,
											["bag_id"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["count"] = 1,
											["bag_id"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["count"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 1,
											["loc_id"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["count"] = 1,
											["bag_id"] = 1,
										}, -- [16]
									},
									["bag_id"] = 1,
									["loc_id"] = 1,
									["count"] = 16,
									["status"] = -3,
									["empty"] = 16,
									["texture"] = "Interface\\Icons\\INV_Misc_Bag_07_Green",
								}, -- [1]
								{
									["q"] = 3,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["count"] = 1,
											["slot_id"] = 1,
											["bag_id"] = 2,
											["loc_id"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 2,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["slot_id"] = 5,
											["bag_id"] = 2,
											["count"] = 1,
											["loc_id"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 2,
										}, -- [7]
										{
											["q"] = 0,
											["slot_id"] = 8,
											["count"] = 1,
											["bag_id"] = 2,
											["loc_id"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["slot_id"] = 11,
											["bag_id"] = 2,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["count"] = 1,
											["bag_id"] = 2,
										}, -- [12]
										{
											["q"] = 0,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 13,
											["loc_id"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 2,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["count"] = 1,
											["bag_id"] = 2,
										}, -- [15]
										{
											["q"] = 0,
											["slot_id"] = 16,
											["count"] = 1,
											["bag_id"] = 2,
											["loc_id"] = 1,
										}, -- [16]
										{
											["q"] = 0,
											["slot_id"] = 17,
											["count"] = 1,
											["bag_id"] = 2,
											["loc_id"] = 1,
										}, -- [17]
										{
											["q"] = 0,
											["count"] = 1,
											["slot_id"] = 18,
											["bag_id"] = 2,
											["loc_id"] = 1,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 19,
											["count"] = 1,
											["bag_id"] = 2,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["slot_id"] = 20,
											["bag_id"] = 2,
										}, -- [20]
										{
											["q"] = 0,
											["count"] = 1,
											["slot_id"] = 21,
											["bag_id"] = 2,
											["loc_id"] = 1,
										}, -- [21]
										{
											["q"] = 0,
											["bag_id"] = 2,
											["h"] = "|cff9d9d9d|Hitem:121391::::::::110:257::::::|h[Poison-Soaked Cuffs]|h|r",
											["slot_id"] = 22,
											["sb"] = 1,
											["loc_id"] = 1,
											["count"] = 1,
											["age"] = 24601426,
										}, -- [22]
										{
											["q"] = 0,
											["bag_id"] = 2,
											["h"] = "|cff9d9d9d|Hitem:132237::::::::110:257::::::|h[Large Leg Bone]|h|r",
											["slot_id"] = 23,
											["loc_id"] = 1,
											["count"] = 2,
											["age"] = 24601426,
										}, -- [23]
										{
											["q"] = 0,
											["age"] = 24601426,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cff9d9d9d|Hitem:138250::::::::110:257::::::|h[Statue of Queen Azshara]|h|r",
											["slot_id"] = 24,
											["bag_id"] = 2,
										}, -- [24]
										{
											["q"] = 1,
											["age"] = 24601426,
											["loc_id"] = 1,
											["count"] = 3,
											["h"] = "|cffffffff|Hitem:118007::::::::110:257::::::|h[Mecha-Blast Rocket]|h|r",
											["slot_id"] = 25,
											["bag_id"] = 2,
										}, -- [25]
										{
											["q"] = 1,
											["bag_id"] = 2,
											["h"] = "|cffffffff|Hitem:133562::::::::110:257::::::|h[Pickled Stormray]|h|r",
											["count"] = 20,
											["loc_id"] = 1,
											["slot_id"] = 26,
											["age"] = 24601426,
										}, -- [26]
									},
									["bag_id"] = 2,
									["loc_id"] = 1,
									["count"] = 26,
									["status"] = -3,
									["empty"] = 21,
									["h"] = "|cff0070dd|Hitem:130320::::::::110:257::::::|h[Addie's Ink-Stained Satchel]|h|r",
									["texture"] = 348527,
								}, -- [2]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 1,
											["age"] = 24601426,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["h"] = "|cffffffff|Hitem:133557::::::::110:257::::::|h[Salt & Pepper Shank]|h|r",
											["count"] = 20,
											["bag_id"] = 3,
										}, -- [1]
										{
											["q"] = 1,
											["bag_id"] = 3,
											["h"] = "|cffffffff|Hitem:138292::::::::110:257::::::|h[Ley-Enriched Water]|h|r",
											["count"] = 18,
											["loc_id"] = 1,
											["slot_id"] = 2,
											["age"] = 24601426,
										}, -- [2]
										{
											["q"] = 1,
											["age"] = 24601426,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["h"] = "|cffffffff|Hitem:138292::::::::110:257::::::|h[Ley-Enriched Water]|h|r",
											["count"] = 20,
											["bag_id"] = 3,
										}, -- [3]
										{
											["q"] = 1,
											["age"] = 24601426,
											["loc_id"] = 1,
											["count"] = 2,
											["h"] = "|cffffffff|Hitem:109599::::::::110:257::::::|h[Neural Silencer]|h|r",
											["slot_id"] = 4,
											["bag_id"] = 3,
										}, -- [4]
										{
											["q"] = 1,
											["age"] = 24601426,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cffffffff|Hitem:37265:::::::208364944:110:257::::::|h[Tua'kea's Breathing Bladder]|h|r",
											["slot_id"] = 5,
											["bag_id"] = 3,
										}, -- [5]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:6532::::::::110:257::::::|h[Bright Baubles]|h|r",
											["count"] = 20,
											["age"] = 24601426,
											["loc_id"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:133712::::::::110:257::::::|h[Frost Worm]|h|r",
											["slot_id"] = 7,
											["age"] = 24601426,
											["loc_id"] = 1,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:133721::::::::110:257::::::|h[Message in a Beer Bottle]|h|r",
											["count"] = 1,
											["age"] = 24601426,
											["loc_id"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:118006::::::::110:257::::::|h[Shieldtronic Shield]|h|r",
											["count"] = 2,
											["age"] = 24601426,
											["loc_id"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cffffffff|Hitem:6948::::::::110:257::::::|h[Hearthstone]|h|r",
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cffffffff|Hitem:140744::::::::110:257::14::::|h[Treasure Map: Azsuna]|h|r",
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cffffffff|Hitem:140731::::::::110:257::14::::|h[Treasure Map: Highmountain]|h|r",
											["bag_id"] = 3,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cffffffff|Hitem:140743::::::::110:257::14::::|h[Treasure Map: Stormheim]|h|r",
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cffffffff|Hitem:140746::::::::110:257::14::::|h[Treasure Map: Suramar]|h|r",
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cffffffff|Hitem:140745::::::::110:257::14::::|h[Treasure Map: Val'sharah]|h|r",
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cffffffff|Hitem:140192::::::::110:257::11::::|h[Dalaran Hearthstone]|h|r",
											["bag_id"] = 3,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 17,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cffffffff|Hitem:110560::::::::110:257::::::|h[Garrison Hearthstone]|h|r",
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [17]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 18,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cffffffff|Hitem:138111::::::::110:257::::::|h[Stormforged Grapple Launcher]|h|r",
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [18]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 19,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cffffffff|Hitem:71634::::::::110:257::::::|h[Darkmoon Adventurer's Guide]|h|r",
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [19]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:128676::::::::110:257::::::|h[Uncalibrated Malloric Burettes]|h|r",
											["count"] = 1,
											["age"] = 24601426,
											["loc_id"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 20,
										}, -- [20]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:38682::::::::110:257::::::|h[Enchanting Vellum]|h|r",
											["count"] = 50,
											["age"] = 24601426,
											["loc_id"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 21,
										}, -- [21]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:121158::::::::110:257:512::2:1812:1711:110:::|h[Hrydshal Cord of the Harmonious]|h|r",
											["count"] = 1,
											["age"] = 24601426,
											["loc_id"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 22,
										}, -- [22]
									},
									["bag_id"] = 3,
									["loc_id"] = 1,
									["count"] = 22,
									["status"] = -3,
									["h"] = "|cff1eff00|Hitem:54443::::::::110:257::::::|h[Embersilk Bag]|h|r",
									["texture"] = 348522,
								}, -- [3]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 3,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cff0070dd|Hitem:134216::::::::110:257::30:3:3397:1492:1675:::|h[Bonespeaker Cowl]|h|r",
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cff0070dd|Hitem:134220::::::::110:257::29:3:3396:1492:3339:::|h[Bonespeaker Sandals]|h|r",
											["bag_id"] = 4,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 4,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cffa335ee|Hitem:139074::::::::110:257::36:3:3432:1502:3336:::|h[Dreamwalker's Cloak]|h|r",
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 4,
											["bag_id"] = 4,
											["h"] = "|cffa335ee|Hitem:134305::::::::110:257::36:4:3432:42:1502:3336:::|h[Manawracker Gloves]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["age"] = 24601426,
										}, -- [4]
										{
											["q"] = 3,
											["bag_id"] = 4,
											["h"] = "|cff0070dd|Hitem:134171::::::::110:257::30:3:3397:1492:1675:::|h[Roggthread Cord]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 5,
											["age"] = 24601426,
										}, -- [5]
										{
											["q"] = 3,
											["age"] = 24601426,
											["h"] = "|cff0070dd|Hitem:134202::::::::110:257::29:4:3396:42:1487:1675:::|h[Stormsky Greatcloak]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["bag_id"] = 4,
										}, -- [6]
										{
											["q"] = 4,
											["age"] = 24601426,
											["h"] = "|cffa335ee|Hitem:139125::::::::110:257::36:3:3432:1497:1674:::|h[Sunfrost Handwraps]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 4,
										}, -- [7]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cff0070dd|Hitem:139127::::::::110:257::30:3:3397:1492:1675:::|h[Sunfrost Robes]|h|r",
											["bag_id"] = 4,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 4,
											["age"] = 24601426,
											["h"] = "|cffa335ee|Hitem:139130::::::::110:257::30:3:3397:1497:3336:::|h[Sunfrost Wristwraps]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["bag_id"] = 4,
										}, -- [9]
										{
											["q"] = 3,
											["age"] = 24601426,
											["h"] = "|cff0070dd|Hitem:139130::::::::110:257::29:5:3396:1808:41:1487:1675:::|h[Sunfrost Wristwraps]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["bag_id"] = 4,
										}, -- [10]
										{
											["q"] = 4,
											["age"] = 24601426,
											["h"] = "|cffa335ee|Hitem:121324::::::::110:257::36:3:3432:1517:3337:::|h[Terrorweave Cowl]|h|r",
											["slot_id"] = 11,
											["sb"] = 1,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 4,
										}, -- [11]
										{
											["q"] = 4,
											["age"] = 24601426,
											["h"] = "|cffa335ee|Hitem:121329:5442:::::::110:257::36:3:3432:1502:3336:::|h[Terrorweave Pauldrons]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 4,
										}, -- [12]
										{
											["q"] = 2,
											["age"] = 24601426,
											["h"] = "|cff1eff00|Hitem:121126::::::::110:257:512::2:1812:605:110:::|h[Stormwing Tail Tip]|h|r",
											["count"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 4,
										}, -- [13]
										{
											["q"] = 3,
											["age"] = 24601426,
											["h"] = "|cff0070dd|Hitem:139103::::::::110:257::28:3:3395:1482:1675:::|h[An'she's Band]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 4,
										}, -- [14]
										{
											["q"] = 2,
											["age"] = 24601426,
											["h"] = "|cff1eff00|Hitem:121227::::::::110:257:512::2:1812:1704:110:::|h[Jandvik Sabatons of the Aurora]|h|r",
											["count"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 4,
										}, -- [15]
										{
											["q"] = 2,
											["age"] = 24601426,
											["h"] = "|cff1eff00|Hitem:139398::::::::110:257::::::|h[Pant Loaf]|h|r",
											["count"] = 3,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 4,
										}, -- [16]
										{
											["q"] = 2,
											["age"] = 24601426,
											["h"] = "|cff1eff00|Hitem:140310::::::::110:257:8388608:::8:::|h[Crude Statuette]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 17,
											["bag_id"] = 4,
										}, -- [17]
										{
											["q"] = 2,
											["age"] = 24601426,
											["h"] = "|cff1eff00|Hitem:139795::::::::110:257::::::|h[Draught of Courage]|h|r",
											["count"] = 4,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 18,
											["bag_id"] = 4,
										}, -- [18]
										{
											["q"] = 2,
											["age"] = 24601426,
											["h"] = "|cff1eff00|Hitem:139792::::::::110:257::::::|h[Fruitful Bauble]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 19,
											["bag_id"] = 4,
										}, -- [19]
										{
											["q"] = 2,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cff1eff00|Hitem:140572::::::::110:257::::::|h[Hasty Pocketwatch]|h|r",
											["bag_id"] = 4,
											["slot_id"] = 20,
										}, -- [20]
										{
											["q"] = 2,
											["loc_id"] = 1,
											["slot_id"] = 21,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cff1eff00|Hitem:139871::::::::110:257::::::|h[Holy Figurine]|h|r",
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [21]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["slot_id"] = 22,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cff0070dd|Hitem:141260::::::::110:257::30:3:3397:1492:1675:::|h[Shieldmaiden's Prayer]|h|r",
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [22]
									},
									["bag_id"] = 4,
									["loc_id"] = 1,
									["count"] = 22,
									["status"] = -3,
									["h"] = "|cff1eff00|Hitem:54443::::::::110:257::::::|h[Embersilk Bag]|h|r",
									["texture"] = 348522,
								}, -- [4]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 2,
											["bag_id"] = 5,
											["h"] = "|cff1eff00|Hitem:140156::::::::110:257::::::|h[Blessing of the Order]|h|r",
											["count"] = 2,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["age"] = 24601426,
										}, -- [1]
										{
											["q"] = 2,
											["bag_id"] = 5,
											["h"] = "|cff1eff00|Hitem:131926::::::::110:257::::::|h[Delicate Roc Feather]|h|r",
											["slot_id"] = 2,
											["sb"] = 1,
											["loc_id"] = 1,
											["count"] = 1,
											["age"] = 24601426,
										}, -- [2]
										{
											["q"] = 2,
											["bag_id"] = 5,
											["h"] = "|cff1eff00|Hitem:131809::::::::110:257::::::|h[Gleaming Roc Feather]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["age"] = 24601426,
										}, -- [3]
										{
											["q"] = 2,
											["bag_id"] = 5,
											["h"] = "|cff1eff00|Hitem:139376::::::::110:257::::::|h[Healing Well]|h|r",
											["count"] = 2,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["age"] = 24601426,
										}, -- [4]
										{
											["q"] = 2,
											["bag_id"] = 5,
											["h"] = "|cff1eff00|Hitem:140930::::::::110:257::::::|h[Acolyte's Vows]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 5,
											["age"] = 24601426,
										}, -- [5]
										{
											["q"] = 2,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cff1eff00|Hitem:84660::::::::110:257::14::::|h[Pandaren Fishing Pole]|h|r",
											["bag_id"] = 5,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 4,
											["bag_id"] = 5,
											["h"] = "|cffa335ee|Hitem:139755::::::::110:257::14:2:3386:3384:::|h[Steps of the High Priest]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["age"] = 24601426,
										}, -- [7]
										{
											["q"] = 3,
											["bag_id"] = 5,
											["h"] = "|cff0070dd|Hitem:134528::::::::110:257::2:3:1726:42:1477:::|h[Band of Callous Dominance]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["age"] = 24601426,
										}, -- [8]
										{
											["q"] = 4,
											["bag_id"] = 5,
											["h"] = "|cffa335ee|Hitem:137301::::::::110:257::23:3:1727:1492:1813:::|h[Corrupted Starlight]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["age"] = 24601426,
										}, -- [9]
										{
											["q"] = 3,
											["bag_id"] = 5,
											["h"] = "|cff0070dd|Hitem:134525::::::::110:257::2:3:1726:42:1477:::|h[Seal of the Nazjatar Empire]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["age"] = 24601426,
										}, -- [10]
										{
											["q"] = 3,
											["bag_id"] = 5,
											["h"] = "|cff0070dd|Hitem:138781::::::::110:257:8388608:::8:::|h[Brief History of the Aeons]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["age"] = 24601426,
										}, -- [11]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["count"] = 3,
											["age"] = 24601426,
											["bag_id"] = 5,
											["h"] = "|cff0070dd|Hitem:139786::::::::110:257::::::|h[Ancient Mana Crystal]|h|r",
										}, -- [12]
										{
											["q"] = 3,
											["bag_id"] = 5,
											["h"] = "|cff0070dd|Hitem:140571::::::::110:257::::::|h[Potion of Energy]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["age"] = 24601426,
										}, -- [13]
										{
											["q"] = 3,
											["bag_id"] = 5,
											["h"] = "|cff0070dd|Hitem:141652::::::::110:257::11::::|h[Mana Divining Stone]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["age"] = 24601426,
										}, -- [14]
										{
											["q"] = 3,
											["bag_id"] = 5,
											["h"] = "|cff0070dd|Hitem:141605::::::::110:257::11::::|h[Flight Master's Whistle]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["age"] = 24601426,
										}, -- [15]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["age"] = 24601426,
											["h"] = "|cff0070dd|Hitem:139480::::::::110:257::::::|h[Corrupted Egg Fragment]|h|r",
											["bag_id"] = 5,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 3,
											["bag_id"] = 5,
											["h"] = "|cff0070dd|Hitem:71637::::::::110:257::::::|h[Mysterious Grimoire]|h|r",
											["slot_id"] = 17,
											["loc_id"] = 1,
											["count"] = 1,
											["age"] = 24601426,
										}, -- [17]
										{
											["q"] = 3,
											["bag_id"] = 5,
											["h"] = "|cff0070dd|Hitem:52723:::::::1697911680:110:257::::::|h[Runed Elementium Rod]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 18,
											["age"] = 24601426,
										}, -- [18]
										{
											["q"] = 4,
											["bag_id"] = 5,
											["h"] = "|cffa335ee|Hitem:135699::::::::110:257::8:3:3428:1472:1813:::|h[Vindictive Gladiator's Insignia of Dominance]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 19,
											["age"] = 24601426,
										}, -- [19]
										{
											["q"] = 4,
											["bag_id"] = 5,
											["h"] = "|cffa335ee|Hitem:64399::::::::110:257::14::::|h[Battle Standard of Coordination]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 20,
											["age"] = 24601426,
										}, -- [20]
										{
											["q"] = 6,
											["bag_id"] = 5,
											["h"] = "|cffe6cc80|Hitem:128827::142063:141264:141273::::110:257:256:9:1:740:247::3:3432:1502:3336:3:3396:1492:3339|h[Xal'atath, Blade of the Black Empire]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 21,
											["age"] = 24601426,
										}, -- [21]
										{
											["q"] = 6,
											["bag_id"] = 5,
											["h"] = "|cffe6cc80|Hitem:128868::::::::110:257:256:9:1:738:292:::|h[Light's Wrath]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 22,
											["age"] = 24601426,
										}, -- [22]
									},
									["bag_id"] = 5,
									["loc_id"] = 1,
									["count"] = 22,
									["status"] = -3,
									["h"] = "|cff1eff00|Hitem:54443::::::::110:257::::::|h[Embersilk Bag]|h|r",
									["texture"] = 348522,
								}, -- [5]
							},
							["slot_count"] = 108,
						}, -- [1]
						[3] = {
							["bag"] = {
								{
									["q"] = 0,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 3,
											["loc_id"] = 3,
											["slot_id"] = 1,
											["h"] = "|cff0070dd|Hitem:44629::::::::110:257::::::|h[Cask of Peaked Dalaran Red]|h|r",
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [1]
										{
											["q"] = 2,
											["loc_id"] = 3,
											["slot_id"] = 2,
											["h"] = "|cff1eff00|Hitem:44626::::::::110:257::::::|h[Cask of Aged Dalaran Red]|h|r",
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [2]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 3,
											["h"] = "|cffffffff|Hitem:44622::::::::110:257::::::|h[Cask of Dalaran White]|h|r",
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [3]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 4,
											["h"] = "|cffffffff|Hitem:129100::::::::110:257::::::|h[Gem Chip]|h|r",
											["count"] = 9,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [4]
										{
											["q"] = 3,
											["bag_id"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 5,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:75525:::::::421369760:110:257::::::|h[Alchemist's Flask]|h|r",
											["count"] = 1,
											["age"] = 24601426,
										}, -- [5]
										{
											["q"] = 4,
											["bag_id"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 6,
											["sb"] = 1,
											["h"] = "|cffa335ee|Hitem:68777::52207:::::1469389184:110:257::::::|h[Vibrant Alchemist Stone]|h|r",
											["count"] = 1,
											["age"] = 24601426,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 2,
											["bag_id"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 8,
											["sb"] = 1,
											["h"] = "|cff1eff00|Hitem:21843:::::::939049344:110:257::::::|h[Imbued Netherweave Bag]|h|r",
											["count"] = 1,
											["age"] = 24601426,
										}, -- [8]
										{
											["q"] = 2,
											["bag_id"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 9,
											["sb"] = 1,
											["h"] = "|cff1eff00|Hitem:21843:::::::1833917312:110:257::::::|h[Imbued Netherweave Bag]|h|r",
											["count"] = 1,
											["age"] = 24601426,
										}, -- [9]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 10,
											["h"] = "|cffffffff|Hitem:52770:::::::1001444992:110:257::::::|h[Enchant Bracer - Exceptional Versatility]|h|r",
											["count"] = 3,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [10]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 11,
											["h"] = "|cffffffff|Hitem:52764:::::::395659264:110:257::::::|h[Enchant Cloak - Critical Strike]|h|r",
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [11]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 12,
											["h"] = "|cffffffff|Hitem:52762:::::::210537264:110:257::::::|h[Enchant Shield - Mastery]|h|r",
											["count"] = 4,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [12]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 13,
											["h"] = "|cffffffff|Hitem:52758:::::::2062694528:110:257::::::|h[Enchant Chest - Mighty Resilience]|h|r",
											["count"] = 10,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [13]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 14,
											["h"] = "|cffffffff|Hitem:52753:::::::960375424:110:257::::::|h[Enchant Cloak - Intellect]|h|r",
											["count"] = 10,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [14]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 15,
											["h"] = "|cffffffff|Hitem:52749:::::::101333032:110:257::::::|h[Enchant Gloves - Haste]|h|r",
											["count"] = 15,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [15]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 16,
											["h"] = "|cffffffff|Hitem:52745:::::::1867783680:110:257::::::|h[Enchant Cloak - Lesser Power]|h|r",
											["count"] = 5,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [16]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 17,
											["h"] = "|cffffffff|Hitem:52743:::::::61654228:110:257::::::|h[Enchant Boots - Earthen Vitality]|h|r",
											["count"] = 20,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [17]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 18,
											["h"] = "|cffffffff|Hitem:52743:::::::1588958208:110:257::::::|h[Enchant Boots - Earthen Vitality]|h|r",
											["count"] = 6,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [18]
										{
											["q"] = 2,
											["loc_id"] = 3,
											["slot_id"] = 19,
											["h"] = "|cff1eff00|Hitem:32897::::::::110:257::::::|h[Mark of the Illidari]|h|r",
											["count"] = 7,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [19]
										{
											["q"] = 3,
											["bag_id"] = 1,
											["loc_id"] = 3,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:139757::::::::110:257::11:2:3386:3381:::|h[Mitre of the High Priest]|h|r",
											["slot_id"] = 20,
											["age"] = 24601426,
										}, -- [20]
										{
											["q"] = 3,
											["bag_id"] = 1,
											["loc_id"] = 3,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:139759::::::::110:257::11:2:3385:3383:::|h[Robes of the High Priest]|h|r",
											["slot_id"] = 21,
											["age"] = 24601426,
										}, -- [21]
										{
											["q"] = 3,
											["bag_id"] = 1,
											["loc_id"] = 3,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:139762::::::::110:257::11:2:3386:3381:::|h[Bracers of the High Priest]|h|r",
											["slot_id"] = 22,
											["age"] = 24601426,
										}, -- [22]
										{
											["q"] = 3,
											["bag_id"] = 1,
											["loc_id"] = 3,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:139758::::::::110:257::14:2:3386:3382:::|h[Leggings of the High Priest]|h|r",
											["slot_id"] = 23,
											["age"] = 24601426,
										}, -- [23]
										{
											["q"] = 2,
											["bag_id"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 24,
											["sb"] = 1,
											["h"] = "|cff1eff00|Hitem:71153::::::::110:257::::::|h[Magical Pet Biscuit]|h|r",
											["count"] = 3,
											["ab"] = 1,
											["age"] = 24601426,
										}, -- [24]
										{
											["q"] = 2,
											["bag_id"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 25,
											["sb"] = 1,
											["h"] = "|cff1eff00|Hitem:138135::::::::110:257::11::::|h[Rax's Magnifying Glass]|h|r",
											["count"] = 1,
											["age"] = 24601426,
										}, -- [25]
										{
											["q"] = 2,
											["bag_id"] = 1,
											["loc_id"] = 3,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cff1eff00|Hitem:141011::::::::110:257::::::|h[Recipe: Surf]|h|r",
											["slot_id"] = 26,
											["age"] = 24601426,
										}, -- [26]
										{
											["q"] = 3,
											["loc_id"] = 3,
											["slot_id"] = 27,
											["h"] = "|cff0070dd|Hitem:128891::::::::110:257::13:5:596:601:689:1696:3408:::|h[Dreadleather Bindings of the Fireflash]|h|r",
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24591913,
										}, -- [27]
										{
											["q"] = 5,
											["bag_id"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 28,
											["sb"] = 1,
											["h"] = "|cffff8000|Hitem:45038::::::::110:257::::::|h[Fragment of Val'anyr]|h|r",
											["count"] = 11,
											["age"] = 24601426,
										}, -- [28]
									},
									["bag_id"] = 1,
									["loc_id"] = 3,
									["count"] = 28,
									["status"] = -3,
									["empty"] = 1,
									["texture"] = "Interface\\Icons\\INV_Box_02",
								}, -- [1]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 4,
											["bag_id"] = 2,
											["loc_id"] = 3,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cffa335ee|Hitem:45632::::::::110:257::::::|h[Breastplate of the Wayward Conqueror]|h|r",
											["slot_id"] = 1,
											["age"] = 24591913,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 7,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 9,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 12,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 18,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 19,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 20,
										}, -- [20]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 21,
										}, -- [21]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 22,
										}, -- [22]
									},
									["bag_id"] = 2,
									["loc_id"] = 3,
									["count"] = 22,
									["status"] = -3,
									["empty"] = 21,
									["h"] = "|cff1eff00|Hitem:54443::::::::110:257::::::|h[Embersilk Bag]|h|r",
									["texture"] = 348522,
								}, -- [2]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 1,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 2,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 4,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 5,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 18,
										}, -- [18]
									},
									["bag_id"] = 3,
									["loc_id"] = 3,
									["count"] = 18,
									["status"] = -3,
									["empty"] = 18,
									["h"] = "|cff1eff00|Hitem:21843:::::::380883008:110:257::::::|h[Imbued Netherweave Bag]|h|r",
									["texture"] = 133657,
								}, -- [3]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 18,
										}, -- [18]
									},
									["bag_id"] = 4,
									["loc_id"] = 3,
									["count"] = 18,
									["status"] = -3,
									["empty"] = 18,
									["h"] = "|cff1eff00|Hitem:21843:::::::189720784:110:257::::::|h[Imbued Netherweave Bag]|h|r",
									["texture"] = 133657,
								}, -- [4]
								{
									["q"] = 1,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 18,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 19,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 20,
										}, -- [20]
									},
									["bag_id"] = 5,
									["loc_id"] = 3,
									["count"] = 20,
									["status"] = -3,
									["empty"] = 20,
									["h"] = "|cffffffff|Hitem:41599:::::::267339392:110:257::::::|h[]|h|r",
									["texture"] = 133665,
								}, -- [5]
								{
									["q"] = 1,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 18,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 19,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 6,
											["slot_id"] = 20,
										}, -- [20]
									},
									["bag_id"] = 6,
									["loc_id"] = 3,
									["count"] = 20,
									["status"] = -3,
									["empty"] = 20,
									["h"] = "|cffffffff|Hitem:41599:::::::706871552:110:257::::::|h[]|h|r",
									["texture"] = 133665,
								}, -- [6]
								{
									["q"] = 1,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 18,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 19,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 7,
											["slot_id"] = 20,
										}, -- [20]
									},
									["bag_id"] = 7,
									["loc_id"] = 3,
									["count"] = 20,
									["status"] = -3,
									["empty"] = 20,
									["h"] = "|cffffffff|Hitem:41599:::::::2110440448:110:257::::::|h[]|h|r",
									["texture"] = 133665,
								}, -- [7]
								{
									["q"] = 1,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 18,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 19,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 8,
											["slot_id"] = 20,
										}, -- [20]
									},
									["bag_id"] = 8,
									["loc_id"] = 3,
									["count"] = 20,
									["status"] = -3,
									["empty"] = 20,
									["h"] = "|cffffffff|Hitem:41599:::::::216806432:110:257::::::|h[]|h|r",
									["texture"] = 133665,
								}, -- [8]
								{
									["q"] = 0,
									["type"] = 27,
									["slot"] = {
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:124441::::::::110:257::::::|h[Leylight Shard]|h|r",
											["count"] = 134,
											["loc_id"] = 3,
											["slot_id"] = 1,
											["bag_id"] = 9,
											["age"] = 24601419,
										}, -- [1]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124440::::::::110:257::::::|h[Arkhana]|h|r",
											["count"] = 200,
											["loc_id"] = 3,
											["slot_id"] = 2,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [2]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124440::::::::110:257::::::|h[Arkhana]|h|r",
											["count"] = 178,
											["loc_id"] = 3,
											["slot_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24599556,
										}, -- [3]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:111245::::::::110:257::::::|h[Luminous Shard]|h|r",
											["count"] = 5,
											["loc_id"] = 3,
											["slot_id"] = 4,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [4]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:109693::::::::110:257::::::|h[Draenic Dust]|h|r",
											["count"] = 132,
											["loc_id"] = 3,
											["slot_id"] = 5,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [5]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:115504::::::::110:257::::::|h[Fractured Temporal Crystal]|h|r",
											["count"] = 6,
											["loc_id"] = 3,
											["slot_id"] = 6,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [6]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:52721::::::::110:257::::::|h[Heavenly Shard]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 7,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [7]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:52720::::::::110:257::::::|h[Small Heavenly Shard]|h|r",
											["count"] = 8,
											["loc_id"] = 3,
											["slot_id"] = 8,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [8]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:52718::::::::110:257::::::|h[Lesser Celestial Essence]|h|r",
											["count"] = 2,
											["loc_id"] = 3,
											["slot_id"] = 9,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [9]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:52555:::::::-694057675:110:257::::::|h[Hypnotic Dust]|h|r",
											["count"] = 36,
											["loc_id"] = 3,
											["slot_id"] = 10,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [10]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:34057::::::::110:257::::::|h[Abyss Crystal]|h|r",
											["count"] = 27,
											["loc_id"] = 3,
											["slot_id"] = 11,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [11]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:34052:::::::-748472285:110:257::::::|h[Dream Shard]|h|r",
											["count"] = 8,
											["loc_id"] = 3,
											["slot_id"] = 12,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [12]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:34055:::::::2130609024:110:257::::::|h[Greater Cosmic Essence]|h|r",
											["count"] = 8,
											["loc_id"] = 3,
											["slot_id"] = 13,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [13]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:22449:::::::520016352:110:257::::::|h[Large Prismatic Shard]|h|r",
											["count"] = 2,
											["loc_id"] = 3,
											["slot_id"] = 14,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [14]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:22450:::::::-1423593100:110:257::::::|h[Void Crystal]|h|r",
											["count"] = 5,
											["loc_id"] = 3,
											["slot_id"] = 15,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [15]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:34054:::::::-735198674:110:257::::::|h[Infinite Dust]|h|r",
											["count"] = 28,
											["loc_id"] = 3,
											["slot_id"] = 16,
											["bag_id"] = 9,
											["age"] = 24601042,
										}, -- [16]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:22446:::::::2112642218:110:257::::::|h[Greater Planar Essence]|h|r",
											["count"] = 18,
											["loc_id"] = 3,
											["slot_id"] = 17,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [17]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:22445:::::::-2141129728:110:257::::::|h[Arcane Dust]|h|r",
											["count"] = 66,
											["loc_id"] = 3,
											["slot_id"] = 18,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [18]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:16204:::::::1711785984:110:257::::::|h[Illusion Dust]|h|r",
											["count"] = 17,
											["loc_id"] = 3,
											["slot_id"] = 19,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [19]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:16203:::::::-740821477:110:257::::::|h[Greater Eternal Essence]|h|r",
											["count"] = 8,
											["loc_id"] = 3,
											["slot_id"] = 20,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [20]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:14343:::::::-755503333:110:257::::::|h[Small Brilliant Shard]|h|r",
											["count"] = 3,
											["loc_id"] = 3,
											["slot_id"] = 21,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [21]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:16202::::::::110:257::::::|h[Lesser Eternal Essence]|h|r",
											["count"] = 3,
											["loc_id"] = 3,
											["slot_id"] = 22,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [22]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:11175::::::::110:257::::::|h[Greater Nether Essence]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 23,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [23]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:11178:::::::-758251200:110:257::::::|h[Large Radiant Shard]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 24,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [24]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:11176::::::::110:257::::::|h[Dream Dust]|h|r",
											["count"] = 4,
											["loc_id"] = 3,
											["slot_id"] = 25,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [25]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:11177::::::::110:257::::::|h[Small Radiant Shard]|h|r",
											["count"] = 6,
											["loc_id"] = 3,
											["slot_id"] = 26,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [26]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:11174:::::::-754740789:110:257::::::|h[Lesser Nether Essence]|h|r",
											["count"] = 9,
											["loc_id"] = 3,
											["slot_id"] = 27,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [27]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:11135:::::::1452661752:110:257::::::|h[Greater Mystic Essence]|h|r",
											["count"] = 10,
											["loc_id"] = 3,
											["slot_id"] = 28,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [28]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:11137:::::::-740821038:110:257::::::|h[Vision Dust]|h|r",
											["count"] = 23,
											["loc_id"] = 3,
											["slot_id"] = 29,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [29]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:11138:::::::-1403558214:110:257::::::|h[Small Glowing Shard]|h|r",
											["count"] = 3,
											["loc_id"] = 3,
											["slot_id"] = 30,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [30]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:11134:::::::1913918908:110:257::::::|h[Lesser Mystic Essence]|h|r",
											["count"] = 6,
											["loc_id"] = 3,
											["slot_id"] = 31,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [31]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:11084:::::::-1990382079:110:257::::::|h[Large Glimmering Shard]|h|r",
											["count"] = 9,
											["loc_id"] = 3,
											["slot_id"] = 32,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [32]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:11082:::::::-2144474265:110:257::::::|h[Greater Astral Essence]|h|r",
											["count"] = 8,
											["loc_id"] = 3,
											["slot_id"] = 33,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [33]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:11083:::::::-761683767:110:257::::::|h[Soul Dust]|h|r",
											["count"] = 40,
											["loc_id"] = 3,
											["slot_id"] = 34,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [34]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:10978:::::::1106076038:110:257::::::|h[Small Glimmering Shard]|h|r",
											["count"] = 7,
											["loc_id"] = 3,
											["slot_id"] = 35,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [35]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:10998:::::::-887660963:110:257::::::|h[Lesser Astral Essence]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 36,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [36]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:10940:::::::-759226185:110:257::::::|h[Strange Dust]|h|r",
											["count"] = 11,
											["loc_id"] = 3,
											["slot_id"] = 37,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [37]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:108996::::::::110:257::::::|h[Alchemical Catalyst]|h|r",
											["count"] = 7,
											["loc_id"] = 3,
											["slot_id"] = 38,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [38]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124439::::::::110:257::::::|h[Unbroken Tooth]|h|r",
											["count"] = 117,
											["loc_id"] = 3,
											["slot_id"] = 39,
											["bag_id"] = 9,
											["age"] = 24599556,
										}, -- [39]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124438::::::::110:257::::::|h[Unbroken Claw]|h|r",
											["count"] = 59,
											["loc_id"] = 3,
											["slot_id"] = 40,
											["bag_id"] = 9,
											["age"] = 24599556,
										}, -- [40]
										{
											["q"] = 2,
											["bag_id"] = 9,
											["loc_id"] = 3,
											["slot_id"] = 41,
											["sb"] = 1,
											["h"] = "|cff1eff00|Hitem:137597::::::::110:257::::::|h[Oily Transmutagen]|h|r",
											["count"] = 20,
											["age"] = 24601426,
										}, -- [41]
										{
											["q"] = 2,
											["bag_id"] = 9,
											["loc_id"] = 3,
											["slot_id"] = 42,
											["sb"] = 1,
											["h"] = "|cff1eff00|Hitem:137596::::::::110:257::::::|h[Black Transmutagen]|h|r",
											["count"] = 20,
											["age"] = 24601426,
										}, -- [42]
										{
											["q"] = 2,
											["bag_id"] = 9,
											["loc_id"] = 3,
											["slot_id"] = 43,
											["sb"] = 1,
											["h"] = "|cff1eff00|Hitem:137595::::::::110:257::::::|h[Viscous Transmutagen]|h|r",
											["count"] = 7,
											["age"] = 24601426,
										}, -- [43]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:3371::::::::110:257::::::|h[Crystal Vial]|h|r",
											["count"] = 90,
											["loc_id"] = 3,
											["slot_id"] = 44,
											["bag_id"] = 9,
											["age"] = 24601042,
										}, -- [44]
										{
											["q"] = 3,
											["bag_id"] = 9,
											["loc_id"] = 3,
											["count"] = 160,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:124124::::::::110:257::::::|h[Blood of Sargeras]|h|r",
											["slot_id"] = 45,
											["age"] = 24601426,
										}, -- [45]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:128304::::::::110:257::::::|h[Yseralline Seed]|h|r",
											["count"] = 188,
											["loc_id"] = 3,
											["slot_id"] = 46,
											["bag_id"] = 9,
											["age"] = 24601419,
										}, -- [46]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124105::::::::110:257::::::|h[Starlight Rose]|h|r",
											["count"] = 9,
											["loc_id"] = 3,
											["slot_id"] = 47,
											["bag_id"] = 9,
											["age"] = 24601419,
										}, -- [47]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124104::::::::110:257::::::|h[Fjarnskaggl]|h|r",
											["count"] = 74,
											["loc_id"] = 3,
											["slot_id"] = 48,
											["bag_id"] = 9,
											["age"] = 24601419,
										}, -- [48]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124103::::::::110:257::::::|h[Foxflower]|h|r",
											["count"] = 71,
											["loc_id"] = 3,
											["slot_id"] = 49,
											["bag_id"] = 9,
											["age"] = 24601419,
										}, -- [49]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124102::::::::110:257::::::|h[Dreamleaf]|h|r",
											["count"] = 96,
											["loc_id"] = 3,
											["slot_id"] = 50,
											["bag_id"] = 9,
											["age"] = 24601419,
										}, -- [50]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124101::::::::110:257::::::|h[Aethril]|h|r",
											["count"] = 70,
											["loc_id"] = 3,
											["slot_id"] = 51,
											["bag_id"] = 9,
											["age"] = 24601419,
										}, -- [51]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124112::::::::110:257::::::|h[Black Barracuda]|h|r",
											["count"] = 50,
											["loc_id"] = 3,
											["slot_id"] = 52,
											["bag_id"] = 9,
											["age"] = 24601419,
										}, -- [52]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124111::::::::110:257::::::|h[Runescale Koi]|h|r",
											["count"] = 77,
											["loc_id"] = 3,
											["slot_id"] = 53,
											["bag_id"] = 9,
											["age"] = 24599556,
										}, -- [53]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124110::::::::110:257::::::|h[Stormray]|h|r",
											["count"] = 36,
											["loc_id"] = 3,
											["slot_id"] = 54,
											["bag_id"] = 9,
											["age"] = 24599556,
										}, -- [54]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124109::::::::110:257::::::|h[Highmountain Salmon]|h|r",
											["count"] = 74,
											["loc_id"] = 3,
											["slot_id"] = 55,
											["bag_id"] = 9,
											["age"] = 24601419,
										}, -- [55]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124108::::::::110:257::::::|h[Mossgill Perch]|h|r",
											["count"] = 26,
											["loc_id"] = 3,
											["slot_id"] = 56,
											["bag_id"] = 9,
											["age"] = 24594722,
										}, -- [56]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124107::::::::110:257::::::|h[Cursed Queenfish]|h|r",
											["count"] = 101,
											["loc_id"] = 3,
											["slot_id"] = 57,
											["bag_id"] = 9,
											["age"] = 24599556,
										}, -- [57]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124121::::::::110:257::::::|h[Wildfowl Egg]|h|r",
											["count"] = 41,
											["loc_id"] = 3,
											["slot_id"] = 58,
											["bag_id"] = 9,
											["age"] = 24601419,
										}, -- [58]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124120::::::::110:257::::::|h[Leyblood]|h|r",
											["count"] = 63,
											["loc_id"] = 3,
											["slot_id"] = 59,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [59]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124119::::::::110:257::::::|h[Big Gamy Ribs]|h|r",
											["count"] = 54,
											["loc_id"] = 3,
											["slot_id"] = 60,
											["bag_id"] = 9,
											["age"] = 24601419,
										}, -- [60]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124118::::::::110:257::::::|h[Fatty Bearsteak]|h|r",
											["count"] = 67,
											["loc_id"] = 3,
											["slot_id"] = 61,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [61]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124117::::::::110:257::::::|h[Lean Shank]|h|r",
											["count"] = 165,
											["loc_id"] = 3,
											["slot_id"] = 62,
											["bag_id"] = 9,
											["age"] = 24599556,
										}, -- [62]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:51950:::::::867100544:110:257::::::|h[Pyrium Bar]|h|r",
											["count"] = 5,
											["loc_id"] = 3,
											["slot_id"] = 63,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [63]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124437::::::::110:257::::::|h[Shal'dorei Silk]|h|r",
											["count"] = 200,
											["loc_id"] = 3,
											["slot_id"] = 64,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [64]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124437::::::::110:257::::::|h[Shal'dorei Silk]|h|r",
											["count"] = 66,
											["loc_id"] = 3,
											["slot_id"] = 65,
											["bag_id"] = 9,
											["age"] = 24601419,
										}, -- [65]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:4338::::::::110:257::::::|h[Mageweave Cloth]|h|r",
											["count"] = 31,
											["loc_id"] = 3,
											["slot_id"] = 66,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [66]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:4306::::::::110:257::::::|h[Silk Cloth]|h|r",
											["count"] = 29,
											["loc_id"] = 3,
											["slot_id"] = 67,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [67]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2592::::::::110:257::::::|h[Wool Cloth]|h|r",
											["count"] = 4,
											["loc_id"] = 3,
											["slot_id"] = 68,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [68]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2589::::::::110:257::::::|h[Linen Cloth]|h|r",
											["count"] = 3,
											["loc_id"] = 3,
											["slot_id"] = 69,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [69]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:7909::::::::110:257::::::|h[Aquamarine]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 70,
											["bag_id"] = 9,
											["age"] = 24591251,
										}, -- [70]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:133607::::::::110:257::::::|h[Silver Mackerel]|h|r",
											["count"] = 15,
											["loc_id"] = 3,
											["slot_id"] = 71,
											["bag_id"] = 9,
											["age"] = 24601419,
										}, -- [71]
										{
											["q"] = 2,
											["bag_id"] = 9,
											["loc_id"] = 3,
											["slot_id"] = 72,
											["sb"] = 1,
											["h"] = "|cff1eff00|Hitem:137597::::::::110:257::::::|h[Oily Transmutagen]|h|r",
											["count"] = 9,
											["age"] = 24601426,
										}, -- [72]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:124442::::::::110:257::::::|h[Chaos Crystal]|h|r",
											["count"] = 9,
											["loc_id"] = 3,
											["slot_id"] = 73,
											["bag_id"] = 9,
											["age"] = 24599556,
										}, -- [73]
										{
											["q"] = 2,
											["bag_id"] = 9,
											["loc_id"] = 3,
											["slot_id"] = 74,
											["sb"] = 1,
											["h"] = "|cff1eff00|Hitem:137596::::::::110:257::::::|h[Black Transmutagen]|h|r",
											["count"] = 10,
											["age"] = 24601426,
										}, -- [74]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:124106::::::::110:257::::::|h[Felwort]|h|r",
											["slot_id"] = 75,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["age"] = 24599556,
										}, -- [75]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:74865::::::::110:257::::::|h[Krasarang Paddlefish]|h|r",
											["slot_id"] = 76,
											["loc_id"] = 3,
											["count"] = 7,
											["bag_id"] = 9,
											["age"] = 24599556,
										}, -- [76]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:74866::::::::110:257::::::|h[Golden Carp]|h|r",
											["slot_id"] = 77,
											["loc_id"] = 3,
											["count"] = 157,
											["bag_id"] = 9,
											["age"] = 24599556,
										}, -- [77]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:74859::::::::110:257::::::|h[Emperor Salmon]|h|r",
											["slot_id"] = 78,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["age"] = 24599556,
										}, -- [78]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:74857::::::::110:257::::::|h[Giant Mantis Shrimp]|h|r",
											["slot_id"] = 79,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["age"] = 24599556,
										}, -- [79]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:72988::::::::110:257::::::|h[Windwool Cloth]|h|r",
											["slot_id"] = 80,
											["loc_id"] = 3,
											["count"] = 2,
											["bag_id"] = 9,
											["age"] = 24599556,
										}, -- [80]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 81,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [81]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 82,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [82]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 83,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [83]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 84,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [84]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 85,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [85]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 86,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [86]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 87,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [87]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 88,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [88]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 89,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [89]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 90,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [90]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 91,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [91]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 92,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [92]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 93,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [93]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 94,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [94]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 95,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [95]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 96,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [96]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 97,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [97]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 98,
											["bag_id"] = 9,
											["count"] = 1,
										}, -- [98]
									},
									["bag_id"] = 9,
									["loc_id"] = 3,
									["count"] = 98,
									["status"] = -3,
									["empty"] = 18,
									["texture"] = "Interface\\Icons\\INV_Box_02",
								}, -- [9]
							},
							["slot_count"] = 264,
						},
						[5] = {
							["bag"] = {
								{
									["type"] = 15,
									["count"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 5,
											["slot_id"] = 1,
											["att_id"] = 1,
											["bag_id"] = 1,
											["msg_id"] = 1,
										}, -- [1]
									},
									["status"] = -3,
									["empty"] = 1,
									["bag_id"] = 1,
									["loc_id"] = 5,
								}, -- [1]
								{
									["loc_id"] = 5,
									["status"] = -3,
									["bag_id"] = 2,
									["type"] = 15,
								}, -- [2]
							},
							["slot_count"] = 1,
						},
						[6] = {
							["bag"] = {
								{
									["type"] = 14,
									["count"] = 18,
									["slot"] = {
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:141449::::::::110:257::3:1:1472:::|h[Mana Scavenger's Mask]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601362,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:135681::::::::110:257::8:3:3428:1472:1813:::|h[Vindictive Gladiator's Necklace]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 2,
											["age"] = 24601422,
											["loc_id"] = 6,
										}, -- [2]
										{
											["q"] = 4,
											["loc_id"] = 6,
											["slot_id"] = 3,
											["sb"] = 1,
											["h"] = "|cffa335ee|Hitem:137360:5442:::::::110:257::23:3:1727:1492:1813:::|h[Shoulderpads of Crashing Waves]|h|r",
											["age"] = 24601362,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 4,
											["loc_id"] = 6,
											["slot_id"] = 4,
											["sb"] = 1,
											["h"] = "|cffa335ee|Hitem:134202:5433:::::::110:257::36:3:3432:1502:3336:::|h[Stormsky Greatcloak]|h|r",
											["age"] = 24601362,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:134307::::::::110:257::30:5:3397:1808:43:1517:3337:::|h[Manawracker Vestments]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601362,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 6,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 7,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:134310::::::::110:257::36:3:3432:1512:3337:::|h[Manawracker Bindings]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601362,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:134217::::::::110:257::36:3:3432:1502:3336:::|h[Bonespeaker Gloves]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601362,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:134423::::::::110:257::23:3:1727:1492:1813:::|h[Poisonroot Belt]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601362,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 4,
											["loc_id"] = 6,
											["slot_id"] = 11,
											["sb"] = 1,
											["h"] = "|cffa335ee|Hitem:134218::::::::110:257::36:4:3432:40:1507:3336:::|h[Bonespeaker Leggings]|h|r",
											["age"] = 24601362,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:134308::::::::110:257::29:3:3396:1512:3337:::|h[Manawracker Sandals]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["age"] = 24601362,
											["bag_id"] = 1,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:133634:5423:::::::110:257::2:4:1726:40:1492:3337:::|h[Grasping Tentacle Loop]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 13,
											["age"] = 24601422,
											["loc_id"] = 6,
										}, -- [13]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:133638:5423:::::::110:257::23:3:1727:1492:1813:::|h[Woe-Bearer's Band]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 14,
											["age"] = 24601422,
											["loc_id"] = 6,
										}, -- [14]
										{
											["q"] = 4,
											["h"] = "|cffa335ee|Hitem:134160::::::::110:257::30:5:3397:1808:604:1502:3336:::|h[Huge Roggstone]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601362,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 4,
											["loc_id"] = 6,
											["slot_id"] = 16,
											["sb"] = 1,
											["age"] = 24601422,
											["count"] = 1,
											["bag_id"] = 1,
											["h"] = "|cffa335ee|Hitem:134204::::::::110:257::36:4:3432:603:1507:3336:::|h[Bleached Skull Talisman]|h|r",
										}, -- [16]
										{
											["q"] = 6,
											["h"] = "|cffe6cc80|Hitem:128825::141260:137327:141260::::110:257:256:9:1:739:748:3:3432:1497:1674:3:1727:1492:1813:3:3397:1492:1675|h[T'uure, Beacon of the Naaru]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601362,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["count"] = 1,
											["slot_id"] = 18,
											["bag_id"] = 1,
											["age"] = 24599561,
										}, -- [18]
									},
									["status"] = -3,
									["empty"] = 3,
									["bag_id"] = 1,
									["loc_id"] = 6,
								}, -- [1]
							},
							["slot_count"] = 18,
						},
						[9] = {
							["bag"] = {
								{
									["type"] = 19,
									["count"] = 8,
									["slot"] = {
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 1,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:1155|h[Ancient Mana]|h|r",
											["bag_id"] = 1,
											["age"] = 24601042,
											["count"] = 429,
										}, -- [1]
										{
											["q"] = 4,
											["loc_id"] = 9,
											["slot_id"] = 2,
											["sb"] = 1,
											["h"] = "|cffa335ee|Hcurrency:1275|h[Curious Coin]|h|r",
											["bag_id"] = 1,
											["age"] = 24591251,
											["count"] = 2,
										}, -- [2]
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 3,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:1226|h[Nethershard]|h|r",
											["bag_id"] = 1,
											["age"] = 24591251,
											["count"] = 713,
										}, -- [3]
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 4,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:1220|h[Order Resources]|h|r",
											["bag_id"] = 1,
											["age"] = 24601411,
											["count"] = 8237,
										}, -- [4]
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 5,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:1149|h[Sightless Eye]|h|r",
											["bag_id"] = 1,
											["age"] = 24599437,
											["count"] = 357,
										}, -- [5]
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 6,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:515|h[Darkmoon Prize Ticket]|h|r",
											["bag_id"] = 1,
											["age"] = 24599437,
											["count"] = 15,
										}, -- [6]
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 7,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:824|h[Garrison Resources]|h|r",
											["bag_id"] = 1,
											["age"] = 24599437,
											["count"] = 300,
										}, -- [7]
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 8,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:738|h[Lesser Charm of Good Fortune]|h|r",
											["bag_id"] = 1,
											["age"] = 24599437,
											["count"] = 19,
										}, -- [8]
									},
									["status"] = -3,
									["bag_id"] = 1,
									["loc_id"] = 9,
								}, -- [1]
								{
									["loc_id"] = 9,
									["status"] = -6,
									["bag_id"] = 2,
									["type"] = 19,
								}, -- [2]
							},
							["slot_count"] = 8,
						},
						[10] = {
							["bag"] = {
								{
									["bag_id"] = 1,
									["loc_id"] = 10,
								}, -- [1]
							},
						},
					},
				},
				["Alfalpha - Doomhammer"] = {
					["info"] = {
						["faction_local"] = "Alliance",
						["isplayer"] = true,
						["guid"] = "Player-1190-075136F0",
						["money"] = 61749088,
						["gender"] = 2,
						["player_id"] = "Alfalpha - Doomhammer",
						["class"] = "DEATHKNIGHT",
						["level"] = 102,
						["race"] = "Draenei",
						["name"] = "Alfalpha",
						["faction"] = "Alliance",
						["race_local"] = "Draenei",
						["skills"] = {
							182, -- [1]
							186, -- [2]
							[6] = 129,
						},
						["class_local"] = "Death Knight",
						["realm"] = "Doomhammer",
					},
					["location"] = {
						{
							["bag"] = {
								{
									["q"] = 0,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 4,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["sb"] = 1,
											["h"] = "|cffa335ee|Hitem:140517::::::::102:252:8388608:11::1:::|h[Glory of the Order]|h|r",
											["age"] = 24592721,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 2,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 5,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 16,
										}, -- [16]
									},
									["bag_id"] = 1,
									["loc_id"] = 1,
									["count"] = 16,
									["status"] = -3,
									["empty"] = 15,
									["texture"] = "Interface\\Icons\\INV_Misc_Bag_07_Green",
								}, -- [1]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 2,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 17,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 18,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [18]
									},
									["bag_id"] = 2,
									["h"] = "|cff1eff00|Hitem:21843:::::::1471015552:102:252::::::|h[Imbued Netherweave Bag]|h|r",
									["count"] = 18,
									["status"] = -3,
									["empty"] = 18,
									["loc_id"] = 1,
									["texture"] = 133657,
								}, -- [2]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 17,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 18,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [18]
									},
									["bag_id"] = 3,
									["h"] = "|cff1eff00|Hitem:21843:::::::1191819776:102:252::::::|h[Imbued Netherweave Bag]|h|r",
									["count"] = 18,
									["status"] = -3,
									["empty"] = 18,
									["loc_id"] = 1,
									["texture"] = 133657,
								}, -- [3]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:141284::::::::102:252:512::1:1812:100:::|h[Nor'danil Ampoule]|h|r",
											["slot_id"] = 1,
											["loc_id"] = 1,
											["age"] = 24591242,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:52242:::::::1042109376:102:252::::::|h[Solid Ocean Sapphire]|h|r",
											["count"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 4,
											["age"] = 24591242,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cffffffff|Hitem:133814::::::::102:252::11::::|h[Recipe: Faronaar Fizz]|h|r",
											["bag_id"] = 4,
											["age"] = 24594726,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["sb"] = 1,
											["h"] = "|cffffffff|Hitem:71634:::::::88965360:102:252::::::|h[Darkmoon Adventurer's Guide]|h|r",
											["age"] = 24591242,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 2,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["sb"] = 1,
											["h"] = "|cff1eff00|Hitem:143785::::::::102:252::::::|h[Tome of the Tranquil Mind]|h|r",
											["age"] = 24591242,
											["bag_id"] = 4,
											["count"] = 5,
										}, -- [9]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:138875::::::::102:252::::::|h[Small Ley Crystal]|h|r",
											["count"] = 5,
											["loc_id"] = 1,
											["bag_id"] = 4,
											["age"] = 24591242,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["sb"] = 1,
											["h"] = "|cffffffff|Hitem:140192::::::::102:252::11::::|h[Dalaran Hearthstone]|h|r",
											["age"] = 24591242,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 17,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 18,
										}, -- [18]
									},
									["bag_id"] = 4,
									["h"] = "|cff1eff00|Hitem:21843:::::::2086500352:102:252::::::|h[Imbued Netherweave Bag]|h|r",
									["count"] = 18,
									["status"] = -3,
									["empty"] = 11,
									["loc_id"] = 1,
									["texture"] = 133657,
								}, -- [4]
								{
									["q"] = 1,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:6948:::::::534338656:102:252::::::|h[Hearthstone]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 5,
											["age"] = 24591183,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:63122:::::::-1940148480:102:252::::::|h[Lifegiving Seed]|h|r",
											["count"] = 19,
											["loc_id"] = 1,
											["bag_id"] = 5,
											["age"] = 24591093,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:71083:::::::1748449280:102:252::::::|h[Darkmoon Game Token]|h|r",
											["count"] = 5,
											["sb"] = 1,
											["loc_id"] = 1,
											["age"] = 24592717,
											["bag_id"] = 5,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:37265:::::::1142659456:102:252::::::|h[Tua'kea's Breathing Bladder]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["age"] = 24594726,
											["bag_id"] = 5,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 5,
											["h"] = "|cffffffff|Hitem:40073:::::::1162857856:102:252::::::|h[Elixir of Mighty Strength]|h|r",
											["age"] = 24591242,
											["bag_id"] = 5,
											["count"] = 6,
										}, -- [5]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["h"] = "|cffffffff|Hitem:40211:::::::1330555040:102:252::::::|h[Potion of Speed]|h|r",
											["age"] = 24591242,
											["bag_id"] = 5,
											["count"] = 4,
										}, -- [6]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:141603::::::::102:252::9:3:3447:1814:1820:::|h[Fel Lord's Warmace]|h|r",
											["age"] = 24592717,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2901::::::::102:252::::::|h[Mining Pick]|h|r",
											["count"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 5,
											["age"] = 24591242,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:134497::::::::102:252:512:17:1:1795:102:::|h[Stormcharged Choker]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 5,
											["age"] = 24594726,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:40483:::::::2129230080:102:252::::::|h[Insignia of the Scourge]|h|r",
											["age"] = 24594726,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124439::::::::102:252::::::|h[Unbroken Tooth]|h|r",
											["slot_id"] = 11,
											["loc_id"] = 1,
											["age"] = 24591242,
											["bag_id"] = 5,
											["count"] = 4,
										}, -- [11]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124437::::::::102:252::::::|h[Shal'dorei Silk]|h|r",
											["slot_id"] = 12,
											["loc_id"] = 1,
											["age"] = 24591242,
											["bag_id"] = 5,
											["count"] = 29,
										}, -- [12]
									},
									["bag_id"] = 5,
									["h"] = "|cffffffff|Hitem:38145::::::::102:252::::::|h[Deathweave Bag]|h|r",
									["count"] = 12,
									["status"] = -3,
									["loc_id"] = 1,
									["texture"] = 133640,
								}, -- [5]
							},
							["slot_count"] = 82,
						}, -- [1]
						[3] = {
							["bag"] = {
								[9] = {
									["q"] = 0,
									["type"] = 27,
									["slot"] = {
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2592::::::::102:252::::::|h[Wool Cloth]|h|r",
											["count"] = 2,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2450::::::::102:252::::::|h[Briarthorn]|h|r",
											["count"] = 9,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:785::::::::102:252::::::|h[Mageroyal]|h|r",
											["count"] = 16,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:765::::::::102:252::::::|h[Silverleaf]|h|r",
											["count"] = 4,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:52185:::::::1800407808:102:252::::::|h[Elementium Ore]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:53038:::::::1008048960:102:252::::::|h[Obsidium Ore]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2771::::::::102:252::::::|h[Tin Ore]|h|r",
											["count"] = 75,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2836::::::::102:252::::::|h[Coarse Stone]|h|r",
											["count"] = 76,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:2775::::::::102:252::::::|h[Silver Ore]|h|r",
											["count"] = 5,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2770::::::::102:252::::::|h[Copper Ore]|h|r",
											["count"] = 4,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2835::::::::102:252::::::|h[Rough Stone]|h|r",
											["count"] = 2,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:53010:::::::1346730240:102:252::::::|h[Embersilk Cloth]|h|r",
											["count"] = 16,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:52078:::::::-1904092800:102:252::::::|h[Chaos Orb]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2452::::::::102:252::::::|h[Swiftthistle]|h|r",
											["count"] = 4,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:2776:::::::297622574:102:252::::::|h[Gold Ore]|h|r",
											["count"] = 17,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2838:::::::1998510720:102:252::::::|h[Heavy Stone]|h|r",
											["count"] = 38,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:3858:::::::583554560:102:252::::::|h[Mithril Ore]|h|r",
											["count"] = 149,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:7912:::::::851990016:102:252::::::|h[Solid Stone]|h|r",
											["count"] = 169,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 18,
										}, -- [18]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2772:::::::2032215424:102:252::::::|h[Iron Ore]|h|r",
											["count"] = 25,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 19,
										}, -- [19]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:1705:::::::-1892480128:102:252::::::|h[Lesser Moonstone]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 20,
										}, -- [20]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:1210:::::::1333099232:102:252::::::|h[Shadowgem]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 21,
										}, -- [21]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:1529:::::::-1452532864:102:252::::::|h[Jade]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 22,
										}, -- [22]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:7911:::::::1496850048:102:252::::::|h[Truesilver Ore]|h|r",
											["count"] = 11,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 23,
										}, -- [23]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:7909:::::::1765285504:102:252::::::|h[Aquamarine]|h|r",
											["count"] = 5,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 24,
										}, -- [24]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:7910:::::::-1548733056:102:252::::::|h[Star Ruby]|h|r",
											["count"] = 2,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 25,
										}, -- [25]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:9262:::::::1949105920:102:252::::::|h[Black Vitriol]|h|r",
											["count"] = 3,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 26,
										}, -- [26]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:3864:::::::1995448320:102:252::::::|h[Citrine]|h|r",
											["count"] = 5,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24591093,
											["slot_id"] = 27,
										}, -- [27]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 28,
										}, -- [28]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 29,
										}, -- [29]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 30,
										}, -- [30]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 31,
										}, -- [31]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 32,
										}, -- [32]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 33,
										}, -- [33]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 34,
										}, -- [34]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 35,
										}, -- [35]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 36,
										}, -- [36]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 37,
										}, -- [37]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 38,
										}, -- [38]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 39,
										}, -- [39]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 40,
										}, -- [40]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 41,
										}, -- [41]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 42,
										}, -- [42]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 43,
										}, -- [43]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 44,
										}, -- [44]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 45,
										}, -- [45]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 46,
										}, -- [46]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 47,
										}, -- [47]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 48,
										}, -- [48]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 49,
										}, -- [49]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 50,
										}, -- [50]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 51,
										}, -- [51]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 52,
										}, -- [52]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 53,
										}, -- [53]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 54,
										}, -- [54]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 55,
										}, -- [55]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 56,
										}, -- [56]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 57,
										}, -- [57]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 58,
										}, -- [58]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 59,
										}, -- [59]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 60,
										}, -- [60]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 61,
										}, -- [61]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 62,
										}, -- [62]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 63,
										}, -- [63]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 64,
										}, -- [64]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 65,
										}, -- [65]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 66,
										}, -- [66]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 67,
										}, -- [67]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 68,
										}, -- [68]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 69,
										}, -- [69]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 70,
										}, -- [70]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 71,
										}, -- [71]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 72,
										}, -- [72]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 73,
										}, -- [73]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 74,
										}, -- [74]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 75,
										}, -- [75]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 76,
										}, -- [76]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 77,
										}, -- [77]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 78,
										}, -- [78]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 79,
										}, -- [79]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 80,
										}, -- [80]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 81,
										}, -- [81]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 82,
										}, -- [82]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 83,
										}, -- [83]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 84,
										}, -- [84]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 85,
										}, -- [85]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 86,
										}, -- [86]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 87,
										}, -- [87]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 88,
										}, -- [88]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 89,
										}, -- [89]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 90,
										}, -- [90]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 91,
										}, -- [91]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 92,
										}, -- [92]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 93,
										}, -- [93]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 94,
										}, -- [94]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 95,
										}, -- [95]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 96,
										}, -- [96]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 97,
										}, -- [97]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 98,
										}, -- [98]
									},
									["bag_id"] = 9,
									["loc_id"] = 3,
									["count"] = 98,
									["status"] = -3,
									["empty"] = 71,
									["texture"] = "Interface\\Icons\\INV_Box_02",
								},
							},
							["slot_count"] = 98,
						},
						[5] = {
							["bag"] = {
								{
									["type"] = 15,
									["count"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 5,
											["slot_id"] = 1,
											["bag_id"] = 1,
										}, -- [1]
									},
									["status"] = -3,
									["empty"] = 1,
									["bag_id"] = 1,
									["loc_id"] = 5,
								}, -- [1]
								{
									["loc_id"] = 5,
									["status"] = -3,
									["bag_id"] = 2,
									["type"] = 15,
								}, -- [2]
							},
							["slot_count"] = 1,
						},
						[6] = {
							["bag"] = {
								{
									["type"] = 14,
									["count"] = 18,
									["slot"] = {
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:132926::::::::102:252:512:11:1:1792:101:::|h[Nar'thalas Helmet]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24594726,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 2,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138160::::::::102:252::14::::|h[Infernal Cord]|h|r",
											["age"] = 24592721,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:138157::::::::102:252:512:9:2:3387:3389:100:::|h[Felforged Pauldrons]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24592717,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:138188::::::::102:252::14::::|h[Demon Commander's Drape]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24594726,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 5,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138152::::::::102:252:512:9:2:3387:3389:100:::|h[Felforged Chestplate]|h|r",
											["age"] = 24592721,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 6,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 7,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 8,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138159::::::::102:252:512:9:2:3387:3389:100:::|h[Felforged Vambraces]|h|r",
											["age"] = 24592721,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 9,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138153::::::::102:252:512:9:1:3387:100:::|h[Felforged Gauntlets]|h|r",
											["age"] = 24592721,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:140622::::::::102:252::11::::|h[Hardshell Greatbelt]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24594726,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 11,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138156::::::::102:252:512:9:2:3387:3388:100:::|h[Felforged Legplates]|h|r",
											["age"] = 24592721,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 12,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138158::::::::102:252:512:9:2:3387:3389:100:::|h[Felforged Warboots]|h|r",
											["age"] = 24592721,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 13,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:132911::::::::102:252:512:11:1:1792:101:::|h[Seal of House Farondis]|h|r",
											["age"] = 24594726,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:139173::::::::102:252::14::::|h[Nether Twisted Band]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24594726,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:137369::::::::102:252:512:17:1:1795:102:::|h[Giant Ornamental Pearl]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24594726,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 16,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138161::::::::102:252::14::::|h[Mo'arg Clan Token]|h|r",
											["age"] = 24592717,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [16]
										{
											["q"] = 6,
											["h"] = "|cffe6cc80|Hitem:128403:3368:133010:133059:::::102:252:256:9::112:3:768:1525:1809:3:1793:1545:1809:|h[Apocalypse]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24594726,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 18,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [18]
									},
									["status"] = -3,
									["empty"] = 3,
									["bag_id"] = 1,
									["loc_id"] = 6,
								}, -- [1]
							},
							["slot_count"] = 18,
						},
						[9] = {
							["bag"] = {
								{
									["type"] = 19,
									["count"] = 3,
									["slot"] = {
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 1,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:1226|h[Nethershard]|h|r",
											["bag_id"] = 1,
											["age"] = 24591093,
											["count"] = 1163,
										}, -- [1]
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 2,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:1220|h[Order Resources]|h|r",
											["bag_id"] = 1,
											["age"] = 24592721,
											["count"] = 1796,
										}, -- [2]
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 3,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:515|h[Darkmoon Prize Ticket]|h|r",
											["bag_id"] = 1,
											["age"] = 24591273,
											["count"] = 78,
										}, -- [3]
									},
									["status"] = -3,
									["bag_id"] = 1,
									["loc_id"] = 9,
								}, -- [1]
								{
									["type"] = 19,
									["status"] = -6,
									["bag_id"] = 2,
									["loc_id"] = 9,
								}, -- [2]
							},
							["slot_count"] = 3,
						},
						[10] = {
							["bag"] = {
								{
									["bag_id"] = 1,
									["loc_id"] = 10,
								}, -- [1]
							},
						},
					},
				},
				["Taunkah - Doomhammer"] = {
					["info"] = {
						["faction_local"] = "Alliance",
						["isplayer"] = true,
						["guid"] = "Player-1190-07578C7A",
						["money"] = 23105531,
						["gender"] = 2,
						["player_id"] = "Taunkah - Doomhammer",
						["class"] = "WARRIOR",
						["level"] = 102,
						["race"] = "Worgen",
						["name"] = "Taunkah",
						["faction"] = "Alliance",
						["race_local"] = "Worgen",
						["skills"] = {
							171, -- [1]
							755, -- [2]
							794, -- [3]
							356, -- [4]
							185, -- [5]
							129, -- [6]
						},
						["class_local"] = "Warrior",
						["realm"] = "Doomhammer",
					},
					["location"] = {
						{
							["bag"] = {
								{
									["q"] = 0,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:130013::::::::102:73:512:11:1:1792:101:::|h[Rooksguard Treads]|h|r",
											["slot_id"] = 2,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 1,
											["age"] = 24601257,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["count"] = 5,
											["h"] = "|cffffffff|Hitem:133575::::::::102:73::::::|h[Dried Mackerel Strips]|h|r",
											["age"] = 24601214,
											["bag_id"] = 1,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["count"] = 4,
											["h"] = "|cffffffff|Hitem:124437::::::::102:73::::::|h[Shal'dorei Silk]|h|r",
											["age"] = 24601214,
											["bag_id"] = 1,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:138160::::::::102:73::14::::|h[Infernal Cord]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 1,
											["age"] = 24601257,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["h"] = "|cffffffff|Hitem:124120::::::::102:73::::::|h[Leyblood]|h|r",
											["age"] = 24601214,
											["bag_id"] = 1,
											["count"] = 3,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [16]
									},
									["bag_id"] = 1,
									["loc_id"] = 1,
									["count"] = 16,
									["status"] = -3,
									["empty"] = 11,
									["texture"] = "Interface\\Icons\\INV_Misc_Bag_07_Green",
								}, -- [1]
								{
									["q"] = 3,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:138152::::::::102:73:512:9:2:3387:3389:100:::|h[Felforged Chestplate]|h|r",
											["slot_id"] = 6,
											["sb"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 2,
											["age"] = 24601257,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 18,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 19,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 20,
										}, -- [20]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 21,
										}, -- [21]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 22,
										}, -- [22]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 23,
										}, -- [23]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 24,
										}, -- [24]
									},
									["bag_id"] = 2,
									["loc_id"] = 1,
									["count"] = 24,
									["status"] = -3,
									["empty"] = 23,
									["h"] = "|cff0070dd|Hitem:69748:::::::1041492672:102:73::::::|h[Tattered Hexcloth Bag]|h|r",
									["texture"] = 133645,
								}, -- [2]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 18,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 19,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 20,
										}, -- [20]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 21,
										}, -- [21]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 3,
											["slot_id"] = 22,
										}, -- [22]
									},
									["bag_id"] = 3,
									["loc_id"] = 1,
									["count"] = 22,
									["status"] = -3,
									["empty"] = 22,
									["h"] = "|cff1eff00|Hitem:54443:::::::1309269888:102:73::::::|h[Embersilk Bag]|h|r",
									["texture"] = 348522,
								}, -- [3]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 4,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:141291::::::::102:73:512::1:1812:100:::|h[Shala'nir Sproutling]|h|r",
											["count"] = 1,
											["loc_id"] = 1,
											["bag_id"] = 4,
											["age"] = 24594723,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cffffffff|Hitem:71634:::::::1426873856:102:73::::::|h[Darkmoon Adventurer's Guide]|h|r",
											["age"] = 24601214,
											["bag_id"] = 4,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:141446::::::::102:73::::::|h[Tome of the Tranquil Mind]|h|r",
											["count"] = 5,
											["loc_id"] = 1,
											["bag_id"] = 4,
											["age"] = 24594723,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cffffffff|Hitem:140192::::::::102:73::11::::|h[Dalaran Hearthstone]|h|r",
											["age"] = 24601214,
											["bag_id"] = 4,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 17,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 18,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 19,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 20,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [20]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 21,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [21]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 22,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [22]
									},
									["bag_id"] = 4,
									["loc_id"] = 1,
									["count"] = 22,
									["status"] = -3,
									["empty"] = 18,
									["h"] = "|cff1eff00|Hitem:54443:::::::874174272:102:73::::::|h[Embersilk Bag]|h|r",
									["texture"] = 348522,
								}, -- [4]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 1,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cffffffff|Hitem:6948::::::::102:73::::::|h[Hearthstone]|h|r",
											["age"] = 24601214,
											["bag_id"] = 5,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cffffffff|Hitem:110560::::::::102:73::11::::|h[Garrison Hearthstone]|h|r",
											["age"] = 24601214,
											["bag_id"] = 5,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 4,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cffa335ee|Hitem:64399::::::::102:73::::::|h[Battle Standard of Coordination]|h|r",
											["age"] = 24601214,
											["bag_id"] = 5,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 2,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["h"] = "|cff1eff00|Hitem:42421:::::::245434630:102:73::::::|h[Shadow Jade Focusing Lens]|h|r",
											["age"] = 24594723,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 2,
											["loc_id"] = 1,
											["slot_id"] = 5,
											["sb"] = 1,
											["h"] = "|cff1eff00|Hitem:129096::::::::102:73::::::|h[Battle-Mender's Dressing]|h|r",
											["age"] = 24601257,
											["bag_id"] = 5,
											["count"] = 3,
										}, -- [5]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["h"] = "|cffffffff|Hitem:128843::::::::102:73::::::|h[Azsunian Grapes]|h|r",
											["age"] = 24594723,
											["bag_id"] = 5,
											["count"] = 20,
										}, -- [6]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["h"] = "|cffffffff|Hitem:58256:::::::-1958341504:102:73::::::|h[Sparkling Oasis Water]|h|r",
											["age"] = 24594723,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:75525:::::::1637279360:102:73::::::|h[Alchemist's Flask]|h|r",
											["age"] = 24601257,
											["bag_id"] = 5,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["h"] = "|cffffffff|Hitem:3823:::::::551168192:102:73::::::|h[Lesser Invisibility Potion]|h|r",
											["age"] = 24594723,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:141603::::::::102:73::9:3:3447:1814:1820:::|h[Fel Lord's Warmace]|h|r",
											["age"] = 24601257,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:141603::::::::102:73::9:3:3447:1815:1820:::|h[Fel Lord's Warmace]|h|r",
											["age"] = 24601257,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 2,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["h"] = "|cff1eff00|Hitem:121188::::::::102:73:512::2:1812:1682:100:::|h[Smolderhide Shoulders of the Quickblade]|h|r",
											["age"] = 24594723,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 2,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["h"] = "|cff1eff00|Hitem:121185::::::::102:73:512::2:1812:1685:100:::|h[Smolderhide Gloves of the Peerless]|h|r",
											["age"] = 24594723,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 2,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["h"] = "|cff1eff00|Hitem:121170::::::::102:73:512::2:1812:1701:100:::|h[Kal'delar Legplates of the Feverflare]|h|r",
											["age"] = 24594723,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:63206::::::::102:73::::::|h[Wrap of Unity]|h|r",
											["age"] = 24601257,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 4,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cffa335ee|Hitem:68775::52206:::::935190528:102:73::::::|h[Volatile Alchemist Stone]|h|r",
											["age"] = 24601214,
											["bag_id"] = 5,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 2,
											["loc_id"] = 1,
											["slot_id"] = 17,
											["sb"] = 1,
											["h"] = "|cff1eff00|Hitem:9149:::::::293853536:102:73::::::|h[Philosopher's Stone]|h|r",
											["age"] = 24601257,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 18,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 19,
										}, -- [19]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 20,
											["h"] = "|cffffffff|Hitem:20815::::::::102:73::::::|h[Jeweler's Kit]|h|r",
											["age"] = 24594723,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [20]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 21,
										}, -- [21]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 22,
										}, -- [22]
									},
									["bag_id"] = 5,
									["loc_id"] = 1,
									["count"] = 22,
									["status"] = -3,
									["empty"] = 4,
									["h"] = "|cff1eff00|Hitem:54443:::::::600020672:102:73::::::|h[Embersilk Bag]|h|r",
									["texture"] = 348522,
								}, -- [5]
							},
							["slot_count"] = 106,
						}, -- [1]
						[3] = {
							["bag"] = {
								{
									["q"] = 0,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2698:::::::-2122175616:101:73::::::|h[Recipe: Cooked Crab Claw]|h|r",
											["slot_id"] = 1,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [1]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:728:::::::-1782528768:101:73::::::|h[Recipe: Westfall Stew]|h|r",
											["slot_id"] = 2,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [2]
										{
											["q"] = 3,
											["bag_id"] = 1,
											["ab"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["age"] = 24594740,
											["h"] = "|cff0070dd|Hitem:69209::::::::101:73::::::|h[Illustrious Guild Tabard]|h|r",
											["slot_id"] = 3,
											["loc_id"] = 3,
										}, -- [3]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:3342:::::::47288112:101:73::::::|h[Captain Sanders' Shirt]|h|r",
											["slot_id"] = 4,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [4]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:58255:::::::68131152:101:73::::::|h[Lord Walden's Top Hat]|h|r",
											["slot_id"] = 5,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [5]
										{
											["q"] = 0,
											["h"] = "|cff9d9d9d|Hitem:56007:::::::1937066240:101:73::::::|h[Broken Amulet]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["age"] = 24594740,
											["bag_id"] = 1,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:28558:::::::-1854345344:101:73::::::|h[Spirit Shard]|h|r",
											["slot_id"] = 7,
											["sb"] = 1,
											["count"] = 15,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [7]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:33081:::::::442259008:101:73::::::|h[Voodoo Skull]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["age"] = 24594740,
											["bag_id"] = 1,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:45574::::::::101:73::::::|h[Stormwind Tabard]|h|r",
											["slot_id"] = 9,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [9]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:45577::::::::101:73::::::|h[Ironforge Tabard]|h|r",
											["slot_id"] = 10,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [10]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:63205:::::::25883016:101:73::::::|h[Safety Goggles]|h|r",
											["slot_id"] = 11,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [11]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:18365:::::::2135585152:101:73::::::|h[A Thoroughly Read Copy of \"Nat Pagle's Guide to Extreme Anglin'.\"]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["age"] = 24594740,
											["bag_id"] = 1,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:8623:::::::738149472:101:73::::::|h[OOX-17/TN Distress Beacon]|h|r",
											["slot_id"] = 13,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [13]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:65908::::::::101:73::::::|h[Tabard of the Wildhammer Clan]|h|r",
											["slot_id"] = 14,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [14]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:45579::::::::101:73::::::|h[Darnassus Tabard]|h|r",
											["slot_id"] = 15,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [15]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:64882::::::::101:73::::::|h[Gilneas Tabard]|h|r",
											["slot_id"] = 16,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [16]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:65907::::::::101:73::::::|h[Tabard of Therazane]|h|r",
											["slot_id"] = 17,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [17]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:4637::::::::101:73::::::|h[Steel Lockbox]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["age"] = 24594740,
											["bag_id"] = 1,
											["slot_id"] = 18,
										}, -- [18]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:68729:::::::1315107648:101:73::::::|h[Elementium Lockbox]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["age"] = 24594740,
											["bag_id"] = 1,
											["slot_id"] = 19,
										}, -- [19]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:68729:::::::1581623936:101:73::::::|h[Elementium Lockbox]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["age"] = 24594740,
											["bag_id"] = 1,
											["slot_id"] = 20,
										}, -- [20]
										{
											["q"] = 4,
											["bag_id"] = 1,
											["ab"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["age"] = 24594740,
											["h"] = "|cffa335ee|Hitem:69210::::::::101:73::::::|h[Renowned Guild Tabard]|h|r",
											["slot_id"] = 21,
											["loc_id"] = 3,
										}, -- [21]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:65906::::::::101:73::::::|h[Tabard of the Guardians of Hyjal]|h|r",
											["slot_id"] = 22,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [22]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:65904::::::::101:73::::::|h[Tabard of Ramkahen]|h|r",
											["slot_id"] = 23,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [23]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:89196:::::::1713067136:101:73::::::|h[Theramore Tabard]|h|r",
											["slot_id"] = 24,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [24]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:45580::::::::101:73::::::|h[Exodar Tabard]|h|r",
											["slot_id"] = 25,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [25]
										{
											["q"] = 4,
											["bag_id"] = 1,
											["ab"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["age"] = 24594740,
											["h"] = "|cffa335ee|Hitem:140999::::::::101:73::::::|h[Replica Lion's Fang]|h|r",
											["slot_id"] = 26,
											["loc_id"] = 3,
										}, -- [26]
										{
											["q"] = 4,
											["bag_id"] = 1,
											["ab"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["age"] = 24594740,
											["h"] = "|cffa335ee|Hitem:141000::::::::101:73::::::|h[Replica Lion's Heart]|h|r",
											["slot_id"] = 27,
											["loc_id"] = 3,
										}, -- [27]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:71083:::::::-1925203968:101:73::::::|h[Darkmoon Game Token]|h|r",
											["slot_id"] = 28,
											["sb"] = 1,
											["count"] = 11,
											["age"] = 24594740,
											["bag_id"] = 1,
											["loc_id"] = 3,
										}, -- [28]
									},
									["bag_id"] = 1,
									["loc_id"] = 3,
									["count"] = 28,
									["status"] = -3,
									["texture"] = "Interface\\Icons\\INV_Box_02",
								}, -- [1]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:17202::::::::101:73::::::|h[Snowball]|h|r",
											["count"] = 20,
											["loc_id"] = 3,
											["age"] = 24594740,
											["bag_id"] = 2,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:123918::::::::101:73::::::|h[Leystone Ore]|h|r",
											["count"] = 4,
											["loc_id"] = 3,
											["age"] = 24594740,
											["bag_id"] = 2,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124117::::::::101:73::::::|h[Lean Shank]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["age"] = 24594740,
											["bag_id"] = 2,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 4,
											["h"] = "|cffffffff|Hitem:124437::::::::101:73::::::|h[Shal'dorei Silk]|h|r",
											["bag_id"] = 2,
											["age"] = 24594740,
											["count"] = 13,
										}, -- [4]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 5,
											["h"] = "|cffffffff|Hitem:124119::::::::101:73::::::|h[Big Gamy Ribs]|h|r",
											["bag_id"] = 2,
											["age"] = 24594740,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 6,
											["h"] = "|cffffffff|Hitem:128304::::::::101:73::::::|h[Yseralline Seed]|h|r",
											["bag_id"] = 2,
											["age"] = 24594740,
											["count"] = 40,
										}, -- [6]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124101::::::::101:73::::::|h[Aethril]|h|r",
											["count"] = 38,
											["loc_id"] = 3,
											["age"] = 24594740,
											["bag_id"] = 2,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 1,
											["loc_id"] = 3,
											["slot_id"] = 8,
											["h"] = "|cffffffff|Hitem:124438::::::::101:73::::::|h[Unbroken Claw]|h|r",
											["bag_id"] = 2,
											["age"] = 24594740,
											["count"] = 2,
										}, -- [8]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124439::::::::101:73::::::|h[Unbroken Tooth]|h|r",
											["count"] = 4,
											["loc_id"] = 3,
											["age"] = 24594740,
											["bag_id"] = 2,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:3371::::::::101:73::::::|h[Crystal Vial]|h|r",
											["count"] = 50,
											["loc_id"] = 3,
											["age"] = 24594740,
											["bag_id"] = 2,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 11,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 12,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 13,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 14,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 15,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 16,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [16]
									},
									["bag_id"] = 2,
									["loc_id"] = 3,
									["count"] = 16,
									["status"] = -3,
									["empty"] = 6,
									["h"] = "|cff1eff00|Hitem:21841:::::::848102464:101:73::::::|h[Netherweave Bag]|h|r",
									["texture"] = 133656,
								}, -- [2]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 1,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 2,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 3,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 4,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 5,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 6,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 7,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 8,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 9,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 10,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 11,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 12,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 13,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 14,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 15,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 16,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [16]
									},
									["bag_id"] = 3,
									["loc_id"] = 3,
									["count"] = 16,
									["status"] = -3,
									["empty"] = 16,
									["h"] = "|cff1eff00|Hitem:21841:::::::694429760:101:73::::::|h[Netherweave Bag]|h|r",
									["texture"] = 133656,
								}, -- [3]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 1,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 2,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 3,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 4,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 5,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 6,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 7,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 8,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 9,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 10,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 11,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 12,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 13,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 14,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 15,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 16,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [16]
									},
									["bag_id"] = 4,
									["loc_id"] = 3,
									["count"] = 16,
									["status"] = -3,
									["empty"] = 16,
									["h"] = "|cff1eff00|Hitem:21841:::::::1627722112:101:73::::::|h[Netherweave Bag]|h|r",
									["texture"] = 133656,
								}, -- [4]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 1,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 2,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 3,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 4,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 5,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 6,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 7,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 8,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 9,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 10,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 11,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 12,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 13,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 14,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 15,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 16,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [16]
									},
									["bag_id"] = 5,
									["loc_id"] = 3,
									["count"] = 16,
									["status"] = -3,
									["empty"] = 16,
									["h"] = "|cff1eff00|Hitem:21841:::::::1710522752:101:73::::::|h[Netherweave Bag]|h|r",
									["texture"] = 133656,
								}, -- [5]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 1,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 2,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 3,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 4,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 5,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 6,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 7,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 8,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 9,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 10,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 11,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 12,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 13,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 14,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 15,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 16,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [16]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:17202::::::::101:73::::::|h[Snowball]|h|r",
											["count"] = 20,
											["loc_id"] = 3,
											["age"] = 24594740,
											["bag_id"] = 6,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:17202::::::::101:73::::::|h[Snowball]|h|r",
											["count"] = 20,
											["loc_id"] = 3,
											["age"] = 24594740,
											["bag_id"] = 6,
											["slot_id"] = 18,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 19,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 20,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [20]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 21,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [21]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 22,
											["bag_id"] = 6,
											["count"] = 1,
										}, -- [22]
									},
									["bag_id"] = 6,
									["loc_id"] = 3,
									["count"] = 22,
									["status"] = -3,
									["empty"] = 20,
									["h"] = "|cff1eff00|Hitem:54443:::::::59035912:101:73::::::|h[Embersilk Bag]|h|r",
									["texture"] = 348522,
								}, -- [6]
								{
									["q"] = 1,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 1,
											["bag_id"] = 7,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 2,
											["bag_id"] = 7,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 3,
											["bag_id"] = 7,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 4,
											["bag_id"] = 7,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 5,
											["bag_id"] = 7,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 6,
											["bag_id"] = 7,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 7,
											["bag_id"] = 7,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 8,
											["bag_id"] = 7,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 9,
											["bag_id"] = 7,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 10,
											["bag_id"] = 7,
											["count"] = 1,
										}, -- [10]
									},
									["bag_id"] = 7,
									["loc_id"] = 3,
									["count"] = 10,
									["status"] = -3,
									["empty"] = 10,
									["h"] = "|cffffffff|Hitem:4497::::::::101:73::::::|h[Heavy Brown Bag]|h|r",
									["texture"] = 133639,
								}, -- [7]
								{
									["q"] = 1,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 1,
											["bag_id"] = 8,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 2,
											["bag_id"] = 8,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 3,
											["bag_id"] = 8,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 4,
											["bag_id"] = 8,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 5,
											["bag_id"] = 8,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["slot_id"] = 6,
											["bag_id"] = 8,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 3,
											["loc_id"] = 3,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:55073:::::::775484032:101:73::::::|h[Bloodied Pyrium Belt]|h|r",
											["bag_id"] = 8,
											["age"] = 24594740,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 3,
											["loc_id"] = 3,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:55075:::::::969069760:101:73::::::|h[Bloodied Pyrium Shoulders]|h|r",
											["bag_id"] = 8,
											["age"] = 24594740,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 4,
											["loc_id"] = 3,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cffa335ee|Hitem:58483::52242:::::1303728000:101:73::::::|h[Lifebound Alchemist Stone]|h|r",
											["bag_id"] = 8,
											["age"] = 24594740,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 4,
											["loc_id"] = 3,
											["count"] = 1,
											["sb"] = 1,
											["h"] = "|cffa335ee|Hitem:58180::::::::101:73::::::|h[License to Slay]|h|r",
											["bag_id"] = 8,
											["age"] = 24594740,
											["slot_id"] = 10,
										}, -- [10]
									},
									["bag_id"] = 8,
									["loc_id"] = 3,
									["count"] = 10,
									["status"] = -3,
									["empty"] = 6,
									["h"] = "|cffffffff|Hitem:4497::::::::101:73::::::|h[Heavy Brown Bag]|h|r",
									["texture"] = 133639,
								}, -- [8]
								{
									["q"] = 0,
									["type"] = 27,
									["slot"] = {
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:52327:::::::1773746176:102:73::::::|h[Volatile Earth]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24594723,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:52325:::::::1812075776:102:73::::::|h[Volatile Fire]|h|r",
											["count"] = 77,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24594723,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:52326:::::::-1731718272:102:73::::::|h[Volatile Water]|h|r",
											["count"] = 3,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24594723,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:51950:::::::1224497152:102:73::::::|h[Pyrium Bar]|h|r",
											["count"] = 16,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24594723,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:52186:::::::906348544:102:73::::::|h[Elementium Bar]|h|r",
											["count"] = 13,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24594723,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:53010:::::::1938179840:102:73::::::|h[Embersilk Cloth]|h|r",
											["count"] = 20,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24594723,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:52196:::::::-1834025088:102:73::::::|h[Chimera's Eye]|h|r",
											["count"] = 1,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24594723,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:52195:::::::1206167808:102:73::::::|h[Amberjewel]|h|r",
											["count"] = 56,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24594723,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:52194:::::::1583662848:102:73::::::|h[Demonseye]|h|r",
											["count"] = 27,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24594723,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:52193:::::::495287072:102:73::::::|h[Ember Topaz]|h|r",
											["count"] = 16,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24594723,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:52191:::::::738801776:102:73::::::|h[Ocean Sapphire]|h|r",
											["count"] = 18,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24594723,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124121::::::::102:73::::::|h[Wildfowl Egg]|h|r",
											["count"] = 2,
											["loc_id"] = 3,
											["bag_id"] = 9,
											["age"] = 24594723,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 18,
										}, -- [18]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 19,
										}, -- [19]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 20,
										}, -- [20]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 21,
										}, -- [21]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 22,
										}, -- [22]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 23,
										}, -- [23]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 24,
										}, -- [24]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 25,
										}, -- [25]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 26,
										}, -- [26]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 27,
										}, -- [27]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 28,
										}, -- [28]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 29,
										}, -- [29]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 30,
										}, -- [30]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 31,
										}, -- [31]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 32,
										}, -- [32]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 33,
										}, -- [33]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 34,
										}, -- [34]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 35,
										}, -- [35]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 36,
										}, -- [36]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 37,
										}, -- [37]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 38,
										}, -- [38]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 39,
										}, -- [39]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 40,
										}, -- [40]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 41,
										}, -- [41]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 42,
										}, -- [42]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 43,
										}, -- [43]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 44,
										}, -- [44]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 45,
										}, -- [45]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 46,
										}, -- [46]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 47,
										}, -- [47]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 48,
										}, -- [48]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 49,
										}, -- [49]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 50,
										}, -- [50]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 51,
										}, -- [51]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 52,
										}, -- [52]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 53,
										}, -- [53]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 54,
										}, -- [54]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 55,
										}, -- [55]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 56,
										}, -- [56]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 57,
										}, -- [57]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 58,
										}, -- [58]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 59,
										}, -- [59]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 60,
										}, -- [60]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 61,
										}, -- [61]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 62,
										}, -- [62]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 63,
										}, -- [63]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 64,
										}, -- [64]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 65,
										}, -- [65]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 66,
										}, -- [66]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 67,
										}, -- [67]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 68,
										}, -- [68]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 69,
										}, -- [69]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 70,
										}, -- [70]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 71,
										}, -- [71]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 72,
										}, -- [72]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 73,
										}, -- [73]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 74,
										}, -- [74]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 75,
										}, -- [75]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 76,
										}, -- [76]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 77,
										}, -- [77]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 78,
										}, -- [78]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 79,
										}, -- [79]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 80,
										}, -- [80]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 81,
										}, -- [81]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 82,
										}, -- [82]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 83,
										}, -- [83]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 84,
										}, -- [84]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 85,
										}, -- [85]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 86,
										}, -- [86]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 87,
										}, -- [87]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 88,
										}, -- [88]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 89,
										}, -- [89]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 90,
										}, -- [90]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 91,
										}, -- [91]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 92,
										}, -- [92]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 93,
										}, -- [93]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 94,
										}, -- [94]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 95,
										}, -- [95]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 96,
										}, -- [96]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 97,
										}, -- [97]
										{
											["q"] = 0,
											["loc_id"] = 3,
											["count"] = 1,
											["bag_id"] = 9,
											["slot_id"] = 98,
										}, -- [98]
									},
									["bag_id"] = 9,
									["loc_id"] = 3,
									["count"] = 98,
									["status"] = -3,
									["empty"] = 86,
									["texture"] = "Interface\\Icons\\INV_Box_02",
								}, -- [9]
							},
							["slot_count"] = 232,
						},
						[5] = {
							["bag"] = {
								{
									["type"] = 15,
									["count"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 5,
											["slot_id"] = 1,
											["att_id"] = 1,
											["bag_id"] = 1,
											["msg_id"] = 1,
										}, -- [1]
									},
									["status"] = -3,
									["empty"] = 1,
									["bag_id"] = 1,
									["loc_id"] = 5,
								}, -- [1]
								{
									["loc_id"] = 5,
									["status"] = -3,
									["bag_id"] = 2,
									["type"] = 15,
								}, -- [2]
							},
							["slot_count"] = 1,
						},
						[6] = {
							["bag"] = {
								{
									["type"] = 14,
									["count"] = 18,
									["slot"] = {
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 1,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138155::::::::102:73:512:9:1:3387:100:::|h[Felforged Helmet]|h|r",
											["age"] = 24601257,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:130122::::::::102:73:512::1:1794:101:::|h[Grelda's Ageless Pendant]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601257,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 3,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138157::::::::102:73:512:9:2:3387:3388:100:::|h[Felforged Pauldrons]|h|r",
											["age"] = 24601257,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:129983::::::::102:73:512:11:1:768:101:::|h[Farseeker Drape]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601257,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:130012::::::::102:73::11::::|h[Shaladrassil Chestguard]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601257,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:49567::::::::102:73::::::|h[Gilnean Adventurer's Shirt]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601257,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 7,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 8,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:138159::::::::102:73:512:9:1:3387:100:::|h[Felforged Vambraces]|h|r",
											["age"] = 24601257,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:138153::::::::102:73:512:9:1:3387:100:::|h[Felforged Gauntlets]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601257,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:138154::::::::102:73:512:9:1:3387:100:::|h[Felforged Waistplate]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601257,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:138156::::::::102:73:512:9:1:3387:100:::|h[Felforged Legplates]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601257,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:138158::::::::102:73:512:9:1:3387:100:::|h[Felforged Warboots]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601257,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:130127::::::::102:73:512:11:1:1794:100:::|h[Syndrelle's Favorite Ring]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601257,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:130021::::::::102:73:512:11:2:767:1733:100:::|h[Swiftfeather Band]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601257,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:121649::::::::102:73:512:11:1:664:101:::|h[Vibrant Temple Masonry]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["bag_id"] = 1,
											["age"] = 24601257,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:138161::::::::102:73::14::::|h[Mo'arg Clan Token]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 1,
											["age"] = 24601226,
											["loc_id"] = 6,
										}, -- [16]
										{
											["q"] = 6,
											["loc_id"] = 6,
											["slot_id"] = 17,
											["sb"] = 1,
											["h"] = "|cffe6cc80|Hitem:128288::::::::102:73:256:::66:::|h[Scaleshard]|h|r",
											["age"] = 24601257,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [17]
										{
											["q"] = 6,
											["loc_id"] = 6,
											["slot_id"] = 18,
											["sb"] = 1,
											["h"] = "|cffe6cc80|Hitem:128289::132340:132306:::::102:73:256:9::66:3:1793:1535:1809:3:664:1521:1809:|h[Scale of the Earth-Warder]|h|r",
											["age"] = 24601257,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [18]
									},
									["status"] = -3,
									["empty"] = 1,
									["bag_id"] = 1,
									["loc_id"] = 6,
								}, -- [1]
							},
							["slot_count"] = 18,
						},
						[9] = {
							["bag"] = {
								{
									["type"] = 19,
									["count"] = 5,
									["slot"] = {
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 1,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:1226|h[Nethershard]|h|r",
											["bag_id"] = 1,
											["age"] = 24594723,
											["count"] = 234,
										}, -- [1]
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 2,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:1220|h[Order Resources]|h|r",
											["bag_id"] = 1,
											["age"] = 24601214,
											["count"] = 2166,
										}, -- [2]
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 3,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:515|h[Darkmoon Prize Ticket]|h|r",
											["bag_id"] = 1,
											["age"] = 24594723,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 4,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:824|h[Garrison Resources]|h|r",
											["bag_id"] = 1,
											["age"] = 24594723,
											["count"] = 11,
										}, -- [4]
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 5,
											["sb"] = 1,
											["h"] = "|cffffffff|Hcurrency:416|h[Mark of the World Tree]|h|r",
											["bag_id"] = 1,
											["age"] = 24594723,
											["count"] = 67,
										}, -- [5]
									},
									["status"] = -3,
									["bag_id"] = 1,
									["loc_id"] = 9,
								}, -- [1]
								{
									["loc_id"] = 9,
									["status"] = -6,
									["bag_id"] = 2,
									["type"] = 19,
								}, -- [2]
							},
							["slot_count"] = 5,
						},
						[10] = {
							["bag"] = {
								{
									["bag_id"] = 1,
									["loc_id"] = 10,
								}, -- [1]
							},
						},
					},
				},
				["Nilrum - Doomhammer"] = {
					["info"] = {
						["faction_local"] = "Alliance",
						["isplayer"] = true,
						["guid"] = "Player-1190-07513746",
						["money"] = 476681618,
						["class"] = "MAGE",
						["player_id"] = "Nilrum - Doomhammer",
						["gender"] = 2,
						["skills"] = {
							171, -- [1]
							755, -- [2]
							nil, -- [3]
							356, -- [4]
							185, -- [5]
							129, -- [6]
						},
						["race"] = "Human",
						["name"] = "Nilrum",
						["faction"] = "Alliance",
						["race_local"] = "Human",
						["level"] = 5,
						["class_local"] = "Mage",
						["realm"] = "Doomhammer",
					},
					["location"] = {
						{
							["slot_count"] = 88,
							["bag"] = {
								{
									["q"] = 0,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["slot_id"] = 16,
										}, -- [16]
									},
									["bag_id"] = 1,
									["loc_id"] = 1,
									["count"] = 16,
									["status"] = -3,
									["empty"] = 16,
									["texture"] = "Interface\\Icons\\INV_Misc_Bag_07_Green",
								}, -- [1]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 2,
											["slot_id"] = 18,
										}, -- [18]
									},
									["bag_id"] = 2,
									["loc_id"] = 1,
									["count"] = 18,
									["status"] = -3,
									["empty"] = 18,
									["h"] = "|cff1eff00|Hitem:21843::::::::5:64::::::|h[Imbued Netherweave Bag]|h|r",
									["texture"] = 133657,
								}, -- [2]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 2,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 5,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 17,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 18,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [18]
									},
									["bag_id"] = 3,
									["loc_id"] = 1,
									["count"] = 18,
									["status"] = -3,
									["empty"] = 18,
									["h"] = "|cff1eff00|Hitem:21843::::::::5:64::::::|h[Imbued Netherweave Bag]|h|r",
									["texture"] = 133657,
								}, -- [3]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 2,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 5,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 17,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 18,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [18]
									},
									["bag_id"] = 4,
									["loc_id"] = 1,
									["count"] = 18,
									["status"] = -3,
									["empty"] = 18,
									["h"] = "|cff1eff00|Hitem:21843::::::::5:64::::::|h[Imbued Netherweave Bag]|h|r",
									["texture"] = 133657,
								}, -- [4]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 2,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 3,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 6,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 7,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 13,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 14,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 15,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 16,
										}, -- [16]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["slot_id"] = 18,
										}, -- [18]
									},
									["bag_id"] = 5,
									["loc_id"] = 1,
									["count"] = 18,
									["status"] = -3,
									["empty"] = 18,
									["h"] = "|cff1eff00|Hitem:21843::::::::5:64::::::|h[Imbued Netherweave Bag]|h|r",
									["texture"] = 133657,
								}, -- [5]
							},
						}, -- [1]
						[3] = {
							["bag"] = {
								[9] = {
									["q"] = 0,
									["type"] = 27,
									["bag_id"] = 9,
									["loc_id"] = 3,
									["status"] = -5,
									["texture"] = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Bag",
								},
							},
						},
						[5] = {
							["slot_count"] = 1,
							["bag"] = {
								{
									["type"] = 15,
									["count"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 5,
											["slot_id"] = 1,
											["money"] = 384322,
											["bag_id"] = 1,
											["msg_id"] = 1,
										}, -- [1]
									},
									["status"] = -3,
									["empty"] = 1,
									["bag_id"] = 1,
									["loc_id"] = 5,
								}, -- [1]
								{
									["type"] = 15,
									["status"] = -3,
									["bag_id"] = 2,
									["loc_id"] = 5,
								}, -- [2]
							},
						},
						[6] = {
							["slot_count"] = 18,
							["bag"] = {
								{
									["type"] = 14,
									["count"] = 18,
									["slot"] = {
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 1,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 2,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 3,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:11475:::::::1541823872:5:64::::::|h[Wine-Stained Cloak]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["age"] = 24597038,
											["bag_id"] = 1,
											["slot_id"] = 4,
										}, -- [4]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:57386:::::::949202496:5:64::::::|h[Northshire Abbot's Robe]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["age"] = 24597038,
											["bag_id"] = 1,
											["slot_id"] = 5,
										}, -- [5]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 6,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 7,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:57395:::::::1622911744:5:64::::::|h[Lion's Pride Bracer]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["age"] = 24597038,
											["bag_id"] = 1,
											["slot_id"] = 8,
										}, -- [8]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:11192:::::::634776064:5:64::::::|h[Outfitter Gloves]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["age"] = 24597038,
											["bag_id"] = 1,
											["slot_id"] = 9,
										}, -- [9]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:57253:::::::1431862272:5:64::::::|h[Northshire Abbot's Cinch]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["age"] = 24597038,
											["bag_id"] = 1,
											["slot_id"] = 10,
										}, -- [10]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:57389:::::::1872669824:5:64::::::|h[Innkeeper's Longstockings]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["age"] = 24597038,
											["bag_id"] = 1,
											["slot_id"] = 11,
										}, -- [11]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:57256:::::::1047396224:5:64::::::|h[Northshire Abbot's Shoes]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["age"] = 24597038,
											["bag_id"] = 1,
											["slot_id"] = 12,
										}, -- [12]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 13,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 14,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 15,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 16,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [16]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:1159:::::::1557379072:5:64::::::|h[Militia Quarterstaff]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["loc_id"] = 6,
											["age"] = 24597038,
											["bag_id"] = 1,
											["slot_id"] = 17,
										}, -- [17]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 18,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [18]
									},
									["status"] = -3,
									["empty"] = 10,
									["bag_id"] = 1,
									["loc_id"] = 6,
								}, -- [1]
							},
						},
						[9] = {
							["bag"] = {
								{
									["type"] = 19,
									["status"] = -3,
									["bag_id"] = 1,
									["loc_id"] = 9,
								}, -- [1]
							},
						},
						[10] = {
							["slot_count"] = 22,
							["bag"] = {
								{
									["type"] = 20,
									["count"] = 22,
									["slot"] = {
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:22281::::::::5:64::14::::|h[Blue Dinner Suit]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595680,
											["slot_id"] = 1,
											["bag_id"] = 1,
											["expires"] = 24598560,
										}, -- [1]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:22281:::::::633517632:5:64::::::|h[Blue Dinner Suit]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595680,
											["slot_id"] = 2,
											["bag_id"] = 1,
											["expires"] = 24598560,
										}, -- [2]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:130172::::::::5:64::::::|h[Sangrite]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595680,
											["slot_id"] = 3,
											["bag_id"] = 1,
											["expires"] = 24598560,
										}, -- [3]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:130177::::::::5:64::::::|h[Queen's Opal]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595680,
											["slot_id"] = 4,
											["bag_id"] = 1,
											["expires"] = 24598560,
										}, -- [4]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:130177::::::::5:64::::::|h[Queen's Opal]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595680,
											["slot_id"] = 5,
											["bag_id"] = 1,
											["expires"] = 24598560,
										}, -- [5]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:130173::::::::5:64::::::|h[Deep Amber]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595680,
											["slot_id"] = 6,
											["bag_id"] = 1,
											["expires"] = 24598560,
										}, -- [6]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:130173::::::::5:64::::::|h[Deep Amber]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595680,
											["slot_id"] = 7,
											["bag_id"] = 1,
											["expires"] = 24598560,
										}, -- [7]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:36908::::::::5:64::::::|h[Frost Lotus]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595680,
											["slot_id"] = 8,
											["bag_id"] = 1,
											["expires"] = 24598560,
										}, -- [8]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:36908::::::::5:64::::::|h[Frost Lotus]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595680,
											["slot_id"] = 9,
											["bag_id"] = 1,
											["expires"] = 24598560,
										}, -- [9]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:36908::::::::5:64::::::|h[Frost Lotus]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595681,
											["slot_id"] = 10,
											["bag_id"] = 1,
											["expires"] = 24598561,
										}, -- [10]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:123919::::::::5:64::::::|h[Felslate]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595681,
											["slot_id"] = 11,
											["bag_id"] = 1,
											["expires"] = 24598561,
										}, -- [11]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:123919::::::::5:64::::::|h[Felslate]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595681,
											["slot_id"] = 12,
											["bag_id"] = 1,
											["expires"] = 24598561,
										}, -- [12]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:123919::::::::5:64::::::|h[Felslate]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595681,
											["slot_id"] = 13,
											["bag_id"] = 1,
											["expires"] = 24598561,
										}, -- [13]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:123919::::::::5:64::::::|h[Felslate]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595681,
											["slot_id"] = 14,
											["bag_id"] = 1,
											["expires"] = 24598561,
										}, -- [14]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:123919::::::::5:64::::::|h[Felslate]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595681,
											["slot_id"] = 15,
											["bag_id"] = 1,
											["expires"] = 24598561,
										}, -- [15]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:123919::::::::5:64::::::|h[Felslate]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595681,
											["slot_id"] = 16,
											["bag_id"] = 1,
											["expires"] = 24598561,
										}, -- [16]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:123919::::::::5:64::::::|h[Felslate]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595681,
											["slot_id"] = 17,
											["bag_id"] = 1,
											["expires"] = 24598561,
										}, -- [17]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:123919::::::::5:64::::::|h[Felslate]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595681,
											["slot_id"] = 18,
											["bag_id"] = 1,
											["expires"] = 24598561,
										}, -- [18]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:123919::::::::5:64::::::|h[Felslate]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595681,
											["slot_id"] = 19,
											["bag_id"] = 1,
											["expires"] = 24598561,
										}, -- [19]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:123919::::::::5:64::::::|h[Felslate]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595681,
											["slot_id"] = 20,
											["bag_id"] = 1,
											["expires"] = 24598561,
										}, -- [20]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:123919::::::::5:64::::::|h[Felslate]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595681,
											["slot_id"] = 21,
											["bag_id"] = 1,
											["expires"] = 24598561,
										}, -- [21]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:123919::::::::5:64::::::|h[Felslate]|h|r",
											["count"] = 1,
											["loc_id"] = 10,
											["age"] = 24595681,
											["slot_id"] = 22,
											["bag_id"] = 1,
											["expires"] = 24598561,
										}, -- [22]
									},
									["status"] = -3,
									["bag_id"] = 1,
									["loc_id"] = 10,
								}, -- [1]
							},
						},
					},
				},
				["+Requiem Infernus - Baelgun"] = {
					["info"] = {
						["money"] = 3224462781,
						["class"] = "GUILD",
						["player_id"] = "+Requiem Infernus - Baelgun",
						["realm"] = "Baelgun",
						["name"] = "Requiem Infernus",
						["faction"] = "Alliance",
						["class_local"] = "Guild",
						["level"] = 1,
						["guild_id"] = "+Requiem Infernus - Baelgun",
						["faction_local"] = "Alliance",
					},
				},
				["Marmit - Doomhammer"] = {
					["info"] = {
						["realm"] = "Doomhammer",
						["isplayer"] = true,
						["guid"] = "Player-1190-08F860E8",
						["money"] = 27461031,
						["gender"] = 2,
						["player_id"] = "Marmit - Doomhammer",
						["class_local"] = "Hunter",
						["skills"] = {
						},
						["race"] = "Gnome",
						["name"] = "Marmit",
						["faction"] = "Alliance",
						["race_local"] = "Gnome",
						["level"] = 100,
						["class"] = "HUNTER",
						["faction_local"] = "Alliance",
					},
					["location"] = {
						{
							["slot_count"] = 80,
							["bag"] = {
								{
									["q"] = 0,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 1,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 1,
											["bag_id"] = 1,
											["age"] = 24599587,
											["h"] = "|cffffffff|Hitem:140192::::::::100:253::11::::|h[Dalaran Hearthstone]|h|r",
										}, -- [1]
										{
											["q"] = 2,
											["h"] = "|cff1eff00|Hitem:141446::::::::100:253::::::|h[Tome of the Tranquil Mind]|h|r",
											["count"] = 5,
											["slot_id"] = 2,
											["age"] = 24599479,
											["bag_id"] = 1,
											["loc_id"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124117::::::::100:253::::::|h[Lean Shank]|h|r",
											["count"] = 3,
											["slot_id"] = 4,
											["age"] = 24599479,
											["bag_id"] = 1,
											["loc_id"] = 1,
										}, -- [4]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:124439::::::::100:253::::::|h[Unbroken Tooth]|h|r",
											["count"] = 1,
											["slot_id"] = 5,
											["age"] = 24599479,
											["bag_id"] = 1,
											["loc_id"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24599587,
											["h"] = "|cff0070dd|Hitem:141601::::::::100:253::9:3:3447:1814:1820:::|h[Hellfury Longbow]|h|r",
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [16]
									},
									["bag_id"] = 1,
									["loc_id"] = 1,
									["count"] = 16,
									["status"] = -3,
									["empty"] = 11,
									["texture"] = "Interface\\Icons\\INV_Misc_Bag_07_Green",
								}, -- [1]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 2,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 5,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 2,
											["count"] = 1,
										}, -- [16]
									},
									["bag_id"] = 2,
									["loc_id"] = 1,
									["count"] = 16,
									["status"] = -3,
									["empty"] = 16,
									["h"] = "|cff1eff00|Hitem:21841::::::::100:253::::::|h[Netherweave Bag]|h|r",
									["texture"] = 133656,
								}, -- [2]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 1,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [1]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 2,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [4]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 5,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 3,
											["count"] = 1,
										}, -- [16]
									},
									["bag_id"] = 3,
									["loc_id"] = 1,
									["count"] = 16,
									["status"] = -3,
									["empty"] = 16,
									["h"] = "|cff1eff00|Hitem:21841::::::::100:253::::::|h[Netherweave Bag]|h|r",
									["texture"] = 133656,
								}, -- [3]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:4338::::::::100:253::::::|h[Mageweave Cloth]|h|r",
											["count"] = 86,
											["slot_id"] = 1,
											["age"] = 24599479,
											["bag_id"] = 4,
											["loc_id"] = 1,
										}, -- [1]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:4306::::::::100:253::::::|h[Silk Cloth]|h|r",
											["count"] = 200,
											["slot_id"] = 2,
											["age"] = 24599479,
											["bag_id"] = 4,
											["loc_id"] = 1,
										}, -- [2]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:4306::::::::100:253::::::|h[Silk Cloth]|h|r",
											["count"] = 82,
											["slot_id"] = 3,
											["age"] = 24599479,
											["bag_id"] = 4,
											["loc_id"] = 1,
										}, -- [3]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2592::::::::100:253::::::|h[Wool Cloth]|h|r",
											["count"] = 110,
											["slot_id"] = 4,
											["age"] = 24599479,
											["bag_id"] = 4,
											["loc_id"] = 1,
										}, -- [4]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:2589::::::::100:253::::::|h[Linen Cloth]|h|r",
											["count"] = 189,
											["slot_id"] = 5,
											["age"] = 24599479,
											["bag_id"] = 4,
											["loc_id"] = 1,
										}, -- [5]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:6530::::::::100:253::::::|h[Nightcrawlers]|h|r",
											["count"] = 4,
											["slot_id"] = 6,
											["age"] = 24599479,
											["bag_id"] = 4,
											["loc_id"] = 1,
										}, -- [6]
										{
											["q"] = 2,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 4,
											["age"] = 24599587,
											["h"] = "|cff1eff00|Hitem:19022::::::::100:253::11::::|h[Nat Pagle's Extreme Angler FC-5000]|h|r",
										}, -- [7]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [8]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [9]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [10]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [11]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [12]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 13,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [13]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 14,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [14]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 15,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [15]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 16,
											["bag_id"] = 4,
											["count"] = 1,
										}, -- [16]
									},
									["bag_id"] = 4,
									["loc_id"] = 1,
									["count"] = 16,
									["status"] = -3,
									["empty"] = 9,
									["h"] = "|cff1eff00|Hitem:21841::::::::100:253::::::|h[Netherweave Bag]|h|r",
									["texture"] = 133656,
								}, -- [4]
								{
									["q"] = 2,
									["type"] = 1,
									["slot"] = {
										{
											["q"] = 1,
											["loc_id"] = 1,
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 1,
											["bag_id"] = 5,
											["age"] = 24599587,
											["h"] = "|cffffffff|Hitem:6948::::::::100:253::::::|h[Hearthstone]|h|r",
										}, -- [1]
										{
											["q"] = 2,
											["loc_id"] = 1,
											["slot_id"] = 2,
											["sb"] = 1,
											["count"] = 5,
											["bag_id"] = 5,
											["age"] = 24599587,
											["h"] = "|cff1eff00|Hitem:103644::::::::100:253::::::|h[Blessed Bandage]|h|r",
										}, -- [2]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 3,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [3]
										{
											["q"] = 2,
											["loc_id"] = 1,
											["slot_id"] = 4,
											["sb"] = 1,
											["count"] = 4,
											["bag_id"] = 5,
											["age"] = 24599587,
											["h"] = "|cff1eff00|Hitem:129096::::::::100:253::::::|h[Battle-Mender's Dressing]|h|r",
										}, -- [4]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 5,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["age"] = 24599587,
											["h"] = "|cffffffff|Hitem:64640::::::::100:253::::::|h[Infectis Puffer Sashimi]|h|r",
										}, -- [5]
										{
											["q"] = 0,
											["loc_id"] = 1,
											["slot_id"] = 6,
											["bag_id"] = 5,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["slot_id"] = 7,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["age"] = 24599587,
											["h"] = "|cff0070dd|Hitem:141599::::::::100:253::9:3:3447:1815:1820:::|h[Fel Barbed Spear]|h|r",
										}, -- [7]
										{
											["q"] = 3,
											["bag_id"] = 5,
											["loc_id"] = 1,
											["slot_id"] = 8,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:141604::::::::100:253::14:3:3447:1814:1820:::|h[Glaive of the Fallen]|h|r",
											["count"] = 1,
											["ab"] = 1,
											["age"] = 24599587,
										}, -- [8]
										{
											["q"] = 3,
											["bag_id"] = 5,
											["loc_id"] = 1,
											["slot_id"] = 9,
											["sb"] = 1,
											["h"] = "|cff0070dd|Hitem:141604::::::::100:253::14:3:3447:1814:1820:::|h[Glaive of the Fallen]|h|r",
											["count"] = 1,
											["ab"] = 1,
											["age"] = 24599587,
										}, -- [9]
										{
											["q"] = 1,
											["loc_id"] = 1,
											["slot_id"] = 10,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["age"] = 24599587,
											["h"] = "|cffffffff|Hitem:63205::::::::100:253::11::::|h[Safety Goggles]|h|r",
										}, -- [10]
										{
											["q"] = 2,
											["loc_id"] = 1,
											["slot_id"] = 11,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["age"] = 24599587,
											["h"] = "|cff1eff00|Hitem:18951::::::::100:253::11::::|h[Evonice's Landin' Pilla]|h|r",
										}, -- [11]
										{
											["q"] = 3,
											["loc_id"] = 1,
											["slot_id"] = 12,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 5,
											["age"] = 24599587,
											["h"] = "|cff0070dd|Hitem:63194::::::::100:253::11::::|h[Rhea's Last Egg]|h|r",
										}, -- [12]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:14256::::::::100:253::::::|h[Felcloth]|h|r",
											["count"] = 3,
											["slot_id"] = 13,
											["age"] = 24599479,
											["bag_id"] = 5,
											["loc_id"] = 1,
										}, -- [13]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:14227::::::::100:253::::::|h[Ironweb Spider Silk]|h|r",
											["count"] = 2,
											["slot_id"] = 14,
											["age"] = 24599479,
											["bag_id"] = 5,
											["loc_id"] = 1,
										}, -- [14]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:14047::::::::100:253::::::|h[Runecloth]|h|r",
											["count"] = 123,
											["slot_id"] = 15,
											["age"] = 24599479,
											["bag_id"] = 5,
											["loc_id"] = 1,
										}, -- [15]
										{
											["q"] = 1,
											["h"] = "|cffffffff|Hitem:4338::::::::100:253::::::|h[Mageweave Cloth]|h|r",
											["count"] = 200,
											["slot_id"] = 16,
											["age"] = 24599479,
											["bag_id"] = 5,
											["loc_id"] = 1,
										}, -- [16]
									},
									["bag_id"] = 5,
									["loc_id"] = 1,
									["count"] = 16,
									["status"] = -3,
									["empty"] = 2,
									["h"] = "|cff1eff00|Hitem:21841::::::::100:253::::::|h[Netherweave Bag]|h|r",
									["texture"] = 133656,
								}, -- [5]
							},
						}, -- [1]
						[3] = {
							["bag"] = {
								[9] = {
									["q"] = 0,
									["type"] = 27,
									["bag_id"] = 9,
									["loc_id"] = 3,
									["status"] = -5,
									["texture"] = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Bag",
								},
							},
						},
						[6] = {
							["slot_count"] = 18,
							["bag"] = {
								{
									["type"] = 14,
									["count"] = 18,
									["slot"] = {
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 1,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24599587,
											["h"] = "|cff0070dd|Hitem:138176::::::::100:253:512:9:2:3387:3388:100:::|h[Fel-Chain Helm]|h|r",
										}, -- [1]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:138160::::::::100:253::14::::|h[Infernal Cord]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 2,
											["age"] = 24599587,
											["bag_id"] = 1,
											["loc_id"] = 6,
										}, -- [2]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 3,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24599587,
											["h"] = "|cff0070dd|Hitem:138178::::::::100:253:512:9:2:3387:3388:100:::|h[Fel-Chain Spaulders]|h|r",
										}, -- [3]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:138188::::::::100:253::14::::|h[Demon Commander's Drape]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 4,
											["age"] = 24599587,
											["bag_id"] = 1,
											["loc_id"] = 6,
										}, -- [4]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 5,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24599587,
											["h"] = "|cff0070dd|Hitem:138179::::::::100:253:512:9:2:3387:3389:100:::|h[Fel-Chain Hauberk]|h|r",
										}, -- [5]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 6,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [6]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 7,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [7]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 8,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24599587,
											["h"] = "|cff0070dd|Hitem:138173::::::::100:253:512:9:2:3387:3388:100:::|h[Fel-Chain Bracers]|h|r",
										}, -- [8]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 9,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24599587,
											["h"] = "|cff0070dd|Hitem:138174::::::::100:253:512:9:2:3387:3388:100:::|h[Fel-Chain Grips]|h|r",
										}, -- [9]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 10,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24599587,
											["h"] = "|cff0070dd|Hitem:138172::::::::100:253:512:9:1:3387:100:::|h[Fel-Chain Cinch]|h|r",
										}, -- [10]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 11,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24599587,
											["h"] = "|cff0070dd|Hitem:138177::::::::100:253:512:9:2:3387:3389:100:::|h[Fel-Chain Leggings]|h|r",
										}, -- [11]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 12,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24599587,
											["h"] = "|cff0070dd|Hitem:138175::::::::100:253:512:9:2:3387:3388:100:::|h[Fel-Chain Boots]|h|r",
										}, -- [12]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 13,
											["sb"] = 1,
											["count"] = 1,
											["bag_id"] = 1,
											["age"] = 24599587,
											["h"] = "|cff0070dd|Hitem:139173::::::::100:253::14::::|h[Nether Twisted Band]|h|r",
										}, -- [13]
										{
											["q"] = 3,
											["loc_id"] = 6,
											["slot_id"] = 14,
											["sb"] = 1,
											["count"] = 1,
											["age"] = 24599587,
											["bag_id"] = 1,
											["h"] = "|cff0070dd|Hitem:138450::::::::100:253:512:11:1:3387:100:::|h[Signet of Stormwind]|h|r",
										}, -- [14]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:138170::::::::100:253::14::::|h[Felstalker Spine]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 15,
											["age"] = 24599587,
											["bag_id"] = 1,
											["loc_id"] = 6,
										}, -- [15]
										{
											["q"] = 3,
											["h"] = "|cff0070dd|Hitem:128959::::::::100:253::11::::|h[Seal of House Wrynn]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 16,
											["age"] = 24599587,
											["bag_id"] = 1,
											["loc_id"] = 6,
										}, -- [16]
										{
											["q"] = 6,
											["h"] = "|cffe6cc80|Hitem:128861::::::::100:253:256:9::288:::|h[Titanstrike]|h|r",
											["count"] = 1,
											["sb"] = 1,
											["slot_id"] = 17,
											["age"] = 24599587,
											["bag_id"] = 1,
											["loc_id"] = 6,
										}, -- [17]
										{
											["q"] = 1,
											["loc_id"] = 6,
											["slot_id"] = 18,
											["bag_id"] = 1,
											["count"] = 1,
										}, -- [18]
									},
									["status"] = -3,
									["empty"] = 3,
									["bag_id"] = 1,
									["loc_id"] = 6,
								}, -- [1]
							},
						},
						[9] = {
							["slot_count"] = 1,
							["bag"] = {
								{
									["type"] = 19,
									["count"] = 1,
									["slot"] = {
										{
											["q"] = 1,
											["loc_id"] = 9,
											["slot_id"] = 1,
											["sb"] = 1,
											["count"] = 670,
											["age"] = 24599479,
											["bag_id"] = 1,
											["h"] = "|cffffffff|Hcurrency:1226|h[Nethershard]|h|r",
										}, -- [1]
									},
									["status"] = -3,
									["bag_id"] = 1,
									["loc_id"] = 9,
								}, -- [1]
								{
									["type"] = 19,
									["status"] = -6,
									["bag_id"] = 2,
									["loc_id"] = 9,
								}, -- [2]
							},
						},
						[10] = {
							["bag"] = {
								{
									["bag_id"] = 1,
									["loc_id"] = 10,
								}, -- [1]
							},
						},
					},
				},
			},
			["version"] = 30715,
		},
		["version"] = 30715,
	},
	["profileKeys"] = {
		["Holyshnizzle - Doomhammer"] = "Default",
		["Alfalpha - Doomhammer"] = "Default",
		["Taunkah - Doomhammer"] = "Default",
		["Nilrum - Doomhammer"] = "Default",
		["Bartholamue - Doomhammer"] = "Default",
		["Marmit - Doomhammer"] = "Default",
	},
}
