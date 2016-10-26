local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table

local yield_num = 10

function ArkInventory.RestackString( )
	
	if ArkInventory.db.option.restack.blizzard then
		return ArkInventory.Localise["CLEANUP"]
	else
		return ArkInventory.Localise["RESTACK"]
	end
	
end

local function RestackMessageStart( loc_id )
	
	if ArkInventory.db.option.message.restack[loc_id] then
		ArkInventory.Output( ArkInventory.RestackString( ), ": ", ArkInventory.Global.Location[loc_id].Name, " - " , ArkInventory.Localise["START"] )
	end
	
end

local function RestackMessageComplete( loc_id )
	
	if ArkInventory.db.option.message.restack[loc_id] then
		ArkInventory.Output( ArkInventory.RestackString( ), ": ", ArkInventory.Global.Location[loc_id].Name, " - " , ArkInventory.Localise["COMPLETE"] )
	end
	
	if ArkInventory.db.option.restack.refresh then
		--ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
end

local function RestackMessageAbort( loc1, loc2 )
	
	local loc2 = loc2 or loc1
	
	if loc1 == loc2 then
		ArkInventory.OutputWarning( ArkInventory.RestackString( ), ": ", ArkInventory.Global.Location[loc1].Name, " - ", ArkInventory.Localise["ABORTED"] )
	else
		ArkInventory.OutputWarning( ArkInventory.RestackString( ), ": ", ArkInventory.Global.Location[loc1].Name, " - ", ArkInventory.Localise["ABORTED"], ": ", string.format( ArkInventory.Localise["RESTACK_FAIL_CLOSED"], ArkInventory.Global.Location[loc2].Name ) )
	end
	
end

local function RestackBagCheck( loc_id, bag_id )
	
	local abort = false
	local numSlots = GetContainerNumSlots( bag_id )
	local freeSlots, bagType = GetContainerNumFreeSlots( bag_id )
	
	if ( loc_id == ArkInventory.Const.Location.Bank and not ArkInventory.Global.Mode.Bank ) or ( loc_id == ArkInventory.Const.Location.Vault and not ArkInventory.Global.Mode.Vault ) then
		-- no longer at location, abort
		abort = loc_id
	end
	
	return abort, bagType, numSlots
	
end


local function FindStack( loc_id, cl, cb, bp, cs, id )
	
	-- working from left to right
	-- find a stack of the matching item in your bag
	
	--ArkInventory.Output( "FindStack( ", loc_id, ", ", cl, ".", cb, ".", cs, ", ", id, " )" )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = cl or loc_id
	local cb = cb or 9999
	local bp = bp or -1
	local cs = cs or -1
	
	for bag_pos, bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		if not me.player.data.option[loc_id].bag[bag_id].restack.ignore then
			
			local ab, bt, count = RestackBagCheck( loc_id, bag_id )
			if ab then
				return cl, recheck, false
			end
			
			for slot_id = 1, count do
				
				if RestackBagCheck( loc_id, bag_id ) then
					return cl, recheck, false
				end
				
				if ( loc_id ~= cl ) or ( loc_id == cl and bag_pos < bp ) or ( loc_id == cl and bag_pos == bp and slot_id < cs )then
				-- ( different location ) or (same location and higher bag) or (same location and same bag and higher slot)
					
					if select( 3, GetContainerItemInfo( bag_id, slot_id ) ) then
						
						-- this slot is locked, move on and check it again next time
						--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
						recheck = true
						
					else
						
						local h = GetContainerItemLink( bag_id, slot_id )
						
						if h then
							
							local osd = ArkInventory.ObjectStringDecode( h )
							
							if osd.id == id then
								
								--ArkInventory.Output( "found> ", loc_id, ".", bag_id, ".", slot_id )
								return abort, recheck, true, bag_id, slot_id
								
							end
							
						end
						
					end
					
				end
				
			end
		
		end
		
	end
	
	if recheck then
		coroutine.yield( )
		return FindStack( loc_id, cl, cb, bp, cs, id )
	end
	
	--ArkInventory.Output( "no stacks found" )
	return abort, recheck, false
	
end

local function FindPartialStack( loc_id, cl, cb, bp, cs, id )
	
	--ArkInventory.OutputDebug( "FindPartialStack( ", cl, ".", cb, ".", cs, ", ", id, " )" )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = cl or loc_id
	local cb = cb or 9999
	local bp = bp or -1
	local cs = cs or -1
	
	
	if cl == ArkInventory.Const.Location.Vault then
		
		local bag_id = cb
		
		for slot_id = 1, MAX_GUILDBANK_SLOTS_PER_TAB do
			
			if not ArkInventory.Global.Mode.Vault or bag_id ~= GetCurrentGuildBankTab( ) then
				-- no longer at the vault or changed tabs, abort
				abort = cl
				return abort, recheck, false
			end
			
			if slot_id < cs then
				
				if select( 3, GetGuildBankItemInfo( bag_id, slot_id ) ) then
					
					-- this slot is locked, move on and check it again next time
					--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
					recheck = true
					
				else
					
					local h = GetGuildBankItemLink( bag_id, slot_id )
					
					if h then
						
						local info = ArkInventory.ObjectInfoArray( h )
						
						if info.id == id then
						
							local count = select( 2, GetGuildBankItemInfo( bag_id, slot_id ) )
							
							if count < info.stacksize then
								--ArkInventory.OutputDebug( "found > ", bag_id, ".", slot_id )
								return abort, recheck, true, bag_id, slot_id
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
		if recheck then
			coroutine.yield( )
			return FindPartialStack( loc_id, cl, cb, bp, cs, id )
		end
		
		return abort, recheck, false
		
	end
	
	if cl == ArkInventory.Const.Location.Bag or cl == ArkInventory.Const.Location.Bank then
		
		for bag_pos, bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
			
			if not me.player.data.option[loc_id].bag[bag_id].restack.ignore then
				
				local ab, bt, count = RestackBagCheck( loc_id, bag_id )
				if ab then
					return cl, recheck, false
				end
				
				for slot_id = 1, count do
					
					if RestackBagCheck( loc_id, bag_id ) then
						return cl, recheck, false
					end
					
					if ( loc_id ~= cl ) or ( loc_id == cl and bag_pos < bp ) or ( loc_id == cl and bag_pos == bp and slot_id < cs )then
					-- ( different location ) or (same location and higher bag) or (same location and same bag and higher slot)
						
						if select( 3, GetContainerItemInfo( bag_id, slot_id ) ) then
						
							-- this slot is locked, move on and check it again next time
							--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
							recheck = true
							
						else
							
							local h = GetContainerItemLink( bag_id, slot_id )
							
							if h then
								
								local info = ArkInventory.ObjectInfoArray( h )
								
								if info.id == id then
								
									local count = select( 2, GetContainerItemInfo( bag_id, slot_id ) )
									
									if count < info.stacksize then
										--ArkInventory.Output( "found > ", bag_id, ".", slot_id )
										return abort, recheck, true, bag_id, slot_id
									end
									
								end
								
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
		if recheck then
			coroutine.yield( )
			return FindPartialStack( loc_id, cl, cb, bp, cs, id )
		end
		
		if loc_id == ArkInventory.Const.Location.Bank and ArkInventory.db.option.restack.topup then
			return FindStack( ArkInventory.Const.Location.Bag, cl, cb, bp, cs, id )
		end
		
		return abort, recheck, false
		
	end
	
end

local function FindNormalItem( loc_id, cl, cb, bp, cs )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = cl or loc_id
	local cb = cb or 9999
	local bp = bp or -1
	local cs = cs or -1
	
	for bag_pos, bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		if not me.player.data.option[loc_id].bag[bag_id].restack.ignore then
			
			local ab, bt, count = RestackBagCheck( loc_id, bag_id )
			if ab then
				return cl, recheck, false
			end
			
			if bt == 0 and bag_id ~= REAGENTBANK_CONTAINER then
				
				for slot_id = 1, count do
					
					if RestackBagCheck( loc_id, bag_id ) then
						return cl, recheck, false
					end
					
					if ( loc_id ~= cl ) or ( loc_id == cl and bag_pos < bp ) or ( loc_id == cl and bag_pos == bp and slot_id < cs )then
					-- ( different location ) or (same location and higher bag) or (same location and same bag and higher slot)
						
						if select( 3, GetContainerItemInfo( bag_id, slot_id ) ) then
							
							-- this slot is locked, move on and check it again next time
							--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
							recheck = true
							
						else
							
							local h = GetContainerItemLink( bag_id, slot_id )
							
							if h then
								--ArkInventory.Output( "found> ", loc_id, ".", bag_id, ".", slot_id )
								return abort, recheck, true, bag_id, slot_id
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
	if recheck then
		coroutine.yield( )
		return FindNormalItem( loc_id, cl, cb, bp, cs )
	end
	
	--ArkInventory.Output( "nothing found, all slots empty" )
	return abort, recheck, false
	
end

local function FindProfessionItem( loc_id, cl, cb, bp, cs, ct )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = cl or loc_id
	local cb = cb or 9999
	local bp = bp or -1
	local cs = cs or -1
	local ct = ct or 0
	
	--ArkInventory.Output( "find prof ", loc_id, ", ", cl, ".", cb, ".", cs, " ", ct )
	
	if ct == 0 then
		ArkInventory.OutputError( "code failure: checking for profession item of type 0" )
		abort = cl
		return abort, recheck, false
	end
	
	for bag_pos, bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		local ab, bt, count = RestackBagCheck( loc_id, bag_id )
		if ab then
			return cl, recheck, false
		end
		
		if not me.player.data.option[loc_id].bag[bag_id].restack.ignore then
			
			if bt == 0 or bt == ct then
				
				for slot_id = 1, count do
					
					if RestackBagCheck( loc_id, bag_id ) then
						return cl, recheck, false
					end
					
					if ( loc_id ~= cl ) or ( loc_id == cl and bag_pos < bp ) or ( loc_id == cl and bag_pos > bp and bt == 0 ) or ( loc_id == cl and bag_pos == bp and slot_id < cs ) then
					-- ( different location ) or (same location and lower bag) or (same location and same bag and lower slot)
						
						if select( 3, GetContainerItemInfo( bag_id, slot_id ) ) then
							
							-- this slot is locked, move on and check it again next time
							--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
							recheck = true
							
						else
							
							local h = GetContainerItemLink( bag_id, slot_id )
							
							if h then
								
								-- ignore bags
								local info = ArkInventory.ObjectInfoArray( h )
								if info.equiploc ~= "INVTYPE_BAG" then
									
									local check_item = true
									if loc_id ~= cl then
										-- only allow crafting reagents to be selected from bags when depositing to the bank (dont steal the pick/hammer/army knife/etc)
										ArkInventory.TooltipSetHyperlink( ArkInventory.Global.Tooltip.Scan, h )
										if not ArkInventory.TooltipFind( ArkInventory.Global.Tooltip.Scan, ArkInventory.Localise["WOW_TOOLTIP_CRAFTING_REAGENT"], false, true, true, 4, true ) then
											check_item = false
										end
									end
									
									local it = GetItemFamily( h )
									
									if check_item and bit.band( it, ct ) > 0 then
										--ArkInventory.Output( "prof> ", loc_id, ".", bag_id, ".", slot_id, " " , h )
										return abort, recheck, true, bag_id, slot_id
									end
									
								end
								
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
	if loc_id == ArkInventory.Const.Location.Bank and ArkInventory.db.option.restack.bank then
		
		local ab, rc, ok, sb, ss = FindProfessionItem( ArkInventory.Const.Location.Bag, loc_id, nil, nil, nil, ct )
		
		if ab then
			abort = cl
		end
		
		if rc then
			recheck = true
		end
		
		return abort, recheck, ok, sb, ss
		
	end
	
	--ArkInventory.Output( "no profession items found in ", loc_id )
	return abort, recheck, false
	
end

local function FindCraftingItem( loc_id, cl, cb, bp, cs, ct )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = cl or loc_id
	local cb = cb or 9999
	local bp = bp or -999
	local cs = cs or -999
	local ct = ct or 0
	
	for bag_pos, bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		local ab, bt, count = RestackBagCheck( loc_id, bag_id )
		if ab then
			return cl, recheck, false
		end
		
		if not me.player.data.option[loc_id].bag[bag_id].restack.ignore then
			
			if ( bt == 0 or bt == ct ) and bag_id ~= REAGENTBANK_CONTAINER then
				-- do not steal from profession bags or the reagent bank
				
				--ArkInventory.Output( "find craft ", cl, ".", cb, "(", bp, ").", cs, " / ", loc_id, ".", bag_id, " (", bag_pos, ")" )
				
				for slot_id = 1, count do
					
					if RestackBagCheck( loc_id, bag_id ) then
						return cl, recheck, false
					end
					
					if ( cb == REAGENTBANK_CONTAINER ) or ( loc_id ~= cl ) or ( loc_id == cl and bag_pos < bp ) or ( loc_id == cl and bag_pos == bp and slot_id < cs )then
						-- ( different location ) or (same location and higher bag) or (same location and same bag and higher slot)
						
						--ArkInventory.Output( "check> ", loc_id, ".", bag_id, ".", slot_id )
						
						if select( 3, GetContainerItemInfo( bag_id, slot_id ) ) then
							
							-- this slot is locked, move on and check it again next time
							--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
							recheck = true
							
						else
							
							ArkInventory.TooltipSetItem( ArkInventory.Global.Tooltip.Scan, bag_id, slot_id )
							if ArkInventory.TooltipFind( ArkInventory.Global.Tooltip.Scan, ArkInventory.Localise["WOW_TOOLTIP_CRAFTING_REAGENT"], false, true, true, 4, true ) then
								--ArkInventory.Output( "craft @ ", loc_id, ".", bag_id, ".", slot_id )
								return abort, recheck, true, bag_id, slot_id
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
	if loc_id == ArkInventory.Const.Location.Bank and ArkInventory.db.option.restack.deposit then
		
		local ab, rc, ok, sb, ss = FindCraftingItem( ArkInventory.Const.Location.Bag, loc_id, nil, nil, nil, ct )
		
		if ab then
			abort = cl
		end
		
		if rc then
			recheck = true
		end
		
		return abort, recheck, ok, sb, ss
		
	end
	
	--ArkInventory.Output( "no crafting items found in ", loc_id )
	return abort, recheck, false
	
end

local function StackBags( loc_id )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = loc_id
	
	for bag_pos = #ArkInventory.Global.Location[loc_id].Bags, 1, -1 do
		
		local bag_id = ArkInventory.Global.Location[loc_id].Bags[bag_pos]
		
		local ab, bt, count = RestackBagCheck( loc_id, bag_id )
		if ab then
			return cl, recheck, false
		end
		
		if not me.player.data.option[loc_id].bag[bag_id].restack.ignore then
			
			--ArkInventory.Output( "StackBags( ", loc_id, ".", bag_id, " )" )
			
			if count > 0 then
				
				local moved = 0
				
				for slot_id = count, 1, -1 do
					
					if RestackBagCheck( loc_id, bag_id ) then
						return cl, recheck, false
					end
					
					--ArkInventory.Output( "checking ", loc_id, ".", bag_id, ".", slot_id )
					
					if select( 3, GetContainerItemInfo( bag_id, slot_id ) ) then
						
						-- this slot is locked, move on and check it again next time
						--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
						recheck = true
						
					else
						
						--ArkInventory.Output( "unlocked> ", loc_id, ".", bag_id, ".", slot_id )
						
						local h = GetContainerItemLink( bag_id, slot_id )
						
						if h then
							
							local info = ArkInventory.ObjectInfoArray( h )
							local num = select( 2, GetContainerItemInfo( bag_id, slot_id ) )
							
							if num < info.stacksize then
								
								--ArkInventory.Output( "partial stack of ", count, "x", h, " found at ", bag_id, ".", slot_id )
								
								local ab, rc, ok, pb, ps = FindPartialStack( loc_id, loc_id, bag_id, bag_pos, slot_id, info.id )
								
								if rc then
									recheck = true
								end
								
								if ab then
									abort = loc_id
									return abort, recheck
								end
								
								if ok then
									
									--ArkInventory.Output( "merge> ", bag_id, ".", slot_id, " + ", pb, ".", ps )
									
									ClearCursor( )
									PickupContainerItem( pb, ps )
									PickupContainerItem( bag_id, slot_id )
									ClearCursor( )
									
									recheck = true
									
									moved = moved + 1
									if moved > yield_num then
										coroutine.yield( )
									end
									
								end
								
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
	return abort, recheck
	
end

local function StackVault( )
	
	local abort = false
	local recheck = false
	
	local loc_id = ArkInventory.Const.Location.Vault
	local bag_id = GetCurrentGuildBankTab( )
	
	local _, _, canView, canDeposit = GetGuildBankTabInfo( bag_id )
	
	if not ( IsGuildLeader( ) or ( canView and canDeposit ) ) then
		ArkInventory.Output( string.format( ArkInventory.Localise["RESTACK_FAIL_ACCESS"], ArkInventory.Localise["LOCATION_VAULT"], bag_id ) )
		return abort, recheck
	end
	
	for slot_id = MAX_GUILDBANK_SLOTS_PER_TAB, 1, -1 do
		
		if not ArkInventory.Global.Mode.Vault or bag_id ~= GetCurrentGuildBankTab( ) then
			-- no longer at the vault or changed tabs, abort
			abort = loc_id
			return abort, recheck
		end
		
		--ArkInventory.OutputDebug( "checking vault ", bag_id, ".", slot_id )
		
		if select( 3, GetGuildBankItemInfo( bag_id, slot_id ) ) then
			
			-- this slot is locked, move on and check it again next time
			--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
			recheck = true
			
		else
			
			local h = GetGuildBankItemLink( bag_id, slot_id )
			
			--ArkInventory.OutputDebug( "tab=[", bag_id, "], slot=[", slot_id, "] count=[", count, "] locked=[", locked, "] item=", h )
			
			if h then
				
				local info = ArkInventory.ObjectInfoArray( h )
				local count = select( 2, GetGuildBankItemInfo( bag_id, slot_id ) )
				
				if count < info.stacksize then
					
					--ArkInventory.OutputDebug( "partial > ", bag_id, ".", slot_id )
					
					local ab, rc, ok, pb, ps = FindPartialStack( loc_id, loc_id, bag_id, nil, slot_id, info.id )
					
					if ab then
						abort = loc_id
						return abort
					end
					
					if rc then
						recheck = true
					end
					
					if ok then
						
						--ArkInventory.OutputDebug( "merge > ", bag_id, ".", slot_id, " + ", pb, ".", ps )
						
						ClearCursor( )
						PickupGuildBankItem( pb, ps )
						PickupGuildBankItem( bag_id, slot_id )
						ClearCursor( )
						
						--ArkInventory.Output( "yielding - pending vault update" )
						--coroutine.yield( )
						--ArkInventory.Output( "resumed" )
						
						recheck = true
						
					end
					
				end
			
			end
			
		end
		
	end
	
	coroutine.yield( )
	
	return abort, recheck
	
end

local function ConsolidateBag( loc_id, bag_id, bag_pos )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = loc_id
	
	
	if not me.player.data.option[loc_id].bag[bag_id].restack.ignore then
		
		local ab, bt, count = RestackBagCheck( loc_id, bag_id )
		if ab then
			return cl, recheck, false
		end
		
		--ArkInventory.Output( "ConsolidateBag( ", loc_id, ".", bag_id, " )" )
		
		--ArkInventory.Output( "bag> ", loc_id, ".", bag_id, " (", bag_pos, ") ", bt, " / ", count )
		
		local ok = true
		local moved = 0
		
		for slot_id = count, 1, -1 do
			
			if RestackBagCheck( loc_id, bag_id ) then
				return cl, recheck, false
			end
			
			--ArkInventory.Output( "chk> ", loc_id, ".", bag_id, ".", slot_id )
			
			if select( 3, GetContainerItemInfo( bag_id, slot_id ) ) then
				
				-- this slot is locked, move on and check it again next time
				recheck = true
				--ArkInventory.Output( "locked @ ", loc_id, ".", bag_id, ".", slot_id )
				
			else
				
				local h = GetContainerItemLink( bag_id, slot_id )
				
				if not h then
					
					--ArkInventory.Output( "empty @ ", loc_id, ".", bag_id, ".", slot_id )
					
					local ab, rc, sb, ss
					if bt == 0 then
						ab, rc, ok, sb, ss = FindCraftingItem( loc_id, loc_id, bag_id, bag_pos, slot_id, bt )
					else
						ab, rc, ok, sb, ss = FindProfessionItem( loc_id, loc_id, bag_id, bag_pos, slot_id, bt )
					end
					
					if rc then
						recheck = true
					end
					
					if ok then
						
						--ArkInventory.Output( "moving> ", sb, ".", ss, " to ", bag_id, ".", slot_id )
						
						ClearCursor( )
						PickupContainerItem( sb, ss )
						PickupContainerItem( bag_id, slot_id )
						ClearCursor( )
						
						recheck = true
						
						moved = moved + 1
						if moved > yield_num then
							coroutine.yield( )
						end
						
					end
					
				else
					
					--ArkInventory.Output( "item> ", loc_id, ".", bag_id, ".", slot_id, " ", h )
					
				end
				
			end
			
			if not ok then
				-- no reagent/profession item found so no point checking the rest of the slots for this bag
				break
			end
			
		end
		
	end
	
	return abort, recheck
	
end

local function Consolidate( loc_id )
	
	--ArkInventory.Output( "Consolidate ", loc_id )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = loc_id
	
	-- fill up profession bags with profession items
	for bag_pos = #ArkInventory.Global.Location[loc_id].Bags, 1, -1 do
		
		local bag_id = ArkInventory.Global.Location[loc_id].Bags[bag_pos]
		
		if not me.player.data.option[loc_id].bag[bag_id].restack.ignore then
			
			local ab, bt, count = RestackBagCheck( loc_id, bag_id )
			if ab then
				return cl, recheck, false
			end
			
			if count > 0 and bt ~= 0 then
				
				--ArkInventory.Output( "Consolidate ", loc_id, ".", bag_id, " ", bt )
				
				local ab, rc = ConsolidateBag( loc_id, bag_id, bag_pos )
				
				if ab then
					return ab, recheck
				end
				
				if rc then
					recheck = true
				end
				
			end
			
		end
		
	end
	
	if loc_id == ArkInventory.Const.Location.Bank then
		
		if  ArkInventory.db.option.restack.deposit and IsReagentBankUnlocked( ) then
			
			-- fill up reagent bank with crafting items
			
			local bag_id = REAGENTBANK_CONTAINER
			
			if not me.player.data.option[loc_id].bag[bag_id].restack.ignore then
				
				if RestackBagCheck( loc_id, bag_id ) then
					return cl, recheck, false
				end
				
				local ab, rc = ConsolidateBag( loc_id, bag_id )
				
				if ab then
					return ab, recheck
				end
				
				if rc then
					recheck = true
				end
				
			end
			
		end
		
		if ArkInventory.db.option.restack.bank then
			
			-- fill up normal bags with crafting items
			
			for bag_pos = #ArkInventory.Global.Location[loc_id].Bags, 1, -1 do
				
				local bag_id = ArkInventory.Global.Location[loc_id].Bags[bag_pos]
				
				if not me.player.data.option[loc_id].bag[bag_id].restack.ignore then
					
					local ab, bt, count = RestackBagCheck( loc_id, bag_id )
					if ab then
						return cl, recheck, false
					end
					
					if bt == 0 and bag_id ~= REAGENTBANK_CONTAINER then
						
						local ab, rc = ConsolidateBag( loc_id, bag_id, bag_pos )
						
						if ab then
							return ab, recheck
						end

						if rc then
							recheck = true
						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
	return abort, recheck
	
end

local function CompactBag( loc_id, bag_id, bag_pos )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = loc_id
	
	
	if not me.player.data.option[loc_id].bag[bag_id].restack.ignore then
		
		--ArkInventory.Output( "CompactBag( ", loc_id, ".", bag_id, " )" )
		
		local ab, bt, count = RestackBagCheck( loc_id, bag_id )
		if ab then
			return cl, recheck, false
		end
		
		--ArkInventory.Output( "bag> ", loc_id, ".", bag_id, " (", bag_pos, ") ", bt, " / ", count )
		
		local ok = true
		local moved = 0
		
		for slot_id = count, 1, -1 do
			
			if RestackBagCheck( loc_id, bag_id ) then
				return cl, recheck, false
			end
			
			--ArkInventory.Output( "chk> ", loc_id, ".", bag_id, ".", slot_id )
			
			if select( 3, GetContainerItemInfo( bag_id, slot_id ) ) then
				
				-- this slot is locked, move on and check it again next time
				recheck = true
				--ArkInventory.Output( "locked @ ", loc_id, ".", bag_id, ".", slot_id )
				
			else
				
				local h = GetContainerItemLink( bag_id, slot_id )
				
				if not h then
					
					--ArkInventory.Output( "empty @ ", loc_id, ".", bag_id, ".", slot_id )
					
					local ab, rc, sb, ss
					ab, rc, ok, sb, ss = FindNormalItem( loc_id, loc_id, bag_id, bag_pos, slot_id, bt )
					
					if rc then
						recheck = true
					end
					
					if ok then
						
						--ArkInventory.Output( "moving> ", sb, ".", ss, " to ", bag_id, ".", slot_id )
						
						ClearCursor( )
						PickupContainerItem( sb, ss )
						PickupContainerItem( bag_id, slot_id )
						ClearCursor( )
						
						recheck = true
						
						moved = moved + 1
						if moved > yield_num then
							coroutine.yield( )
						end
						
					end
					
				else
					
					--ArkInventory.Output( "item> ", loc_id, ".", bag_id, ".", slot_id, " ", h )
					
				end
				
			end
			
			if not ok then
				-- no item found so no point checking the rest of the slots for this bag
				break
			end
			
		end
		
	end
	
	return abort, recheck
	
end

local function Compact( loc_id )
	
	--ArkInventory.Output( "Compact ", loc_id )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = loc_id
	
	for bag_pos = #ArkInventory.Global.Location[loc_id].Bags, 1, -1 do
		
		local bag_id = ArkInventory.Global.Location[loc_id].Bags[bag_pos]
		
		if not me.player.data.option[loc_id].bag[bag_id].restack.ignore then
			
			local ab, bt, count = RestackBagCheck( loc_id, bag_id )
			if ab then
				return cl, recheck, false
			end
			
			if count > 0 and bt == 0 and bag_id ~= REAGENTBANK_CONTAINER then
				
				--ArkInventory.Output( "Compact ", loc_id, ".", bag_id, " ", bt )
				
				local ab, rc = CompactBag( loc_id, bag_id, bag_pos )
				
				if ab then
					return ab, recheck
				end
				
				if rc then
					recheck = true
				end
				
			end
			
		end
		
	end
	
	return abort, recheck
	
end



local function RestackRun( loc_id )
	
	-- DO NOT USE CACHED DATA FOR RESTACKING, PULL THE DATA DIRECTLY FROM WOW AGAIN, THE UI WILL CATCH UP
	
	local me = ArkInventory.GetPlayerCodex( )
	local ok = false
	local abort, recheck
	
	if loc_id == ArkInventory.Const.Location.Bag then
		
		RestackMessageStart( loc_id )
		
		if ArkInventory.db.option.restack.blizzard then
			
			SortBags( )
			
		else
			
			repeat
				
				ok = true
				
				abort, recheck = StackBags( loc_id )
				
				if abort then
					RestackMessageAbort( loc_id )
					break
				end
				
				if recheck then
					ok = false
					coroutine.yield( )
				end
				
				
				abort, recheck = Consolidate( loc_id )
				
				if abort then
					RestackMessageAbort( loc_id )
					break
				end
				
				if recheck then
					ok = false
					coroutine.yield( )
				end
				
				
--[[
				abort, recheck = Compact( loc_id )
				
				if abort then
					RestackMessageAbort( loc_id )
					break
				end
				
				if recheck then
					ok = false
					coroutine.yield( )
				end
]]--
				
			until ok
			
		end
		
		RestackMessageComplete( loc_id )
		
	end
	
	
	if loc_id == ArkInventory.Const.Location.Bank then
		
		if ArkInventory.Global.Mode.Bank then
			
			RestackMessageStart( loc_id )
			
			if ArkInventory.db.option.restack.blizzard then
				
				SortBankBags( )
--				coroutine.yield( )
				
				if IsReagentBankUnlocked( ) then
					
					if ArkInventory.db.option.restack.deposit then
						ArkInventory.Output( ArkInventory.RestackString( ), ": ", REAGENTBANK_DEPOSIT, " " , ArkInventory.Localise["ENABLED"] )
						DepositReagentBank( )
--						coroutine.yield( )
					else
						ArkInventory.Output( ArkInventory.RestackString( ), ": ", REAGENTBANK_DEPOSIT, " " , ArkInventory.Localise["DISABLED"] )
					end
					
					local bag_id = ArkInventory.Global.Location[loc_id].tabReagent
					if not me.player.data.option[loc_id].bag[bag_id].restack.ignore then
						SortReagentBankBags( )
--						coroutine.yield( )
					end
					
				end
				
			else
				
				repeat
					
					ok = true
					
					
					abort, recheck = StackBags( loc_id )
					
					if abort then
						RestackMessageAbort( loc_id )
						break
					end
					
					if recheck then
						ok = false
						coroutine.yield( )
					end
					
					
					abort, recheck = Consolidate( loc_id )
					
					if abort then
						RestackMessageAbort( loc_id )
						break
					end
					
					if recheck then
						ok = false
						coroutine.yield( )
					end
					
					
--[[
					abort, recheck = Compact( loc_id )
					
					if abort then
						RestackMessageAbort( loc_id )
						break
					end
					
					if recheck then
						ok = false
						coroutine.yield( )
					end
]]--
					
				until ok
				
			end
			
			RestackMessageComplete( loc_id )
			
		end
		
	end
	
	
	if loc_id == ArkInventory.Const.Location.Vault then
		
		if ArkInventory.Global.Mode.Vault then
			
			RestackMessageStart( loc_id )
			
			repeat
				
				abort, recheck = StackVault( )
				
				if abort then
					RestackMessageAbort( loc_id )
					break
				end
				
				-- do not yield here
				
			until not recheck
			
			RestackMessageComplete( loc_id )
			
		end
		
	end
	
end

function ArkInventory.RestackResume( id )
	
	--ArkInventory.Output( "RestackResume ", loc_id )
	local done = true
	
	for loc_id in pairs( ArkInventory.Global.Location ) do
		if type( ArkInventory.Global.Thread.Restack[loc_id] ) == "thread" and coroutine.status( ArkInventory.Global.Thread.Restack[loc_id] ) == "suspended" then
			done = false
			if not id or id == loc_id then
				local ok, errmsg = coroutine.resume( ArkInventory.Global.Thread.Restack[loc_id] )
				if not ok then
					error( errmsg )
				end
			end
		end
	end
	
	return done
	
end

local function RestackLocation( loc_id )
	
	if ArkInventory.Global.Mode.Combat then
		--ArkInventory.Output( "restack location ", loc_id, " aborted - in combat" )
		return
	end
	
	if type( ArkInventory.Global.Thread.Restack[loc_id] ) ~= "thread" or coroutine.status( ArkInventory.Global.Thread.Restack[loc_id] ) == "dead" then
		
		-- thread not active, create a new one
		ArkInventory.Global.Thread.Restack[loc_id] = coroutine.create(
			function ( )
				RestackRun( loc_id )
			end
		)
		
	else
		
		-- restack already in progress
		ArkInventory.OutputError( ArkInventory.RestackString( ), ": ", ArkInventory.Global.Location[loc_id].Name, " " , ArkInventory.Localise["RESTACK_FAIL_WAIT"] )
		
	end
	
	ArkInventory.RestackResume( loc_id )
	
end

function ArkInventory.Restack( loc_id )
	ARKINV_TimerYieldRestack:Show( )
	RestackLocation( loc_id )
end

function ArkInventory.EmptyBag( loc_id, cbag )
	
	local cbag = ArkInventory.BagID_Blizzard( loc_id, cbag )
	
	if not ( loc_id == ArkInventory.Const.Location.Bag or loc_id == ArkInventory.Const.Location.Bank ) then
		return
	end
	
	local _, ct = GetContainerNumFreeSlots( cbag )
	local cslot = 0
	
	--ArkInventory.Output( "empty ", cbag, " [", ct, "]" )
	
	for bag_pos, bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		local _, bt = GetContainerNumFreeSlots( bag_id )
		
		if bag_id ~= cbag and ( bt == 0 or bt == ct ) then
			
			for slot_id = 1, GetContainerNumSlots( bag_id ) do
				
				if loc_id == ArkInventory.Const.Location.Bank and not ArkInventory.Global.Mode.Bank then
					-- no longer at bank, abort
					return
				end
				
				local h = GetContainerItemLink( bag_id, slot_id )
				
				if not h then
					
					repeat
						cslot = cslot + 1
						h = GetContainerItemLink( cbag, cslot )
					until h or cslot > GetContainerNumSlots( cbag )
					
					if h then
						ClearCursor( )
						PickupContainerItem( cbag, cslot )
						PickupContainerItem( bag_id, slot_id )
						ClearCursor( )
					end
				
				end
				
			end
			
		end
		
	end
	
end
