local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table
local CreateFrame = _G.CreateFrame


function ArkInventory.TooltipInit( name )
	
	local tooltip = _G[name]
	assert( tooltip, string.format( "XML Frame [%s] not found", name ) )
	
	tooltip.ARK_Data = { scan = true }
	
	return tooltip
	
end

function ArkInventory.TooltipNumLines( tooltip )
	
	return tooltip:NumLines( ) or 0
	
end

function ArkInventory.TooltipSetHyperlink( tooltip, h )
	
	if not tooltip.ARK_Data then
		tooltip.ARK_Data = { }
	end
	
	if tooltip.ARK_Data.scan and tooltip.ARK_Data.h == h then
		-- its the scan tooltip and the hyperlink is the same as last time
		return
	end
	
	tooltip:ClearLines( )
	tooltip.ARK_Data.h = h
	
	if h then
		
		local osd = ArkInventory.ObjectStringDecode( h )
		
		if osd.class == "item" or osd.class == "spell" then
			return tooltip:SetHyperlink( h )
		end
		
	end
	
end

function ArkInventory.TooltipSetBagItem( tooltip, bag_id, slot_id )
	
	tooltip:ClearLines( )
	
	return tooltip:SetBagItem( bag_id, slot_id )
	
end

function ArkInventory.TooltipSetInventoryItem( tooltip, slot )
	
	tooltip:ClearLines( )
	
	return tooltip:SetInventoryItem( "player", slot )
	
end

function ArkInventory.TooltipSetGuildBankItem( tooltip, tab, slot )
	
	tooltip:ClearLines( )
	
	return tooltip:SetGuildBankItem( tab, slot )
	
end

function ArkInventory.TooltipSetItem( tooltip, bag_id, slot_id )
	
	-- not for offline mode, only direct online scanning of the current player
	
	if bag_id == BANK_CONTAINER then
		
		return ArkInventory.TooltipSetInventoryItem( tooltip, BankButtonIDToInvSlotID( slot_id ) )
		
	elseif bag_id == REAGENTBANK_CONTAINER then
		
		return ArkInventory.TooltipSetInventoryItem( tooltip, ReagentBankButtonIDToInvSlotID( slot_id ) )
		
	else
		
		return ArkInventory.TooltipSetBagItem( tooltip, bag_id, slot_id )
		
	end
	
end


function ArkInventory.TooltipAddBattlepetDetail( tooltip, speciesID, i, link )
	
	if not speciesID then return end
	
	ArkInventory.TooltipAddEmptyLine( tooltip )
	
	local numOwned, maxAllowed = C_PetJournal.GetNumCollectedInfo( speciesID )
	local info = ""
	
	if numOwned == 0 then
		info = ArkInventory.Localise["NOT_COLLECTED"]
	else
		info = string.format( ITEM_PET_KNOWN, numOwned, maxAllowed )
	end
	
	tooltip:AddLine( info )
	
	local tt = { }
	for _, pd in ArkInventory.PetJournal.Iterate( ) do
		if ( pd.sd.speciesID == speciesID ) then
			tt[#tt  + 1] = pd
		end
	end
	
	if ( i and numOwned > 1 ) or ( not i and numOwned > 0 ) then
		
		for k, pd in pairs( tt ) do
			
			info = ""
			
			local c = select( 5, ArkInventory.GetItemQualityColor( pd.rarity ) )
			info = string.format( "%s%s%s|r%s", info, c, _G[string.format( "ITEM_QUALITY%d_DESC", pd.rarity )], "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:16:32:0:16|t" )
			
			info = string.format( "%s  %s%s", info, pd.level, "|TInterface\\PetBattles\\BattleBar-AbilityBadge-Strong-Small:0|t" )
			
			if pd.sd.canBattle then
				
				local iconPetAlive = "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:16:32:16:32|t"
				local iconPetDead = "|TInterface\\Scenarios\\ScenarioIcon-Boss:0|t"
				if ( pd.health <= 0 ) then
					info = string.format( "%s  %.0f%s", info, pd.maxHealth, iconPetDead )
				else
					info = string.format( "%s  %.0f%s", info, pd.maxHealth, iconPetAlive )
				end
		
				info = string.format( "%s  %.0f%s", info, pd.power, "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:0:16:0:16|t" )
				info = string.format( "%s  %.0f%s", info, pd.speed, "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:0:16:16:32|t" )
				
				if pd.breed then
					info = string.format( "%s  %s", info, pd.breed )
				end
				
				if ( not i ) or ( i and i.guid ~= pd.guid ) then
					tooltip:AddLine( info )
				end
				
			end
			
		end
		
	end
	
	local h = link or string.format( "battlepet:%s", speciesID )
	ArkInventory.TooltipHook( tooltip, h )
	
	tooltip:Show( )
	
end

function ArkInventory.TooltipSetBattlepet( tooltip, h, i )
	
	-- creates a basic text tooltip, then hooks via the hyperlink for the item counts
	-- mouseover pet items, and clicking pet links
	
	-- mouseover tooltip for pets is done at TooltipHookSetUnit
	
	local osd = ArkInventory.ObjectStringDecode( h )
	
	if osd.class ~= "battlepet" then return end
	
	--ArkInventory.Output( "[", osd.class, " : ", osd.id, " : ", osd.level, " : ", osd.q, " : ", osd.maxhealth, " : ", osd.power, " : ", osd.speed, "]" )
	
	if not ArkInventory.db.option.tooltip.battlepet.enable then
		BattlePetToolTip_Show( osd.id, osd.level, osd.q, osd.maxhealth, osd.power, osd.speed )
		return
	end
	
	local sd = ArkInventory.PetJournal.GetSpeciesInfo( osd.id )
	if not sd then
		--ArkInventory.OutputWarning( "no species data found for ", osd.id )
		return
	end
	
	local name = sd.name
	local pd
	local rarity = osd.q
	
	if i and i.index then
		pd = ArkInventory.PetJournal.GetPet( i.index )
		if pd then
			if rarity == -1 then
				rarity = pd.rarity
			end
			name = pd.fullname
		end
	end
	
	tooltip:ClearLines( )
	
	if sd.isWild then
		name = string.format( "%s%s|r", select( 5, ArkInventory.GetItemQualityColor( rarity ) ), name )
	end
	
	tooltip:AddLine( string.format( "|T%s:32:32:-4:4:128:256:64:100:130:166|t %s", GetPetTypeTexture( sd.petType ), name ) )
	
	if ArkInventory.db.option.tooltip.battlepet.source then
		if sd.sourceText and sd.sourceText ~= "" then
			tooltip:AddLine( sd.sourceText, 1, 1, 1, true )
		end
	end
	
	if ( not sd.tradable ) then
		tooltip:AddLine( BATTLE_PET_NOT_TRADABLE, 1, 0.1, 0.1, true )
	end
	
	if sd.unique then
		tooltip:AddLine( ITEM_UNIQUE, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, true )
	end
	
	if ArkInventory.db.option.tooltip.battlepet.description and ( sd.description and sd.description ~= "" ) then
		tooltip:AddLine( " " )
		tooltip:AddLine( sd.description, nil, nil, nil, true )
	end
	
	if sd.canBattle then
		
		tooltip:AddLine( " " )
		
		
		txt1 = LEVEL
		txt2 = string.format( "%s %s", osd.level, "|TInterface\\PetBattles\\BattleBar-AbilityBadge-Strong-Small:0|t" )
		if pd and pd.xp and pd.maxXp and pd.xp > 0 then
			
			local pc = pd.xp / pd.maxXp * 100
			if pc < 1 then
				pc = 1
			elseif pc > 99 then
				pc = 99
			end
			
			txt1 = string.format( "%s (%d%%)", txt1, pc )
			
		end
		tooltip:AddDoubleLine( txt1, txt2 )
		
		
		local iconPetAlive = "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:16:32:16:32|t"
		local iconPetDead = "|TInterface\\Scenarios\\ScenarioIcon-Boss:0|t"
		txt1 = PET_BATTLE_STAT_HEALTH
		if pd and pd.health and ( pd.health <= 0 ) then
			
			txt1 = string.format( "%s (%s)", txt1, DEAD )
			txt2 = string.format( "%s %s", osd.maxhealth, iconPetDead )
			
		else
			
			if pd and ( pd.health ~= osd.maxhealth ) then
				
				local pc = pd.health / osd.maxhealth * 100
				if pc < 1 then
					pc = 1
				elseif pc > 99 then
					pc = 99
				end
				
				txt1 = string.format( "%s (%d%%)", txt1, pc )
				
			end
			
			txt2 = string.format( "%s %s", osd.maxhealth, iconPetAlive )
			
		end
		tooltip:AddDoubleLine( txt1, txt2 )
		
		
		-- |TTexturePath:size1:size2:offset-x:offset-y:original-size-x:original-size-y:crop-x1:crop-x2:crop-y1:crop-y2|t
		tooltip:AddDoubleLine( PET_BATTLE_STAT_POWER, string.format( "%s %s", osd.power, "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:0:16:0:16|t" ) )
		
		
		tooltip:AddDoubleLine( PET_BATTLE_STAT_SPEED, string.format( "%s %s", osd.speed, "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:0:16:16:32|t" ) )
		
		
		if ( not sd.isWild ) and ( rarity ~= -1 ) then
			-- only need this for system pets as the wild pets have their names colour coded
			-- ignore the -1, those will be from other peoples links and we cant get at that data
			local c = select( 5, ArkInventory.GetItemQualityColor( rarity ) )
			tooltip:AddDoubleLine( PET_BATTLE_STAT_QUALITY, string.format( "%s%s %s", c, _G[string.format( "ITEM_QUALITY%d_DESC", rarity )], "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:16:32:0:16|t" ) )
		end

	else
		
		tooltip:AddLine( ArkInventory.Localise["PET_CANNOT_BATTLE"], 1.0, 0.1, 0.1, true )
		
	end
	
	
	tooltip:Show( )
	
	ArkInventory.TooltipAddBattlepetDetail( tooltip, osd.id, i, h )
	
end

function ArkInventory.TooltipHookSetUnit( ... )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if not ArkInventory.db.option.tooltip.battlepet.mouseover.enable then return end
	
	local tooltip = ...
	
	local _, unit = tooltip:GetUnit( )
	
	if unit and ( UnitIsWildBattlePet( unit ) or UnitIsOtherPlayersBattlePet( unit ) or UnitIsBattlePetCompanion( unit ) ) then
		
		local speciesID = UnitBattlePetSpeciesID( unit )
		
		if speciesID then
			
			tooltip:Show( ) -- its a static tooltip, need to show it first to be able to add to it
			
			sd = ArkInventory.PetJournal.GetSpeciesInfo( speciesID )
			
			if sd then
				
				if ArkInventory.db.option.tooltip.battlepet.mouseover.source and sd.sourceText and ( sd.sourceText ~= "" ) then
					tooltip:AddLine( " " )
					tooltip:AddLine( sd.sourceText, nil, nil, nil, true )
				end
				
				if ArkInventory.db.option.tooltip.battlepet.mouseover.description and sd.description and ( sd.description ~= "" ) then
					tooltip:AddLine( " " )
					tooltip:AddLine( sd.description, nil, nil, nil, true )
				end
				
			end
			
			if ArkInventory.db.option.tooltip.add.count then
				ArkInventory.TooltipAddBattlepetDetail( tooltip, speciesID )
			end
			
		end
		
	end
	
end
	
function ArkInventory.TooltipGetMoneyFrame( tooltip )
	
	return _G[string.format( "%s%s", tooltip:GetName( ), "MoneyFrame1" )]
	
end

function ArkInventory.TooltipGetItem( tooltip )
	
	local itemName, ItemLink = tooltip:GetItem( )
	return itemName, ItemLink
	
end

function ArkInventory.TooltipFind( tooltip, TextToFind, IgnoreLeft, IgnoreRight, CaseSensitive, maxDepth, BaseOnly )
	
	local TextToFind = TextToFind
	if not TextToFind or string.trim( TextToFind ) == "" then
		return false
	end
	
	local IgnoreLeft = IgnoreLeft or false
	local IgnoreRight = IgnoreRight or false
	
	local CaseSensitive = CaseSensitive or false
	if not CaseSensitive then
		TextToFind = string.lower( TextToFind )
	end
	
	local maxDepth = maxDepth or 0
	local BaseOnly = BaseOnly or false
	
	local obj, txt
	
	for i = 2, ArkInventory.TooltipNumLines( tooltip ) do
		
		if maxDepth > 0 and i > maxDepth then return end
		
		obj = _G[string.format( "%s%s%s", tooltip:GetName( ), "TextLeft", i )]
		if obj and obj:IsShown( ) then
			
			txt = ArkInventory.StripColourCodes( obj:GetText( ) )
			if txt then
				
				--ArkInventory.Output( "L[", i, "] = [", txt, "]" )
				
				if BaseOnly and ( string.match( txt, "^%s+$" ) or string.match( txt, "^\n" ) ) then
					-- recipies and patterns have a blank line between the item and what it creates
					-- techniques have a newline character to break them up
					return false
				end
				
				if not IgnoreLeft then

					if not CaseSensitive then
						txt = string.lower( txt )
					end
					
					if string.find( txt, TextToFind ) then
						return string.find( txt, TextToFind )
					end
					
				end
				
			end
			
		end
		
		if not IgnoreRight then
			
			obj = _G[string.format( "%s%s%s", tooltip:GetName( ), "TextRight", i )]
			if obj and obj:IsShown( ) then
				
				txt = ArkInventory.StripColourCodes( obj:GetText( ) )
				if txt then
					
					--ArkInventory.Output( "R[", i, "] = [", txt, "]" )
					
					if not CaseSensitive then
						txt = string.lower( txt )
					end
					
					if string.find( txt, TextToFind ) then
						return string.find( txt, TextToFind )
					end
					
				end
				
			end
			
		end
		
	end
	
	return
	
end

function ArkInventory.TooltipFindExact( tooltip, TextToFind, IgnoreLeft, IgnoreRight, CaseSensitive, maxDepth, BaseOnly )
	
	local TextToFind = TextToFind
	if not TextToFind or string.trim( TextToFind ) == "" then
		return false
	end
	
	TextToFind = string.format( "^%s$", TextToFind )
	return ArkInventory.TooltipFind( tooltip, TextToFind, IgnoreLeft, IgnoreRight, CaseSensitive, maxDepth, BaseOnly )
	
end

function ArkInventory.TooltipGetLine( tooltip, i )

	if not i or i < 1 or i > ArkInventory.TooltipNumLines( tooltip ) then
		return
	end
	
	local obj, txt1, txt2
	
	obj = _G[string.format( "%s%s%s", tooltip:GetName( ), "TextLeft", i )]
	if obj and obj:IsShown( ) then
		txt1 = obj:GetText( )
	end
	
	obj = _G[string.format( "%s%s%s", tooltip:GetName( ), "TextRight", i )]
	if obj and obj:IsShown( ) then
		txt2 = obj:GetText( )
	end
	
	txt1 = ArkInventory.StripColourCodes( txt1 )
	return txt1 or "", txt2 or ""
	
end
	
function ArkInventory.TooltipContains( tooltip, TextToFind, IgnoreLeft, IgnoreRight, CaseSensitive, BaseOnly )
	
	if ArkInventory.TooltipFind( tooltip, TextToFind, IgnoreLeft, IgnoreRight, CaseSensitive, 0, BaseOnly ) then
		return true
	else
		return false
	end
	
end

function ArkInventory.TooltipCanUse( tooltip, ignoreknown )

	local l = { "TextLeft", "TextRight" }
	
	local n = ArkInventory.TooltipNumLines( tooltip )
	
	local t1 = tooltip:GetItem( )
	local line1 = _G[string.format( "%sTextLeft1", tooltip:GetName( ) )]:GetText( )
	
	for i = 2, n do
		for _, v in pairs( l ) do
			
			local obj = _G[string.format( "%s%s%s", tooltip:GetName( ), v, i )]
			if obj and obj:IsShown( ) then
				
				local txt = obj:GetText( )
				
				if string.match( txt, "^%s+$" ) or string.match( txt, "^\n" ) then
					-- recipies and patterns have a blank line between the item and what it creates so check from the last line upwards now
					-- techniques have a newline character to break them up
					return ArkInventory.TooltipCanUseBackwards( tooltip, ignoreknown )
				end
				
				local r, g, b = obj:GetTextColor( )
				local c = string.format( "%02x%02x%02x", r * 255, g * 255, b * 255 )
				if c == "fe1f1f" then
					
					if txt == ITEM_SPELL_KNOWN then
						
						--ArkInventory.Output( "line[", i, "]=[", txt, "] forwards" )
						if not ignoreknown then
							return false
						end
					
					elseif not ( txt == ITEM_DISENCHANT_NOT_DISENCHANTABLE or txt == RETRIEVING_ITEM_INFO ) then
						
						--ArkInventory.Output( "line[", i, "]=[", txt, "] forwards" )
						return false
						
					end
					
				end

			end
		end
	end

	return true
	
end

function ArkInventory.TooltipCanUseBackwards( tooltip, ignoreknown )

	local l = { "TextLeft", "TextRight" }
	
	local n = ArkInventory.TooltipNumLines( tooltip )
	
	for i = n, 2, -1 do
		for _, v in pairs( l ) do
			local obj = _G[string.format( "%s%s%s", tooltip:GetName( ), v, i )]
			if obj and obj:IsShown( ) then
				
				local txt = obj:GetText( )
				
				if string.match( txt, "^%s+$" ) or string.match( txt, "^\n" ) then
					-- recipies and patterns have a blank line between the pattern and the item it created, stop when we hit a blank line
					-- techniques have a newline character to break them up
					return true
				end
				
				local r, g, b = obj:GetTextColor( )
				local c = string.format( "%02x%02x%02x", r * 255, g * 255, b * 255 )
				if c == "fe1f1f" then
					
					if txt == ITEM_SPELL_KNOWN then
						
						--ArkInventory.Output( "line[", i, "]=[", txt, "] backwards" )
						if not ignoreknown then
							return false
						end
					
					elseif not ( txt == ITEM_DISENCHANT_NOT_DISENCHANTABLE or txt == RETRIEVING_ITEM_INFO ) then
						
						--ArkInventory.Output( "line[", i, "]=[", txt, "] backwards" )
						return false
						
					end
					
				end

			end
		end
	end

	return true
	
end


function ArkInventory.TooltipHook( ... )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if not ArkInventory.db.option.tooltip.show then return end
	
	if ArkInventory.Global.Mode.Combat then return end

	local tooltip, arg1, arg2, arg3, arg4 = ...
	
	if not tooltip then return end
	
	if not tooltip:IsVisible( ) then
		-- dont add stuff to tooltips until after they become visible for the first time
		return
	end
	
	tooltip.ARK_Data[1] = arg1
	tooltip.ARK_Data[2] = arg2
	tooltip.ARK_Data[3] = arg3
	tooltip.ARK_Data[4] = arg4
	
	--ArkInventory.Output( tooltip.ARK_Data )
	
	local _, h, addItemCount
	
	if not h and tooltip["GetItem"] then
		
		local name, link = tooltip:GetItem( )
		--ArkInventory.Output( "[", name, "] = ", gsub( link, "\124", "\124\124" ) )
		
		-- check for broken hyperlink bug
		if name and name ~= "" then
			addItemCount = true
			h = link
		end
		
	end
	
	if not h and tooltip["GetSpell"] then
		
		local name, rank, id = tooltip:GetSpell( )
		
		if id then
			h = GetSpellLink( id )
			--ArkInventory.Output( "GetSpell = ", h )
		end
		
	end
	
	if not h and arg1 and type( arg1 ) == "string" then
		h = arg1
	end
	
	if not h then
		--ArkInventory.Output( "nothing found" )
		return
	end
	
	if ArkInventory.db.option.tooltip.add.count then
		local osd = ArkInventory.ObjectStringDecode( h )
		if osd.class == "item" or osd.class == "currency" or osd.class == "battlepet" or osd.class == "spell" then
			ArkInventory.TooltipAddItemCount( tooltip, h )
		end
	end
	
	--ArkInventory.TooltipAddItemAge( tooltip, h, arg1, arg2 )
	
	tooltip:Show( )
	
end

function ArkInventory.TooltipHookSetCurrencyToken( ... )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if not ArkInventory.db.option.tooltip.show then return end
	
	local tooltip, arg1 = ...
	
	if not tooltip then return end
	
	local h = GetCurrencyListLink( arg1 )
	
	ArkInventory.TooltipHook( tooltip, h )
	
end

function ArkInventory.TooltipHookSetMerchantCostItem( ... )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if not ArkInventory.db.option.tooltip.show then return end
	
	local tooltip, slot, index = ...
	
	if not tooltip then return end
	
	local currencies = { GetMerchantCurrencies( ) }
	--ArkInventory.Output( slot, " / ", index, " / ", currencies )
	
	if currencies[index] then
		local h = GetCurrencyLink( currencies[index] )
		
		if h then
			ArkInventory.TooltipHook( tooltip, h )
		end
		
	end
	
end

function ArkInventory.TooltipHookSetCurrencyByID( ... )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if not ArkInventory.db.option.tooltip.show then return end
	
	local tooltip, id = ...
	
	if not tooltip then return end
	
	local h = GetCurrencyLink( id )
	
	if h then
		ArkInventory.TooltipHook( tooltip, h )
	end
	
end

function ArkInventory.TooltipHookSetBackpackToken( ... )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if not ArkInventory.db.option.tooltip.show then return end
	
	local tooltip, arg1 = ...
	
	if not tooltip then return end
	
	local name, count, icon, currencyID = GetBackpackCurrencyInfo( arg1 )
	local h = GetCurrencyLink( currencyID )
	
	ArkInventory.TooltipHook( tooltip, h )
	
end

function ArkInventory.TooltipHookSetRecipeReagentItem( ... )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if not ArkInventory.db.option.tooltip.show then return end
	
	local tooltip, arg1, arg2 = ...
	
	if tooltip and arg1 and arg2 then
		
		local h = C_TradeSkillUI.GetRecipeReagentItemLink( arg1, arg2 )
		--ArkInventory.Output( "recipe id:", arg1, " / reagent index:", arg2, " = ", h )
		ArkInventory.TooltipHook( tooltip, h )
		
	end
	
end

function ArkInventory.TooltipHookSetRecipeResultItem( ... )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if not ArkInventory.db.option.tooltip.show then return end
	
	local tooltip, arg1 = ...
	
	if tooltip and arg1 then
		
		local h = C_TradeSkillUI.GetRecipeItemLink( arg1 )
		--ArkInventory.Output( "recipe id:", arg1, " = ", h )
		ArkInventory.TooltipHook( tooltip, h )
		
	end
	
end


function ArkInventory.TooltipAddEmptyLine( tooltip )
	
	if ArkInventory.db.option.tooltip.add.empty then
		tooltip:AddLine( " ", 1, 1, 1, 0 )
	end
	
end

function ArkInventory.TooltipAddItemCount( tooltip, h )
	
	local search_id = ArkInventory.ObjectIDCount( h )
	local tt = ArkInventory.TooltipObjectCountGet( search_id, tooltip )
	
	if tt and tt ~= "" then
		local tc = ArkInventory.db.option.tooltip.colour.count
		ArkInventory.TooltipAddEmptyLine( tooltip )
		tooltip:AddLine( tt, tc.r, tc.g, tc.b, 0 )
	end
	
end

function ArkInventory.TooltipAddItemAge( tooltip, h, blizzard_id, slot_id )
	
	if type( blizzard_id ) == "number" and type( slot_id ) == "number" then
		ArkInventory.TooltipAddEmptyLine( tooltip )
		local bag_id = ArkInventory.BagID_Internal( blizzard_id )
		tooltip:AddLine( tt, 1, 1, 1, 0 )
	end

end

function ArkInventory.TooltipObjectCountGet( search_id, tooltip )
	
	local codex = ArkInventory.GetPlayerCodex( )
	
	if tooltip then
		tooltip = tooltip:GetOwner( )
		if tooltip and tooltip.ARK_Data and tooltip.ARK_Data.loc_id then
			codex = ArkInventory.GetLocationCodex( tooltip.ARK_Data.loc_id )
			if not codex.player.data.info.isplayer then
				codex = ArkInventory.GetPlayerCodex( )
			end
		end
	end
	
	
	local player_id = codex.player.data.info.player_id
	
	if not ArkInventory.Global.Cache.ItemCountTooltip[player_id] then
		ArkInventory.Global.Cache.ItemCountTooltip[player_id] = { }
	end
	
	if ArkInventory.Global.Cache.ItemCountTooltip[player_id][search_id] then
		--ArkInventory.Output( "returning cached tooltip count ", player_id, " / ", search_id )
		return ArkInventory.Global.Cache.ItemCountTooltip[player_id][search_id]
	end
	
	--ArkInventory.Output( "building cached tooltip count ", player_id, " / ", search_id )
	local tc = ArkInventory.ObjectCountGet( search_id, player_id, ArkInventory.db.option.tooltip.me, not ArkInventory.db.option.tooltip.add.vault, ArkInventory.db.option.tooltip.faction, ArkInventory.db.option.tooltip.realm, ArkInventory.db.option.tooltip.crossrealm )
	if tc == nil then
		--ArkInventory.OutputDebug( "no count data" )
		ArkInventory.Global.Cache.ItemCountTooltip[player_id][search_id] = ""
		return ArkInventory.Global.Cache.ItemCountTooltip[player_id][search_id]
	end
	
	--ArkInventory.Output( tc )
	local paint = ArkInventory.db.option.tooltip.colour.class
	local colour = ""
	if paint then
		colour = HIGHLIGHT_FONT_COLOR_CODE
	end
	
	local item_count_total = 0
	
	local character_count = 0
	local character_entries = { }
	
	local guild_count = 0
	local guild_entries = { }
	local pd = { }
	
	for pid, td in ArkInventory.spairs( tc ) do
		
		ArkInventory.GetPlayerStorage( pid, nil, pd )
			
			local name = ArkInventory.DisplayName3( pd.data.info, paint, codex.player.data.info )
			
			local item_count_character = 0
			local item_count_guild = 0
			
			local location_entries = { }
			
			if td.location then
				
				for l, lc in pairs( td.location ) do
					
					if lc > 0 then
						
						if td.vault then
							if ArkInventory.db.option.tooltip.add.tabs then
								location_entries[#location_entries + 1] = string.format( "%s %s", ArkInventory.Localise["TOOLTIP_VAULT_TABS"], td.tabs )
							else
								location_entries[#location_entries + 1] = string.format( "%s", ArkInventory.Global.Location[l].Name )
							end
							item_count_guild = item_count_guild + lc
						else
							if ArkInventory.Table.Elements( td.location ) > 1 then
								location_entries[#location_entries + 1] = string.format( "%s %s%s|r", ArkInventory.Global.Location[l].Name, colour, lc )
							else
								location_entries[#location_entries + 1] = string.format( "%s", ArkInventory.Global.Location[l].Name )
							end
							item_count_character = item_count_character + lc
						end
						
					end
					
				end
				
				if item_count_character > 0 then
					
					local hl = ""
					if not ArkInventory.db.option.tooltip.me and pd.data.info.player_id == player_id then
						hl = ArkInventory.db.option.tooltip.highlight
					end
					
					character_entries[#character_entries + 1] = string.format( "%s%s|r: %s%s|r (%s)", hl, name, colour, FormatLargeNumber( item_count_character ), table.concat( location_entries, ", " ) )
					character_count = character_count + 1
					item_count_total = item_count_total + item_count_character
					
				end
				
				if item_count_guild > 0 then
					guild_entries[#guild_entries + 1] = string.format( "%s|r: %s%s|r (%s)", name, colour, FormatLargeNumber( item_count_guild ), table.concat( location_entries, ", " ) )
					guild_count = guild_count + 1
				end
				
			end
			
	end
	
	if item_count_total > 0 or guild_count > 0 then
		
		local c = table.concat( character_entries, "\n" )
		if character_count > 1 then
			c = string.format( "%s\n%s: %s%s|r", c, ArkInventory.Localise["TOTAL"], colour, FormatLargeNumber( item_count_total ) )
		end
		
		local g = ""
		
		if ArkInventory.db.option.tooltip.add.vault and guild_count > 0 then
			
			if character_count > 0 then
				g = "\n\n"
			end
			
			table.sort( guild_entries )
			g = string.format( "%s%s", g, table.concat( guild_entries, "\n" ) )
			
		end
		
		ArkInventory.Global.Cache.ItemCountTooltip[player_id][search_id] = string.format( "%s%s", c, g )
		
	else
		
		ArkInventory.Global.Cache.ItemCountTooltip[player_id][search_id] = ""
		
	end
	
	return ArkInventory.Global.Cache.ItemCountTooltip[player_id][search_id]
	
end

function ArkInventory.TooltipSetMoneyCoin( frame, amount, txt, r, g, b )
	
	if not frame or not amount then
		return
	end
	
	frame:AddDoubleLine( txt or " ", " ", r or 1, g or 1, b or 1 )
	
	local numLines = frame:NumLines( )
	if not frame.numMoneyFrames then
		frame.numMoneyFrames = 0
	end
	if not frame.shownMoneyFrames then
		frame.shownMoneyFrames = 0
	end
	
	local name = string.format( "%s%s%s", frame:GetName( ), "MoneyFrame", frame.shownMoneyFrames + 1 )
	local moneyFrame = _G[name]
	if not moneyFrame then
		frame.numMoneyFrames = frame.numMoneyFrames + 1
		moneyFrame = CreateFrame( "Frame", name, frame, "TooltipMoneyFrameTemplate" )
		name = moneyFrame:GetName( )
		ArkInventory.MoneyFrame_SetType( moneyFrame, "STATIC" )
	end
	
	moneyFrame:SetPoint( "RIGHT", string.format( "%s%s%s", frame:GetName( ), "TextRight", numLines ), "RIGHT", 15, 0 )
	
	moneyFrame:Show( )
	
	if not frame.shownMoneyFrames then
		frame.shownMoneyFrames = 1
	else
		frame.shownMoneyFrames = frame.shownMoneyFrames + 1
	end
	
	MoneyFrame_Update( moneyFrame:GetName( ), amount )
	
	local leftFrame = _G[string.format( "%s%s%s", frame:GetName( ), "TextLeft", numLines )]
	local frameWidth = leftFrame:GetWidth( ) + moneyFrame:GetWidth( ) + 40
	
	if frame:GetMinimumWidth( ) < frameWidth then
		frame:SetMinimumWidth( frameWidth )
	end
	
	frame.hasMoney = 1

end

function ArkInventory.TooltipSetMoneyText( frame, money, txt, r, g, b )
	if not money then
		return
	elseif money == 0 then
		--frame:AddDoubleLine( txt or "missing text", ITEM_UNSELLABLE, r or 1, g or 1, b or 1, 1, 1, 1 )
		frame:AddDoubleLine( txt or "missing text", ArkInventory.MoneyText( money ), r or 1, g or 1, b or 1, 1, 1, 1 )
	else
		frame:AddDoubleLine( txt or "missing text", ArkInventory.MoneyText( money ), r or 1, g or 1, b or 1, 1, 1, 1 )
	end
end

function ArkInventory.TooltipShowCompare( ... )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if not ArkInventory.db.option.tooltip.show then return end
	
	-- achievement comparison
	
	--if true then return end
	
	local self = ...
	
	if not self or not self.ARK_Data then return end
	
	local objectlink = self.ARK_Data[1]
	if not objectlink or type( objectlink ) ~= "string" then return end
	
	--ArkInventory.Output( self.ARK_Data[1], " / ", self.ARK_Data[2], " / ", self.ARK_Data[3], " / ", self.ARK_Data[4] )
	
	local osd = ArkInventory.ObjectStringDecode( objectlink )
	if not osd.class or not osd.id then return end
	
	local link = nil
	
	--ArkInventory.Output( osd.class, " / ", osd.id )
	
	if osd.class == "achievement" then
		link = GetAchievementLink( osd.id )
--	elseif class == "instancelock" then
--		link = GetSavedInstanceChatLink(self:GetID())
	else
		return
	end
	
	if not link then return end
	
	-- sourced from GameTooltip.lua / GameTooltip_ShowCompareItem( )
	
	local shoppingTooltip1, shoppingTooltip2, shoppingTooltip3 = unpack(self.shoppingTooltips);

	local item1 = true;
	
	local side = "left";

	-- find correct side
	local rightDist = 0;
	local leftPos = self:GetLeft();
	local rightPos = self:GetRight();
	if ( not rightPos ) then
		rightPos = 0;
	end
	if ( not leftPos ) then
		leftPos = 0;
	end

	rightDist = GetScreenWidth() - rightPos;

	if (leftPos and (rightDist < leftPos)) then
		side = "left";
	else
		side = "right";
	end

	-- see if we should slide the tooltip
	if ( self:GetAnchorType() and self:GetAnchorType() ~= "ANCHOR_PRESERVE" ) then
		local totalWidth = 0;
		if ( item1  ) then
			totalWidth = totalWidth + shoppingTooltip1:GetWidth();
		end

		if ( (side == "left") and (totalWidth > leftPos) ) then
			self:SetAnchorType(self:GetAnchorType(), (totalWidth - leftPos), 0);
		elseif ( (side == "right") and (rightPos + totalWidth) >  GetScreenWidth() ) then
			self:SetAnchorType(self:GetAnchorType(), -((rightPos + totalWidth) - GetScreenWidth()), 0);
		end
	end

	-- anchor the compare tooltips
	if ( item1 ) then
		shoppingTooltip1:SetOwner(self, "ANCHOR_NONE");
		shoppingTooltip1:ClearAllPoints();
		if ( side and side == "left" ) then
			shoppingTooltip1:SetPoint("TOPRIGHT", self, "TOPLEFT", 0, -10);
		else
			shoppingTooltip1:SetPoint("TOPLEFT", self, "TOPRIGHT", 0, -10);
		end
		shoppingTooltip1:SetHyperlink(link);
		shoppingTooltip1:Show();
	end
	
end
