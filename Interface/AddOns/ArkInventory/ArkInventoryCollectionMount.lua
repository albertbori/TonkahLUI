local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table
local C_MountJournal = _G.C_MountJournal

local PLAYER_MOUNT_LEVEL = 20

local data = {
	total = 0,
	owned = 0,
	cache = { },
	types = { }, -- [spell] = value
}

local function Scan( )
	
	local update = false
	
	if ArkInventory.Global.Mode.Combat then
		-- set to scan when leaving combat
		ArkInventory.Global.LeaveCombatRun.Mount = true
		return
	end
	
	local total = C_MountJournal.GetNumMounts( )
	
	if total == 0 then
		return
	end
	
	if data.total ~= total then
		data.total = total
		update = true
	end
	
	data.owned = 0
	
	local c = data.cache
	
	for _, i in pairs( C_MountJournal.GetMountIDs( ) ) do
		
		local name, spell, icon, active, usable, source, fav, factionSpecific, faction, hide, owned, id = C_MountJournal.GetMountInfoByID( i )
		
		if not hide then
			
			-- only look at the bits for this toon, not any variants that are hidden
			
			if owned then
				data.owned = data.owned + 1
			end
			
			if ( not update ) and ( not c[i] or c[i].owned ~= owned or c[i].fav ~= fav or c[i].usable ~= usable or c[i].active ~= active )then
				update = true
			end
		
			if not c[i] then
				
				local display, description, source, self, mt = C_MountJournal.GetMountInfoExtraByID( i )
				
				c[i] = {
					index = i,
					name = name,
					spell = spell,
					link = GetSpellLink( spell ),
					--texture = icon,
					desc = description,
					src = source,
					did = display,
				}
				
				if mt == 230 or mt == 231 or mt == 241 then
					-- land
					mt = ArkInventory.Const.MountTypes["l"]
				elseif mt == 242 or mt == 247 or mt == 248 then
					-- flying
					mt = ArkInventory.Const.MountTypes["a"]
				elseif mt == 231 or mt == 232 then
					--underwater
					mt = ArkInventory.Const.MountTypes["u"]
				elseif mt == 269 then
					-- surface
					mt = ArkInventory.Const.MountTypes["s"]
				else
					-- unknown
					mt = nil
				end
				
				--ArkInventory.Output( i, " = ", spell, " / ", string.format("%.12f",spell) )
				
				c[i].mt = data.types[spell] or mt or ArkInventory.Const.MountTypes["x"]
				c[i].mto = c[i].mt -- save original mount type (user corrections can override the other value)
				
			end
			
			c[i].owned = owned
			c[i].fav = fav
			c[i].usable = usable
			c[i].active = active
			
		else
			--ArkInventory.Output( "hidden = ", spell, " / ", name )
		end
		
	end
	
	--ArkInventory.Collection.Mount.ApplyUserCorrections( )
	
	return update
	
end


ArkInventory.Collection.Mount = { }

function ArkInventory.Collection.Mount.OnHide( )
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_MOUNT_UPDATE_BUCKET", "RESCAN" )
end

function ArkInventory.Collection.Mount.IsReady( )
	return ( data.total > 0 )
end

function ArkInventory.Collection.Mount.GetCount( )
	return data.owned, data.total
end

function ArkInventory.Collection.Mount.GetMount( id )
	if type( id ) == "number" then
		return data.cache[id]
	end
end

function ArkInventory.Collection.Mount.GetMountBySpell( spell )
	for _, v in pairs( data.cache ) do
		if v.spell == spell then
			return v
		end
	end
end

function ArkInventory.Collection.Mount.Iterate( )
	return ArkInventory.spairs( data.cache, function( a, b ) return ( data.cache[a].name or "" ) < ( data.cache[b].name or "" ) end )
end

function ArkInventory.Collection.Mount.Dismiss( )
	C_MountJournal.Dismiss( )
end

function ArkInventory.Collection.Mount.Summon( id )
	local obj = ArkInventory.Collection.Mount.GetMount( id )
	C_MountJournal.SummonByID( obj.index )
end

function ArkInventory.Collection.Mount.GetFavorite( id )
	local obj = ArkInventory.Collection.Mount.GetMount( id )
	return C_MountJournal.GetIsFavorite( obj.index )
end

function ArkInventory.Collection.Mount.SetFavorite( id, value )
	-- value = true|false
	local obj = ArkInventory.Collection.Mount.GetMount( id )
	--ArkInventory.Output( id, " / ", value, " (", type(value), ") / ", obj )
	C_MountJournal.SetIsFavorite( obj.index, value )
end

function ArkInventory.Collection.Mount.IsUsable( id )
	local obj = ArkInventory.Collection.Mount.GetMount( id )
	-- and yes its still buggy and returning true when you cant actually use the mount
	return ( select( 5, C_MountJournal.GetMountInfoByID( obj.index ) ) )
end

function ArkInventory.Collection.Mount.SkillLevel( )
	
	local skill = 0
	
	if UnitLevel( "player" ) < PLAYER_MOUNT_LEVEL then
		
		--ArkInventory.Output( "player level is too low" )
		skill = 1
		
	else
		
		if GetSpellInfo( ( GetSpellInfo( 90265 ) ) ) then -- master
			skill = 300
			--ArkInventory.Output( "riding skill = ", skill, " / master" )
		elseif GetSpellInfo( ( GetSpellInfo( 34091 ) ) ) then -- artisan
			skill = 300
			--ArkInventory.Output( "riding skill = ", skill, " / artisan" )
		elseif GetSpellInfo( ( GetSpellInfo( 34090 ) ) ) then -- expert
			skill = 225
			--ArkInventory.Output( "riding skill = ", skill, " / expert" )
		elseif GetSpellInfo( ( GetSpellInfo( 33391 ) ) ) then -- journeyman
			skill = 150
			--ArkInventory.Output( "riding skill = ", skill, " / journeyman" )
		elseif GetSpellInfo( ( GetSpellInfo( 33388 ) ) ) then -- apprentice
			skill = 75
			--ArkInventory.Output( "riding skill = ", skill, " / apprentice" )
		end
		
	end
	
	return skill
	
end

function ArkInventory.Collection.Mount.StoreMountType( spell, mt )
	data.types[spell] = mt
end

function ArkInventory.Collection.Mount.ApplyUserCorrections( )
	
	-- apply user corrections (these are global settings so the mount may not exist for this character)
	
	for _, md in ArkInventory.Collection.Mount.Iterate( ) do
		
		local correction = ArkInventory.db.option.mount.correction[md.spell]
		
		if correction ~= nil then -- check for nil as we use both true and false
			if correction == md.mto then
				-- code has been updated, clear correction
				--ArkInventory.Output( "clearing mount correction ", md.spell, ": system=", md.mt, ", correction=", correction )
				ArkInventory.db.option.mount.correction[md.spell] = nil
				md.mt = md.mto
			else
				-- apply correction
				--ArkInventory.Output( "correcting mount ", md.spell, ": system=", md.mt, ", correction=", correction )
				md.mt = correction
			end
		end
		
	end
	
end


function ArkInventory:EVENT_WOW_COLLECTION_MOUNT_UPDATE( event )
	
	if event ~= "COMPANION_UPDATE" then
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_MOUNT_UPDATE_BUCKET", event )
	end
	
end

function ArkInventory:EVENT_ARKINV_COLLECTION_MOUNT_UPDATE_BUCKET( events )
	
	--ArkInventory.Output( "EVENT_ARKINV_COLLECTION_MOUNT_UPDATE_BUCKET( ", events, " )" ) -- ****
	
	if not ArkInventory:IsEnabled( ) then return end
	
	local loc_id = ArkInventory.Const.Location.Mount
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( "IGNORED (NOT MONITORED)" )
		return
	end
	
	if MountJournal and MountJournal:IsVisible( ) then
		--ArkInventory.Output( "IGNORED (MOUNT JOURNAL OPEN)" )
		return
	end
	
	local update = Scan( )
	
	if update then
		ArkInventory.ScanCollectionMount( )
	end
	
end
