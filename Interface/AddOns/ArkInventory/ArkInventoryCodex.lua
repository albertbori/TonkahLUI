local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table
local CreateFrame = _G.CreateFrame


local codex_data = {
	location = { },
	player = { },
}

local function helper_CodexInit( loc_id )
	
	codex_data.location[loc_id] = codex_data.location[loc_id] or { }
	
	local codex = codex_data.location[loc_id]
	codex.loc_id = loc_id
	codex.player = codex.player or { }
	codex.toon = codex.toon or { }
	codex.workpad = codex.workpad or { }
	codex.global = codex.global or ArkInventory.acedb.global.options
	
	return codex
	
end

function ArkInventory.GetPlayerStorage( player_id, loc_id, player )
	
	-- points player.data to the requested player_id storage
	
	local loc_id = loc_id or ArkInventory.Const.Location.Bag
	local player_id = player_id or ArkInventory.PlayerIDSelf( )
	local player = player or { }
	
	player.data = ArkInventory.db.player.data[player_id]
	
	if loc_id == ArkInventory.Const.Location.Vault then
		player_id = player.data.info.guild_id or player_id
		player.data = ArkInventory.db.player.data[player_id]
	elseif loc_id == ArkInventory.Const.Location.Pet or loc_id == ArkInventory.Const.Location.Mount or loc_id == ArkInventory.Const.Location.Toybox or loc_id == ArkInventory.Const.Location.Heirloom then
		player_id = ArkInventory.PlayerIDAccount( )
		player.data = ArkInventory.db.player.data[player_id]
	end
	
	return player
	
end

function ArkInventory.GetPlayerInfo( player_id )
	local player_id = player_id or ArkInventory.PlayerIDSelf( )
	return ArkInventory.db.player.data[player_id].info
end

function ArkInventory.GetPlayerCodex( loc_id, rebuild )
	
	--debugprofilestart( )
	
	local loc_id = loc_id or ArkInventory.Const.Location.Bag
	
	codex_data.player[loc_id] = codex_data.player[loc_id] or { }
	
	local codex = codex_data.player[loc_id]
	codex.loc_id = loc_id
	codex.player = codex.player or { }
	codex.workpad = codex.workpad or { }
	
	ArkInventory.GetPlayerStorage( nil, nil, codex.player )
	
	codex.player.previous = codex.player.data.info.player_id
	codex.player.current = codex.player.data.info.player_id
	
	codex.profile_id, codex.profile = ArkInventory.ConfigInternalProfileGet( codex.player.data.profile, true )
	codex.style_id, codex.style = ArkInventory.ConfigInternalDesignGet( codex.profile.location[loc_id].style, true )
	codex.layout_id, codex.layout = ArkInventory.ConfigInternalDesignGet( codex.profile.location[loc_id].layout, true )
	codex.catset_id, codex.catset = ArkInventory.ConfigInternalCategorysetGet( codex.profile.location[loc_id].catset, true )
	
	-- get storage again to retrive account/vault data if required
	ArkInventory.GetPlayerStorage( codex.player.data.info.player_id, loc_id, codex.player )
	
	--local ms = debugprofilestop( )
	--print( "built player codex for " .. codex.player.current .. " / " .. loc_id .. " / ", codex.player.data.info.player_id, " in " .. ms )
	
	return codex
	
end

function ArkInventory.GetLocationCodex( loc_id )
	
	--debugprofilestart( )
	
	local codex = helper_CodexInit( loc_id )
	local changed = false
	
	codex.player.current = codex.player.current or ArkInventory.PlayerIDSelf( )
	
	if codex.player.current ~= codex.player.previous then
		
		--ArkInventory.Output( "codex player changed from ", codex.player.previous, " to ", codex.player.current )
		codex.player.previous = codex.player.current
		
		ArkInventory.GetPlayerStorage( codex.player.current, loc_id, codex.player )
		
		-- used to get the correct profile
		ArkInventory.GetPlayerStorage( codex.player.current, nil, codex.toon )
		if not codex.toon.data.info.isplayer then
			-- drop back to the current player when passed a non player id (vault/account)
			ArkInventory.GetPlayerStorage( nil, nil, codex.toon )
		end
		
		changed = true
		
	end
	
	if not codex.profile_id or codex.profile_id ~= codex.toon.data.profile then
		--ArkInventory.Output( "codex profile changed for ", codex.player.current, " from ", codex.profile_id, " to ", codex.toon.data.profile )
		codex.profile_id, codex.profile = ArkInventory.ConfigInternalProfileGet( codex.toon.data.profile, true )
		changed = true
	end
	
	if not codex.style_id or codex.style_id ~= codex.profile.location[loc_id].style then
		--ArkInventory.Output( "codex style changed for ", codex.player.current, " from ", codex.style_id, " to ", codex.profile.location[loc_id].style )
		codex.style_id, codex.style = ArkInventory.ConfigInternalDesignGet( codex.profile.location[loc_id].style, true )
		changed = true
	end

	if not codex.layout_id or codex.layout_id ~= codex.profile.location[loc_id].layout then
		--ArkInventory.Output( "codex layout changed for ", codex.player.current, " from ", codex.layout_id, " to ", codex.profile.location[loc_id].layout )
		codex.layout_id, codex.layout = ArkInventory.ConfigInternalDesignGet( codex.profile.location[loc_id].layout, true )
		changed = true
	end
	
	if not codex.catset_id or codex.catset_id ~= codex.profile.location[loc_id].catset then
		--ArkInventory.Output( "codex catset changed for ", codex.player.current, " from ", codex.catset_id, " to ", codex.profile.location[loc_id].catset )
		codex.catset_id, codex.catset = ArkInventory.ConfigInternalCategorysetGet( codex.profile.location[loc_id].catset, true )
		changed = true
	end
	
	if changed then
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Init )
	end
	
	--local ms = debugprofilestop( )
	--print( "built location codex for " .. codex.player.current .. " / " .. loc_id .. " / ", codex.player.data.info.player_id, " in " .. ms )
	
	return codex
	
end

function ArkInventory.SetLocationCodex( loc_id, player_id )
	
	local codex = helper_CodexInit( loc_id )
	
	local player = ArkInventory.GetPlayerStorage( player_id, loc_id )
	
	codex.player.previous = codex.player.current
	codex.player.current = player.data.info.player_id
	
	return ArkInventory.GetLocationCodex( loc_id )
	
end

function ArkInventory.CodexReset( loc_id )
	
	if not loc_id then
		table.wipe( codex_data.player )
		table.wipe( codex_data.location )
	else
		codex_data.player[loc_id] = nil
		codex_data.location[loc_id] = nil
	end
	
end
