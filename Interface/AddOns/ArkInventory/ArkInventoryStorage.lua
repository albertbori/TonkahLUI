local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table

local ArkInventoryScanCleanupList = { }

function ArkInventory.EraseSavedData( player_id, loc_id, silent )

	-- /run ArkInventory.EraseSavedData( )
	
	--ArkInventory.Output( "EraseSavedData( ", player_id, ", ", loc_id, ", ", silent, " )" )
	
	local rescan
	
	-- erase item/tooltip cache
	ArkInventory.Table.Clean( ArkInventory.Global.Cache.ItemCountTooltip, nil, true )
	ArkInventory.Table.Clean( ArkInventory.Global.Cache.ItemCountRaw, nil, true )
	ArkInventory.Table.Clean( ArkInventory.Global.Cache.ItemCount, nil, true )
	
	local info = ArkInventory.GetPlayerInfo( )
	
	-- erase data
	for pk, pv in pairs( ArkInventory.db.player.data ) do
		
		if ( not player_id ) or ( pk == player_id ) then
			
			for lk, lv in pairs( pv.location ) do
				
				if ( loc_id == nil ) or ( lk == loc_id ) then
					
					ArkInventory.Frame_Main_Hide( lk )
					
					lv.slot_count = 0
					
					for bk, bv in pairs( lv.bag ) do
						ArkInventory.Table.Clean( bv )
						bv.status = ArkInventory.Const.Bag.Status.Unknown
						bv.type = ArkInventory.Const.Slot.Type.Unknown
						bv.count = 0
						bv.empty = 0
						table.wipe( bv.slot )
					end
					
					ArkInventory.Frame_Main_DrawStatus( lk, ArkInventory.Const.Window.Draw.Recalculate )
					if ArkInventory.Global.Location[lk] and not silent then
						ArkInventory.Output( "Saved ", string.lower( ArkInventory.Global.Location[lk].Name ), " data for ", pk, " has been erased" )
					end
					
				end
				
			end
			
			if pk == info.player_id then
				rescan = true
			else
				if ( loc_id == nil ) or ( ( loc_id == ArkInventory.Const.Location.Vault ) and ( pv.info.class == "GUILD" ) ) then
					table.wipe( pv.info )
				end
			end
			
		end
		
	end
	
	if rescan then
		-- current player was wiped, need to rescan
		ArkInventory.PlayerInfoSet( )
		ArkInventory.ScanLocation( )
	end
	
end


function ArkInventory.PlayerInfoSet( )
	
	--ArkInventory.Output( "PlayerInfoSet" )
	
	local n = UnitName( "player" )
	local r = GetRealmName( )
	local id = ArkInventory.PlayerIDSelf( )
	
	local player = ArkInventory.db.player.data[id].info
	
	player.guid = UnitGUID( "player" ) or player.guid
	player.name = n
	player.realm = r
	player.player_id = id
	player.isplayer = true
	
	local faction, faction_local = UnitFactionGroup( "player" )
	player.faction = faction or player.faction
	player.faction_local = faction_local or player.faction_local
	if player.faction_local == "" then
		player.faction_local = FACTION_STANDING_LABEL4
	end
	
	-- WARNING, most of this stuff is not available upon first login, even when the mod gets to OnEnabled (ui reloads are fine), and some are not available on logout
	
	local class_local, class = UnitClass( "player" )
	player.class_local = class_local or player.class_local
	player.class = class or player.class
	
	player.level = UnitLevel( "player" ) or player.level or 1
	
	local race_local, race = UnitRace( "player" )
	player.race_local = race_local or player.race_local
	player.race = race or player.race
	
	player.gender = UnitSex( "player" ) or player.gender
	
	local m = GetMoney( ) or player.money
	if m > 0 then  -- returns 0 on logout so dont wipe the current value
		player.money = m
	end
	
	-- ACCOUNT
	local id = ArkInventory.PlayerIDAccount( )
	local account = ArkInventory.db.player.data[id].info
	
	account.name = ArkInventory.Localise["LOCATION_ACCOUNT"]
	account.realm = player.realm
	account.player_id = id
	account.faction = ""
	account.faction_local = ""
	account.class = "ACCOUNT"
	account.class_local = ArkInventory.Localise["LOCATION_ACCOUNT"]
	account.level = account.level or 1
	
	-- VAULT
	local gname, grank_text, grank, grealm = GetGuildInfo( "player" )
	--ArkInventory.Output( "IsInGuild=[", IsInGuild( ), "], g=[", gn, "], r=[", grealm, "]" )
	
	if not gname then
		
		if IsInGuild( ) then
			--ArkInventory.OutputWarning( "you are in a guild but no guild name was found, keep previous data" )
		else
			player.guild_id = nil
		end
		
	else
		
		player.guild_id = string.format( "%s%s%s%s", ArkInventory.Const.GuildTag, gname, ArkInventory.Const.PlayerIDSep, grealm or r )
		
	end
	
	
	return player
	
end

function ArkInventory.VaultInfoSet( )
	
	local n, _, _, r = GetGuildInfo( "player" )
	local player_info = ArkInventory.GetPlayerInfo( )
	
	if n then
		
		local id = string.format( "%s%s%s%s", ArkInventory.Const.GuildTag, n, ArkInventory.Const.PlayerIDSep, r or player_info.realm )
		local guild = ArkInventory.db.player.data[id].info
		
		guild.name = n
		guild.realm = r or player_info.realm
		guild.player_id = id
		guild.faction = player_info.faction
		guild.faction_local = player_info.faction_local
		guild.class = "GUILD"
		guild.class_local = GUILD
		
		guild.guild_id = id
		guild.level = 1 --GetGuildLevel( )
		guild.money = GetGuildBankMoney( ) or 0
		
		player_info.guild_id = id
		
	else
		
		player_info.guild_id = nil
		
	end
	
end

function ArkInventory.PlayerIDSelf( )
	return string.format( "%s%s%s", UnitName( "player" ), ArkInventory.Const.PlayerIDSep, GetRealmName( ) )
end

function ArkInventory.PlayerIDAccount( )
	local a = "!ACCOUNT"
	return string.format( "%s%s%s", a, ArkInventory.Const.PlayerIDSep, a )
end

function ArkInventory:EVENT_ARKINV_STORAGE( msg, arg1, arg2, arg3, arg4 )
	
	--ArkInventory.Output( "EVENT_ARKINV_STORAGE( ", arg1, ", ", arg2, ", ", arg3, ", ", arg4, " )" )
	
	if arg1 == ArkInventory.Const.Event.BagUpdate then
		
		--ArkInventory.Output( "BAG_UPDATE( ", arg2, ", [", arg4, "] )" )
		ArkInventory.Frame_Main_Generate( arg2, arg4 )
		
	else
		
		error( string.format( "code failure: unknown storage event [%s]", arg1 ) )
		
	end
	
end


function ArkInventory:EVENT_WOW_PLAYER_ENTER( )

	--ArkInventory.Output( "EVENT_WOW_PLAYER_ENTER" )
	
	ArkInventory.PlayerInfoSet( )
	
end

function ArkInventory:EVENT_WOW_PLAYER_LEAVE( )

	--ArkInventory.Output( "EVENT_WOW_PLAYER_LEAVE" )
	
	ArkInventory.Frame_Main_Hide( )
	
	ArkInventory.PlayerInfoSet( )
	
	ArkInventory.ScanAuctionExpire( )
	
	local player_id = ArkInventory.PlayerIDSelf( )
	
	for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
		if not ArkInventory.LocationIsSaved( loc_id ) then
			ArkInventory.EraseSavedData( player_id, loc_id, true )
		end
	end
	
end

function ArkInventory:EVENT_WOW_PLAYER_MONEY( )

	--ArkInventory.Output( "PLAYER_MONEY" )

	if ArkInventory.db.option.junk.sell then
		
		if ArkInventory.db.option.junk.notify and ( ArkInventory.Global.Junk.sold > 0 or ArkInventory.Global.Junk.destroyed > 0 ) then
			
			--ArkInventory.Output( "end amount ", GetMoney( ) )
			ArkInventory.Global.Junk.money = GetMoney( ) - ArkInventory.Global.Junk.money
			--ArkInventory.Output( "difference ", ArkInventory.Global.Junk.money )
			--ArkInventory.Output( "sold ", ArkInventory.Global.Junk.sold )
			--ArkInventory.Output( "destroyed ", ArkInventory.Global.Junk.destroyed )
			
			if ArkInventory.Global.Junk.sold > 0 and ArkInventory.Global.Junk.money > 0 then
				ArkInventory.Output( string.format( ArkInventory.Localise["CONFIG_JUNK_SELL_NOTIFY_SOLD"], ArkInventory.MoneyText( ArkInventory.Global.Junk.money, true ) ) )
			end
			
			if ArkInventory.Global.Junk.destroyed > 0 then
				ArkInventory.Output( string.format( ArkInventory.Localise["CONFIG_JUNK_SELL_NOTIFY_DESTROYED"], ArkInventory.Global.Junk.destroyed ) )
			end
			
		end
		
		ArkInventory.Global.Junk.sold = 0
		ArkInventory.Global.Junk.destroyed = 0
		ArkInventory.Global.Junk.money = 0
		
	end
	
	
	ArkInventory.PlayerInfoSet( )
	
	-- set saved money amount here as well
	local info = ArkInventory.GetPlayerInfo( )
	info.money = GetMoney( )
	
	ArkInventory.LDB.Money:Update( )
	
end

function ArkInventory:EVENT_WOW_PLAYER_SKILLS( )

	--ArkInventory.Output( "SKILL_LINES_CHANGED" )
	
	ArkInventory.ScanProfessions( )
	ArkInventory.ScanTradeskill( )
	
end


function ArkInventory:EVENT_WOW_COMBAT_ENTER( )
	
	--ArkInventory.Output( "EVENT_WOW_COMBAT_ENTER" )
	
	ArkInventory.Global.Mode.Combat = true
	
	if ArkInventory.db.option.auto.close.combat then
		ArkInventory.Frame_Main_Hide( )
	end
	
end

function ArkInventory:EVENT_WOW_COMBAT_LEAVE( )
	
	--ArkInventory.Output( "EVENT_WOW_COMBAT_LEAVE" )
	
	ArkInventory.Global.Mode.Combat = false
	
	if ArkInventory.Global.LeaveCombatRun.PetJournal then
		ArkInventory.Global.LeaveCombatRun.PetJournal = false
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_RELOAD_BUCKET", "RESCAN" )
	end
	
	if ArkInventory.Global.LeaveCombatRun.Mount then
		ArkInventory.Global.LeaveCombatRun.Mount = false
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_MOUNT_UPDATE_BUCKET", "RESCAN" )
	end
	
	if ArkInventory.Global.LeaveCombatRun.Toybox then
		ArkInventory.Global.LeaveCombatRun.Toybox = false
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_TOYBOX_UPDATE_BUCKET", "RESCAN" )
	end
	
	if ArkInventory.Global.LeaveCombatRun.Heirloom then
		ArkInventory.Global.LeaveCombatRun.Heirloom = false
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_HEIRLOOM_UPDATE_BUCKET", "RESCAN" )
	end
	
	for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
		if loc_data.canView then
			
			if loc_data.tainted then
				
				ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
				
			else
				
				local me = ArkInventory.GetPlayerCodex( loc_id )
				if me.style.slot.cooldown.show and not me.style.slot.cooldown.combat  then
					ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
				end
				
			end
			
		end
	end
	
	ArkInventory.LDB.Mounts:Update( )
	
end


function ArkInventory:EVENT_ARKINV_BAG_UPDATE_BUCKET( bagTable )
	
	--ArkInventory.Output( "EVENT_ARKINV_BAG_UPDATE_BUCKET( ", bagTable, " )" )
	
	-- bagTable[bag_id] = true

	local bag_changed = false
	
	for blizzard_id in pairs( bagTable ) do
		ArkInventory.Scan( blizzard_id )
		if ArkInventory.BagID_Internal( blizzard_id ) == ArkInventory.Const.Location.Bag then
			bag_changed = true
		end
		--ArkInventory.RestackResume( ArkInventory.BagID_Internal( blizzard_id ) )
	end

	-- re-scan empty bag slots to wipe their data - no events are triggered when you move a bag from one bag slot into an empty bag slot (for the empty slot, new slot is fine)
	if bag_changed then
		for _, bag_id in pairs( ArkInventory.Global.Location[ArkInventory.Const.Location.Bag].Bags ) do
			if GetContainerNumSlots( bag_id ) == 0 then
				ArkInventory.ScanBag( bag_id )
			end
		end
	end

	
 	-- instant sorting enabled
	for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
		if loc_data.canView then
			local me = ArkInventory.GetPlayerCodex( loc_id )
			if me.style.sort.when == ArkInventory.Const.SortWhen.Instant then
				ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
			end
		end
	end
	
	ArkInventory.LDB.Bags:Update( )
	
end

function ArkInventory:EVENT_WOW_BAG_UPDATE( event, blizzard_id )
	
	--ArkInventory.Output( "EVENT_WOW_BAG_UPDATE( ", blizzard_id, " )" )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_BUCKET", blizzard_id )
	
end

function ArkInventory:EVENT_WOW_BAG_LOCK( event, arg1, arg2 )

	--ArkInventory.Output( "EVENT_WOW_BAG_LOCK( ", arg1, ",", arg2, " )" )

	if not arg2 then
	
		-- inventory lock
		
		for blizzard_id = 1, NUM_BAG_SLOTS do
			local slotName = string.format( "Bag%sSlot", blizzard_id - 1 )
			if arg1 == GetInventorySlotInfo( slotName ) then
				local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
				ArkInventory.ObjectLockChanged( loc_id, bag_id, nil )
			end
		end
		
		--ArkInventory.RestackResume( loc_id )
	
	else
	
		if arg1 == BANK_CONTAINER then
		
			local count = GetContainerNumSlots( BANK_CONTAINER )
	
			if arg2 <= count then
				-- item lock
				local loc_id, bag_id = ArkInventory.BagID_Internal( arg1 )
				ArkInventory.ObjectLockChanged( loc_id, bag_id, arg2 )
			else
				-- bag lock
				local loc_id, bag_id = ArkInventory.BagID_Internal( arg2 - count + NUM_BAG_SLOTS )
				ArkInventory.ObjectLockChanged( loc_id, bag_id, nil )
			end

		else
	
			-- item lock
			local loc_id, bag_id = ArkInventory.BagID_Internal( arg1 )
			ArkInventory.ObjectLockChanged( loc_id, bag_id, arg2 )
			
		end
	
		--ArkInventory.RestackResume( loc_id )
		
	end

end

function ArkInventory:EVENT_ARKINV_CHANGER_UPDATE_BUCKET( arg1 )

	--ArkInventory.Output( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET( ", arg1, " )" )
	
	-- arg1 = table in the format loc_id_id=true so we need to loop through them

	for k in pairs( arg1 ) do
		ArkInventory.Frame_Changer_Update( k )
	end
	
end


function ArkInventory:EVENT_WOW_BANK_ENTER( event, ... )
	
	--ArkInventory.Output( "EVENT_WOW_BANK_ENTER( ", event, " )" )
	
	local loc_id = ArkInventory.Const.Location.Bank
	
	ArkInventory.Global.Mode.Bank = true
	
	ArkInventory.ScanLocation( loc_id )
	
	ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Show( loc_id )
		ArkInventory.Frame_Main_Generate( loc_id )
	end
	
	if ArkInventory.db.option.auto.open.bank and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
	end
	
end

function ArkInventory:EVENT_WOW_BANK_LEAVE( )
	
	--ArkInventory.Output( "EVENT_WOW_BANK_LEAVE" )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_BANK_LEAVE_BUCKET" )
	
end

function ArkInventory:EVENT_ARKINV_BANK_LEAVE_BUCKET( )
	
	--ArkInventory.Output( "EVENT_ARKINV_BANK_LEAVE_BUCKET" )
	
	local loc_id = ArkInventory.Const.Location.Bank
	
	ArkInventory.Global.Mode.Bank = false
	ArkInventory.Global.Location[loc_id].isOffline = true
	
	ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Hide( loc_id )
	end
	
	if ArkInventory.db.option.auto.close.bank and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end
	
	if not ArkInventory.LocationIsSaved( loc_id ) then
		local me = ArkInventory.GetPlayerCodex( )
		ArkInventory.EraseSavedData( me.player.data.info.player_id, loc_id, not me.profile.location[loc_id].notify )
	end
	
end

function ArkInventory:EVENT_WOW_BANK_UPDATE( event, arg1 )

	-- player changed a bank bag or item

	--ArkInventory.Output( "EVENT_WOW_BANK_UPDATE( ", arg1, " ) " )

	local count = GetContainerNumSlots( BANK_CONTAINER )
	
	if arg1 <= count then
		-- item was changed
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_BUCKET", BANK_CONTAINER )
	else
		-- bag was changed
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_BUCKET", arg1 - count + NUM_BAG_SLOTS )
	end
	
end

function ArkInventory:EVENT_WOW_BANK_SLOT( )

	--ArkInventory.Output( "EVENT_WOW_BANK_SLOT" )
	
	-- player just purchased a bank bag slot, re-scan and force a reload
	
	ArkInventory.ScanLocation( ArkInventory.Const.Location.Bank )
	ArkInventory.Frame_Main_Generate( ArkInventory.Const.Location.Bank, ArkInventory.Const.Window.Draw.Refresh )
	
end

function ArkInventory:EVENT_WOW_BANK_TAB( event )
	
	--ArkInventory.Output( "EVENT_WOW_BANK_TAB" )
	
	-- player just purchased a bank tab, re-scan and force a reload
	
	if event == "REAGENTBANK_PURCHASED" then
		ArkInventory:UnregisterEvent( "REAGENTBANK_PURCHASED" )
		ArkInventory.ScanLocation( ArkInventory.Const.Location.Bank )
		ArkInventory.Frame_Main_Generate( ArkInventory.Const.Location.Bank, ArkInventory.Const.Window.Draw.Refresh )
	end
	
end

function ArkInventory:EVENT_WOW_REAGENTBANK_UPDATE( event, arg1 )

	--ArkInventory.Output( "EVENT_WOW_REAGENTBANK_UPDATE( ", arg1, " ) " )

	ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_BUCKET", REAGENTBANK_CONTAINER )
	
end

function ArkInventory:EVENT_WOW_VAULT_ENTER( )
	
	--ArkInventory.Output( "EVENT_WOW_VAULT_ENTER" )
	
	local loc_id = ArkInventory.Const.Location.Vault
	
	ArkInventory.Global.Mode.Vault = true
	ArkInventory.Global.Location[loc_id].isOffline = false
	
	ArkInventory.VaultInfoSet( )
	
	ArkInventory.ScanVaultHeader( )
	
	QueryGuildBankTab( GetCurrentGuildBankTab( ) or 1 )
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Show( loc_id )
		ArkInventory.Frame_Main_Generate( loc_id )
	end
	
	if ArkInventory.db.option.auto.open.vault and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
	end
	
end

function ArkInventory:EVENT_WOW_VAULT_LEAVE( )

	--ArkInventory.Output( "EVENT_WOW_VAULT_LEAVE" )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_VAULT_LEAVE_BUCKET" )
	
end

function ArkInventory:EVENT_ARKINV_VAULT_LEAVE_BUCKET( )

	--ArkInventory.Output( "EVENT_ARKINV_VAULT_LEAVE_BUCKET" )
	
	local loc_id = ArkInventory.Const.Location.Vault

	ArkInventory.Global.Mode.Vault = false
	ArkInventory.Global.Location[loc_id].isOffline = true

	--ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Hide( loc_id )
	end
	
	if ArkInventory.db.option.auto.close.vault and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end

	if not ArkInventory.LocationIsSaved( loc_id ) then
		local me = ArkInventory.GetPlayerCodex( )
		ArkInventory.EraseSavedData( me.player.data.info.player_id, loc_id, not me.profile.location[loc_id].notify )
	end
	
end

function ArkInventory:EVENT_ARKINV_VAULT_UPDATE_BUCKET( )
	
	--ArkInventory.Output( "EVENT_ARKINV_VAULT_UPDATE_BUCKET" )
	
	local loc_id = ArkInventory.Const.Location.Vault
	
	ArkInventory.ScanVault( )
	ArkInventory.ScanVaultHeader( )
	
	--ArkInventory.RestackResume( ArkInventory.Const.Location.Vault )
	
 	-- instant sorting enabled
	local me = ArkInventory.GetPlayerCodex( loc_id )
	if me.style.sort.when == ArkInventory.Const.SortWhen.Instant then
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
end

function ArkInventory:EVENT_WOW_VAULT_UPDATE( event, ... )
	
	--local v1, v2, v3, v4
	--ArkInventory.Output( "EVENT_WOW_VAULT_UPDATE( ", v1, ", ", v2, ", ", v3, ", ", v4, " )"  )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_VAULT_UPDATE_BUCKET" )
	
end

function ArkInventory:EVENT_WOW_VAULT_LOCK( event, ... )
	
	--local v1, v2, v3, v4
	--ArkInventory.Output( "EVENT_WOW_VAULT_LOCK( ", v1, ", ", v2, ", ", v3, ", ", v4, " )"  )
	
	local loc_id = ArkInventory.Const.Location.Vault
	local bag_id = GetCurrentGuildBankTab( )
	
	for slot_id = 1, ArkInventory.Global.Location[loc_id].maxSlot[bag_id] or 0 do
		ArkInventory.ObjectLockChanged( loc_id, bag_id, slot_id )
	end
	
	--ArkInventory.RestackResume( ArkInventory.Const.Location.Vault )
	
end

function ArkInventory:EVENT_WOW_VAULT_MONEY( )

	--ArkInventory.Output( "EVENT_WOW_VAULT_MONEY" )

	local loc_id = ArkInventory.Const.Location.Vault
	
	ArkInventory.VaultInfoSet( )
	
end

function ArkInventory:EVENT_WOW_VAULT_TABS( )
	
	--ArkInventory.Output( "EVENT_WOW_VAULT_TABS" )
	
	local loc_id = ArkInventory.Const.Location.Vault
	if not ArkInventory.Global.Location[loc_id].isOffline then
		-- ignore pre vault entrance events
		ArkInventory.ScanVaultHeader( )
	end
	
end

function ArkInventory:EVENT_WOW_VAULT_LOG( event )

	--ArkInventory.Output( "EVENT_WOW_VAULT_LOG: ", tab )
	
	ArkInventory.Frame_Vault_Log_Update( )
	
end

function ArkInventory:EVENT_WOW_VAULT_INFO( event )

	--ArkInventory.Output( "EVENT_WOW_VAULT_INFO: ", tab )
	
	ArkInventory.Frame_Vault_Info_Update( )
	
end


function ArkInventory:EVENT_ARKINV_VOID_UPDATE_BUCKET( )
	
	--ArkInventory.Output( "EVENT_ARKINV_VOID_UPDATE_BUCKET" )
	
	local loc_id = ArkInventory.Const.Location.Void

	ArkInventory.ScanLocation( loc_id )
	
 	-- instant sorting enabled
	local me = ArkInventory.GetPlayerCodex( loc_id )
	if me.style.sort.when == ArkInventory.Const.SortWhen.Instant then
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
end

function ArkInventory:EVENT_WOW_VOID_UPDATE( event )
	
	--ArkInventory.Output( "EVENT_WOW_VOID_UPDATE: ", arg1, ", ", arg2, ", ", arg3 )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_VOID_UPDATE_BUCKET" )
	
end


function ArkInventory:EVENT_ARKINV_INVENTORY_CHANGE_BUCKET( )
	
	--ArkInventory.Output( "EVENT_ARKINV_INVENTORY_CHANGE_BUCKET" )
	
	local loc_id = ArkInventory.Const.Location.Wearing
	
	ArkInventory.ScanLocation( loc_id )
	
end

function ArkInventory:EVENT_WOW_INVENTORY_CHANGE( event, arg1, arg2 )
	
	--ArkInventory.Output( "EVENT_WOW_INVENTORY_CHANGE( ", arg1, ", ", arg2, " ) " )

	if arg1 == "player" then
		ArkInventory:SendMessage( "EVENT_ARKINV_INVENTORY_CHANGE_BUCKET" )
	end
	
end


function ArkInventory:EVENT_WOW_MAIL_ENTER( event, ... )
	
	--ArkInventory.Output( "MAIL_ENTER( ", event, " )" )
	
	local BACKPACK_WAS_OPEN = ArkInventory.Frame_Main_Get( ArkInventory.Const.Location.Bag ):IsVisible( )
	
	MailFrame_OnEvent( MailFrame, event, ... )
	
	ArkInventory.Global.Mode.Mail = true
	
	
	if ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		
		-- blizzard auto-opens the backpack when you open the mailbox
		if not ArkInventory.db.option.auto.open.mail and not BACKPACK_WAS_OPEN then
			-- it wasnt already opened, blizzard opened it, so we need to close it
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		end
		
	end
	
	
	local loc_id = ArkInventory.Const.Location.Mail
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Show( loc_id )
		ArkInventory.Frame_Main_Generate( loc_id )
	end
	
end

function ArkInventory:EVENT_WOW_MAIL_LEAVE( )
	
	--ArkInventory.Output( "MAIL_LEAVE" )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_MAIL_LEAVE_BUCKET" )
	
end

function ArkInventory:EVENT_ARKINV_MAIL_LEAVE_BUCKET( )
	
	--ArkInventory.Output( "MAIL_LEAVE_BUCKET" )
	
	ArkInventory.Global.Mode.Mail = false
	
	if not ArkInventory:IsEnabled( ) then return end
	
	
	local loc_id = ArkInventory.Const.Location.Mail
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Hide( loc_id )
	end
	
	if ArkInventory.db.option.auto.close.mail and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end
	
	if not ArkInventory.LocationIsSaved( loc_id ) then
		local me = ArkInventory.GetPlayerCodex( )
		ArkInventory.EraseSavedData( me.player.data.info.player_id, loc_id, not me.profile.location[loc_id].notify )
	end
	
end

function ArkInventory:EVENT_ARKINV_MAIL_UPDATE_BUCKET( )
	
	--ArkInventory.Output( "MAIL_UPDATE_BUCKET" )
	
	ArkInventory.ScanMailInbox( )
	
end

function ArkInventory:EVENT_WOW_MAIL_UPDATE_MASSIVE_BUCKET( )
	
	--ArkInventory.Output( "MAIL_UPDATE_BUCKET" )
	
	ArkInventory.ScanMailInbox( true )
	
end

function ArkInventory:EVENT_WOW_MAIL_UPDATE( event )

	--ArkInventory.Output( "MAIL_UPDATE( ", event, " )" )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_MAIL_UPDATE_BUCKET" )
	
end


function ArkInventory:EVENT_WOW_MAIL_SEND_SUCCESS( )
	
	--ArkInventory.Output( "MAIL_SEND_SUCCESS( ", ArkInventory.Global.Cache.SentMail, " )" )
	
	ArkInventory.ScanMailSentData( )
	
end

function ArkInventory.HookMailSend( ... )
	
	--ArkInventory.Output( "HookMailSend( )" )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	local loc_id = ArkInventory.Const.Location.Mail
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then return end
	
	table.wipe( ArkInventory.Global.Cache.SentMail )
	
	local recipient, subject, body = ...
	local n, r = strsplit( "-", recipient )
	r = r or GetRealmName( )
	
	local player_id = string.format( "%s%s%s", n, ArkInventory.Const.PlayerIDSep, r )
	if ArkInventory.db.player.data[player_id].info.player_id ~= player_id then
		return
	end
	
	-- known character, store sent mail data
	
	ArkInventory.Global.Cache.SentMail.to = player_id
	local info = ArkInventory.GetPlayerInfo( )
	ArkInventory.Global.Cache.SentMail.from = info.player_id
	ArkInventory.Global.Cache.SentMail.age = ArkInventory.TimeAsMinutes( )
	
	local name, texture, _, count
	for x = 1, ATTACHMENTS_MAX_SEND do
		
		name, texture, _, count = GetSendMailItem( x )
		if name then
			ArkInventory.Global.Cache.SentMail[x] = { n = name, c = count, h = GetSendMailItemLink( x ) }
		end
		
	end
	
end

function ArkInventory.HookMailReturn( index )
	
	--ArkInventory.Output( "HookMailReturn( ", index, " )" )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	local loc_id = ArkInventory.Const.Location.Mail
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then return end
	
	table.wipe( ArkInventory.Global.Cache.SentMail )
	
	local _, _, recipient = GetInboxHeaderInfo( index )
	
	local n, r = strsplit( "-", recipient )
	r = r or GetRealmName( )
	
	local player_id = string.format( "%s%s%s", n, ArkInventory.Const.PlayerIDSep, r )
	if ArkInventory.db.player.data[player_id].info.player_id ~= player_id then
		return
	end
	
	-- known character, store sent mail data
	ArkInventory.Global.Cache.SentMail.to = player_id
	local info = ArkInventory.GetPlayerInfo( )
	ArkInventory.Global.Cache.SentMail.from = info.player_id
	ArkInventory.Global.Cache.SentMail.age = ArkInventory.TimeAsMinutes( )
	
	local name, texture, _, count
	for x = 1, ATTACHMENTS_MAX_RECEIVE do
		
		name, texture, _, count = GetInboxItem( index, x )
		if name then
			ArkInventory.Global.Cache.SentMail[x] = { n = name, c = count, h = GetInboxItemLink( index, x ) }
		end
		
	end
	
	ArkInventory.ScanMailSentData( )
	
end

function ArkInventory:EVENT_WOW_TRADE_ENTER( )

	--ArkInventory.Output( "EVENT_WOW_TRADE_ENTER" )
	
	if ArkInventory.db.option.auto.open.trade and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
	end
	
end

function ArkInventory:EVENT_WOW_TRADE_LEAVE( )

	--ArkInventory.Output( "EVENT_WOW_TRADE_LEAVE" )
	
	if ArkInventory.db.option.auto.close.trade and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end
	
end


function ArkInventory:EVENT_WOW_AUCTION_ENTER( )
	
	--ArkInventory.Output( "EVENT_WOW_AUCTION_ENTER" )
	
	ArkInventory.Global.Mode.Auction = true
	
	if ArkInventory.db.option.auto.open.auction and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
	end
	
end

function ArkInventory:EVENT_WOW_AUCTION_LEAVE( )
	
	--ArkInventory.Output( "EVENT_WOW_AUCTION_LEAVE" )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_AUCTION_LEAVE_BUCKET" )
	
end

function ArkInventory:EVENT_ARKINV_AUCTION_LEAVE_BUCKET( )
	
	--ArkInventory.Output( "EVENT_ARKINV_AUCTION_LEAVE_BUCKET" )
	
	if ArkInventory.db.option.auto.close.auction and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end
	
	ArkInventory.Global.Mode.Auction = false
	
end

function ArkInventory:EVENT_WOW_AUCTION_UPDATE( )
	
	--ArkInventory.Output( "EVENT_WOW_AUCTION_UPDATE" )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_AUCTION_UPDATE_BUCKET" )
	
end

function ArkInventory:EVENT_ARKINV_AUCTION_UPDATE_BUCKET( )
	
	--ArkInventory.Output( "EVENT_ARKINV_AUCTION_UPDATE_BUCKET" )
	
	ArkInventory.ScanAuction( )
	
end

function ArkInventory:EVENT_ARKINV_AUCTION_UPDATE_MASSIVE_BUCKET( )
	
	--ArkInventory.Output( "EVENT_ARKINV_AUCTION_UPDATE_MASSIVE_BUCKET" )
	
	ArkInventory.ScanAuction( true )
	
end

function ArkInventory:EVENT_WOW_MERCHANT_ENTER( event, ... )
	
	--ArkInventory.Output( "EVENT_WOW_MERCHANT_ENTER( ", event, " )" )
	
	local BACKPACK_WAS_OPEN = ArkInventory.Frame_Main_Get( ArkInventory.Const.Location.Bag ):IsVisible( )
	
	MerchantFrame_OnEvent( MerchantFrame, event, ... )
	
	ArkInventory.Global.Mode.Merchant = true
	
	-- merchant / vendor
	
	ArkInventory.JunkSell( )
	
	if ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		
		-- blizzard auto-opens the backpack when you talk to a merchant
		if not ArkInventory.db.option.auto.open.merchant and not BACKPACK_WAS_OPEN then
			-- it wasnt already opened, blizzard opened it, so we need to close it
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		end
		
	end
	
end

function ArkInventory:EVENT_WOW_MERCHANT_LEAVE( event )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_MERCHANT_LEAVE_BUCKET" )
	
end

function ArkInventory:EVENT_ARKINV_MERCHANT_LEAVE_BUCKET( )
	
	--ArkInventory.Output( "EVENT_ARKINV_MERCHANT_LEAVE_BUCKET" )
	
	ArkInventory.Global.Mode.Merchant = false
	
	if ArkInventory.db.option.auto.close.merchant and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end
	
end

function ArkInventory:EVENT_WOW_TRANSMOG_ENTER( event, ... )
	
	--ArkInventory.Output( "EVENT_WOW_TRANSMOG_ENTER( ", event, " )" )
	
	local BACKPACK_WAS_OPEN = ArkInventory.Frame_Main_Get( ArkInventory.Const.Location.Bag ):IsVisible( )
	
	-- reforger / transmogrify
	
	if ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		if ArkInventory.db.option.auto.open.merchant and not BACKPACK_WAS_OPEN then
			ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
		end
	end
	
end

function ArkInventory:EVENT_WOW_CURRENCY_UPDATE( )

	--ArkInventory.Output( "EVENT_WOW_CURRENCY_UPDATE" )
	
	local loc_id = ArkInventory.Const.Location.Token
	
	ArkInventory.ScanLocation( loc_id )
	
	ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	
	ArkInventory.Frame_Status_Update_Tracking( )
	
	ArkInventory.LDB.Tracking_Currency:Update( )
	
end

function ArkInventory:EVENT_WOW_EQUIPMENT_SETS_CHANGED( )
	
	--ArkInventory.Output( "EVENT_WOW_EQUIPMENT_SETS_CHANGED( )" )
	
	ArkInventory.ItemCacheClear( )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory:EVENT_ARKINV_BAG_UPDATE_COOLDOWN_BUCKET( arg )
	
	for loc_id in pairs( arg ) do
		local me = ArkInventory.GetPlayerCodex( loc_id )
		if me.style.slot.cooldown.show then
			if not ArkInventory.Global.Mode.Combat or me.style.slot.cooldown.combat then
				if me.style.sort.when ~= ArkInventory.Const.SortWhen.Instant then
					ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
				end
			end
		end
	end
	
end

function ArkInventory:EVENT_WOW_BAG_UPDATE_COOLDOWN( event, arg1, arg2, arg3, arg4 )
	
	--ArkInventory.Output( "EVENT_WOW_BAG_UPDATE_COOLDOWN( ", arg1, ", ", arg2, ", ", arg3, ", ", arg4, " )" )
	
	if arg1 then
		local loc_id = ArkInventory.BagID_Internal( arg1 )
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_COOLDOWN_BUCKET", loc_id )
	else
		for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
			if loc_data.canView then
				local me = ArkInventory.GetPlayerCodex( loc_id )
				if me.style.slot.cooldown.global then
					ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_COOLDOWN_BUCKET", loc_id )
				end
			end
		end
	end
end

function ArkInventory:EVENT_ARKINV_QUEST_UPDATE_BUCKET( )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
end

function ArkInventory:EVENT_WOW_QUEST_UPDATE( )
	ArkInventory:SendMessage( "EVENT_ARKINV_QUEST_UPDATE_BUCKET" )
end

function ArkInventory:EVENT_WOW_CVAR_UPDATE( event, cvar, value )
	
	--ArkInventory.Output( event, ": ", cvar, " = ", value )
	
	if cvar == "USE_COLORBLIND_MODE" then
		ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
		ArkInventory.LDB.Money:Update( )
	end
	
end

function ArkInventory:EVENT_ARKINV_ZONE_CHANGED_BUCKET( )
	--ArkInventory.LDB.Mounts:Update( )
	ArkInventory.ScanCollectionMount( )
end

function ArkInventory:EVENT_WOW_ZONE_CHANGED( )
	ArkInventory:SendMessage( "EVENT_ARKINV_ZONE_CHANGED_BUCKET", 1 )
end

function ArkInventory:EVENT_ARKINV_ACTIONBAR_UPDATE_USABLE_BUCKET( )
	if not ArkInventory.Global.Mode.Combat then
		ArkInventory.LDB.Mounts:Update( )
	end
end

function ArkInventory:EVENT_WOW_ACTIONBAR_UPDATE_USABLE( event )
	ArkInventory:SendMessage( "EVENT_ARKINV_ACTIONBAR_UPDATE_USABLE_BUCKET", 1 )
end

function ArkInventory:EVENT_ARKINV_SPELLS_CHANGED_BUCKET( )
	
	--ArkInventory.Output( "EVENT_ARKINV_SPELLS_CHANGED_BUCKET( )" )
	
	ArkInventory.ScanSpellbook( )
	
end

function ArkInventory:EVENT_WOW_SPELLS_CHANGED( event )
	
	--ArkInventory.Output( "EVENT_WOW_SPELLS_CHANGED( )" )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_SPELLS_CHANGED_BUCKET" )
	
end




function ArkInventory:EVENT_ARKINV_RESCAN_LOCATION_BUCKET( arg1 )
	
	--ArkInventory.Output( "EVENT_ARKINV_RESCAN_LOCATION_BUCKET( ", arg1, " )" )
	
	-- arg1 = table in the format loc_id=true so we need to loop through them
	
	for k in pairs( arg1 ) do
		ArkInventory.ScanLocation( k )
	end
	
end



function ArkInventory.BagID_Blizzard( loc_id, bag_id )
	
	-- converts internal location+bag codes into blizzzard bag ids
	
	assert( loc_id ~= nil, "code failure: loc_id is nil" )
	assert( bag_id ~= nil, "code failure: bag_id is nil" )
	
	local blizzard_id = ArkInventory.Global.Location[loc_id].Bags[bag_id]
	
	assert( blizzard_id ~= nil, string.format( "code failure: ArkInventory.Global.Location[%s].Bags[%s] is nil", loc_id, bag_id ) )
	
	return blizzard_id
	
end

function ArkInventory.BagID_Internal( blizzard_id )
	
	-- converts blizzard bag codes into storage location+bag ids
	
	assert( blizzard_id ~= nil, "code failure: blizard_id is nil" )
	
	for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
		for bag_id, v in pairs( loc_data.Bags ) do
			if blizzard_id == v then
				return loc_id, bag_id
			end
		end
	end
	
	ArkInventory.OutputError( "unknown blizzard bag id ", blizzard_id )
	--error( "code failure" )
	
	return
	
end

function ArkInventory.BagType( blizzard_id )
	
	assert( blizzard_id ~= nil, "code failure: blizzard_id is nil" )
	
	if blizzard_id == BACKPACK_CONTAINER then
		return ArkInventory.Const.Slot.Type.Bag
	elseif blizzard_id == BANK_CONTAINER then
		return ArkInventory.Const.Slot.Type.Bag
	elseif blizzard_id == REAGENTBANK_CONTAINER then
		return ArkInventory.Const.Slot.Type.ReagentBank
	end
	
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if loc_id == nil then
		return ArkInventory.Const.Slot.Type.Unknown
	elseif loc_id == ArkInventory.Const.Location.Vault then
		return ArkInventory.Const.Slot.Type.Bag
	elseif loc_id == ArkInventory.Const.Location.Mail then
		return ArkInventory.Const.Slot.Type.Mail
	elseif loc_id == ArkInventory.Const.Location.Wearing then
		return ArkInventory.Const.Slot.Type.Wearing
	elseif loc_id == ArkInventory.Const.Location.Pet then
		return ArkInventory.Const.Slot.Type.Critter
	elseif loc_id == ArkInventory.Const.Location.Mount then
		return ArkInventory.Const.Slot.Type.Mount
	elseif loc_id == ArkInventory.Const.Location.Toybox then
		return ArkInventory.Const.Slot.Type.Toybox
	elseif loc_id == ArkInventory.Const.Location.Heirloom then
		return ArkInventory.Const.Slot.Type.Heirloom
	elseif loc_id == ArkInventory.Const.Location.Token then
		return ArkInventory.Const.Slot.Type.Currency
	elseif loc_id == ArkInventory.Const.Location.Auction then
		return ArkInventory.Const.Slot.Type.Auction
	elseif loc_id == ArkInventory.Const.Location.Spellbook then
		return ArkInventory.Const.Slot.Type.Spellbook
	elseif loc_id == ArkInventory.Const.Location.Tradeskill then
		return ArkInventory.Const.Slot.Type.Tradeskill
	elseif loc_id == ArkInventory.Const.Location.Void then
		return ArkInventory.Const.Slot.Type.Void
	end
	
	
	if ArkInventory.Global.Location[loc_id].isOffline then
		
		local codex = ArkInventory.GetLocationCodex( loc_id )
		return codex.player.data.location[loc_id].bag[bag_id].type
		
	else
		
		local h = GetInventoryItemLink( "player", ContainerIDToInventoryID( blizzard_id ) )
		
		if h and h ~= "" then
			
			local info = ArkInventory.ObjectInfoArray( h )
			local t = info.itemtypeid
			local s = info.itemsubtypeid
			
			--ArkInventory.Output( "bag[", blizzard_id, "], type[", t, "], sub[", s, "], h=", h )
			
			if t == ArkInventory.Const.ItemClass.CONTAINER then
				
				if s == ArkInventory.Const.ItemClass.CONTAINER_BAG then
					return ArkInventory.Const.Slot.Type.Bag
				elseif s == ArkInventory.Const.ItemClass.CONTAINER_ENCHANTING then
					return ArkInventory.Const.Slot.Type.Enchanting
				elseif s == ArkInventory.Const.ItemClass.CONTAINER_ENGINEERING then
					return ArkInventory.Const.Slot.Type.Engineering
				elseif s == ArkInventory.Const.ItemClass.CONTAINER_GEM then
					return ArkInventory.Const.Slot.Type.Gem
				elseif s == ArkInventory.Const.ItemClass.CONTAINER_HERB then
					return ArkInventory.Const.Slot.Type.Herb
				elseif s == ArkInventory.Const.ItemClass.CONTAINER_INSCRIPTION then
					return ArkInventory.Const.Slot.Type.Inscription
				elseif s == ArkInventory.Const.ItemClass.CONTAINER_LEATHERWORKING then
					return ArkInventory.Const.Slot.Type.Leatherworking
				elseif s == ArkInventory.Const.ItemClass.CONTAINER_MINING then
					return ArkInventory.Const.Slot.Type.Mining
				elseif s == ArkInventory.Const.ItemClass.CONTAINER_TACKLE then
					return ArkInventory.Const.Slot.Type.Tackle
				elseif s == ArkInventory.Const.ItemClass.CONTAINER_COOKING then
					return ArkInventory.Const.Slot.Type.Cooking
				end
				
			end
			
			return ArkInventory.Const.Slot.Type.Unknown
			
		else
			
			-- empty bag slots
			return ArkInventory.Const.Slot.Type.Bag
			
		end
	
	end
	
	ArkInventory.OutputWarning( "Unknown Type: [", ArkInventory.Global.Location[loc_id].Name, "] id[", blizzard_id, "]=[empty]" )
	return ArkInventory.Const.Slot.Type.Unknown
	
end

function ArkInventory.ScanLocation( arg1 )
	
	--ArkInventory.Output( "ScanLocation( ", arg1, " )" )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
		if arg1 == nil or arg1 == loc_id then
			ArkInventory.Scan( loc_data.Bags )
		end
	end
	
end

function ArkInventory.Scan( bagTable )
	
	local bagTable = bagTable
	if type( bagTable ) ~= "table" then
		bagTable = { bagTable }
	end
	
	local processed = { }
	
	for _, blizzard_id in pairs( bagTable ) do
		
		--local t1 = GetTime( )
		
		local loc_id = ArkInventory.BagID_Internal( blizzard_id )
		
		if loc_id == nil then
			--ArkInventory.OutputWarning( "aborted scan of bag ", blizzard_id, ", not an ", ArkInventory.Const.Program.Name, " controlled bag" )
			return
		elseif loc_id == ArkInventory.Const.Location.Bag or loc_id == ArkInventory.Const.Location.Bank then
			ArkInventory.ScanBag( blizzard_id )
		elseif loc_id == ArkInventory.Const.Location.Vault then
			if not processed[loc_id] then
				ArkInventory.ScanVault( )
			end
		elseif loc_id == ArkInventory.Const.Location.Wearing then
			if not processed[loc_id] then
				ArkInventory.ScanWearing( )
			end
		elseif loc_id == ArkInventory.Const.Location.Mail then
			if not processed[loc_id] then
				ArkInventory.ScanMailInbox( )
			end
		elseif loc_id == ArkInventory.Const.Location.Pet then
			if not processed[loc_id] then
				ArkInventory.ScanCollectionPet( )
			end
		elseif loc_id == ArkInventory.Const.Location.Mount then
			if not processed[loc_id] then
				ArkInventory.ScanCollectionMount( )
			end
		elseif loc_id == ArkInventory.Const.Location.Toybox then
			if not processed[loc_id] then
				ArkInventory.ScanCollectionToy( )
			end
		elseif loc_id == ArkInventory.Const.Location.Heirloom then
			if not processed[loc_id] then
				ArkInventory.ScanCollectionHeirloom( )
			end
		elseif loc_id == ArkInventory.Const.Location.Token then
			if not processed[loc_id] then
				ArkInventory.ScanCurrency( )
			end
		elseif loc_id == ArkInventory.Const.Location.Auction then
			if not processed[loc_id] then
				ArkInventory.ScanAuction( )
			end
		elseif loc_id == ArkInventory.Const.Location.Spellbook then
			if not processed[loc_id] then
				ArkInventory.ScanSpellbook( )
			end
		elseif loc_id == ArkInventory.Const.Location.Tradeskill then
			if not processed[loc_id] then
				ArkInventory.ScanTradeskill( )
			end
		elseif loc_id == ArkInventory.Const.Location.Void then
			ArkInventory.ScanVoidStorage( blizzard_id )
		else
			error( string.format( "code failure: uncoded location [%s] for bag [%s]", loc_id, blizzard_id ) )
		end
		
		--t1 = GetTime( ) - t1
		--ArkInventory.Output( "scan location[" , loc_id, ".", blizzard_id, "] in ", string.format( "%0.3f", t1 ) )
		
		processed[loc_id] = true
		
	end

end

function ArkInventory.ScanBag( blizzard_id )
	
	--ArkInventory.Output( "ScanBag( ", blizzard_id, " )" )
	
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if not loc_id then
		ArkInventory.OutputWarning( "aborted scan of bag [", blizzard_id, "], unknown bag id" )
		return
	else
		--ArkInventory.Output( "found bag id [", blizzard_id, "] in location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "]" )
	end
	
	-- if there is a thread running for this location then terminate it so it doesnt get into an inconsistent state
	if type( ArkInventory.Global.Thread.Window[loc_id] ) == "thread" then
		ArkInventory.Global.Thread.Window[loc_id] = nil
	end
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	--ArkInventory.Output( "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local count = 0
	local empty = 0
	local bt = ArkInventory.BagType( blizzard_id )
	local texture = nil
	local status = ArkInventory.Const.Bag.Status.Unknown
	local h = nil
	local rarity = 0
	
	if loc_id == ArkInventory.Const.Location.Bag then
		
		count = GetContainerNumSlots( blizzard_id )
		
		if blizzard_id == BACKPACK_CONTAINER then
			
			if not count or count == 0 then
				if ArkInventory.db.option.bugfix.zerosizebag.alert then
					ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 10 seconds.  This warning can be disabled in the config menu" )
				end
				ArkInventory:SendMessage( "EVENT_ARKINV_RESCAN_LOCATION_BUCKET", loc_id )
				return
			end
			
			texture = ArkInventory.Global.Location[loc_id].Texture
			status = ArkInventory.Const.Bag.Status.Active
			
		else
			
			h = GetInventoryItemLink( "player", ContainerIDToInventoryID( blizzard_id ) )
			
			if not h then
				
				texture = ArkInventory.Const.Texture.Empty.Bag
				status = ArkInventory.Const.Bag.Status.Empty
				
			else
				
				if not count or count == 0 then
					if ArkInventory.db.option.bugfix.zerosizebag.alert then
						ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 10 seconds.  This warning can be disabled in the config menu" )
					end
					ArkInventory:SendMessage( "EVENT_ARKINV_RESCAN_LOCATION_BUCKET", loc_id )
					return
				end
				
				status = ArkInventory.Const.Bag.Status.Active
				
				local info = ArkInventory.ObjectInfoArray( h )
				texture = info.texture
				rarity = info.q
				
			end
			
		end
		
	end
	
	if loc_id == ArkInventory.Const.Location.Bank then
		
		count = GetContainerNumSlots( blizzard_id )
		
		if blizzard_id == REAGENTBANK_CONTAINER then
			
			-- reagent bank can be seen when not at the bank
			
			if not count or count == 0 then
				if ArkInventory.db.option.bugfix.zerosizebag.alert then
					ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 10 seconds.  This warning can be disabled in the config menu" )
				end
				ArkInventory:SendMessage( "EVENT_ARKINV_RESCAN_LOCATION_BUCKET", loc_id )
				return
			end
			
			if IsReagentBankUnlocked( ) then
				texture = ArkInventory.Global.Location[loc_id].Texture
				status = ArkInventory.Const.Bag.Status.Active
			else
				count = 0
				texture = ArkInventory.Const.Texture.Empty.Bag
				status = ArkInventory.Const.Bag.Status.Purchase
			end
			
		elseif ArkInventory.Global.Mode.Bank == true then
			
			if blizzard_id == BANK_CONTAINER then
				
				if not count or count == 0 then
					if ArkInventory.db.option.bugfix.zerosizebag.alert then
						ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 10 seconds.  This warning can be disabled in the config menu" )
					end
					ArkInventory:SendMessage( "EVENT_ARKINV_RESCAN_LOCATION_BUCKET", loc_id )
					return
				end
				
				texture = ArkInventory.Global.Location[loc_id].Texture
				status = ArkInventory.Const.Bag.Status.Active
				
			else
				
				if blizzard_id - NUM_BAG_SLOTS > GetNumBankSlots( ) then
				
					texture = ArkInventory.Const.Texture.Empty.Bag
					status = ArkInventory.Const.Bag.Status.Purchase
					
				else
					
					h = GetInventoryItemLink( "player", ContainerIDToInventoryID( blizzard_id ) )
					
					if not h then
						
						texture = ArkInventory.Const.Texture.Empty.Bag
						status = ArkInventory.Const.Bag.Status.Empty
						
					else
						
						if not count or count == 0 then
							if ArkInventory.db.option.bugfix.zerosizebag.alert then
								ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 10 seconds.  This warning can be disabled in the config menu" )
							end
							ArkInventory:SendMessage( "EVENT_ARKINV_RESCAN_LOCATION_BUCKET", loc_id )
							return
						end
						
						status = ArkInventory.Const.Bag.Status.Active
						
						local info = ArkInventory.ObjectInfoArray( h )
						texture = info.texture
						rarity = info.q
						
					end
					
				end
	
			end
		
		else
			
			--ArkInventory.OutputWarning( "aborted scan of bag id [", blizzard_id, "], not at bank" )
			return
			
		end
		
	end
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	local old_bag_count = bag.count
	local old_bag_link = bag.h
	local old_bag_status = bag.status
	
	bag.count = count
	bag.empty = empty
	bag.type = bt
	bag.texture = texture
	bag.status = status
	bag.h = h
	bag.q = rarity
	
	local changed_bag = false
	if old_bag_count ~= bag.count or old_bag_link ~= bag.h or old_bag_status ~= bag.status then
		changed_bag = true
	end
	
	for slot_id = 1, bag.count do
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = {
				loc_id = loc_id,
				bag_id = bag_id,
				slot_id = slot_id,
			}
		end
		
		local i = bag.slot[slot_id]
		
		local texture, count, locked, rarity, readable, lootable, h, filtered, novalue, itemID = GetContainerItemInfo( blizzard_id, slot_id )
		local ab = nil
		local sb = nil
		local empty_slot = true
		
		if h then
			
			ArkInventory.TooltipSetItem( ArkInventory.Global.Tooltip.Scan, blizzard_id, slot_id )
			
			if ArkInventory.TooltipGetLine( ArkInventory.Global.Tooltip.Scan, 1 ) == RETRIEVING_ITEM_INFO then	
				--ArkInventory.OutputWarning( "tooltips not ready, queuing bag ", bag_id, " (", blizzard_id, ") for rescan" )
				ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_BUCKET", blizzard_id )
			end
			
			for _, v in pairs( ArkInventory.Const.Accountbound ) do
				if v and ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, v, false, false, false, true ) then
					ab = 1
					sb = 1
					break
				end
			end
			
			if not ab then
				for _, v in pairs( ArkInventory.Const.Soulbound ) do
					if v and ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, v, false, false, false, true ) then
						sb = 1
						break
					end
				end
			end
			
			rarity = ArkInventory.ObjectInfoQuality( h )
			
		else
			
			empty_slot = true
			
			rarity = 0
			
			count = 1
			bag.empty = bag.empty + 1
			
		end
		
		--local isNewItem = C_NewItems.IsNewItem( blizzard_id, slot_id )
		local changed_item, changed_type = ArkInventory.ScanChanged( i, h, sb, count )
		
		i.h = h
		i.ab = ab
		i.sb = sb
		i.q = rarity
		i.r = ( not not readable ) or nil
		i.count = count
		
		--ArkInventory.Output( loc_id, ".", bag_id, ".", slot_id, " = ", { i } )
		
		if changed_item then
			
			if i.h then
				i.age = ArkInventory.TimeAsMinutes( )
			else
				i.age = nil
			end
			
			ArkInventory.ItemCategoryGet( i )
			
			if not changed_bag then
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
				ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
			end
			
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
			
		end
		
	end
	
	if bt == ArkInventory.Const.Slot.Type.Unknown and status == ArkInventory.Const.Bag.Status.Active then
		
		if ArkInventory.TranslationsLoaded then
			-- print the warning only after the translations are loaded
			ArkInventory.OutputWarning( "bag [", bag_id, "] in location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] type is unknown, queuing for rescan" )
		end
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_BUCKET", blizzard_id )
		
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	if changed_bag then
		ArkInventory:SendMessage( "EVENT_ARKINV_STORAGE", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
end

function ArkInventory.ScanVault( )
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "ScanVault( )" )
	
	if ArkInventory.Global.Mode.Vault == false then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of vault, not at vault" )
		return
	end
	
	local info = ArkInventory.GetPlayerInfo( )
	if not info.guild_id then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of vault, not in a guild" )
		return
	end
	
	if GetNumGuildBankTabs( ) == 0 then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of vault, no tabs purchased" )
		return
	end
	
	local loc_id = ArkInventory.Const.Location.Vault
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local bag_id = GetCurrentGuildBankTab( )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = bag.count or 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Bag
	
	local old_bag_count = bag.count
	local old_bag_status = bag.status
	
	local blizzard_container_width = NUM_SLOTS_PER_GUILDBANK_GROUP
	local blizzard_container_depth = NUM_GUILDBANK_COLUMNS
	
	if bag_id <= GetNumGuildBankTabs( ) then
		local name, icon, canView, canDeposit, numWithdrawals, remainingWithdrawals, filtered = GetGuildBankTabInfo( bag_id )
		bag.name = name
		bag.texture = icon
		bag.count = MAX_GUILDBANK_SLOTS_PER_TAB
		bag.status = ArkInventory.Const.Bag.Status.Active
	end
	
	local canView, canDeposit = select( 3, GetGuildBankTabInfo( bag_id ) )
	
	local changed_bag = false
	if old_bag_count ~= bag.count or old_bag_status ~= bag.status then
		
		changed_bag = true
		
		--ArkInventory.Output( "bag changed ", bag_id )
		--ArkInventory.Output( "slot count ", old_bag_count, " - ", bag.count )
		--ArkInventory.Output( "bag status ", old_bag_status, " - ", bag.status )
		
	end
	
	
	for slot_id = 1, bag.count or 0 do
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = {
				loc_id = loc_id,
				bag_id = bag_id,
				slot_id = slot_id,
			}
		end
		
		local i = bag.slot[slot_id]
		i.did = blizzard_container_width * ( ( slot_id - 1 ) % blizzard_container_depth ) + math.floor( ( slot_id - 1 ) / blizzard_container_depth ) + 1
		
		local texture, count = GetGuildBankItemInfo( bag_id, slot_id )
		local h = nil
		local sb = nil
		
		if texture then
			
			--LEGION todo - caged battlepet
--			h = GetGuildBankItemLink( bag_id, slot_id )
--			local h2 = ArkInventory.ObjectInfoItemString( h )
--			ArkInventory.Output( h, " ", h2 )
			
			local speciesID, level, breedQuality, maxHealth, power, speed, name = ArkInventory.TooltipSetGuildBankItem( ArkInventory.Global.Tooltip.Scan, bag_id, slot_id )
			
			if speciesID then
				
				h = ArkInventory.BattlepetBaseHyperlink( speciesID, level, breedQuality, maxHealth, power, speed, name )
				
			else
				
				h = GetGuildBankItemLink( bag_id, slot_id )
				
--				if not h then
--					h = select( 2, ArkInventory.TooltipGetItem( ArkInventory.Global.Tooltip.Scan ) )
--				end
				
			end
			
		else
			
			bag.empty = bag.empty + 1
			
		end
		
		
		local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
		
		if changed_item then
			
			--ArkInventory.Output( "changed item ", loc_id, ".", bag_id, ".", slot_id, " ", i.h )
			
			if i.h then
				i.age = ArkInventory.TimeAsMinutes( )
			else
				i.age = nil
			end
			
			i.h = h
			i.count = count
			i.sb = sb
			i.q = ArkInventory.ObjectInfoQuality( h )
			
			ArkInventory.ItemCategoryGet( i )
			
			if not changed_bag then
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
				--ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
			end
			
			--ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
			
		end
		
	end
	
	
	if changed_bag then
		ArkInventory:SendMessage( "EVENT_ARKINV_STORAGE", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Recalculate )
	else
		--ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
		--ArkInventory:SendMessage( "EVENT_ARKINV_STORAGE", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
end

function ArkInventory.ScanVaultHeader( )
	
	local loc_id = ArkInventory.Const.Location.Vault
	
	if ArkInventory.Global.Mode.Vault == false then
		--ArkInventory.Output( "aborted scan of tab headers, not at vault" )
		return
	end
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	for bag_id = 1, MAX_GUILDBANK_TABS do
		
		--ArkInventory.Output( "scaning tab header: ", bag_id )
		
		local bag = player.data.location[loc_id].bag[bag_id]
		
		bag.loc_id = loc_id
		bag.bag_id = bag_id
		
		bag.type = ArkInventory.Const.Slot.Type.Bag
	
		if bag_id <= GetNumGuildBankTabs( ) then
			
			local name, icon, canView, canDeposit, numWithdrawals, remainingWithdrawals = GetGuildBankTabInfo( bag_id )
			
			--ArkInventory.Output( "tab = ", bag_id, ", icon = ", icon )
			
			bag.name = name
			bag.texture = icon
			bag.status = ArkInventory.Const.Bag.Status.Active
			
			-- from Blizzard_GuildBankUI.lua - GuildBankFrame_UpdateTabs( )
			local access = GUILDBANK_TAB_FULL_ACCESS
			if not canView then
				access = ArkInventory.Localise["VAULT_TAB_ACCESS_NONE"]
			elseif ( not canDeposit and numWithdrawals == 0 ) then
				access = GUILDBANK_TAB_LOCKED
			elseif ( not canDeposit ) then
				access = GUILDBANK_TAB_WITHDRAW_ONLY
			elseif ( numWithdrawals == 0 ) then
				access = GUILDBANK_TAB_DEPOSIT_ONLY
			end
			bag.access = access
			
			local stackString = nil
			if bag_id == GetCurrentGuildBankTab( ) then
				if remainingWithdrawals > 0 then
					stackString = string.format( "%s/%s", remainingWithdrawals, string.format( GetText( "STACKS", nil, numWithdrawals ), numWithdrawals ) )
				elseif remainingWithdrawals == 0 then
					stackString = NONE
				else
					stackString = UNLIMITED
				end
			end
			bag.withdraw = stackString
			
			if bag.access == ArkInventory.Localise["VAULT_TAB_ACCESS_NONE"] then
				bag.status = ArkInventory.Const.Bag.Status.NoAccess
				bag.withdraw = nil
			end
			
		else
			
			bag.name = string.format( GUILDBANK_TAB_NUMBER, bag_id )
			bag.texture = ArkInventory.Const.Texture.Empty.Bag
			bag.count = 0
			bag.empty = 0
			bag.access = ArkInventory.Localise["STATUS_PURCHASE"]
			bag.withdraw = nil
			bag.status = ArkInventory.Const.Bag.Status.Purchase
			
		end
		
	end
	
	ArkInventory.Frame_Changer_Update( loc_id, bag_id )
	
	--ArkInventory.Output( "ScanVaultHeader( ) end" )
	
end

function ArkInventory.ScanWearing( )

	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "ScanWearing( ) start" )
	
	local blizzard_id = ArkInventory.Const.Offset.Wearing + 1
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end

	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Wearing
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	for slot_id, v in ipairs( ArkInventory.Const.InventorySlotName ) do
	
		bag.count = bag.count + 1
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = { }
		end
		
		local i = bag.slot[slot_id]
		
		local inv_id = GetInventorySlotInfo( v )
		local h = GetInventoryItemLink( "player", inv_id )
		local ab = nil
		local sb = nil
		local count = 1
		
		if h then
		
			ArkInventory.TooltipSetInventoryItem( ArkInventory.Global.Tooltip.Scan, inv_id )
			
			if ArkInventory.TooltipGetLine( ArkInventory.Global.Tooltip.Scan, 1 ) == RETRIEVING_ITEM_INFO then	
				--ArkInventory.OutputWarning( "tooltips not ready, queuing bag ", bag_id, " (", blizzard_id, ") for rescan" )
				ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_BUCKET", blizzard_id )
			end
			
			for _, v in pairs( ArkInventory.Const.Accountbound ) do
				if v and ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, v, false, false, false, true ) then
					ab = 1
					sb = 1
					break
				end
			end
			
			if ( not sb ) then
				for _, v in pairs( ArkInventory.Const.Soulbound ) do
					if v and ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, v, false, false, false, true ) then
						sb = 1
						break
					end
				end
			end
			
		else
		
			bag.empty = bag.empty + 1
			
		end

		
		local changed_item = ArkInventory.ScanChanged( i, h, sb, count )

		if changed_item or i.loc_id == nil then
		
			if i.h then
				i.age = ArkInventory.TimeAsMinutes( )
			else
				i.age = nil
			end
			
			i.loc_id = loc_id
			i.bag_id = bag_id
			i.slot_id = slot_id
			
			i.h = h
			i.count = count
			i.ab = ab
			i.sb = sb
			i.q = ArkInventory.ObjectInfoQuality( h )
		
			ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
			
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
			
		end
		
		--ArkInventory.Output( "slot=[", slot_id, "], item=[", i.h, "]" )
	
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
end

function ArkInventory.ScanMailInbox( )
	
	-- mailbox can be scanned from anywhere, just uses data from when it was last opened but dont bother unless its actually open
	if ArkInventory.Global.Mode.Mail == false then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of mailbox, not at mailbox" )
		return
	end
	
	local blizzard_id = ArkInventory.Const.Offset.Mail + 1
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Mail
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local slot_id = 0
	local name, itemid, texture, quality
	
	--debugprofilestart( )
	
	for index = 1, GetInboxNumItems( ) do
	
		--ArkInventory.Output( "scanning message ", index )
		
		--ArkInventory.Output( { GetInboxHeaderInfo( index ) } )
		local packageTexture, stationaryTexture, sender, subject, money, CoD, daysLeft, itemCount, wasRead, wasReturned, saved, canReply, GM = GetInboxHeaderInfo( index )
		
		if money > 0 then
			
			slot_id = slot_id + 1
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			
			local h = string.format( "copper:0:%s", money )
			local sb = nil
			local count = money
			
			bag.count = bag.count + 1
			
			local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
			
			
			i.h = h
			i.sb = sb
			i.count = 0
			i.q = 0
			
			i.msg_id = index
			i.att_id = nil
			i.money = count
			i.texture = GetCoinIcon( count )
			
			if changed_item then
				
				if i.h then
					i.age = ArkInventory.TimeAsMinutes( )
				else
					i.age = nil
				end
				
				ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
				
			end
			
		end
		
		if itemCount then
		
			--if ( daysLeft >= 1 ) then
--			daysLeft = string.format( "%s%s%s%s", GREEN_FONT_COLOR_CODE, string.format( DAYS_ABBR, floor(daysLeft) ), " ", FONT_COLOR_CODE_CLOSE )
			--else
--			daysLeft = string.format( "%s%s%s", RED_FONT_COLOR_CODE, SecondsToTime( floor( daysLeft * 24 * 60 * 60 ) ), FONT_COLOR_CODE_CLOSE )
			--end
		
			--local expires_d = floor( daysLeft )
			--local expires_s = ( daysLeft - floor( daysLeft ) ) * 24 * 60* 60
			--local purge = not not ( wasReturned ) or ( not canReply )
		
			--ArkInventory.Output( "message ", index, " has item(s)" )
			
			for x = 1, ATTACHMENTS_MAX_RECEIVE do
				
				name, itemid, texture, count = GetInboxItem( index, x )
				
				if name then
					
					--ArkInventory.Output( "message ", index, ", attachment ", x, " = ", name, " x ", count, " / (", { GetInboxItemLink( index, x ) }, ")" )
					
					slot_id = slot_id + 1
					
					if not bag.slot[slot_id] then
						bag.slot[slot_id] = {
							loc_id = loc_id,
							bag_id = bag_id,
							slot_id = slot_id,
						}
					end
					
					local i = bag.slot[slot_id]
					
					local h = GetInboxItemLink( index, x )
					local hasCooldown, speciesID, level, breedQuality, maxHealth, power, speed, name = ArkInventory.Global.Tooltip.Scan:SetInboxItem( index, x )
					if speciesID then
						h = ArkInventory.BattlepetBaseHyperlink( speciesID, level, breedQuality, maxHealth, power, speed, name )
					end
					
					local sb = nil -- always false, might be boa but sort that out if its looted
					
					if h then
						bag.count = bag.count + 1
					end
					
					local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
					
					i.h = h
					i.sb = sb
					
					i.msg_id = index
					i.att_id = x
					i.money = nil
					i.texture = nil
					
					if changed_item then
						
						if i.h then
							i.age = ArkInventory.TimeAsMinutes( )
						else
							i.age = nil
						end
						
						i.count = count
						i.q = ArkInventory.ObjectInfoQuality( h )
						
						ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
						
					end
					
				end
				
			end
		
		end
		
	end
	
	if slot_id == 0 then
		
		for k = 1, 1 do
			
			slot_id = slot_id + 1
			bag.count = bag.count + 1
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			
			local h = nil
			local sb = nil
			local count = nil
			
			bag.empty = bag.empty + 1
			
			local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.sb = sb
			i.age = nil
			i.count = count
			i.texture = nil
			i.q = 0
			
		end
		
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
		
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	
	-- clear cached mail sent from other known characters
	blizzard_id = ArkInventory.Const.Offset.Mail + 2
	loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Mail
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	
	--local ms = debugprofilestop( )
	--print( "mailbox scan took " .. ms .. "ms" )
	
end

function ArkInventory.ScanMailSentData( )
	
	local blizzard_id = ArkInventory.Const.Offset.Mail + 2
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( ArkInventory.Global.Cache.SentMail.to, loc_id )
	if not player.data.info.player_id then
		return
	end
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Mail
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local slot_id = bag.count
	
	local name, texture, count, quality
	for x = 1, ATTACHMENTS_MAX do
		
		if ArkInventory.Global.Cache.SentMail[x] then
		
			slot_id = slot_id + 1
			bag.count = slot_id
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			
			local h = ArkInventory.Global.Cache.SentMail[x].h
			local sb = nil -- always false, might be boa but sort that out if its looted
			local count = ArkInventory.Global.Cache.SentMail[x].c
			
			local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.sb = sb
			i.age = ArkInventory.Global.Cache.SentMail[x].age
			i.count = count
			i.q = ArkInventory.ObjectInfoQuality( h )
			i.sdr = ArkInventory.Global.Cache.SentMail[x].from
			
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
			
		end
		
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
end

function ArkInventory.ScanCollectionMount( )
	
	--ArkInventory.Output( "ScanCollectionMount( ) start" )
	
	if ( not ArkInventory.Collection.Mount.IsReady( ) ) then
		--ArkInventory.Output( "mount journal not ready" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_MOUNT_UPDATE_BUCKET", "RESCAN" )
		return
	end
	--ArkInventory.Output( "mount journal ready" )
	
	if ( ArkInventory.Collection.Mount.GetCount( ) == 0 ) then
		--ArkInventory.Output( "no mounts" )
		return
	end
	
	local blizzard_id = ArkInventory.Const.Offset.Mount + 1
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id

	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	--ArkInventory.Output( "scanning mounts [", ArkInventory.Collection.Mount.data.owned, "]" )
	
	local slot_id = 0
	
	for _, md in ArkInventory.Collection.Mount.Iterate( ) do
		
		if md.owned then
			
			slot_id = slot_id + 1
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			local h = md.link
			local sb = 1
			local count = 1
			
			ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.count = count
			i.ab = 1
			i.sb = sb
			i.q = 1
			
			i.index = md.index
			i.fav = md.fav
			
			if changed_item then
				ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
			end
			
		end
		
	end
	
	ArkInventory.CompanionDataUpdate( )
	
	bag.count = slot_id
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory.LDB.Mounts.Cleanup( )
	
	--ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
	--ArkInventory.Output( "ScanCollectionMount( ) end" )
	
end

function ArkInventory.ScanCollectionPet( )
	
	--ArkInventory.Output( "ScanCollectionPet( ) start" )
	
	if ( not ArkInventory.PetJournal.JournalIsReady( ) ) then
		--ArkInventory.Output( "pet journal not ready" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_RELOAD_BUCKET", "RESCAN" )
		return
	end
	--ArkInventory.Output( "pet journal ready" )
	
	if ( ArkInventory.PetJournal.GetCount( ) == 0 ) then
		--ArkInventory.Output( "no pets" )
		return
	end
	
	local blizzard_id = ArkInventory.Const.Offset.Pet + 1
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	--ArkInventory.Output( "scanning pets [", ArkInventory.PetJournal.data.owned, "]" )
	
	local slot_id = 0
	
	player.data.info.level = 1
	
	for _, object in ArkInventory.PetJournal.Iterate( ) do
		
		slot_id = slot_id + 1
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = {
				loc_id = loc_id,
				bag_id = bag_id,
				slot_id = slot_id,
			}
		end
		
		local i = bag.slot[slot_id]
		
		local h = object.link
		--ArkInventory.Output( gsub( h, "|", "*" ) )
		
		local level = object.level or 1
		
		if player.data.info.level < level then
			-- save highest pet level for tint unusable
			player.data.info.level = level
		end
		
		local count = 1
		local sb = ( ( not object.sd.tradable ) and 1 ) or nil
		
		ArkInventory.ScanChanged( i, h, sb, count )
		
		i.h = h
		i.ab = 1
		i.sb = sb
		i.q = object.rarity
		i.count = count
		i.guid = object.guid
		i.bp = ( object.sd.canBattle and 1 ) or nil
		i.wp = ( object.sd.isWild and 1 ) or nil
		i.cn = object.cn
		i.index = object.index
		i.fav = object.fav
		
	end
	
	bag.count = slot_id
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory.CompanionDataUpdate( )
	
	--ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
	--ArkInventory.Output( "ScanCollectionPet( ) end" )
	
end

function ArkInventory.ScanCollectionToy( )
	
	--ArkInventory.Output( "ScanCollectionToy( ) start" )
	
	if not ArkInventory.Collection.Toybox.IsReady( ) then
		--ArkInventory.Output( "toybox journal not ready" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_TOYBOX_UPDATE_BUCKET", "RESCAN" )
		return
	end
	--ArkInventory.Output( "toybox journal ready" )
	
	if ArkInventory.Collection.Toybox.GetCount( ) == 0 then
		--ArkInventory.Output( "no toys" )
		return
	end
	
	local blizzard_id = ArkInventory.Const.Offset.Toybox + 1
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	--ArkInventory.Output( "scanning toybox [", ArkInventory.Collection.Toybox.data.owned, "]" )
	
	local slot_id = 0
	
	for _, object in ArkInventory.Collection.Toybox.Iterate( ) do
		
		if object.owned then
			
			slot_id = slot_id + 1
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			
			local h = object.link
			local sb = 1
			local count = 1
			
			ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.count = count
			i.ab = 1
			i.sb = sb
			i.q = 1
			
			i.index = object.index
			i.item = object.item
			i.fav = object.fav
			
		end
		
	end
	
	bag.count = slot_id
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	--ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
	--ArkInventory.Output( "ScanCollectionToy( ) end ", slot_id )
	
end

function ArkInventory.ScanCollectionHeirloom( )
	
	--ArkInventory.Output( "ScanCollectionHeirloom( ) start" )
	
	if not ArkInventory.Collection.Heirloom.IsReady( ) then
		--ArkInventory.Output( "heirloom journal not ready" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_HEIRLOOM_UPDATE_BUCKET", "RESCAN" )
		return
	end
	--ArkInventory.Output( "heirloom journal ready" )
	
	if ArkInventory.Collection.Heirloom.GetCount( ) == 0 then
		--ArkInventory.Output( "no heirlooms" )
		return
	end
	
	local blizzard_id = ArkInventory.Const.Offset.Heirloom + 1
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local slot_id = 0
	
	for _, object in ArkInventory.Collection.Heirloom.Iterate( ) do
		
		if object.owned then
			
			slot_id = slot_id + 1
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			
			local h = object.link
			local sb = 1
			local count = 1
			
			ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.count = count
			i.ab = 1
			i.sb = sb
			i.q = LE_ITEM_QUALITY_HEIRLOOM
			i.item = object.item
			
		end
		
	end
	
	bag.count = slot_id
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	--ArkInventory.Output( "ScanCollectionHeirloom( ) end" )
	
end

function ArkInventory.ScanCurrency( )

	--ArkInventory.Output( "ScanCurrency( ) start" )
	
	local blizzard_id = ArkInventory.Const.Offset.Token + 1
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )

	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Token
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local numTokenTypes = GetCurrencyListSize( )
	
	if numTokenTypes == 0 then return end
	
	-- expand all currency headers
	for j = numTokenTypes, 1, -1 do
		local name, isHeader, isExpanded = GetCurrencyListInfo( j )
		if isHeader and not isExpanded then
			ExpandCurrencyList( j, 1 )
		end
	end
	
	local slot_id = 0
	
	numTokenTypes = GetCurrencyListSize( )
	
	for j = 1, numTokenTypes do
	
		local name, isHeader, isExpanded, isUnused, isWatched, count, icon = GetCurrencyListInfo( j )
  
		if not isHeader and name and count and count > 0 then
			
			slot_id = slot_id + 1
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			local sb = 1
			local h = GetCurrencyListLink( j )
			local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.count = count
			i.sb = sb
			
			if changed_item or i.loc_id == nil then
				
				if i.h then
					i.age = ArkInventory.TimeAsMinutes( )
				else
					i.age = nil
				end
				
				i.q = ArkInventory.ObjectInfoQuality( h )
				
				ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
				
			end
			
		end
		
	end
	
	bag.count = slot_id

	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	-- token "bag" blizzard is using (mapped to our second bag)
	bag_id = 2
	bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Token
	bag.status = ArkInventory.Const.Bag.Status.NoAccess
	
end

local CanUseVoidStorage = CanUseVoidStorage or ArkInventory.HookDoNothing

function ArkInventory.ScanVoidStorage( blizzard_id )
	
	--ArkInventory.Output( "ScanVoidStorage" )
	
	if not CanUseVoidStorage( ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of void storage, storage not active" )
		return
	end
	
	if ArkInventory.Global.Mode.Void == false then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of void storage, not at npc" )
		return
	end
	
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = ArkInventory.Const.VOID_STORAGE_MAX
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local blizzard_container_width = 10
	local blizzard_container_depth = 8
	
	for slot_id = 1, bag.count do
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = { }
		end
		
		local i = bag.slot[slot_id]
		i.did = blizzard_container_width * ( ( slot_id - 1 ) % blizzard_container_depth ) + math.floor( ( slot_id - 1 ) / blizzard_container_depth ) + 1
		
		local item_id, texture, locked, recentDeposit, isFiltered, q = GetVoidItemInfo( bag_id, slot_id )
		
		local h = nil
		
		if item_id then
			h = string.format( "item:%s", item_id )
		end
		
		local count = 1
		local sb = 1
		
		if h then
			
			
		else
			
			bag.empty = bag.empty + 1
			
		end
		
		
		local changed_item = ArkInventory.ScanChanged( i, h, sb, count )

		if changed_item or i.loc_id == nil then
			
			if i.h then
				i.age = ArkInventory.TimeAsMinutes( )
			else
				i.age = nil
			end
			
			i.loc_id = loc_id
			i.bag_id = bag_id
			i.slot_id = slot_id
			
			i.h = h
			i.count = count
			i.sb = sb
			i.q = q
			
			ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
			
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
			
		end
		
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
end

function ArkInventory.ScanAuction( massive )
	
	if ArkInventory.Global.Mode.Auction == false then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of auction house, not at auction house" )
		return
	end
	
	local blizzard_id = ArkInventory.Const.Offset.Auction + 1
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	local auctions = select( 2, GetNumAuctionItems( "owner" ) )
	
	if auctions > 100 and not massive then
		ArkInventory:SendMessage( "EVENT_ARKINV_AUCTION_UPDATE_MASSIVE_BUCKET" )
		return
	end
	
	bag.count = auctions
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Auction
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	for slot_id = 1, bag.count do
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = {
				loc_id = loc_id,
				bag_id = bag_id,
				slot_id = slot_id,
			}
		end
		
		local i = bag.slot[slot_id]
		
		--ArkInventory.Output( "scanning auction ", slot_id, " of ", bag.count )
		
		local h = GetAuctionItemLink( "owner", slot_id )
		local name, texture, count, rarity, canUse, level, minBid, minIncrement, buyoutPrice, bidAmount, highestBidder, owner, sold = GetAuctionItemInfo( "owner", slot_id )
		local duration = GetAuctionItemTimeLeft( "owner", slot_id )
		local sb = nil
		
		--ArkInventory.Output( "auction ", slot_id, " / ", h, " / ", sold )
		
		if not h or sold == 1 then
			count = 1
			bag.empty = bag.empty + 1
			h = nil
			duration = nil
		end
		
		--ArkInventory.Output( "auction ", slot_id, " = ", h, " x ", count )
		
		local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
		
		if changed_item then
			
			i.h = h
			i.count = count
			i.sb = sb
			i.q = ArkInventory.ObjectInfoQuality( h )
			
			if i.h then
				i.age = ArkInventory.TimeAsMinutes( )
			else
				i.age = nil
			end

			if duration == 1 then
				-- Short (less than 30 minutes)
				i.expires = ( i.age or 0 ) + 30
			elseif duration == 2 then
				-- Medium (30 minutes to 2 hours)
				i.expires = ( i.age or 0 ) + 2 * 60
			elseif duration == 3 then
				-- Long (2 hours to 12 hours)
				i.expires = ( i.age or 0 ) + 12 * 60
			elseif duration == 4 then
				-- Very Long (more than 12 hours)
				i.expires = ( i.age or 0 ) + 48 * 60
			end
			
			
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
			
		end
		
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
end

function ArkInventory.ScanAuctionExpire( )
	
	local blizzard_id = ArkInventory.Const.Offset.Auction + 1
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	local current_time = ArkInventory.TimeAsMinutes( )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	local search_id
	
	for slot_id = 1, bag.count do
		
		local i = bag.slot[slot_id]
		
		if i.h then
			
			if ( i.expires and ( i.expires < current_time ) ) or ( i.age and ( i.age + 48 * 60 < current_time ) ) then
				
				search_id = ArkInventory.ObjectIDCount( i.h )
				ArkInventory.ObjectCountClear( search_id )
				
				table.wipe( i )
				
				i.loc_id = loc_id
				i.bag_id = bag_id
				i.slot_id = slot_id
				
				i.count = 1
				bag.empty = bag.empty + 1
				
			end
			
		end
		
	end
	
	ArkInventory:SendMessage( "EVENT_ARKINV_STORAGE", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Refresh )
	
end

function ArkInventory.ScanSpellbook( )
	
	if true then return end -- not enabled yet
	
	local blizzard_id = ArkInventory.Const.Offset.Spellbook + 1
	
	local loc_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local numTabs = GetNumSpellTabs( )
	
	for bag_id = 1, numTabs do
		
		local bag = player.data.location[loc_id].bag[bag_id]
		
		bag.loc_id = loc_id
		bag.bag_id = bag_id
		
		local old_bag_count = bag.count
		
		local name, texture, offset, numSpells = GetSpellTabInfo( bag_id )

		bag.count = numSpells
		bag.empty = 0
		bag.type = ArkInventory.Const.Slot.Type.Spellbook
		bag.status = ArkInventory.Const.Bag.Status.Active
		bag.texture = texture
		
		for slot_id = 1, bag.count do
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = { }
			end
			
			local i = bag.slot[slot_id]
			
			--ArkInventory.Output( "scanning spellbook tab ", bag_id, ", slot ", slot_id + offset )
			
			local h = GetSpellLink( slot_id + offset, "spell")
			--local name, rank, icon, powerCost, isFunnel, powerType, castingTime, minRange, maxRange = GetSpellInfo( slot_id + offset, "spell")
			local rarity = 1
			local sb = 1
			local count = 1
			
			--ArkInventory.Output( "spellbook ", bag_id, " / ", slot_id, " / ", h )
			
			if not h then
				bag.empty = bag.empty + 1
				h = nil
			end
			
			local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
			
			if changed_item or i.loc_id == nil then
				
				table.wipe( i )
				
				i.loc_id = loc_id
				i.bag_id = bag_id
				i.slot_id = slot_id
				
				i.h = h
				i.count = count
				i.sb = sb
				i.q = ArkInventory.ObjectInfoQuality( h )
				
				ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
				
			end
			
		end
		
		ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
		
	end
	
end

function ArkInventory.ScanProfessions( )
	
	--ArkInventory.Output( "ScanProfessions" )
	
	local p = { GetProfessions( ) }
	--ArkInventory.Output( "skills = [", p, "]" )
	
	local info = ArkInventory.GetPlayerInfo( )
	info.skills = info.skills or { }
	
	for index = 1, ArkInventory.Const.Skills.Primary + ArkInventory.Const.Skills.Secondary do
		
		if p[index] then
			--local name, texture, rank, maxRank, numSpells, spelloffset, skillLine, rankModifier = GetProfessionInfo( p[index] )
			--ArkInventory.Output( "skill [", index, "] = [", skillLine, "] [", name, "]" )
			local skillLine = select( 7, GetProfessionInfo( p[index] ) )
			info.skills[index] = skillLine
		else
			info.skills[index] = nil
			--ArkInventory.Output( "skill [", index, "] = [", skillLine, "] [", name, "]" )
		end
		
	end

	ArkInventory.Table.Clean( ArkInventory.Global.Cache.Default )
	ArkInventory.LocationSetValue( nil, "resort", true )
	
end

function ArkInventory.ScanTradeskillWindow( )
	
	if IsTradeSkillLinked( ) then
		-- dont care about other players
		return
	end
	
	local restore_ShowSkillUps = TradeSkillFrame.filterTbl.hasSkillUp
	TradeSkillOnlyShowSkillUps( false )
	
	local restore_OnlyShowMakeable = TradeSkillFrame.filterTbl.hasMaterials
	TradeSkillOnlyShowMakeable( false )
	
	local restore_SubClassFilter = -1
	for _, index in pairs( { GetTradeSkillSubClasses( ) } ) do
		if GetTradeSkillSubClassFilter( index ) then
			restore_SubClassFilter = index
		end
	end
	SetTradeSkillSubClassFilter( -1, 1, 1 )
	
	
	local restore_InvSlotFilter = -1
	for _, index in pairs( { GetTradeSkillInvSlots( ) } ) do
		if GetTradeSkillInvSlotFilter( index ) then
			restore_InvSlotFilter = index
		end
	end
	SetTradeSkillInvSlotFilter( -1, 1, 1 )
	
	local restore_ItemLevelFilter_min, restore_ItemLevelFilter_max = GetTradeSkillItemLevelFilter( )
	SetTradeSkillItemLevelFilter( 0, 0 )
	
	local restore_ItemNameFilter = GetTradeSkillItemNameFilter( )
	SetTradeSkillItemNameFilter( nil )
	
	
	-- expand all categories
	local restore_header = { }
	local numSkills = GetNumTradeSkills( )
	local header = 0
	for index = numSkills, 1, -1 do
		local skillName, skillType, numAvailable, isExpanded, serviceType, numSkillUps = GetTradeSkillInfo( index )
		if skillType == "header" then
			header = header + 1
			restore_header[header] = isExpanded
			if not isExpanded then
				ExpandTradeSkillSubClass( index )
			end
		end
	end
	
	numSkills = GetNumTradeSkills( )
	ArkInventory.Output( "numSkills=", numSkills )
	for index = 1, numSkills do
		local skillName, skillType, numAvailable, isExpanded, serviceType, numSkillUps = GetTradeSkillInfo( index )
		if skillType ~= "header" then
			local h = GetTradeSkillRecipeLink( index )
			--ArkInventory.Output( index, " = ", skillName, " / ", skillType, " / ", h )
		end
	end
	
	
	
	-- restore filters
	TradeSkillOnlyShowSkillUps( restore_ShowSkillUps )
	TradeSkillOnlyShowMakeable( restore_OnlyShowMakeable )
	SetTradeSkillSubClassFilter( restore_SubClassFilter, 1, 1 )
	SetTradeSkillInvSlotFilter( restore_InvSlotFilter, 1, 1 )
	SetTradeSkillItemLevelFilter( restore_ItemLevelFilter_min, restore_ItemLevelFilter_max )
	SetTradeSkillItemNameFilter( restore_ItemNameFilter )
	
	-- restore collapsed headers
	numSkills = GetNumTradeSkills( )
	header = 0
	for index = numSkills, 1, -1 do
		local skillName, skillType, numAvailable, isExpanded, serviceType, numSkillUps = GetTradeSkillInfo( index )
		if skillType == "header" then
			header = header + 1
			if not restore_header[header] then
				CollapseTradeSkillSubClass( index )
			end
		end
	end
	
end

function ArkInventory.ScanTradeskill( )
	
	if true then return end -- not enabled yet
	
	local blizzard_id = ArkInventory.Const.Offset.Tradeskill + 1
	
	local loc_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local prof = { GetProfessions( ) }
	
	for bag_id = 1, 6 do
		
		local bag = player.data.location[loc_id].bag[bag_id]
		
		bag.loc_id = loc_id
		bag.bag_id = bag_id
		
		bag.count = 0
		bag.empty = 0
		bag.type = ArkInventory.Const.Slot.Type.Tradeskill
		bag.status = ArkInventory.Const.Bag.Status.Active
		bag.texture = [[Interface\\Icons\\INV_Scroll_04]]
		
		local index = prof[bag_id]
		
		if index then
			
			local name, texture, rank, maxRank, numSpells, spelloffset, skillLine, rankModifier = GetProfessionInfo( index )
			bag.texture = texture
			
			CastSpell( 1 + spelloffset, BOOKTYPE_PROFESSION )
			
			
			
			local numSkills = GetNumTradeSkills( )
			--ArkInventory.Output( "tradeskill ", bag_id, " = ", name, ", ", numSkills )
			
			
			
			local slot_id = 0
			
			for skillIndex = 1, bag.count do
				
				local skillName, skillType, numAvailable, isExpanded, altVerb, numSkillUps = GetTradeSkillInfo( skillIndex )
				
				
				if not bag.slot[slot_id] then
					bag.slot[slot_id] = { }
				end
				
				local i = bag.slot[slot_id]
				
				--ArkInventory.Output( "scanning tradeskill ", bag_id, ", slot ", slot_id + offset )
				
				local h --= GetSpellLink( slot_id + offset, "spell")
				
				local rarity = 1
				local sb = 1
				local count = 1
				
				
				if not h then
					bag.empty = bag.empty + 1
					h = nil
				end
				
				local changed_item, new = ArkInventory.ScanChanged( i, h, sb, count )
				
				if changed_item or i.loc_id == nil then
					
					table.wipe( i )
					
					i.loc_id = loc_id
					i.bag_id = bag_id
					i.slot_id = slot_id
					
					i.h = h
					i.count = count
					i.sb = sb
					i.q = ArkInventory.ObjectInfoQuality( h )
					
					ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
					
				end
				
			end
			
		end
		
		ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
		
	end
	
end


function ArkInventory.ScanChanged( old, h, sb, count )
	
	--ArkInventory.Output( "scanchanged: ", old.loc_id, ".", old.bag_id, ".", old.slot_id, " - ", h, " ", count )
	
	-- check for slot changes
	
	-- return item has changed, new status
	
	-- item counts are now reset here if required
	
	-- do not use the full hyperlink, pull out the itemstring part and check against that, theres a bug where the name isnt always included in the hyperlink

	if not h then
		
		-- slot is empty
		
		if old.h then
			
			-- previous item was removed
			--ArkInventory.ItemCacheClear( old.h )
			ArkInventory.ItemCacheClear( )
			ArkInventory.ScanCleanupCount( old.h, old.loc_id )
			
			--ArkInventory.Output( "scanchanged: ", old.loc_id, ".", old.bag_id, ".", old.slot_id, " - ", old.h, " - item removed" )
			return true, ArkInventory.Const.Slot.New.No
			
		end
		
	else
		
		-- slot has an item
		
		if not old.h then
			
			-- item added to previously empty slot
			--ArkInventory.ItemCacheClear( h )
			ArkInventory.ItemCacheClear( )
			ArkInventory.ScanCleanupCount( h, old.loc_id )
			
			--ArkInventory.Output( "scanchanged: ", old.loc_id, ".", old.bag_id, ".", old.slot_id, " - ", h, " - item added" )
			return true, ArkInventory.Const.Slot.New.Yes
			
		end
		
		if ArkInventory.ObjectIDCount( h ) ~= ArkInventory.ObjectIDCount( old.h ) then
			
			-- different item
			--ArkInventory.ItemCacheClear( h )
			--ArkInventory.ItemCacheClear( old.h )
			ArkInventory.ItemCacheClear( )
			ArkInventory.ScanCleanupCount( old.h, old.loc_id )
			ArkInventory.ScanCleanupCount( h, old.loc_id )
			
			--ArkInventory.Output( "scanchanged: ", old.loc_id, ".", old.bag_id, ".", old.slot_id, " - ", old.h, " / ", h, " - item changed" )
			return true, ArkInventory.Const.Slot.New.Yes
			
		end
		
		if sb ~= old.sb then
			
			-- soulbound changed
			--ArkInventory.ItemCacheClear( old.h )
			ArkInventory.ItemCacheClear( )
			--ArkInventory.Output( "scanchanged: ", old.loc_id, ".", old.bag_id, ".", old.slot_id, " - ", old.h, " - soulbound was ", old.sb, " now ", sb )
			return true, ArkInventory.Const.Slot.New.Yes
			
		end
		
		if count and old.count and count ~= old.count then
			
			-- same item, previously existed, count has changed
			ArkInventory.ScanCleanupCount( old.h, old.loc_id )
			
			if count > old.count then
				--ArkInventory.Output( "scanchanged: ", old.loc_id, ".", old.bag_id, ".", old.slot_id, " - ", old.h, " - count increased" )
				return true, ArkInventory.Const.Slot.New.Inc
			else
				--ArkInventory.Output( "scanchanged: ", old.loc_id, ".", old.bag_id, ".", old.slot_id, " - ", old.h, " - count decreased" )
				ArkInventory.ScanCleanupCount( old.h, old.loc_id )
				return true, ArkInventory.Const.Slot.New.Dec
			end
			
		end
		
	end
	
end

function ArkInventory.ScanCleanupCount( h, loc_id )
	
	if not h or not loc_id then return end
	
	local search_id = ArkInventory.ObjectIDCount( h )
	if not ArkInventoryScanCleanupList[search_id] then
		ArkInventoryScanCleanupList[search_id] = { }
	end
	
	ArkInventoryScanCleanupList[search_id][loc_id] = true
	
end

function ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	local num_slots = #bag.slot
	--ArkInventory.Output( "cleanup: loc=", loc_id, ", bag=", bag_id, ", count=", num_slots, " / ", bag.count )
	
	-- remove unwanted slots
	if num_slots > bag.count then
		
		for slot_id = bag.count + 1, num_slots do
			
			if bag.slot[slot_id] and bag.slot[slot_id].h then
				ArkInventory.ScanCleanupCount( bag.slot[slot_id].h, loc_id )
			end
			
			--ArkInventory.Output( "wiped bag ", bag_id, " slot ", slot_id )
			table.wipe( bag.slot[slot_id] )
			bag.slot[slot_id] = nil
			
		end
	end
	
	-- cleanup changed item counts
	for search_id, loc in pairs( ArkInventoryScanCleanupList ) do
		for loc_id in pairs( loc ) do
			--ArkInventory.Output( "reset count for ", h, " at loc ", loc_id )
			ArkInventory.ObjectCountClear( search_id, player.data.info.player_id, loc_id )
		end
	end
	
	table.wipe( ArkInventoryScanCleanupList )
	
	-- recalculate total slots
	player.data.location[loc_id].slot_count = ArkInventory.Table.Sum( player.data.location[loc_id].bag, function( a ) return a.count end )
	
	-- if bag size has changed, let the changer window know
	if num_slots ~= bag.count then
		ArkInventory:SendMessage( "EVENT_ARKINV_STORAGE", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
	ArkInventory.LDB.Tracking_Item:Update( )
	
end


function ArkInventory.ObjectInfoName( h )
	local info = ArkInventory.ObjectInfoArray( h )
	return info.name or "!"
end

function ArkInventory.ObjectInfoTexture( h )
	local info = ArkInventory.ObjectInfoArray( h )
	return info.texture
end

function ArkInventory.ObjectInfoQuality( h )
	local info = ArkInventory.ObjectInfoArray( h )
	return info.q or 1
end

function ArkInventory.ObjectInfoVendorPrice( h )
	local info = ArkInventory.ObjectInfoArray( h )
	return info.vendorprice or -1
end

function ArkInventory.ObjectInfoArray( h, i )
	
	local info = { }
	
	info.osd = ArkInventory.ObjectStringDecode( h, i )
	info.class = info.osd.class
	info.id = info.osd.id
	
	info.h = info.osd.h
	info.name = ""
	info.q = 1
	info.ilvl = 0
	info.uselevel = 0
	info.itemtype = ""
	info.itemsubtype = ""
	info.stacksize = 1
	info.equiploc = ""
	info.texture = ArkInventory.Const.Texture.Missing
	info.vendorprice = -1
	info.itemtypeid = 0
	info.itemsubtypeid = 0
	
	if info.class == "item" then
		
		info.info = { GetItemInfo( info.osd.h ) }
		
		-- broken in 7.1 for artifacts
		-- info.h = info.info[2] or info.h
		
		info.name = info.info[1] or info.name
		if not info.name or info.name == "" then
			info.name = string.match( info.h, "|h%[(.+)%]|h" ) or info.name
		end
		
		info.q = info.info[3] or info.q
		
		info.ilvl = info.info[4] or info.ilvl
		
--		if info.id == 128872 then
--			ArkInventory.Output( "[ ", gsub( gsub( info.info[2], "\124", " " ), ":", " : " ), " ]" )
--			ArkInventory.Output( "[ ", gsub( gsub( info.osd.h, "\124", " " ), ":", " : " ), " ]" )
--			ArkInventory.Output( "[ ", gsub( gsub( info.h, "\124", " " ), ":", " : " ), " ]" )
--		end
		
		if info.osd.upgradeid > 0 or info.osd.bonusids then
			
			-- upgradable or has bonusId that may not adjust the itemlevel return value (eg 615/timewarped), so get item level from tooltip
			
			--ArkInventory.TooltipSetHyperlink( ArkInventory.Global.Tooltip.Scan, info.h )
			ArkInventory.TooltipSetHyperlink( ArkInventory.Global.Tooltip.Scan, info.h )
			local _, _, ilvl = ArkInventory.TooltipFind( ArkInventory.Global.Tooltip.Scan, ArkInventory.Localise["WOW_TOOLTIP_ITEM_LEVEL"], false, true, true, 4, true )
			
			info.ilvl = tonumber( ilvl ) or info.ilvl
			
--			if info.ilvl ~= info.info[4] then
--				ArkInventory.Output( h, " / ", info.info[4], " / ", ilvl, " / ", info.osd.upgradeid, " / ", info.osd.bonusids )
--			end
			
		end
		
		info.uselevel = info.info[5] or info.uselevel
		info.itemtype = info.info[6] or info.itemtype
		info.itemsubtype = info.info[7] or info.itemsubtype
		info.stacksize = info.info[8] or info.stacksize
		info.equiploc = info.info[9] or info.equiploc
		
		if not info.info[10] or info.info[10] == "" then
			info.texture = GetItemIcon( h ) or info.texture
		else
			info.texture = info.info[10]
		end
		
		info.vendorprice = info.info[11] or info.vendorprice
		info.itemtypeid = info.info[12] or info.itemtypeid
		info.itemsubtypeid = info.info[13] or info.itemsubtypeid
		
	elseif info.class == "spell" then
		
		info.info = { GetSpellInfo( info.id ) }
		
		info.h = GetSpellLink( info.id )
		
		info.name = info.info[1]
		if not info.name or info.name == "" then
			info.name = string.match( info.h, "|h%[(.+)%]|h" ) or info.name
		end

		info.q = 1
		info.texture = info.info[3] or info.texture
		
	elseif info.class == "battlepet" then
		
		info.sd = ArkInventory.PetJournal.GetSpeciesInfo( info.id )
		info.ilvl = 1
		info.itemtypeid = ArkInventory.Const.ItemClass.BATTLEPET
		
		if info.sd then
			info.name = info.sd.name or info.name
			info.texture = info.sd.icon or info.texture
			info.ilvl = info.sd.level or info.ilvl
			info.itemsubtypeid = info.sd.petType or info.itemsubtypeid
		end
		
	elseif info.class == "currency" then
		
		info.info = { GetCurrencyInfo( info.id ) }
		
		info.h = GetCurrencyLink( info.id )
		
		info.name = info.info[1]
		info.amount = info.info[2]
		info.q = info.info[8]
		
		info.texture = info.info[3]
		
	elseif info.class == "empty" then
		
		info.texture = ""
		info.itemtypeid = ArkInventory.Const.ItemClass.EMPTY
		info.itemsubtypeid = info.osd[3]
		info.slottype = info.osd[3]
		
	end
	
	return info
	
end

function ArkInventory.ObjectInfoItemString( h )
	local osd = ArkInventory.ObjectStringDecode( h )
	return osd.h
end

function ArkInventory.ObjectStringDecode( h, i )
	
	local h = string.trim( h or "" )
	
	if h == "" and i and not i.h then
		h = ArkInventory.ObjectIDCategory( i )
	end
	
	local s = string.lower( string.match( h, "|H(.-)|h" ) or string.match( h, "^([a-z]-:.+)" ) or "empty:0:0" )
	local v = { strsplit( ":", s ) }
	
	local c = #v
	if c < 15 then
		c = 15
	end
	
	for x = 2, c do
		v[x] = tonumber( v[x] ) or 0
	end
	
	v.h = s
	v.class = v[1]
	v.id = v[2]
	
	v.slottype = 0
	if i then
		if not i.loc_id then
			ArkInventory.Output( i )
		end
		local blizzard_id = ArkInventory.BagID_Blizzard( i.loc_id, i.bag_id )
		v.slottype = ArkInventory.BagType( blizzard_id )
	end
	
	if v.class == "item" then
		
		--[[
			[01]class
			[02]item
			[03]enchantid
			[04]gem1
			[05]gem2
			[06]gem3
			[07]gem4
			[08]suffixid
			[09]uniqueid
			[10]linklevel
			[11]specid
			[12]upgradeid
			[13]sourceid
			[14]numbonusids
			[..]bonusids
			[15]upgradelevel
			
			-- nothing past here is consistent
			
			[16]numbonusids2
			[..]bonusids2
			[17]numbonusids3
			[..]bonusids3
			[18]??
			
			[16]mythicKeystoneLevel
			[17]depleted(?) 1=active, 2=depleted
			[18]??
			[19]??
			[20]??
			
			
		]]--
		
		v.enchantid = v[3]
		v.gemid = { v[4], v[5], v[6], v[7] }
		
		v.suffixid = v[8]
		if v[8] < 0 then
			v.suffixfactor = bit.band( v[9], 65535 )
		end
		
		v.uniqueid = v[9]
		v.linklevel = v[10]
		v.specid = v[11]
		v.upgradeid = v[12]
		v.sourceid = v[13]
		
		local pos = 14
		
		-- bonus id set
		if v[pos] and v[pos] > 0 then
			v.bonusids = { }
			for x = pos + 1, pos + v[pos] do
				v.bonusids[v[x]] = true
			end
		end
		pos = pos + 1 + v[pos]
		
		-- upgrade level
		if not v[pos] then
			v[pos] = 0
		end
		v.upgradelevel = v[pos]
		pos = pos + 1
		
		-- everything up to here should exist in the itemstring
		-- below this, seems to be specific to the item
		
		if pos <= c then
			-- record start position of custom values
			v.custom = pos
		end
		
	elseif v.class == "spell" then
		
		--[[
			[01]class
			[02]spellId
			[03]glyphId
			[04]???
		]]--
		
		v.glyphid = v[3]
		
	elseif v.class == "battlepet" then
		
		--[[
			[01]class
			[02]species
			[03]level
			[04]rarity
			[05]maxhealth
			[06]power
			[07]speed
			[08]guid (BattlePet-[unknown]-[creatureID])
		]]--
		
		v.level = v[3]
		v.q = v[4]
		v.maxhealth = v[5] 
		v.power = v[6]
		v.speed = v[7]
		
		v.guid = v[8]
		if v.guid == 0 then
			v.guid = ""
		end
		
	elseif v.class == "copper" then
		
		--[[
			[01]class
			[02]not used
			[03]amount
		--]]
		
		v.amount = v[3]
		
	elseif v.class == "empty" then
		
		v.bagtype = v[3]
		
		if v.bagtype == 0 and i then
			
			local blizzard_id = ArkInventory.BagID_Blizzard( i.loc_id, i.bag_id )
			local bt = ArkInventory.BagType( blizzard_id )
			
			v.h = string.format( "empty:0:%s", bt )
			v[3] = bt
			v.bagtype = v[3]
			
		end
		
	end
	
	return v
	
end

function ArkInventory.GetItemQualityColor( rarity )
	
	local rarity = rarity or -1
	
	if ( rarity == -1 ) then
		return NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, string.sub( NORMAL_FONT_COLOR_CODE, 3 ), NORMAL_FONT_COLOR_CODE
	else
		local r, g, b, c = GetItemQualityColor( rarity )
		return r, g, b, c, string.format( "|c%s", c )
	end
	
end

function ArkInventory.InventoryIDGet( loc_id, bag_id )
	
	local blizzard_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
	
	if blizzard_id == nil then
		return nil
	end
	
	if loc_id == ArkInventory.Const.Location.Bag and bag_id > 1 then
		
		return ContainerIDToInventoryID( blizzard_id )
		
	elseif loc_id == ArkInventory.Const.Location.Bank then
		
		if bag_id == ArkInventory.Global.Location[loc_id].tabReagent then
			
			return nil
			
		elseif bag_id > 1 then
			
			return ContainerIDToInventoryID( blizzard_id )
			
		end
		
	end
	
end


function ArkInventory.ObjectIDCount( h )
	local osd = ArkInventory.ObjectStringDecode( h )
	return string.format( "%s:%s", osd.class, osd.id )
end

function ArkInventory.ObjectIDCategory( i )
	
	local soulbound = ( i.sb and 1 ) or 0
	
	local osd = ArkInventory.ObjectStringDecode( i.h )
	local r
	
	if osd.class == "item" then
		r = string.format( "%s:%i:%i", osd.class, osd.id, soulbound )
	elseif osd.class == "empty" then
		local blizzard_id = ArkInventory.BagID_Blizzard( i.loc_id, i.bag_id )
		soulbound = ArkInventory.BagType( blizzard_id ) -- allows for unique codes per bag type
		r = string.format( "%s:%i:%i", osd.class, osd.id, soulbound )
	elseif osd.class == "spell" or osd.class == "currency" or osd.class == "copper" then
		r = string.format( "%s:%i", osd.class, osd.id )
	elseif osd.class == "battlepet" then
		r = string.format( "%s:%i:%i", osd.class, osd.id, soulbound )
	else
		ArkInventory.OutputWarning( "uncoded object class [", i.h, "] = [", osd.class, "]" )
		r = string.format( "%s:%i", osd.class, osd.id )
	end
	
	local codex = ArkInventory.GetLocationCodex( i.loc_id )
	local cr = string.format( "%i:%s", codex.catset_id, r )
	
	return cr, r, codex
	
end

function ArkInventory.ObjectIDRule( i )
	local id = string.format( "%i:%i:%i:%s", i.loc_id or 0, i.bag_id or 0, ( i.sb and 1 ) or 0, ArkInventory.ObjectIDCategory( i ) )
	local codex = ArkInventory.GetLocationCodex( i.loc_id )
	local cid = string.format( "%i:%s", codex.catset_id, id )
	return cid, id, codex
end

function ArkInventory.ObjectCountClear( search_id, player_id, loc_id )
	
	--ArkInventory.Output( "ObjectCountClear( ", search_id, ", ", player_id, ", ", loc_id, " )" )
	
	local info = ArkInventory.GetPlayerInfo( )
	
	if search_id and player_id and loc_id then
		
		-- clear the account/vault user if needed, then come back and clear the current user
		
		if player_id == ArkInventory.PlayerIDAccount( ) or ( loc_id == ArkInventory.Const.Location.Vault ) or ( loc_id == ArkInventory.Const.Location.Pet ) or ( loc_id == ArkInventory.Const.Location.Mount ) or ( loc_id == ArkInventory.Const.Location.Toybox ) then
			ArkInventory.ObjectCountClear( search_id, info.player_id )
		end
		
	end
	
	if search_id and player_id then
		
		-- reset count for a specific item for a specific player
		--ArkInventory.Output( "ObjectCountClear( ", search_id, ", ", player_id )
		
		if ArkInventory.Global.Cache.ItemCountTooltip[player_id] then
			ArkInventory.Global.Cache.ItemCountTooltip[player_id][search_id] = nil
		end
		
		if ArkInventory.Global.Cache.ItemCount[player_id] then
			ArkInventory.Global.Cache.ItemCount[player_id][search_id] = nil
		end
		
		if ArkInventory.Global.Cache.ItemCountRaw[search_id] then
			ArkInventory.Global.Cache.ItemCountRaw[search_id][player_id] = nil
		end
		
		if search_alt then
			
			for k in pairs( search_alt ) do
				
				if ArkInventory.Global.Cache.ItemCountTooltip[player_id] then
					ArkInventory.Global.Cache.ItemCountTooltip[player_id][k] = nil
				end
				
				if ArkInventory.Global.Cache.ItemCount[player_id] then
					ArkInventory.Global.Cache.ItemCount[player_id][k] = nil
				end
				
				if ArkInventory.Global.Cache.ItemCountRaw[k] then
					ArkInventory.Global.Cache.ItemCountRaw[k][player_id] = nil
				end
				
			end
			
		end
		
		return
		
	end
	
	if search_id and not player_id then
		
		-- reset count for a specific item for all players
		--ArkInventory.Output( "ObjectCountClear( ", search_id, " )" )
		
		for k, v in pairs( ArkInventory.Global.Cache.ItemCountTooltip ) do
			v[search_id] = nil
		end
		
		for k, v in pairs( ArkInventory.Global.Cache.ItemCount ) do
			v[search_id] = nil
		end
		
		ArkInventory.Global.Cache.ItemCountRaw[search_id] = nil
		
		-- erase item/tooltip cache
		ArkInventory.Table.Clean( ArkInventory.Global.Cache.ItemCountTooltip, nil, true )
		ArkInventory.Table.Clean( ArkInventory.Global.Cache.ItemCountRaw, nil, true )
		ArkInventory.Table.Clean( ArkInventory.Global.Cache.ItemCount, nil, true )

		return
		
	end
	
	if ( not search_id ) and ( not player_id ) then
		
		--ArkInventory.Output( "wipe all item counts" )
		table.wipe( ArkInventory.Global.Cache.ItemCountTooltip )
		
		table.wipe( ArkInventory.Global.Cache.ItemCount )
		
		if ArkInventory.Global.Cache.ItemCountRaw[info.player_id] then
			table.wipe( ArkInventory.Global.Cache.ItemCountRaw[info.player_id] )
		end
		
		return
		
	end
	
end

function ArkInventory.ObjectCountGetRaw( search_id )
	
--	ArkInventory.Output( "get raw count for [", search_id, "]" )
	
	if not ArkInventory.Global.Cache.ItemCountRaw[search_id] then
		ArkInventory.Global.Cache.ItemCountRaw[search_id] = { }
	end
	
	local d = ArkInventory.Global.Cache.ItemCountRaw[search_id]
	
	local search_alt = ArkInventory.Const.ItemCrossReference[search_id]
--	if search_alt then
--		ArkInventory.Output( "alt search: ", search_id, " = ", search_alt )
--	end
	
	local c, k, tabs
	
	for pid, pd in pairs( ArkInventory.db.player.data ) do
		
		if pd.info.name then
			
			if not d[pid] then
				d[pid] = { ["vault"] = false, ["location"] = { }, ["faction"] = pd.info.faction, ["realm"] = pd.info.realm }
			end
			
			--ArkInventory.Output( "rebuild ", search_id, " for ", pid )
			
			for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
				
				if not d[pid].location[loc_id] then
					
					-- rebuild missing location data
					
					local ld = pd.location[loc_id]
					
					--ArkInventory.Output( "scanning location [", loc_id, "] for item [", search_id, "]" )
					c = 0
					k = false
					tabs = ""
					
					for b in pairs( loc_data.Bags ) do
						
						local bd = ld.bag[b]
						
						k = false
						
						if bd.h and search_id == ArkInventory.ObjectIDCount( bd.h ) then
							--ArkInventory.Output( "found bag [", b, "] equipped" )
							c = c + 1
							k = true
						end
						
						for sn, sd in pairs( bd.slot ) do
							
							if sd and sd.h then
								
								-- primary match
								local oit = ArkInventory.ObjectIDCount( sd.h )
								local matches = ( search_id == oit )
								
								-- secondary match
								if not matches and search_alt then
									for sa in pairs( search_alt ) do
										if sa == oit then
											matches = true
											break
										end
									end
								end
								
								if matches then
									--ArkInventory.Output( pid, " has ", sd.count, " x ", sd.h, " in loc[", loc_id, "], bag [", b, "] slot [", sn, "]" )
									c = c + sd.count
									k = true
								end
								
							end
							
						end
						
						if k and loc_id == ArkInventory.Const.Location.Vault then
							tabs = string.format( "%s%s, ", tabs, b )
						end
						
					end
					
					if c > 0 then
						
						if pd.info.class == "GUILD" and loc_id == ArkInventory.Const.Location.Vault then
							d[pid].vault = true
							d[pid].tabs = string.sub( tabs, 1, string.len( tabs ) - 2 )
						end
						
						d[pid].location[loc_id] = c
						
					end
					
				end
				
			end
			
		end
		
	end
	
end

function ArkInventory.ObjectCountGet( search_id, player_id, just_me, ignore_vaults, ignore_other_faction, my_realm, include_crossrealm )
	
	--ArkInventory.Output( "ObjectCountGet [", search_id, "] [", player_id, "] [", just_me, "] [", ignore_vaults, "] [", ignore_other_faction, "] [", my_realm, "] [", include_crossrealm, "]"  )
	
	ArkInventory.ObjectCountGetRaw( search_id )
	
	local info = ArkInventory.GetPlayerInfo( )
	local player_id = player_id or info.player_id
	
	if not ArkInventory.Global.Cache.ItemCount[player_id] then
		ArkInventory.Global.Cache.ItemCount[player_id] = { }
	end
	
	if ArkInventory.Global.Cache.ItemCount[player_id][search_id] then
		--ArkInventory.Output( "cached [", player_id, "] [", search_id, "]" )
		return ArkInventory.Global.Cache.ItemCount[player_id][search_id]
	else
		ArkInventory.Global.Cache.ItemCount[player_id][search_id] = {
--			["location"] = {
--				[loc_id] = number (count),
--			},
--			["total"] = number,
--			["vault"] = boolean,
--			["tabs"] = string ("1, 2, 3, 4, 5, 6, 7, 8")
--			["faction"] = string (system),
--			["realm"] = string (system),
--			["class"] = string (system),
		}
	end
	
	-- build return
	local info = ArkInventory.GetPlayerInfo( player_id )
	
	--ArkInventory.Output( "reference [", info.name, "] [", info.realm, "] [", info.faction, "]" )
	
	local d = ArkInventory.Global.Cache.ItemCount[player_id][search_id]
	
	for rcn, rcd in pairs( ArkInventory.Global.Cache.ItemCountRaw[search_id] ) do
		--ArkInventory.Output( "check: ", rcd.realm )
		if ( rcn == ArkInventory.PlayerIDAccount( ) ) or ( not my_realm ) or ( ( my_realm and ( ( rcd.realm == info.realm ) ) ) or ( my_realm and include_crossrealm and ArkInventory.IsConnectedRealm( rcd.realm, info.realm ) ) ) then
		--ArkInventory.Output( "ok: ", rcd.realm )
		if ( rcn == ArkInventory.PlayerIDAccount( ) ) or ( not ignore_other_faction ) or ( ignore_other_faction and ( ( rcd.faction == info.faction ) ) ) then
		if ( rcn == ArkInventory.PlayerIDAccount( ) ) or ( not just_me ) or ( just_me and ( ( rcn == info.player_id ) ) ) then
				
				for l, c in pairs( rcd.location ) do
					
					local ok = true
					
					if ignore_vaults and rcd.vault then
						ok = false
					end
					
					if ok then
						
						if c > 0 then
							
							if not d[rcn] then
								d[rcn] = { ["vault"] = rcd.vault, ["tabs"] = rcd.tabs, ["location"] = { }, ["total"] = 0 } -- , ["realm"] = rcd.realm, ["faction"] = rcd.faction
							end
							
							d[rcn].location[l] = c
							d[rcn].total = d[rcn].total + c
							
						end
						
					end
					
				end
				
		end
		end
		end
		
	end
	
	table.sort( d )
	return d
	
end

function ArkInventory.BattlepetBaseHyperlink( ... )
	local v = { ... } -- species, level, rarity, maxHealth, power, speed, name (not used), petid
	--ArkInventory.Output( "[ ", v, " ]" )
	return string.format( "battlepet:%s:%s:%s:%s:%s:%s:%s:%s", v[1] or 0, v[2] or 0, v[3] or 0, v[4] or 0, v[5] or 0, v[6] or 0, v[7] or "", v[8] or "" )
end
