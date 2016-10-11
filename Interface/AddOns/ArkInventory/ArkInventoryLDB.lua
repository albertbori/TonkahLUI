local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


ArkInventory.LDB = {
	Bags = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s", ArkInventory.Const.Program.Name, "Bags" ), {
		type = "data source",
		icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Bag].Texture,
		text = ArkInventory.Const.Slot.Data[ArkInventory.Const.Location.Bag].name,
	} ),
	Money = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s", ArkInventory.Const.Program.Name, "Money" ), {
		type = "data source",
		icon = [[Interface\Icons\INV_Misc_Coin_02]],
		text = "Money",
	} ),
	Companion = { },
	Pets = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s", ArkInventory.Const.Program.Name, "Pets" ), {
		type = "data source",
		icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Pet].Texture,
		text = "",
	} ),
	Mounts = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s", ArkInventory.Const.Program.Name, "Mounts" ), {
		type = "data source",
		icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Texture,
		text = "",
	} ),
	Tracking_Currency = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s_%s", ArkInventory.Const.Program.Name, "Tracking", "Currency" ), {
		type = "data source",
		icon = nil,
		text = "Track Currency",
	} ),
	Tracking_Item = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s_%s", ArkInventory.Const.Program.Name, "Tracking", "Item" ), {
		type = "data source",
		icon = nil,
		text = "Track Items",
	} ),
}

local companionTable = { }



function ArkInventory.LDB.Bags:OnClick( button )
	if button == "RightButton" then
		ArkInventory.MenuLDBBagsOpen( self )
	else
		ArkInventory.Frame_Main_Toggle( ArkInventory.Const.Location.Bag )
	end
end

function ArkInventory.LDB.Bags:Update( )
	local me = ArkInventory.GetPlayerCodex( )
	local loc_id = ArkInventory.Const.Location.Bag
	--ArkInventory.LDB.Bags.icon = ArkInventory.Global.Location[loc_id].Texture
	self.text = ArkInventory.Frame_Status_Update_Empty( loc_id, me, true )
end



function ArkInventory.LDB.Money:Update( )
	self.text = ArkInventory.MoneyText( GetMoney( ) )
end

function ArkInventory.LDB.Money.OnTooltipShow( frame )
	ArkInventory.MoneyFrame_Tooltip( frame )
end



function ArkInventory.LDB.Tracking_Currency:Update( )
	
	self.text = ""
	local hasText = false
	
	local numTokenTypes = GetCurrencyListSize( )
	
	-- expand all token headers
	for j = numTokenTypes, 1, -1 do
		local name, isHeader, isExpanded = GetCurrencyListInfo( j )
		if isHeader and not isExpanded then
			ExpandCurrencyList( j, 1 )
		end
	end
	
	numTokenTypes = GetCurrencyListSize( )
	
	for j = 1, numTokenTypes do
		
		local name, isHeader, isExpanded, isUnused, isWatched, count, icon = GetCurrencyListInfo( j )
		
		if not isHeader then
			local h = GetCurrencyListLink( j )
			local osd = ArkInventory.ObjectStringDecode( h )
			local id = osd.id
			local me = ArkInventory.GetPlayerCodex( )
			if me.player.data.ldb.tracking.currency.tracked[id] then
				self.text = string.format( "%s  |T%s:0|t %d", self.text, icon or ArkInventory.Const.Texture.Missing, count or 0 )
				hasText = true
			end
		end
		
	end
	
	if hasText then
		self.text = string.trim( self.text )
	else
		self.text = string.format( "|T%s:0|t", ArkInventory.Global.Location[ArkInventory.Const.Location.Token].Texture )
	end
	
end

function ArkInventory.LDB.Tracking_Currency.OnClick( frame, button )
	if button == "RightButton" then
		ArkInventory.MenuLDBTrackingCurrencyOpen( frame )
	else
		ArkInventory.Frame_Main_Toggle( ArkInventory.Const.Location.Token )
	end
end

function ArkInventory.LDB.Tracking_Currency:OnTooltipShow( )
	
	self:AddLine( string.format( "%s: %s", ArkInventory.Localise["TRACKING"], ArkInventory.Localise["LDB_TRACKING_CURRENCY"] ) )
	
	local numTokenTypes = GetCurrencyListSize( )
	
	-- expand all currency headers
	for j = numTokenTypes, 1, -1 do
		name, isHeader, isExpanded = GetCurrencyListInfo( j )
		if isHeader and not isExpanded then
			ExpandCurrencyList( j, 1 )
		end
	end
	
	numTokenTypes = GetCurrencyListSize( )
	
	for j = 1, numTokenTypes do
		
		local name, isHeader, isExpanded, isUnused, isWatched, count, icon, limit, limitWeekly, countWeekly = GetCurrencyListInfo( j )
		--ArkInventory.Output( GetCurrencyListInfo( j ) )
		
		if isHeader then
			self:AddLine( " " )
			self:AddLine( name )
		else
			
			local h = GetCurrencyListLink( j )
			local osd = ArkInventory.ObjectStringDecode( h )
			local id = osd.id
			local me = ArkInventory.GetPlayerCodex( )
			
			--limit = limit / 100
			local txt = FormatLargeNumber( count )
			
			if limit and limit > 0 then
				txt = string.format( "%s/%s", FormatLargeNumber( count ), FormatLargeNumber( limit ) )
			end
			
			if me.player.data.ldb.tracking.currency.tracked[id] then
				self:AddDoubleLine( name, txt, 0, 1, 0, 0, 1, 0 )
			else
				self:AddDoubleLine( name, txt, 1, 1, 1, 1, 1, 1 )
			end
			
			if limitWeekly and countWeekly and countWeekly > 0 then
				
				txt = string.format( "%s/%s", FormatLargeNumber( countWeekly ), FormatLargeNumber( limitWeekly ) )
				
				if me.player.data.ldb.tracking.currency.tracked[id] then
					self:AddDoubleLine( string.format( "  * %s", ArkInventory.Localise["WEEKLY"] ), txt, 0, 1, 0, 0, 1, 0 )
				else
					self:AddDoubleLine( string.format( "  * %s", ArkInventory.Localise["WEEKLY"] ), txt, 1, 1, 1, 1, 1, 1 )
				end
				
			end
			
		end
		
	end
	
	self:Show( )
	
end



function ArkInventory.LDB.Tracking_Item:Update( )
	
	self.text = ""
	local hasText = false
	local me = ArkInventory.GetPlayerCodex( )
	for k in ArkInventory.spairs( ArkInventory.db.option.tracking.items )  do
		if me.player.data.ldb.tracking.item.tracked[k] then
			local count = GetItemCount( k, true )
--[[
			if ( k == 6265 ) then
				-- soul shards for cataclysm
				count = UnitPower( "player", 7 ) or 0
			end
]]--
			local icon = select( 10, GetItemInfo( k ) )
			self.text = string.format( "%s  |T%s:0|t %s", self.text, icon or ArkInventory.Const.Texture.Missing, count or 0 )
			hasText = true
		end
	end
	
	if hasText then
		self.text = string.trim( self.text )
	else
		self.text = string.format( "|T%s:0|t", [[Interface\Icons\Ability_Tracking]] )
	end
	
end

function ArkInventory.LDB.Tracking_Item:OnClick( button )
	if button == "RightButton" then
		ArkInventory.MenuLDBTrackingItemOpen( self )
	end
end

function ArkInventory.LDB.Tracking_Item:OnTooltipShow( )
	
	self:AddLine( string.format( "%s: %s", ArkInventory.Localise["TRACKING"], ArkInventory.Localise["ITEMS"] ) )
	
	self:AddLine( " " )
	
	local me = ArkInventory.GetPlayerCodex( )
	for k in ArkInventory.spairs( ArkInventory.db.option.tracking.items )  do
		
		local count = GetItemCount( k, true )
--[[
		if k == 6265 then
			-- soul shards for cataclysm
			count = UnitPower( "player", 7 ) or 0
		end
]]--
		local name = GetItemInfo( k )
		
		local checked = me.player.data.ldb.tracking.item.tracked[k]
		
		if checked then
			self:AddDoubleLine( name, count, 0, 1, 0, 0, 1, 0 )
		else
			self:AddDoubleLine( name, count, 1, 1, 1, 1, 1, 1 )
		end
		
	end
	
	self:Show( )
	
end


function ArkInventory.LDB.Pets:Update( )
	
	ArkInventory.LDB.Pets.Cleanup( )
	
	local total = ArkInventory.PetJournal.GetCount( )
	
	if total < 1 then
		self.icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Pet].Texture
		return
	end
	
	local me = ArkInventory.GetPlayerCodex( )
	local selected = me.player.data.ldb.pets.selected
	local count = ArkInventory.Table.Elements( selected )
	
	if count == 0 then
		--all companions
		self.icon = [[Interface\Icons\INV_Misc_Dice_01]]
		return
	end
	
	if count > 1 then
		-- partial selection
		self.icon = [[Interface\Icons\INV_Misc_Dice_02]]
		return
	end
	
	-- just one
	for k, v in pairs( selected ) do
		if v then
			local pd = ArkInventory.PetJournal.GetPet( k )
			self.icon = pd.sd.icon
			return
		end
	end
	
end

function ArkInventory.LDB.Pets:OnTooltipShow( )
	
	if not ArkInventory.PetJournal.JournalIsReady( ) then
		self:AddLine( "journal not ready", 1, 0, 0 )
		return
	end
	
	self:AddDoubleLine( MODE, ArkInventory.Localise["LDB_MOUNTS_TOOLTIP_SELECTION"] )
	
	local total = ArkInventory.PetJournal.GetCount( )
	
	if total < 1 then
		self:AddDoubleLine( ArkInventory.Localise["PET"], ArkInventory.Localise["LDB_COMPANION_NONE"], 1, 1, 1, 1, 1, 1 )
		return
	end
	
	local me = ArkInventory.GetPlayerCodex( )
	local selected = me.player.data.ldb.pets.selected
	local count = ArkInventory.Table.Elements( selected )
	local selectedCount = 0
	for k, v in pairs( selected ) do
		if v == true then
			selectedCount = selectedCount + 1
		end
	end
	
	if count == 0 then
		
		-- random all
		self:AddDoubleLine( ArkInventory.Localise["PET"], string.format( "%s: %s (%s)", ArkInventory.Localise["RANDOM"], ArkInventory.Localise["ALL"], total ), 1, 1, 1, 1, 1, 1 )
		
	elseif selectedCount == 1 then
		
		-- just the one selected, there may be ignored but they dont matter
		for k, v in pairs( selected ) do
			if v == true then
				local pd = ArkInventory.PetJournal.GetPet( k )
				local name = pd.sd.name
				if pd.cn and pd.cn ~= "" then
					name = string.format( "%s (%s)", name, pd.cn )
				end
				self:AddDoubleLine( ArkInventory.Localise["PET"], string.format( "%s: %s", ArkInventory.Localise["LDB_MOUNTS_TOOLTIP_SELECTION"], name ), 1, 1, 1, 1, 1, 1 )
			end
		end
	
	else
	
		-- random selection, possibly some ignored
		
		if selectedCount == 0 then
			-- none selected so must be ignored
			self:AddDoubleLine( ArkInventory.Localise["PET"], string.format( "%s: %s (%s %s)", ArkInventory.Localise["RANDOM"], ArkInventory.Localise["ALL"], ArkInventory.Localise["IGNORE"], count - selectedCount ), 1, 1, 1, 1, 1, 1 )
		else
			-- more than one selected, there may be ignored but they dont matter
			self:AddDoubleLine( ArkInventory.Localise["PET"], string.format( "%s: %s (%s)", ArkInventory.Localise["RANDOM"], ArkInventory.Localise["LDB_MOUNTS_TOOLTIP_SELECTION"], selectedCount ), 1, 1, 1, 1, 1, 1 )
		end
		
	end

end

function ArkInventory.LDB.Pets:OnClick( button )
	
	if not ArkInventory.PetJournal.JournalIsReady( ) then
		return
	end
	
	if IsModifiedClick( "CHATLINK" ) then
		-- dismiss current pet
		ArkInventory.PetJournal.Dismiss( )
		return
	end
	
	ArkInventory.LDB.Pets:Update( )
	
	if button == "RightButton" then
		
		ArkInventory.MenuLDBPetsOpen( self )
		
	else
		
		if ArkInventory.Collection.Mount.GetCount( ) == 0 then
			ArkInventory.Output( string.format( ArkInventory.Localise["NONE_OWNED"], "pets" ) )
			return
		end
		
		ArkInventory.LDB.Pets.BuildList( true )
		
		--ArkInventory.Output( #companionTable, " usable pets" )
		
		if #companionTable == 0 then
			ArkInventory.Output( string.format( ArkInventory.Localise["NONE_USABLE"], "pets" ) )
		elseif #companionTable == 1 then
			ArkInventory.PetJournal.Summon( companionTable[1] )
		else
			ArkInventory.PetJournal.Summon( companionTable[random( 1, #companionTable )] )
		end
		
	end
	
end

function ArkInventory.LDB.Pets.Cleanup( )
	
	if ArkInventory.PetJournal.JournalIsReady( ) then
		
		-- check for and remove any selected companions we no longer have (theyve either been caged or released)
		local me = ArkInventory.GetPlayerCodex( )
		local selected = me.player.data.ldb.pets.selected
		for k, v in pairs( selected ) do
			if v ~= nil and not ArkInventory.PetJournal.GetPet( k ) then
				selected[k] = nil
				--ArkInventory.Output( "removing selected pet we dont have any more - ", k )
			end
		end
		
		-- if all companions are selected then deselect them all
		local selected = me.player.data.ldb.pets.selected
		local n1 = ArkInventory.PetJournal.GetCount( )
		local n2 = ArkInventory.Table.Elements( selected )
		
		--ArkInventory.Output( "pet / ", n1, " / ", n2, " / ", selected )
		
		if n1 == n2 then
			for k, v in pairs( selected ) do
				if v == true then
					selected[k] = nil
				end
			end
		end
		
	end
	
end


function ArkInventory.LDB.Mounts:Update( useMapZone )
	
	ArkInventory.LDB.Mounts.Cleanup( )
	
	ArkInventory.LDB.Mounts.IsFlyable( useMapZone )
	
	local mountType = ArkInventory.LDB.Mounts.GetUsable( true )
	
	if not mountType then
		-- no usable mounts
		self.icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Texture
		return
	end
	
	local total = ArkInventory.LDB.Mounts.GetTotal( mountType )
	
	--ArkInventory.Output( mountType, " / ", #companionTable, " / ", total )
	
	if total < 1 then
		self.icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Texture
		return
	end
	
	local me = ArkInventory.GetPlayerCodex( )
	local selected = me.player.data.ldb.mounts[mountType].selected
	local count = ArkInventory.Table.Elements( selected )
	
	if count == 0 then
		--all companions
		self.icon = [[Interface\Icons\INV_Misc_Dice_01]]
		return
	end
	
	if count > 1 then
		-- partial selection
		self.icon = [[Interface\Icons\INV_Misc_Dice_02]]
		return
	end
	
	-- just one
	for k, v in pairs( selected ) do
		if v then
			self.icon = select( 3, GetSpellInfo( k ) )
			return
		end
	end
	
end

function ArkInventory.LDB.Mounts:OnTooltipShow( ... )
	
	if not ArkInventory.Collection.Mount.IsReady( ) then
		self:AddLine( "journal not ready", 1, 0, 0 )
		return
	end
	
--	if ArkInventory.Collection.Mount.SkillLevel( ) == 0 then
--		self:AddLine( SPELL_FAILED_LOW_CASTLEVEL, 1, 0, 0 )
--		return
--	end
	
	self:AddDoubleLine( MODE, ArkInventory.Localise["LDB_MOUNTS_TOOLTIP_SELECTION"] )
	
	for mountType in pairs( ArkInventory.Const.MountTypes ) do
		
		local mode = ArkInventory.Localise[string.upper( string.format( "LDB_MOUNTS_TYPE_%s", mountType ) )]
		local total = ArkInventory.LDB.Mounts.GetTotal( mountType )
		
		--ArkInventory.Output( mountType, " / ", mode, " / ", total )
		
		if mountType ~= "x" then
			
			if total < 1 then
				
				self:AddDoubleLine( mode, ArkInventory.Localise["LDB_COMPANION_NONE"], 1, 1, 1, 1, 0, 0 )
				
			else
				
				local me = ArkInventory.GetPlayerCodex( )
				local selected = me.player.data.ldb.mounts[mountType].selected
				local count = ArkInventory.Table.Elements( selected )
				local selectedCount = 0
				for k, v in pairs( selected ) do
					if v == true then
						selectedCount = selectedCount + 1
					end
				end
				
				if count == 0 then
					
					-- random all
					self:AddDoubleLine( mode, string.format( "%s: %s (%s)", ArkInventory.Localise["RANDOM"], ArkInventory.Localise["ALL"], total ), 1, 1, 1, 1, 1, 1 )
				
				elseif selectedCount == 1 then
				
					-- just the one selected, there may be ignored but they dont matter
					for k, v in pairs( selected ) do
						if v then
							local name = GetSpellInfo( k )
							self:AddDoubleLine( mode, string.format( "%s: %s", ArkInventory.Localise["LDB_MOUNTS_TOOLTIP_SELECTION"], name ), 1, 1, 1, 1, 1, 1 )
						end
					end
				
				else
					
					-- random selection
					if selectedCount == 0 then
						-- none selected so must be ignored
						self:AddDoubleLine( mode, string.format( "%s: %s (%s %s)", ArkInventory.Localise["RANDOM"], ArkInventory.Localise["ALL"], ArkInventory.Localise["IGNORE"], count - selectedCount ), 1, 1, 1, 1, 1, 1 )
					else
						-- more than one selected, there may be ignored but they dont matter
						self:AddDoubleLine( mode, string.format( "%s: %s (%s)", ArkInventory.Localise["RANDOM"], ArkInventory.Localise["LDB_MOUNTS_TOOLTIP_SELECTION"], selectedCount ), 1, 1, 1, 1, 1, 1 )
					end
					
				end
				
			end
			
		end
		
	end
	
end

function ArkInventory.LDB.Mounts:OnClick( button )
	
	if button == "RightButton" then
		
		ArkInventory.MenuLDBMountsOpen( self )
		
	else
		
		if UnitInVehicle( "player" ) or IsIndoors( ) or not IsOutdoors( ) or not ArkInventory.Collection.Mount.IsReady( ) or ArkInventory.Collection.Mount.SkillLevel( ) == 0 then
			-- not even going to try
			return
		end
		
		if IsMounted( ) then
			
			if IsFlying( ) then
				local me = ArkInventory.GetPlayerCodex( )
				if not me.player.data.ldb.mounts.a.dismount then
					ArkInventory.OutputWarning( ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT_WARNING"] )
					return
				end
			end
			
			ArkInventory.Collection.Mount.Dismiss( )
			
			return
			
		end
		
		if IsFlying( ) then
			
			-- all known shapeshift forms should have been cancelled at this point, and any current mount dismissed so no idea how youre still flying. it could be druid flight form and server lag.
			-- whatever it is i can't do anything about it so i'm going to just exit.
			
			return
			
		end
		
		if ArkInventory.Collection.Mount.GetCount( ) == 0 then
			--ArkInventory.Output( "you don't own any mounts" )
			return
		end
		
		ArkInventory.LDB.Mounts:Update( true )
		
		local forceAlternative = IsModifiedClick( "CHATLINK" )
		ArkInventory.LDB.Mounts.GetUsable( false, forceAlternative )
		
		if forceAlternative and #companionTable == 0 then
			ArkInventory.LDB.Mounts.GetUsable( )
		end
		
		
		--ArkInventory.Output( #companionTable, " available mounts" )
		
		if #companionTable == 0 then
			-- no mounts
			ArkInventory.Output( "no usable mounts" )
			return
		end
		
		if #companionTable == 1 then
			ArkInventory.Collection.Mount.Summon( companionTable[1] )
		else
			local i = companionTable[random( 1, #companionTable )]
			local md = ArkInventory.Collection.Mount.GetMount( i )
			--ArkInventory.Output( "use mount ", i, ": ", md.name )
			ArkInventory.Collection.Mount.Summon( i )
		end
		
	end
	
end

function ArkInventory.LDB.Mounts.Cleanup( )
	
	-- remove any selected mounts we no longer have (not sure how but just in case)
	
	if ArkInventory.Collection.Mount.IsReady( ) then
		
		--ArkInventory.Output( "mount journal ready" )
		
		for mountType in pairs( ArkInventory.Const.MountTypes ) do
			if mountType ~= "x" then
				
				local me = ArkInventory.GetPlayerCodex( )
				local selected = me.player.data.ldb.mounts[mountType].selected
				
				for spell, value in pairs( selected ) do
					local md = ArkInventory.Collection.Mount.GetMountBySpell( spell )
					if value ~= nil and not md then
						ArkInventory.OutputWarning( "removing a selected mount we dont have any more - ", spell )
						selected[spell] = nil
					end
				end
				
			end
		end
		
	else
		--ArkInventory.Output( "mount journal NOT ready" )
	end
		
	-- if all mounts are selected then deselect them all
	for mountType in pairs( ArkInventory.Const.MountTypes ) do
		if mountType ~= "x" then
			
			local me = ArkInventory.GetPlayerCodex( )
			local selected = me.player.data.ldb.mounts[mountType].selected
			local n1 = ArkInventory.LDB.Mounts.GetTotal( mountType )
			local n2 = ArkInventory.Table.Elements( selected )
			
			--ArkInventory.Output( mountType, " / ", n1, " / ", n2, " / ", selected )
			
			if n1 == n2 then
				for k, v in pairs( selected ) do
					if v == true then
						selected[k] = nil
					end
				end
			end
			
		end
	end
	
end


function ArkInventory.LDB.Mounts.IsFlyable( useMapZone )
	
	ArkInventory.IsFlyable = IsFlyableArea( )  -- its got some issues, but its usually only wrong about flying zones
	
	if ArkInventory.IsFlyable then
		
		if ArkInventory.Collection.Mount.SkillLevel( ) < 225 then
			
			--ArkInventory.Output( "riding skill ", skill, " is too low for flying" )
			ArkInventory.IsFlyable = false
			
		else
			
			if ( useMapZone ) or ( not WorldMapFrame:IsVisible( ) ) then
				
				-- only set the map zone if the world map is not open or we need to force it
				
				SetMapToCurrentZone( ) -- wont work after a uireload, requires a zone change to kick in
				local zone = GetCurrentMapContinent( )
				-- -1 = instance
				--  0 = cosmic
				--  1 = kalimdor
				--  2 = eastern kingdoms
				--  3 = outland
				--  4 = northrend
				--  5 = maelstrom (deepholm)
				--  6 = pandaria
				--  7 = draenor
				
				
				if zone == 1 or zone == 2 then
					
					if not GetSpellInfo( ( GetSpellInfo( 90267 ) ) ) then
						--ArkInventory.Output( "azeroth but you dont know flight masters licence" )
						ArkInventory.IsFlyable = false
					end
					
				elseif zone == 4 then
					
					if not GetSpellInfo( ( GetSpellInfo( 54197 ) ) ) then
						
						--ArkInventory.Output( "northrend but you dont know cold weather flying" )
						ArkInventory.IsFlyable = false
						
					end
					
				elseif zone == 6 then
					
					if not GetSpellInfo( ( GetSpellInfo( 115913 ) ) ) then
						
						--ArkInventory.Output( "pandaria but you dont know wisdom of the four winds" )
						ArkInventory.IsFlyable = false
						
					end
					
				elseif zone == 7 then
					
					local _, _, _, completed = GetAchievementInfo( 10018 )
					
					if not completed then
						
						--ArkInventory.Output( "draenor but you dont have the pathfinder achievement )
						ArkInventory.IsFlyable = false
						
					end
					
				end
				
			end
			
		end
		
	end
	
	if ArkInventory.IsFlyable then
		
		-- world pvp battle in progress?
		
		for index = 1, GetNumWorldPVPAreas( ) do
			
			local pvpID, pvpZone, isActive = GetWorldPVPAreaInfo( index )
			--ArkInventory.Output( pvpID, " / ", pvpZone, " / ", isActive )
			
			if ArkInventory.IsFlyable and isActive and GetRealZoneText( ) == pvpZone then
				-- ArkInventory.Output( "battle in progress, no flying allowed" )
				ArkInventory.IsFlyable = false
				break
			end
			
		end
		
	end
	
end

function ArkInventory.LDB.Mounts.BuildList( ignoreActive, mountType )
	
	table.wipe( companionTable )
	
	if not ArkInventory.Collection.Mount.IsReady( ) then
		return
	end
	
	local n = ArkInventory.Collection.Mount.GetCount( )
	--ArkInventory.Output( n, " owned mounts to choose from" )
	
	if n == 0 then return end
	
	local me = ArkInventory.GetPlayerCodex( )
	local selected = { }
	for k, v in pairs( me.player.data.ldb.mounts[mountType].selected ) do
		selected[k] = v
	end
	
	if mountType == "l" and me.player.data.ldb.mounts.l.useflying then
		for k, v in pairs( me.player.data.ldb.mounts["a"].selected ) do
			selected[k] = v
		end
	end
	
	local selectedCount = 0
	for k, v in pairs( selected ) do
		if v == true then
			selectedCount = selectedCount + 1
		end
	end
	
	if selectedCount < 2 then
		ignoreActive = true
	end
	
	--ArkInventory.Output( selectedCount, " (", mountType, ") mounts specifically selected ", selected )
	
	local count = 0
	
	for _, md in ArkInventory.Collection.Mount.Iterate( ) do
		
		if md.owned and ( not md.active or ignoreActive ) and ( selectedCount == 0 or selected[md.spell] == true ) then
			
			if selected[md.spell] == false then
				-- never summon
			else
				-- dont use stored value here, check the current value
				local usable = ArkInventory.Collection.Mount.IsUsable( md.index )
				
				if usable and ( md.mt == ArkInventory.Const.MountTypes[mountType] or ( mountType == "l" and me.player.data.ldb.mounts.l.useflying and md.mt == ArkInventory.Const.MountTypes["a"] ) ) then
					-- usable = true
				else
					usable = false
				end
				
				if usable then
					count = count + 1
					companionTable[count] = md.index
				end
			end
			
		end
		
	end
	
	--ArkInventory.Output( count, " (", mountType, ") mounts to chose from ", companionTable )
	
end

function ArkInventory.LDB.Pets.BuildList( ignoreActive )
	
	table.wipe( companionTable )
	
	if not ArkInventory.PetJournal.JournalIsReady( ) then
		return
	end
	
	local n = ArkInventory.PetJournal.GetCount( )
	--ArkInventory.Output( "pet count = ", n )
	if n == 0 then return end
	
	local me = ArkInventory.GetPlayerCodex( )
	local selected = me.player.data.ldb.pets.selected
	local selectedCount = 0
	for k, v in pairs( selected ) do
		if v == true then
			selectedCount = selectedCount + 1
		end
	end
	
	if selectedCount < 2 then
		ignoreActive = true
	end
	
	--ArkInventory.Output( "count = ", selectedCount, ", selected = ", selected )
	
	local count = 0
	local _, _, activePet = ArkInventory.PetJournal.GetCurrent( )
	local activeSpecies = activePet and activePet.sd.speciesID
	
	for index, pd in ArkInventory.PetJournal.Iterate( ) do
		if ( not activePet or ignoreActive ) and ( pd.sd.speciesID ~= activeSpecies ) and ( selectedCount == 0 or selected[index] == true ) and ArkInventory.PetJournal.CanSummon( pd.guid ) then
			-- cannot be same current species as active pet, if one was active
			-- must be summonable
			if selected[index] == false then
				-- never summon
			else
				count = count + 1
				companionTable[count] = index
			end
		end
	end
	
end

function ArkInventory.LDB.Mounts.GetUsable( ignoreActive, forceAlternative )
	
	if IsIndoors( ) or not IsOutdoors( ) or not ArkInventory.Collection.Mount.IsReady( ) or ArkInventory.Collection.Mount.SkillLevel( ) == 0 then
		return
	end
	
	if IsSwimming( ) then
		if ( not forceAlternative ) then
			--ArkInventory.Output( "check underwater" )
			ArkInventory.LDB.Mounts.BuildList( ignoreActive, "u" )
			if #companionTable > 0 then return "u" end
			--ArkInventory.Output( "check surface" )
			ArkInventory.LDB.Mounts.BuildList( ignoreActive, "s" )
			if #companionTable > 0 then return "s" end
		else
			--ArkInventory.Output( "ignore underwater, force flying" )
		end
	end
	
	if ArkInventory.IsFlyable then
		--ArkInventory.Output( "can fly here" )
		if ( not forceAlternative ) or ( forceAlternative and IsSwimming( ) ) then
			--ArkInventory.Output( "check flying" )
			ArkInventory.LDB.Mounts.BuildList( ignoreActive, "a" )
			if #companionTable > 0 then return "a" end
		else
			--ArkInventory.Output( "ignore flying, force land" )
		end
	end
	
	--ArkInventory.Output( "check land" )
	ArkInventory.LDB.Mounts.BuildList( ignoreActive, "l" )
	if #companionTable > 0 then return "l" end
	
	
--	if ArkInventory.db.option.message.mount.warnings then
--		ArkInventory.OutputWarning( "no land mounts available, checking flying mounts for fallback" )
--	end
	ArkInventory.LDB.Mounts.BuildList( ignoreActive, "a" )
	if #companionTable > 0 then return "a" end
	
--	if ArkInventory.db.option.message.mount.warnings then
--		ArkInventory.OutputWarning( "no land or flying mounts available, checking underwater mounts for fallback" )
--	end
	ArkInventory.LDB.Mounts.BuildList( ignoreActive, "u" )
	if #companionTable > 0 then return "u" end
	
end

function ArkInventory.LDB.Mounts.GetTotal( mountType )
	
	local count = 0
	
	for _, md in ArkInventory.Collection.Mount.Iterate( ) do
		
		if md.owned and md.mt == ArkInventory.Const.MountTypes[mountType] then
			count = count + 1
		end
		
	end
	
	return count
	
end
