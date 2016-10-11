local portal = GetCVar( "Portal" ) or ""

local ConnectedRealms = { }

local function addRealms( ... )
	
	local ac = select( '#', ... )
	
	if ac == 0 then return end
	
	local system = false
	local realm
	local realmTable = { }
	for ax = 1, ac do
		realm = select( ax, ... )
		if type( realm ) == "boolean" then
			system = realm
		elseif type( realm ) ~= "string" then
			if not system then
				ArkInventory.OutputWarning( "bad code: parameter ", ax, " is a ", type( realm ), " not a string, ignoring value" )
			end
		else
			realm = string.gsub( realm, " ", "" )
			realmTable[realm] = true
		end
	end
	
	for k in pairs( realmTable ) do
		if ConnectedRealms[k] then
			if not system then
				ArkInventory.OutputWarning( "duplicate connected realm (", portal, ") data found for ", k )
			else
				ConnectedRealms[k] = realmTable
			end
		else
			ConnectedRealms[k] = realmTable
		end
	end
	
end


if portal == "US" then
	
	ArkInventory.Output( "Loading Connected Realm (", portal, ") Data" )
	
	-- source http://us.battle.net/wow/en/blog/11393305
	addRealms( "Aegwynn", "Bonechewer", "Daggerspine", "Gurubashi", "Hakkar" )
	addRealms( "Aerie Peak", "Ulduar" )
	addRealms( "Agamaggan", "Archimonde", "Burning Legion", "Jaedenar", "The Underbog" )
	addRealms( "Aggramar", "Fizzcrank" )
	addRealms( "Akama", "Dragonmaw", "Mug'thol" )
	addRealms( "Alleria", "Khadgar" )
	addRealms( "Alexstrasza", "Terokkar" )
	addRealms( "Altar of Storms", "Anetheron", "Magtheridon", "Ysondre" )
	addRealms( "Alterac Mountains", "Balnazzar", "Gorgonnash", "The Forgotten Coast", "Warsong" )
	addRealms( "Andorhal", "Scilla", "Ursin", "Zuluhed" )
	addRealms( "Antonidas", "Uldum" )
	addRealms( "Anub'arak", "Chromaggus", "Chrushridge", "Garithos", "Nathrezim", "Smolderthorn" )
	addRealms( "Anvilmar", "Undermine" )
	addRealms( "Arygos", "Llane" )
	addRealms( "Auchindoun", "Cho'gall", "Laughing Skull" )
	addRealms( "Azgalor", "Azshara", "Destromath", "Thunderlord" )
	addRealms( "Azjol-Nerub", "Khaz Modan" )
	addRealms( "Azuremyst", "Staghelm" )
	addRealms( "Black Dragonflight", "Gul'dan", "Skullcrusher" )
	addRealms( "Blackhand", "Galakrond" )
	addRealms( "Blackwater Raiders", "Shadow Council" )
	addRealms( "Blackwing Lair", "Dethecus", "Lethon", "Haomarush" )
	addRealms( "Bladefist", "Kul Tiras" )
	addRealms( "Blade's Edge", "Thunderhorn" )
	addRealms( "Blood Furnace", "Mannaroth", "Nazjatar" )
	addRealms( "Bloodscalp", "Boulderfist", "Dunemaul", "Maiev", "Stonemaul" )
	addRealms( "Borean Tundra", "Shadowsong" )
	addRealms( "Bronzebeard", "Shandris" )
	addRealms( "Burning Blade", "Lightning's Blade", "Onyxia" )
	addRealms( "Cairne", "Perenolde" )
	addRealms( "Coilfang", "Dark Iron", "Dalvengyr", "Demon Soul", "Shattered Hand" )
	addRealms( "Dawnbringer", "Madoran" )
	addRealms( "Darrowmere", "Windrunner" )
	addRealms( "Dath'Remar", "Khaz'goroth" )
	addRealms( "Dentarg", "Whisperwind" )
	addRealms( "Draenor", "Echo Isles" )
	addRealms( "Draka", "Suramar" )
	addRealms( "Drak'Tharon", "Firetree", "Malorne", "Rivendare", "Spirestone", "Stormscale" )
	addRealms( "Drak'thul", "Skywall" )
	addRealms( "Dreadmaul", "Thaurissan" )
	addRealms( "Drenden", "Arathor" )
	addRealms( "Duskwood", "Bloodhoof" )
	addRealms( "Eitrigg", "Shu'halo" )
	addRealms( "Eldre'Thalas", "Korialstrasz" )
	addRealms( "Elune", "Gilneas" )
	addRealms( "Eonar", "Velen" )
	addRealms( "Eredar", "Gorefiend", "Spinebreaker", "Wildhammer" )
	addRealms( "Deathwing", "Executus", "Kalecgos", "Shattered Halls" )
	addRealms( "Exodar", "Medivh" )
	addRealms( "Farstriders", "Silver Hand", "Thorium Brotherhood" )
	addRealms( "Fenris", "Dragonblight" )
	addRealms( "Frostmane", "Ner'zhul", "Tortheldrin" )
	addRealms( "Frostwolf", "Vashj" )
	addRealms( "Ghostlands", "Kael'thas" )
	addRealms( "Gnomeregan", "Moonrunner" )
	addRealms( "Grizzly Hills", "Lothar" )
	addRealms( "Gundrak", "Jubei'Thos" )
	addRealms( "Hellscream", "Zangarmarsh" )
	addRealms( "Hydraxis", "Terenas" )
	addRealms( "Icecrown", "Malygos" )
	addRealms( "Kargath", "Norgannon" )
	addRealms( "Kilrogg", "Winterhoof" )
	addRealms( "Kirin Tor", "Sentinels", "Steamwheedle Cartel" )
	addRealms( "Malfurion", "Trollbane" )
	addRealms( "Misha", "Rexxar" )
	addRealms( "Mok'Nathal", "Silvermoon" )
	addRealms( "Nagrand", "Caelestrasz" )
	addRealms( "Nazgrel", "Nesingwary", "Vek'nilash" )
	addRealms( "Nordrassil", "Muradin" )
	addRealms( "Quel'dorei", "Sen'jin" )
	addRealms( "Ravenholdt", "Twisting Nether" )
	addRealms( "Runetotem", "Uther" )
	addRealms( "Scarlet Crusade", "Feathermoon" )
	addRealms( "Shadowmoon", "Detheroc" ) -- Detheroc is duplicated in the source with another group
	addRealms( "Tanaris", "Greymane" )
	addRealms( "The Scryers", "Argent Dawn" )
	addRealms( "The Venture Co", "Maelstrom", "Lightninghoof" )
	addRealms( "Uldaman", "Ravencrest" )
	addRealms( "Ysera", "Durotan" )
	addRealms( "Cenarion Circle", "Sisters of Elune" )
	
elseif portal == "EU" then

	ArkInventory.Output( "Loading Connected Realm (", portal, ") Data" )
	
	--ENGLISH
	addRealms( "Aggramar", "Hellscream" )
	addRealms( "Arathor", "Hellfire" )
	addRealms( "Bloodfeather", "Burning Steppes", "Executus", "Kor'gall", "Shattered Hand" )
	addRealms( "Kilrogg", "Nagrand", "Runetotem" )
	addRealms( "Thunderhorn", "Wildhammer" )
	addRealms( "Azjol-Nerub", "Quel'Thalas" )
	addRealms( "Dragonblight", "Ghostlands" )
	addRealms( "Darkspear", "Terokkar" )
	addRealms( "Aszune", "Shadowsong" )
	addRealms( "Shattered Halls", "Balnazzar", "Ahn'Qiraj", "Trollbane", "Talnivarr", "Chromaggus", "Boulderfist", "Daggerspine", "Laughing Skull", "Sunstrider" )
	addRealms( "Emeriss", "Agamaggan", "Hakkar", "Crushridge", "Bloodscalp" )
	addRealms( "Grim Batol", "Aggra" )
	addRealms( "Karazhan", "Lightning's Blade", "Deathwing", "The Maelstrom" )
	addRealms( "Auchindoun", "Dunemaul", "Jaedenar" )
	addRealms( "Dragonmaw", "Spinebreaker", "Haomarush", "Vashj", "Stormreaver" )
	addRealms( "Zenedar", "Bladefist", "Frostwhisper" )
	addRealms( "Xavius", "Skullcrusher" )
	addRealms( "Darksorrow", "Genjuros", "Neptulon" )
	addRealms( "Drak'thul", "Burning Blade" )
	addRealms( "Moonglade", "The Sha'tar" )
	addRealms( "Darkmoon Faire", "Earthen Ring" )
	addRealms( "Scarshield Legion", "Ravenholdt", "The Venture Co", "Sporeggar" )
	
	-- FRENCH
	addRealms( "Cho'gall", "Eldre'Thalas", "Sinstralis" )
	addRealms( "Dalaran", "Marécage de Zangar" )
	addRealms( "Elune", "Varimathras" )
	addRealms( "Eitrigg", "Krasus" )
	addRealms( "Medivh", "Suramar" )
	addRealms( "Arak-arahm", "Throk'Feroth", "Rashgarroth" )
	addRealms( "Naxxramas", "Arathi", "Temple Noir", "Illidan" )
	addRealms( "Garona", "Ner'zhul" )
	addRealms( "Confrerie du Thorium", "Les Clairvoyants" )
	addRealms( "La Croisade écarlate", "Culte de la Rive noire", "Conseil des Ombres" )
	
	-- GERMAN
	addRealms( "Alexstrasza", "Nethersturm" )
	addRealms( "Ambossar", "Kargath" )
	addRealms( "Anetheron", "Festung der Stürme", "Gul'dan", "Rajaxx" )
	addRealms( "Area 52", "Sen'jin", "Un'Goro" )
	addRealms( "Arthas", "Blutkessel", "Vek'lor" )
	addRealms( "Azshara", "Krag'jin" )
	addRealms( "Dalvengyr", "Nazjatar" )
	addRealms( "Das Syndikat", "Die Arguswacht", "Die Todeskrallen", "Der Abyssische Rat" )
	addRealms( "Dethecus", "Mug'thol", "Terrordar", "Theradras" )
	addRealms( "Echsenkessel", "Mal'Ganis", "Taerar" )
	addRealms( "Garrosh", "Nozdormu", "Shattrath" )
	addRealms( "Gilneas", "Ulduar" )
	addRealms( "Malfurion", "Malygos" )
	addRealms( "Malorne", "Ysera" )
	
	-- SPANISH
	addRealms( "Exodar", "Minahonda" )
	addRealms( "Colinas Pardas", "Los Errantes", "Tyrande" )
	addRealms( "Sanguino", "Shen'dralar", "Uldum", "Zul'jin" )
	
	-- RUSSIAN
	addRealms( "Подземье", "Разувий" )
	
else
	
	if not portal then
		portal = "PTR/Beta/Alpha"
	end
	
	ArkInventory.Output( "Loading Connected Realm (", portal, ") Data" )
	
end


function ArkInventory.IsConnectedRealm( a, b )
	local a = string.gsub( a, " ", "" )
	if ConnectedRealms[a] then
		local b = string.gsub( b, " ", "" )
		return ConnectedRealms[a][b]
	end
end

-- in case i dont have the data ask blizzard for the realms connected to the current one
addRealms( true, unpack( GetAutoCompleteRealms( ) or { } ) )

-- /dump unpack( GetAutoCompleteRealms( ) or { } )
