local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table
local C_PetJournal = _G.C_PetJournal
local C_Heirloom = _G.C_Heirloom


local filter = {
	searchBox = nil,
	collected = true,
	uncollected = true,
	source = { },
	class = 0,
	spec = 0,
}

local data = {
	ready = false,
	total = 0,
	owned = 0,
	cache = { },
}


-- map the basic filter functions, blizzard change them around every now and then so this way you just update this and youre done

local function FilterGetSourceTypes( )
	return C_PetJournal.GetNumPetSources( )
end

local function FilterGetSearch( )
	return HeirloomsJournal.SearchBox:GetText( )
end

local function FilterSetSearch( s )
	HeirloomsJournal.SearchBox:SetText( s )
	C_Heirloom.SetSearch( s )
end

local function FilterSetClassSpec( class, spec )
	C_Heirloom.SetClassAndSpecFilters( class, spec )
end

local function FilterGetClassSpec( )
	return C_Heirloom.GetClassAndSpecFilters( )
end

local function FilterSetCollected( value )
	C_Heirloom.SetCollectedHeirloomFilter( value )
end

local function FilterGetCollected( )
	return C_Heirloom.GetCollectedHeirloomFilter( )
end

local function FilterSetUncollected( value )
	C_Heirloom.SetUncollectedHeirloomFilter( value )
end

local function FilterGetUncollected( )
	return C_Heirloom.GetUncollectedHeirloomFilter( )
end

local function FilterSetSource( t )
	local check = nil
	for i = 1, FilterGetSourceTypes( ) do
		if type( t ) == "table" then
			check = t[i]
		elseif type( t ) == "boolean" then
			check = t
		else
			assert( false, "parameter is not a table or boolean" )
		end
		C_Heirloom.SetHeirloomSourceFilter( i, check )
	end
end

local function FilterGetSource( t )
	assert( type( t ) == "table", "parameter is not a table" )
	wipe( t )
	for i = 1, FilterGetSourceTypes( ) do
		t[i] = C_Heirloom.GetHeirloomSourceFilter( i )
	end
end

local function FilterActionClear( )
	
	--ArkInventory.Output( "Collection.Heirloom.FilterActionClear" )
	
	filter.ignore = true
	
	FilterSetSearch( "" )
	FilterSetCollected( true )
	FilterSetUncollected( true )
	FilterSetSource( true )
	FilterSetClassSpec( 0, 0 )
	
end

local function FilterActionBackup( )
	
	--ArkInventory.Output( "Collection.Heirloom.FilterActionBackup" )
	
	if filter.ignore then
		--ArkInventory.Output( "FilterActionBackup - ignore" )
		return
	end
	
	filter.search = FilterGetSearch( )
	filter.collected = FilterGetCollected( )
	filter.uncollected = FilterGetUncollected( )
	FilterGetSource( filter.source )
	filter.class, filter.spec = FilterGetClassSpec( )
	
end

local function FilterActionRestore( )
	
	--ArkInventory.Output( "Collection.Heirloom.FilterActionRestore" )
	
	filter.ignore = true
	
	FilterSetSearch( filter.search )
	FilterSetCollected( filter.collected )
	FilterSetUncollected( filter.uncollected )
	FilterSetSource( filter.source )
	FilterSetClassSpec( filter.class, filter.spec )
	
end

local function Scan( )
	
	local update = false
	
	if ArkInventory.Global.Mode.Combat then
		-- set to scan when leaving combat
		ArkInventory.Global.LeaveCombatRun.Heirloom = true
		return
	end
	
	local total = C_Heirloom.GetNumDisplayedHeirlooms( )
	local owned = C_Heirloom.GetNumKnownHeirlooms( )
	--ArkInventory.Output( "total heirlooms = ", total )
	
	if data.total ~= total or not data.ready then
		data.total = total
		update = true
	end
	
	if data.owned ~= owned or not data.ready then
		data.owned = owned
		update = true
	end
	
	data.ready = true
	
	if owned == 0 then return end
	
	local c = data.cache
	
	for x = 1, total do
		
		local i = C_Heirloom.GetHeirloomItemIDFromDisplayedIndex( x )
		local name, itemEquipLoc, isPvP, icon, upgradeLevel, source, _, effectiveLevel, useLevel, maxLevel = C_Heirloom.GetHeirloomInfo( i )
		local owned = C_Heirloom.PlayerHasHeirloom( i )
		
		if not hide then
			
			-- only look at the bits for this toon, not any variants that are hidden
			
			if ( not update ) and ( not c[i] or c[i].owned ~= owned ) then
				update = true
			end
		
			if not c[i] then
				c[i] = {
					index = x,
					item = i,
					name = name,
					link = C_Heirloom.GetHeirloomLink( i ),
					--texture = icon,
					src = source,
				}
			end
			
			c[i].owned = owned
			
		else
			--ArkInventory.Output( "hidden = ", spell, " / ", name )
		end
		
	end
	
	return update
	
end



ArkInventory.Collection.Heirloom = { }

function ArkInventory.Collection.Heirloom.OnHide( )
	filter.ignore = false
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_HEIRLOOM_UPDATE_BUCKET", "RESCAN" )
end

function ArkInventory.Collection.Heirloom.IsReady( )
	return data.ready
end

function ArkInventory.Collection.Heirloom.GetCount( )
	return data.owned, data.total
end

function ArkInventory.Collection.Heirloom.Iterate( )
	local t = data.cache
	return ArkInventory.spairs( t, function( a, b ) return ( t[a].index or 0 ) < ( t[b].index or 0 ) end )
end

function ArkInventory:EVENT_WOW_COLLECTION_HEIRLOOM_UPDATE( event, ... )
	
	--ArkInventory.Output( "EVENT_WOW_COLLECTION_HEIRLOOM_UPDATE( ", event, " )" )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_HEIRLOOM_UPDATE_BUCKET", event )
	
end

function ArkInventory:EVENT_ARKINV_COLLECTION_HEIRLOOM_UPDATE_BUCKET( events )
	
	--ArkInventory.Output( "EVENT_ARKINV_COLLECTION_HEIRLOOM_UPDATE_BUCKET( ", events, " )" )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	local loc_id = ArkInventory.Const.Location.Heirloom
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( "IGNORED (NOT MONITORED)" )
		return
	end
	
	if HeirloomsJournal and HeirloomsJournal:IsVisible( ) then
		--ArkInventory.Output( "IGNORED (HEIRLOOM JOURNAL OPEN)" )
		return
	end
	
	if filter.ignore then
		--ArkInventory.Output( "IGNORED (FILTER CHANGED BY ME)" )
		filter.ignore = false
		return
	end
	
	FilterActionBackup( )
	FilterActionClear( )
	local update = Scan( )
	FilterActionRestore( )
	
	if update then
		ArkInventory.ScanCollectionHeirloom( )
	end
	
end
