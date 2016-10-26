local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table
local C_PetJournal = _G.C_PetJournal
local C_PetBattles = _G.C_PetBattles

local BreedAvailable = IsAddOnLoaded( "BattlePetBreedID" )


local filter = {
	ignore = false,
	searchBox = nil,
	collected = true,
	favourites = false,
	uncollected = true,
	family = { },
	source = { },
}

ArkInventory.PetJournal = {
	data = {
		loaded = false,
		total = 0, -- number of total pets
		owned = 0, -- number of owned pets
		collection = { },	-- [guid] = { } - owned pets only
		species = { }, -- [speciesID] = { } - all pet types
		ability = { }, -- [abilityID] = { } - all pet types
		creature = { },	-- [creatureID] = speciesID
	},
}


-- map the basic filter functions, blizzard change them around every now and then so this way you just update this and youre done

function ArkInventory.PetJournal.FilterGetFamilyTypes( )
	return C_PetJournal.GetNumPetTypes( )
end

function ArkInventory.PetJournal.FilterGetSourceTypes( )
	return C_PetJournal.GetNumPetSources( )
end

function ArkInventory.PetJournal.FilterGetSearch( )
	return PetJournal.searchBox:GetText( )
end

function ArkInventory.PetJournal.FilterSetSearch( s )
	PetJournal.searchBox:SetText( s )
	C_PetJournal.SetSearchFilter( s )
end

function ArkInventory.PetJournal.FilterSetCollected( value )
	C_PetJournal.SetFilterChecked( LE_PET_JOURNAL_FILTER_COLLECTED, value )
	-- legion ok
end

function ArkInventory.PetJournal.FilterGetCollected( )
	return C_PetJournal.IsFilterChecked( LE_PET_JOURNAL_FILTER_COLLECTED )
	-- legion ok
end

function ArkInventory.PetJournal.FilterSetUncollected( value )
	C_PetJournal.SetFilterChecked( LE_PET_JOURNAL_FILTER_NOT_COLLECTED, value )
	-- legion ok
end

function ArkInventory.PetJournal.FilterGetUncollected( )
	return C_PetJournal.IsFilterChecked( LE_PET_JOURNAL_FILTER_NOT_COLLECTED )
	-- legion ok
end

function ArkInventory.PetJournal.FilterSetFamily( t )
	if type( t ) == "table" then
		for i = 1, ArkInventory.PetJournal.FilterGetFamilyTypes( ) do
			C_PetJournal.SetPetTypeFilter( i, t[i] )
		end
	elseif type( t ) == "boolean" then
		for i = 1, ArkInventory.PetJournal.FilterGetFamilyTypes( ) do
			C_PetJournal.SetPetTypeFilter( i, t )
			
		end
	else
		assert( false, "parameter is " .. type( t ) .. ", not a table or boolean" )
	end
	-- legion ok
end

function ArkInventory.PetJournal.FilterGetFamily( t )
	assert( type( t ) == "table", "parameter is not a table" )
	for i = 1, ArkInventory.PetJournal.FilterGetFamilyTypes( ) do
		t[i] = C_PetJournal.IsPetTypeChecked( i )
	end
	-- legion ok
end

function ArkInventory.PetJournal.FilterSetSource( t )
	if type( t ) == "table" then
		for i = 1, ArkInventory.PetJournal.FilterGetSourceTypes( ) do
			C_PetJournal.SetPetSourceChecked( i, t[i] )
		end
	elseif type( t ) == "boolean" then
		for i = 1, ArkInventory.PetJournal.FilterGetSourceTypes( ) do
			C_PetJournal.SetPetSourceChecked( i, t )
		end
	else
		assert( false, "parameter is not a table or boolean" )
	end
	-- legion ok
end

function ArkInventory.PetJournal.FilterGetSource( t )
	assert( type( t ) == "table", "parameter is not a table" )
	for i = 1, ArkInventory.PetJournal.FilterGetSourceTypes( ) do
		t[i] = C_PetJournal.IsPetSourceChecked( i )
	end
	-- legion ok
end

function ArkInventory.PetJournal.OnHide( )
	filter.ignore = false
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_RELOAD_BUCKET", "RESCAN" )
end

function ArkInventory.PetJournal.FilterActionClear( )
	
	--ArkInventory.Output( "PetJournal.FilterActionClear" )
	
	filter.ignore = true
	
	ArkInventory.PetJournal.FilterSetSearch( "" )
	ArkInventory.PetJournal.FilterSetCollected( true )
	ArkInventory.PetJournal.FilterSetUncollected( true )
	ArkInventory.PetJournal.FilterSetFamily( true )
	ArkInventory.PetJournal.FilterSetSource( true )
	
end

function ArkInventory.PetJournal.FilterActionBackup( )
	
	--ArkInventory.Output( "PetJournal.FilterActionBackup" )
	
	if filter.ignore then
		--ArkInventory.Output( "FilterActionBackup - ignore" )
		return
	end
	
	filter.search = ArkInventory.PetJournal.FilterGetSearch( )
	filter.collected = ArkInventory.PetJournal.FilterGetCollected( )
	filter.uncollected = ArkInventory.PetJournal.FilterGetUncollected( )
	ArkInventory.PetJournal.FilterGetFamily( filter.family )
	ArkInventory.PetJournal.FilterGetSource( filter.source )
	
end

function ArkInventory.PetJournal.FilterActionRestore( )
	
	--ArkInventory.Output( "PetJournal.FilterActionRestore" )
	
	filter.ignore = true
	
	ArkInventory.PetJournal.FilterSetSearch( filter.search )
	ArkInventory.PetJournal.FilterSetCollected( filter.collected )
	ArkInventory.PetJournal.FilterSetUncollected( filter.uncollected )
	ArkInventory.PetJournal.FilterSetFamily( filter.family )
	ArkInventory.PetJournal.FilterSetSource( filter.source )
	
end



function ArkInventory.PetJournal.JournalIsReady( )
	return ArkInventory.PetJournal.data.loaded
end




function ArkInventory.PetJournal.GetCount( )
	return ArkInventory.PetJournal.data.owned, ArkInventory.PetJournal.data.total
end

function ArkInventory.PetJournal.GetPet( arg1 )
	
	if type( arg1 ) == "number" then
		--ArkInventory.Output( "GetPet( index=", arg1, " ) " )
		for _, obj in ArkInventory.PetJournal.Iterate( ) do
			if obj.guid == arg1 then
				return obj
			end
		end
		--ArkInventory.Output( "no pet found at index ", arg1 )
		return
	elseif type( arg1 ) == "string" then
		--ArkInventory.Output( "GetPet( guid=", arg1, " ) " )
		if ArkInventory.PetJournal.data.collection[arg1] then
			return ArkInventory.PetJournal.data.collection[arg1]
		else
			--ArkInventory.Output( "no pet found with guid ", arg1 )
		end
	end
	
end

function ArkInventory.PetJournal.Iterate( )
	local t = ArkInventory.PetJournal.data.collection
	return ArkInventory.spairs( t, function( a, b ) return ( t[a].fullname or "" ) < ( t[b].fullname or "" ) end )
end

function ArkInventory.PetJournal.CanSummon( arg1 )
	local pd = ArkInventory.PetJournal.GetPet( arg1 )
	if pd then
		return not C_PetJournal.PetIsRevoked( pd.guid ) and not C_PetJournal.PetIsLockedForConvert( pd.guid ) and C_PetJournal.PetIsSummonable( pd.guid )
	end
end

function ArkInventory.PetJournal.CanRelease( arg1 )
	local pd = ArkInventory.PetJournal.GetPet( arg1 )
	if pd then
		return C_PetJournal.PetCanBeReleased( pd.guid )
	end
end

function ArkInventory.PetJournal.CanTrade( arg1 )
	local pd = ArkInventory.PetJournal.GetPet( arg1 )
	if pd then
		return C_PetJournal.PetIsTradable( pd.guid )
	end
end

function ArkInventory.PetJournal.Summon( arg1 )
	local pd = ArkInventory.PetJournal.GetPet( arg1 )
	if pd then
		C_PetJournal.SummonPetByGUID( pd.guid )
	end
end

function ArkInventory.PetJournal.GetCurrent( )
	local guid = C_PetJournal.GetSummonedPetGUID( )
	if guid then
		local pd = ArkInventory.PetJournal.GetPet( guid )
		return pd.guid, guid, pd
	end
end

function ArkInventory.PetJournal.Dismiss( )
	local guid = ArkInventory.PetJournal.GetCurrent( )
	if guid then
		C_PetJournal.SummonPetByGUID( guid )
	end
end

function ArkInventory.PetJournal.GetStats( arg1 )
	local pd = ArkInventory.PetJournal.GetPet( arg1 )
	if pd then
		return C_PetJournal.GetPetStats( pd.guid )
	end
end

function ArkInventory.PetJournal.PickupPet( arg1, arg2 )
	local pd = ArkInventory.PetJournal.GetPet( arg1 )
	if pd then
		return C_PetJournal.PickupPet( pd.guid, arg2 )
	end
end




function ArkInventory.PetJournal.IsRevoked( arg1 )
	local pd = ArkInventory.PetJournal.GetPet( arg1 )
	if pd then
		return C_PetJournal.PetIsRevoked( pd.guid )
	end
end

function ArkInventory.PetJournal.IsLockedForConvert( arg1 )
	local pd = ArkInventory.PetJournal.GetPet( arg1 )
	if pd then
		return C_PetJournal.PetIsLockedForConvert( pd.guid )
	end
end

function ArkInventory.PetJournal.IsFavorite( arg1 )
	local pd = ArkInventory.PetJournal.GetPet( arg1 )
	if pd then
		return C_PetJournal.PetIsFavorite( pd.guid )
	end
end

function ArkInventory.PetJournal.IsSlotted( arg1 )
	local pd = ArkInventory.PetJournal.GetPet( arg1 )
	if pd then
		return C_PetJournal.PetIsSlotted( pd.guid )
	end
end

function ArkInventory.PetJournal.IsHurt( arg1 )
	local pd = ArkInventory.PetJournal.GetPet( arg1 )
	if pd then
		return C_PetJournal.PetIsHurt( pd.guid )
	end
end


function ArkInventory.PetJournal.InBattle( )
	return C_PetBattles.IsInBattle( )
end


function ArkInventory.PetJournal.SetName( arg1, arg2 )
	local pd = ArkInventory.PetJournal.GetPet( arg1 )
	C_PetJournal.SetCustomName( pd.guid, arg2 )
end


function ArkInventory.PetJournal.JournalIsUnlocked( )
	return C_PetJournal.IsJournalUnlocked( )
end

function ArkInventory.PetJournal.SetFavorite( arg1, arg2 )
	-- arg2 = 0 (remove) | 1 (set)
	local pd = ArkInventory.PetJournal.GetPet( arg1 )
	C_PetJournal.SetFavorite( pd.guid, arg2 )
end


function ArkInventory.PetJournal.Scan( )
	
	--ArkInventory.Output( "Pets: Start Scan" )
	
	if ArkInventory.Global.Mode.Combat then
		-- set to scan when leaving combat
		ArkInventory.Global.LeaveCombatRun.PetJournal = true
		return
	end
	
	if not ArkInventory.PetJournal.JournalIsUnlocked( ) then
		-- journal not ready, come back later
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_RELOAD_BUCKET", "RESCAN" )
	end
	
	local pj = ArkInventory.PetJournal.data
	
	ArkInventory.PetJournal.FilterActionBackup( )
	ArkInventory.PetJournal.FilterActionClear( )
	
	local total, owned = C_PetJournal.GetNumPets( )
	
	if total == 0 or owned == 0 or total < owned then
		
		--ArkInventory.Output( "no pets available or list is filtered, t=", total, " o=", owned" )
		
		ArkInventory.PetJournal.FilterActionRestore( )
		filter.ignore = false
		return
		
	end
	
	local update = false
	
	if ( pj.total ~= total ) or ( not pj.loaded ) then
		pj.total = total
		update = true
	end
	
	if ( pj.owned ~= owned ) or ( not pj.loaded ) then
		
		pj.owned = owned
		update = true
		
		wipe( pj.collection )
		
	end
	
	local check = true
	
	for i = 1, total do
		
		local guid, speciesID, owned = C_PetJournal.GetPetInfoByIndex( i, false )
		
		-- species data (all pets)
		local sd = ArkInventory.PetJournal.ScanSpecies( speciesID )
		if not sd then
			ArkInventory.PetJournal.FilterActionRestore( )
			ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_RELOAD_BUCKET", "RESCAN" )
			return false
		end

		-- creatureid to speciesid lookup (all pets)
		if not pj.creature[sd.creatureID] then
			pj.creature[sd.creatureID] = speciesID
			--ArkInventory.Output( sd.creatureID, " = ", speciesID )
		end
		
		
		-- pet data (owned pets)
		if owned then
			local pd, upd = ArkInventory.PetJournal.ScanPet( i, guid, update )
			if not pd then
				--ArkInventory.Output( "* pet journal not ready at ", i, " / ", guid )
				ArkInventory.PetJournal.FilterActionRestore( )
				ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_RELOAD_BUCKET", "RESCAN" )
				return false
			end
			if not update and upd then
				update = true
			end
		end
		
	end
	
	--ArkInventory.Output( "Pets: End Scan ( ", pj.owned, " of ", pj.total, " )" )
	
	ArkInventory.PetJournal.FilterActionRestore( )
	
	pj.loaded = true
	
	if update then
		ArkInventory.ScanCollectionPet( )
	end
	
	return true
	
end

function ArkInventory.PetJournal.GetSpeciesIDForCreatureID( creatureID )
	return ArkInventory.PetJournal.data.creature[creatureID]
end

function ArkInventory.PetJournal.GetSpeciesIDfromGUID( guid )
	
	-- breaks apart a guid to get the battlepet speciesid
	-- Creature-[unknown]-[serverID]-[instanceID]-[zoneUID]-[npcID]-[spawnUID]
	
	-- replaced with UnitBattlePetSpeciesID( unit )
	
	local creatureID = string.match( guid or "", "Creature%-.-%-.-%-.-%-.-%-(.-)%-.-$" )
	--ArkInventory.Output( creatureID, " / ", guid )
	if creatureID then
		creatureID = tonumber( creatureID ) or 0
		return ArkInventory.PetJournal.GetSpeciesIDForCreatureID( creatureID )
	end
	
end

function ArkInventory.PetJournal.GetSpeciesInfo( speciesID )
	return ArkInventory.PetJournal.data.species[speciesID]
end

function ArkInventory.PetJournal.ScanPet( index, guid, update )
	
	local pd = ArkInventory.PetJournal.data.collection
	local update = update
	
	local speciesID, customName, level, xp, maxXp, did, fav, name, icon, _, cid, _, _, wild, battle, tradable, unique, obtainable = C_PetJournal.GetPetInfoByPetID( guid )
	if ( not name ) then
		--ArkInventory.Output( "no name for pet #", index, ": ", guid )
		return
	end
	
	local sd = ArkInventory.PetJournal.GetSpeciesInfo( speciesID )
	if not sd then
		--ArkInventory.Output( "no species data for pet #", index, ": ", guid, " / ", speciesID )
		return  -- will rescan from there
	end
	
	local currentHealth, fullHealth, power, speed, rarity = C_PetJournal.GetPetStats( guid )
	rarity = rarity - 1 -- back down to item colour	
	
	local pet = pd[guid]
	
	if ( not update ) and ( ( not pet ) or ( pet.rarity ~= rarity ) or ( pet.cn ~= customName ) or ( pet.level ~= level ) or ( pet.fav ~= fav ) or ( pet.xp ~= xp ) or ( pet.fullHealth ~= fullHealth ) or ( pet.index ~= index ) ) then
		update = true
	end
	
	pd[guid] = {
		guid = guid,
		index = index,
		link = C_PetJournal.GetBattlePetLink( guid ),
		active = false,
		cn = customName,
		level = level,
		fav = fav,
		rarity = rarity, -- actual pet quality (standard item colour)
		
		xp = xp,
		maxXp = maxXp,
		health = currentHealth,
		maxHealth = fullHealth,
		power = power,
		speed = speed,
		
		breed = nil, -- wipe it every time
		
		sd = ArkInventory.PetJournal.data.species[speciesID], -- species data for this pet
	}
	
	if BreedAvailable then
		pd[guid].breed = GetBreedID_Journal( guid )
	end
	
	pet = pd[guid]
	
	if customName and customName ~= "" then
		pet.fullname = string.format( "%s (%s)", sd.name, customName )
	else
		pet.fullname = sd.name
	end
	
	return pet, update
	
end


local PET_STRONG = { 2, 6, 9, 1, 4, 3, 10, 5, 7, 8 }
--[[
	HUMANOID vs DRAGONKIN
	DRAGONKIN vs MAGIC
	FLYING vs AQUATIC
	UNDEAD vs HUMANOID
	CRITTER vs UNDEAD
	MAGIC vs FLYING
	ELEMENTAL vs MECHANICAL
	BEAST vs CRITTER
	AQUATIC vs ELEMENTAL
	MECHANICAL vs BEAST
]]--

local PET_WEAK = { 8, 4, 2, 8, 1, 10, 5, 3, 6, 7 }
--[[
	HUMANOID vs BEAST
	DRAGONKIN vs UNDEAD
	FLYING vs DRAGONKIN
	UNDEAD vs AQUATIC
	CRITTER vs HUMANOID
	MAGIC vs MECHANICAL
	ELEMENTAL vs CRITTER
	BEAST vs FLYING
	AQUATIC vs MAGIC
	MECHANICAL vs ELEMENTAL
]]--

function ArkInventory.PetJournal.ScanSpecies( speciesID )
	
	if ( not speciesID ) or ( type( speciesID ) ~= "number" ) or ( speciesID <= 0 ) then
		error( "invalid speciesID: ", speciesID )
		return
	end
	
	local data = ArkInventory.PetJournal.data.species
	
	if ( not data[speciesID] ) then
		
		local name, icon, petType, creatureID, sourceText, description, isWild, canBattle, tradable, unique = C_PetJournal.GetPetInfoBySpeciesID( speciesID )
		
--		if name and ( name ~= "" ) then
			
			data[speciesID] = {
				speciesID = speciesID,
				name = name or ArkInventory.Localise["UNKNOWN"],
				icon = icon,
				petType = petType,
				strong = PET_STRONG[petType],
				weak = PET_WEAK[petType],
				creatureID = creatureID,
				sourceText = sourceText,
				description = description,
				isWild = isWild,
				canBattle = canBattle,
				tradable = tradable,
				unique = unique,
				abilityID = { },
				abilityLevel = { },
			}
			
			local _, maxAllowed = C_PetJournal.GetNumCollectedInfo( speciesID )
			data[speciesID].maxAllowed = maxAllowed
			
			if canBattle then
				
				C_PetJournal.GetPetAbilityList( speciesID, data[speciesID].abilityID, data[speciesID].abilityLevel )
				--ArkInventory.Output( "id = ", data[speciesID].abilityID )
				--ArkInventory.Output( "level = ", data[speciesID].abilityLevel )
				
				for i, abilityID in ipairs( data[speciesID].abilityID ) do
					ArkInventory.PetJournal.ScanAbility( abilityID )
				end
				
			end
			
--		end
		
	end
	
	return data[speciesID]
	
end

function ArkInventory.PetJournal.GetSpeciesInfo( speciesID )
	return ArkInventory.PetJournal.data.species[speciesID]
end

function ArkInventory.PetJournal.ScanAbility( abilityID )
	
	if ( not abilityID ) or ( type( abilityID ) ~= "number" ) or ( abilityID <= 0 ) then
		error( "invalid abilityID" )
		return
	end
	
	local data = ArkInventory.PetJournal.data.ability
	
	if ( not data[abilityID] ) then
		
		local id, name, icon, maxCooldown, unparsedDescription, numTurns, petType, noStrongWeakHints = C_PetBattles.GetAbilityInfoByID( abilityID )
		
		data[abilityID] = {
			name = name,
			icon = icon,
			petType = petType,
			noStrongWeakHints = noStrongWeakHints,
			strong = PET_STRONG[petType],
			weak = PET_WEAK[petType],
		}
		
	end
	
	return data[abilityID]
	
end

function ArkInventory.PetJournal.GetAbilityInfo( abilityID )
	return ArkInventory.PetJournal.data.ability[abilityID]
end


function ArkInventory.PetJournal.AttackList( speciesID, level )
	
	local sd = ArkInventory.PetJournal.GetSpeciesInfo( speciesID )
	
	local weak = { }
	local strong = { }
	
	local base = ArkInventory.PetJournal.PetTypeName( sd.petType )
	
	for i, abilityType in ipairs( sd.abilityType ) do
		if ( sd.abilityLevel[i] <= level ) and ( PET_WEAK[abilityType] ~= sd.weak ) then
			--ArkInventory.Output( ArkInventory.PetJournal.PetTypeName( abilityType ), " ability weak against ", ArkInventory.PetJournal.PetTypeName( PET_WEAK[abilityType] ) )
			weak[PET_WEAK[abilityType]] = true
		end
	end
	
	--ArkInventory.Output( "-- -- -- -- -- -- --" )

	for i, abilityType in ipairs( sd.abilityType ) do
		
		if ( sd.abilityLevel[i] <= level ) and ( PET_STRONG[abilityType] ~= PET_STRONG[sd.petType] ) then
			
			--ArkInventory.Output( ArkInventory.PetJournal.PetTypeName( abilityType ), " ability strong against ", ArkInventory.PetJournal.PetTypeName( PET_STRONG[abilityType] ) )
			
			weak[PET_STRONG[abilityType]] = nil
			strong[PET_STRONG[abilityType]] = true
			
--			if PET_STRONG[abilityType] == sd.petType then
--				weak[PET_STRONG[abilityType]] = true
--				strong[PET_STRONG[abilityType]] = nil
--			end
			
		end
	end
	
	--ArkInventory.Output( "-- -- -- -- -- -- --" )
	
	
	local info = ArkInventory.PetJournal.PetTypeName( PET_WEAK[sd.petType] )
	local pos = 1
	for abilityType in pairs( weak ) do
		--ArkInventory.Output( "weak ", ArkInventory.PetJournal.PetTypeName( abilityType ) )
		if ( pos == 1 ) then
			info = string.format( "%s or %s", info, ArkInventory.PetJournal.PetTypeName( abilityType ) )
			pos = pos + 1
		else
			info = string.format( "%s, %s", info, ArkInventory.PetJournal.PetTypeName( abilityType ) )
		end
	end
	weak = info
	
	info = ArkInventory.PetJournal.PetTypeName( PET_STRONG[sd.petType] )
	pos = 1
	for abilityType in pairs( strong ) do
		--ArkInventory.Output( "strong ", ArkInventory.PetJournal.PetTypeName( abilityType ) )
		
		if ( pos == 1 ) then
			info = string.format( ArkInventory.Localise["BATTLEPET_OPPONENT_FORMAT_ABILITY1"], info, ArkInventory.PetJournal.PetTypeName( abilityType ) )
			pos = pos + 1
		else
			info = string.format( ArkInventory.Localise["BATTLEPET_OPPONENT_FORMAT_ABILITY2"], info, ArkInventory.PetJournal.PetTypeName( abilityType ) )
		end
		
	end
	strong = info
	
	
	
	
	return weak, strong, base
	
--[[

	for index, pd in ArkInventory.PetJournal.Iterate( ) do
		
		if ( pd.level >= level ) and ( weak[pd.sd.petType] ) then
			--ArkInventory.Output( pd.link )
			attackResult[index] = true
		end
		
	end
]]--
	
end

function ArkInventory.PetJournal.PetTypeName( arg1 )
	return _G[string.format( "BATTLE_PET_NAME_%s", arg1 )]
end

function ArkInventory.PetJournal.PetBattleHelp( speciesID, level )
	
	local enemy = ArkInventory.PetJournal.ScanSpecies( speciesID )
	if not enemy then
		ArkInventory.Output( "no data returned for speciesID:", speciesID )
		return
	end
	
	local level = level or 25
	
	local strong = { }
	
	local ad
	for i, abilityID in ipairs( enemy.abilityID ) do
		ad = ArkInventory.PetJournal.ScanAbility( abilityID )
		--ArkInventory.Output( "strong ability ", i, " = ", ad )
		if not ad.noStrongWeakHints then
			strong[ad.strong] = true
		end
	end
	
	local weak = { }
	weak[enemy.weak] = true
	for i, abilityID in ipairs( enemy.abilityID ) do
		ad = ArkInventory.PetJournal.ScanAbility( abilityID )
		--ArkInventory.Output( "weak ability ", i, " = ", ad )
		if not ad.noStrongWeakHints then
			weak[ad.weak] = true
		end
	end
	
	for x in pairs( strong ) do
		weak[strong[x]] = nil
	end
	
--[[
	ArkInventory.Output( "-- -- -- -- -- -- --" )
	ArkInventory.Output( "name = ", enemy.name )
	ArkInventory.Output( "level = ", level )
	
	for x in pairs( strong ) do
		ArkInventory.Output( "strong = ", ArkInventory.PetJournal.PetTypeName( x ) )
	end
	for x in pairs( weak ) do
		ArkInventory.Output( "weak = ", ArkInventory.PetJournal.PetTypeName( x ) )
	end
]]--
	
	local result, count, bad, good, modifier
	local species = { }
	
	for v = 3, 1, -1 do
		
		result = false
		
		for _, pd in ArkInventory.PetJournal.Iterate( ) do
			
			if ( pd.sd.canBattle ) and ( not species[pd.sd.speciesID] ) and ( pd.level >= ( level - 5 ) ) and ( pd.sd.petType == enemy.weak ) and ( not strong[pd.sd.PetType] ) then
				
				-- must be battle capable
				-- cant have been reported already
				-- within 5 levels
				-- pets the enemy is weak against
				
	--			ArkInventory.Output( "checking ", pd.link )
				
				bad = false
				good = false
				count = 0
				modifier = 1.0
				
				--ArkInventory.Output( "pd.sd = ", pd.sd )
				
				for i = 1, 3 do
					
					-- first row abilities
					
					if ( pd.sd.abilityLevel[i] <= level ) then
						
						ad = ArkInventory.PetJournal.ScanAbility( pd.sd.abilityID[i] )
						--ArkInventory.Output( "ability ", i, " = ", ad )
						modifier = C_PetBattles.GetAttackModifier( ad.petType, enemy.petType )
						
						if ( ad.noStrongWeakHints or modifier == 1 ) then
							-- neutral ability, dont care
						elseif ( modifier < 1 ) then
							-- weak ability, ignore this pet
							bad = true
						elseif ( modifier > 1 ) then
							-- strong ability, possibly include this pet
							good = true
							count = count + 1
						end
						
					end
					
					-- second row abilities
					if ( ( not good ) or ( bad ) ) and ( pd.sd.abilityLevel[i+3] <= level ) then
						
						ad = ArkInventory.PetJournal.ScanAbility( pd.sd.abilityID[i+3] )
						--ArkInventory.Output( "ability ", i, " = ", ad )
						modifier = C_PetBattles.GetAttackModifier( ad.petType, enemy.petType )
						
						if ( ad.noStrongWeakHints or modifier == 1 ) then
							-- neutral ability, dont care
						elseif ( modifier < 1 ) then
							-- weak ability, ignore this pet
							bad = true
						elseif ( modifier > 1 ) then
							-- strong ability, possibly include this pet
							bad = false
							count = count + 1
						end
						
					end
					
				end
				
				if ( not bad ) and ( count >= v ) then
					species[pd.sd.speciesID] = true
					ArkInventory.Output( pd.link, " (", count, ")" )
					result = true
				end
				
			end
			
		end
		
		if result then
			return
		end
		
	end
	
	-- there are no base weak pets
	
	for v = 3, 1, -1 do
		
		result = false
		
		for _, pd in ArkInventory.PetJournal.Iterate( ) do
			
			if ( pd.sd.canBattle ) and ( not species[pd.sd.speciesID] ) and ( pd.level >= ( level - 5 ) ) and ( not strong[pd.sd.petType] ) then
				
				-- must be battle capable
				-- cant have been reported already
				-- within 5 levels
				-- pets where the enemy attacks are not strong
				
				--ArkInventory.Output( "checking ", pd.link )
				
				bad = false
				good = false
				count = 0
				modifier = 1.0
				
				--ArkInventory.Output( "pd.sd = ", pd.sd )
				
				for i = 1, 3 do
					
					-- first row abilities
					
					if ( pd.sd.abilityLevel[i] <= level ) then
						
						ad = ArkInventory.PetJournal.ScanAbility( pd.sd.abilityID[i] )
						--ArkInventory.Output( "ability ", i, " = ", ad )
						modifier = C_PetBattles.GetAttackModifier( ad.petType, enemy.petType )
						
						if ( ad.noStrongWeakHints or modifier == 1 ) then
							-- neutral ability, dont care
						elseif ( modifier < 1 ) then
							-- weak ability, ignore this pet
							bad = true
						elseif ( modifier > 1 ) then
							-- strong ability, possibly include this pet
							good = true
							count = count + 1
						end
						
					end
					
					-- second row abilities
					if ( ( not good ) or ( bad ) ) and ( pd.sd.abilityLevel[i+3] <= level ) then
						
						ad = ArkInventory.PetJournal.ScanAbility( pd.sd.abilityID[i+3] )
						--ArkInventory.Output( "ability ", i, " = ", ad )
						modifier = C_PetBattles.GetAttackModifier( ad.petType, enemy.petType )
						
						if ( ad.noStrongWeakHints or modifier == 1 ) then
							-- neutral ability, dont care
						elseif ( modifier < 1 ) then
							-- weak ability, ignore this pet
							bad = true
						elseif ( modifier > 1 ) then
							-- strong ability, possibly include this pet
							bad = false
							count = count + 1
						end
						
					end
					
				end
				
				if ( not bad ) and ( count >= v ) then
					species[pd.sd.speciesID] = true
					ArkInventory.Output( pd.link, " (", count, ")" )
					result = true
				end
				
			end
			
		end
		
		if result then
			return
		end
		
	end
	
end


function ArkInventory:EVENT_WOW_BATTLEPET_OPENING_DONE( event, ... )
	
	--ArkInventory.Output( "EVENT_WOW_BATTLEPET_OPENING_DONE" )
	-- /run ArkInventory:EVENT_WOW_BATTLEPET_OPENING_DONE( "MANUAL" )
	if not ArkInventory.db.option.message.battlepet.opponent then return end
	
	ArkInventory.PetJournal.Scan( )
	
	local help = ...
	local player = 2
	local isnpc = C_PetBattles.IsPlayerNPC( player )
	local opponents = C_PetBattles.GetNumPets( player )
	
--	if opponents > 1 then
		ArkInventory.Output( "--- --- --- --- --- --- ---" )
--	end
	
	if not ArkInventory.PetJournal.JournalIsReady( ) then
		ArkInventory.Output( "pet journal not ready" )
		return
	end
	
	for i = 1, opponents do
		
		local name = C_PetBattles.GetName( player, i )
		
		local speciesID = C_PetBattles.GetPetSpeciesID( player, i )
		local level = C_PetBattles.GetLevel( player, i )
		local fullHealth = C_PetBattles.GetMaxHealth( player, i )
		local power = C_PetBattles.GetPower( player, i )
		local speed = C_PetBattles.GetSpeed( player, i )
		local breed = ""
		
		if BreedAvailable then
			breed = string.format( " %s", GetBreedID_Battle( { ["petOwner"] = player, ["petIndex"] = i } ) )
		end
		
		local rarity = C_PetBattles.GetBreedQuality( player, i )
		rarity = ( rarity and ( rarity - 1 ) ) or -1
		
		local info = ""
		local count
		
		local sd = ArkInventory.PetJournal.data.species[speciesID] or ArkInventory.PetJournal.ScanSpecies( speciesID )
		
		if not sd then
			
			ArkInventory.Output( YELLOW_FONT_COLOR_CODE, "#", i, ": ", name, " - ", RED_FONT_COLOR_CODE, ArkInventory.Localise["NO_DATA_AVAILABLE"] )
			
		else
			
			if C_PetBattles.IsWildBattle( ) then
				
				--ArkInventory.Output( "wild battle" )
				if not sd.canBattle then
					-- opponent cannot battle (and yet it is), its one of the secondary non-capturabe opponents
					info = string.format( "%s- %s", YELLOW_FONT_COLOR_CODE, ArkInventory.Localise["BATTLEPET_OPPONENT_IMMUNE"] )
				else
					count = true
				end
				
			elseif isnpc then
				
				--ArkInventory.Output( "trainer battle" )
				
			else
				
				--ArkInventory.Output( "pvp battle" )
				
				count = true
				
			end
			
			if help and ( type( help ) == "string" ) and ( help == "PET_BATTLE_HELP" ) then
				--local good, bad = ArkInventory.PetJournal.AttackList( speciesID, level )
				--info = string.format( " vs %s", good )
				ArkInventory.PetJournal.PetBattleHelp( speciesID, level )
			end
			
			local h = string.format( "%s|Hbattlepet:%s:%s:%s:%s:%s:%s:%s|h[%s]|h|r", select( 5, ArkInventory.GetItemQualityColor( rarity ) ), speciesID, level, rarity, fullHealth, power, speed, "", name )
			
			if ( not count ) then
				
				-- dont do anything
				
			else
				
				local numOwned, maxAllowed = C_PetJournal.GetNumCollectedInfo( speciesID )
				
				if numOwned == 0 then
					
					info = string.format( "%s- %s", RED_FONT_COLOR_CODE, ArkInventory.Localise["NOT_COLLECTED"] )
					
					local h = string.format( "%sbattlepet:%s:%s:%s:%s:%s:%s:%s|h[%s]", select( 5, ArkInventory.GetItemQualityColor( rarity ) ), speciesID, level, rarity, fullHealth, power, speed, "", name )
					
				else
					
					if numOwned >= maxAllowed then
						
						info = string.format( "- %s", ArkInventory.Localise["BATTLEPET_OPPONENT_KNOWN_MAX"] )
						
					elseif C_PetBattles.IsWildBattle( ) then
						
						local upgrade = false
						
						for _, pd in ArkInventory.PetJournal.Iterate( ) do
							
							if ( pd.sd.speciesID == speciesID ) then
								
								local q = pd.rarity
								--ArkInventory.Output( "s=[", speciesID, "], ", h, ", [", rarity, "] / ", pd.link, " [", q, "]" )
								if ( rarity >= q ) then
									upgrade = true
								end
								
								if string.len( info ) < 2 then
									info = string.format( "- %s ", ArkInventory.Localise["BATTLEPET_OPPONENT_UPGRADE"] )
									--info = string.format( "- " )
								end
								
								info = string.format( "%s%s", info, pd.link )
								
								if pd.breed then
									info = string.format( "%s  %s", info, pd.breed )
								end
								
							end
							
						end
						
						if not upgrade then
							info = ""
						end
						
					end
					
				end
				
			end
		
			--ArkInventory.Output( YELLOW_FONT_COLOR_CODE, ArkInventory.Localise["BATTLEPET"], " #", i, ": ", h, " ", YELLOW_FONT_COLOR_CODE, info )
			ArkInventory.Output( YELLOW_FONT_COLOR_CODE, "#", i, ": ", h, breed, " ", YELLOW_FONT_COLOR_CODE, info )
		
		end
		
	end
	
end

function ArkInventory:LISTEN_BATTLEPET_UPDATE( )
	
	--ArkInventory.Output( "LISTEN_BATTLEPET_UPDATE" )
	
	local loc_id = ArkInventory.Const.Location.Pet
	ArkInventory.ScanLocation( loc_id )
	--ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	
	ArkInventory.LDB.Pets:Update( )
	
end

function ArkInventory:EVENT_WOW_COLLECTION_PET_RELOAD( event, ... )
	
	--ArkInventory.Output( "EVENT_WOW_COLLECTION_PET_RELOAD( ", event, " )" )
	--ArkInventory.Output( event )
	
	if ( event == "PET_JOURNAL_LIST_UPDATE" ) then
		
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_RELOAD_BUCKET", event )
		
	elseif ( event == "COMPANION_UPDATE" ) then
		
		local c = ...
		if ( c == "CRITTER" ) then
			ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_RELOAD_BUCKET", event )
		end
		
	else
		
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_RELOAD_BUCKET", event )
		
	end
	
end

function ArkInventory:EVENT_ARKINV_COLLECTION_PET_RELOAD_BUCKET( events )
	
	--ArkInventory.Output( "EVENT_ARKINV_COLLECTION_PET_RELOAD_BUCKET( ", events, " )" )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	local loc_id = ArkInventory.Const.Location.Pet
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( "IGNORED (NOT MONITORED)" )
		return
	end
	
	if PetJournal:IsVisible( ) then
		--ArkInventory.Output( "IGNORED (PET JOURNAL OPEN)" )
		return
	end
	
	if filter.ignore then
		--ArkInventory.Output( "IGNORED (FILTER CHANGED BY ME)" )
		filter.ignore = false
		return
	end
	
	ArkInventory.PetJournal.Scan( )
	
end

-- unit guid, from mouseover = Creature-[unknown]-[serverID]-[instanceID]-[zoneUID]-[creatureID]-[spawnUID]
-- caged battletpet (item) = battlepet:
-- pet journal = battlepet:[speciesID]:16:3:922:185:185:[guid]

--[[

battlepet:1387:1:3:152:12:11:BattlePet-0-000006589760
battlepet:1387:1:3:155:12:10:0000000000000000
item:111660:0:0:0:0:0:0:0:90:0:11:0

]]--
