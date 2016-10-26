local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


local function helper_CategoryRenumber( cat_old, cat_new )
	
	-- fix hard coded item assignments
	
	if ArkInventory.acedb.global.option.cateset then
		for k, v in pairs( ArkInventory.acedb.global.option.cateset.data ) do
			for k2, v2 in pairs( v.category.assign ) do
				if v2 == cat_old then
					v.category.assign[k2] = cat_new
				end
			end
		end
	end
	
end


function ArkInventory.DatabaseUpgradePreLoad( )
	
	ARKINVDB = ARKINVDB or { }
	
	if ArkInventory.Const.Program.Version >= 3.0227 then
		-- erase old factionrealm data
		if ARKINVDB.factionrealm then
			ARKINVDB.factionrealm = nil
		end
	end
	
	
	if ArkInventory.Const.Program.Version >= 30334 then
		
		ARKINVDB.global = ARKINVDB.global or { }
		ARKINVDB.global.player = ARKINVDB.global.player or { }
		ARKINVDB.global.player.data = ARKINVDB.global.player.data or { }
		
		if ARKINVDB.global.option and ARKINVDB.global.option.sort and ARKINVDB.global.option.sort.data then
			ARKINVDB.global.option.sort.method = { }
			ARKINVDB.global.option.sort.method.data = ARKINVDB.global.option.sort.data
			ARKINVDB.global.option.sort.data = nil
		end
		
		if ARKINVDB.realm then
			-- move realm into global
			
			for r, v1 in pairs( ARKINVDB.realm ) do
				
				if v1.player and v1.player.data then
					
					for n, v2 in pairs( v1.player.data ) do
						
						if string.sub( n, 1, 1 ) ~= "!" then
							
							local k = string.format( "%s%s%s", n, ArkInventory.Const.PlayerIDSep, r )
							ARKINVDB.global.player.data[k] = v2
							ARKINVDB.global.player.data[k].location = nil
							ARKINVDB.global.player.data[k].version = v1.player.version or ArkInventory.Const.Program.Version
							
							ARKINVDB.global.player.data[k].info = { }
							
							local i = ARKINVDB.global.player.data[k].info
							i.player_id = k
							i.guild_id = nil
							if i.guild then
								i.guild_id = string.format( "%s%s%s%s", ArkInventory.Const.GuildTag, i.guild, ArkInventory.Const.PlayerIDSep, r )
							end
							i.guild = nil
							
						end
						
					end
					
				end
				
			end
		
			ARKINVDB.realm = nil
		
		end
		
		if ARKINVDB.char then
			-- move char into global
			
			for k, v in pairs( ARKINVDB.char ) do
				
				ARKINVDB.global.player.data[k] = ARKINVDB.global.player.data[k] or { }
				
				if v.option and v.option.ldb then
					ARKINVDB.global.player.data[k].ldb = v.option.ldb
					ARKINVDB.global.player.data[k].ldb.version = v.option.version
				end
				
				ARKINVDB.global.player.data[k].ldb = ARKINVDB.global.player.data[k].ldb or { }
				ARKINVDB.global.player.data[k].ldb.version = ARKINVDB.global.player.data[k].ldb.version or ArkInventory.Const.Program.Version
				
			end
			
			ARKINVDB.char = nil
			
		end
		
	end
	
end




local function helper_UpgradeProfile( profile, profile_name )
	
	local upgrade_version
	
	if not profile.option then
		profile.option = { }
	end
	
	if not profile.option.version then
		profile.option.version = ArkInventory.Const.Program.Version
	end
	
	if profile.option.version >= 30699 then
		return
	end
	
	
	upgrade_version = 3.00
	if profile.option.version < upgrade_version then
	
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], profile_name, upgrade_version ) )
		
		if profile.option.category then
			for k, v in pairs( profile.option.category ) do
				if type( v ) == "number" then
					profile.option.category[k] = ArkInventory.CategoryCodeJoin( ArkInventory.Const.Category.Type.System, abs( v ) )
				end
			end
		end
		
		if profile.option.location then
			
			local t
			for _, loc in pairs( profile.option.location ) do
			
				t = { }
				
				if loc.category then
					
					for k, v in pairs( loc.category ) do
						if type( k ) == "number" then
							if k < 0 then
								local id = ArkInventory.CategoryCodeJoin( ArkInventory.Const.Category.Type.System, abs( k ) )
								t[id] = v
							else
								local id = ArkInventory.CategoryCodeJoin( ArkInventory.Const.Category.Type.Rule, k )
								t[id] = v
							end
							loc.category[k] = nil
						end
					end
					
					for k, v in pairs( t ) do
						loc.category[k] = v
					end
					
				end
				
			end
			
		end
		
		
		profile.option.version = upgrade_version
		
	end

	
	upgrade_version = 3.0201
	if profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], profile_name, upgrade_version ) )
		
		-- fix categories, need to add class
		if profile.option.category then
			
			local t = { }
			
			for k, v in pairs( profile.option.category ) do
				
				local sb, id = strsplit( ":", k )
				id = tonumber( id ) or 0
				sb = tonumber( sb ) or 0
				if sb > 20 then
					local z = sb
					sb = id
					id = z
				end
				
				local class = "item"
				if id == 0 then
					class = "empty"
				end
				
				local cid = string.format( "%s:%s:%s", class, id, sb )
				--ArkInventory.OutputDebug( "k=[", k, "], id=[", id, "], sb=[", sb, "], cid=[", cid, "] / [", v, "]" )
				t[cid] = v
				
			end
			
			profile.option.category = t
			
		end
		
		
		profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0230
	if profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], profile_name, upgrade_version ) )
		
		ArkInventory.OutputWarning( "The sort order for each location has been reset to bag/slot as it couldnt be automatically transferred. You will need to create an equivalent sort method (via the config menu) to what you had and apply that to each location" )
		
		if profile.option.location then
			
			for _, v in pairs( profile.option.location ) do
				
				if v.window then
				
					if v.window.border then
						v.window.border.style = ArkInventory.Const.Texture.BorderDefault
						v.window.border.size = nil
						v.window.border.offset = nil
						v.window.border.scale = 1
						v.window.border.file = nil
					end
					
					if v.window.colour then
					
						if v.window.colour.border then
							v.window.border = v.window.border or { }
							v.window.border.colour = v.window.border.colour or { }
							v.window.border.colour.r = v.window.colour.border.r or v.window.border.colour.r
							v.window.border.colour.g = v.window.colour.border.g or v.window.border.colour.g
							v.window.border.colour.b = v.window.colour.border.b or v.window.border.colour.b
							v.window.colour.border = nil
						end
						
						if v.window.colour.background then
							v.window.background = v.window.background or { }
							v.window.background.colour = v.window.background.colour or { }
							v.window.background.colour.r = v.window.colour.background.r or v.window.background.colour.r
							v.window.background.colour.g = v.window.colour.background.g or v.window.background.colour.g
							v.window.background.colour.b = v.window.colour.background.b or v.window.background.colour.b
							v.window.background.colour.a = v.window.colour.background.a or v.window.background.colour.a
							v.window.colour.background = nil
						end
						
						if v.window.colour.baghighlight then
							v.changer = v.changer or { }
							v.changer.highlight = v.changer.highlight or { }
							v.changer.highlight.colour = v.changer.highlight.colour or { }
							v.changer.highlight.colour.r = v.window.colour.baghighlight.r or v.changer.highlight.colour.r
							v.changer.highlight.colour.g = v.window.colour.baghighlight.g or v.changer.highlight.colour.g
							v.changer.highlight.colour.b = v.window.colour.baghighlight.b or v.changer.highlight.colour.b
							v.window.colour.baghighlight = nil
						end
					
					end
					
					v.window.colour = nil
					
				end
				
				if v.bar then
					
					if v.bar.name and v.bar.name.label then
						for id, label in pairs( v.bar.name.label ) do
							v.bar.data = v.bar.data or { }
							v.bar.data[id] = v.bar.data[id] or { }
							v.bar.data[id].label = label
						end
						v.bar.name.label = nil
					end
					
					if v.bar.border then
						v.bar.border.style = ArkInventory.Const.Texture.BorderDefault
						v.bar.border.size = nil
						v.bar.border.offset = nil
						v.bar.border.scale = 1
						v.bar.border.file = nil
					end
				
					if v.bar.colour then
						
						if v.bar.colour.border then
							v.bar.border = v.bar.border or { }
							v.bar.border.colour = v.bar.border.colour or { }
							v.bar.border.colour.r = v.bar.colour.border.r or v.bar.border.colour.r
							v.bar.border.colour.g = v.bar.colour.border.g or v.bar.border.colour.g
							v.bar.border.colour.b = v.bar.colour.border.b or v.bar.border.colour.b
							v.bar.colour.border = nil
						end
						
						if v.bar.colour.background then
							v.bar.background = v.bar.background or { }
							v.bar.background.colour = v.bar.background.colour or { }
							v.bar.background.colour.r =  v.bar.colour.background.r or v.bar.background.colour.r
							v.bar.background.colour.g = v.bar.colour.background.g or v.bar.background.colour.g
							v.bar.background.colour.b = v.bar.colour.background.b or v.bar.background.colour.b
							v.bar.background.colour.a = v.bar.colour.background.a or v.bar.background.colour.a
							v.bar.colour.background = nil
						end
					
					end
					
					v.bar.colour = nil
					
				end
				
				if v.slot then
				
					if v.slot.border then
						v.slot.border.style = ArkInventory.Const.Texture.BorderDefault
						v.slot.border.size = nil
						v.slot.border.offset = nil
						v.slot.border.scale = 1
						v.slot.border.file = nil
					end
				
					if v.slot.empty then
						v.slot.empty.colour = nil
						v.slot.empty.display = nil
						v.slot.empty.show = nil
					end
				
				end
				
				v.sortorder = nil
				
				if v.sort then
					wipe( v.sort )
				end
				
			end
			
		end
		
		if profile.option.ui then
			
			if profile.option.ui.search then
				
				if profile.option.ui.search.border then
					profile.option.ui.search.border.style = ArkInventory.Const.Texture.BorderDefault
					profile.option.ui.search.border.size = nil
					profile.option.ui.search.border.offset = nil
					profile.option.ui.search.border.scale = 1
					profile.option.ui.search.border.file = nil
				end
				
				if profile.option.ui.search.colour then
					
					if profile.option.ui.search.colour.border then
						profile.option.ui.search.border = profile.option.ui.search.border or { }
						profile.option.ui.search.border.colour = profile.option.ui.search.border.colour or { }
						profile.option.ui.search.border.colour.r = profile.option.ui.search.colour.border.r or profile.option.ui.search.border.colour.r
						profile.option.ui.search.border.colour.g = profile.option.ui.search.colour.border.g or profile.option.ui.search.border.colour.g
						profile.option.ui.search.border.colour.b = profile.option.ui.search.colour.border.b or profile.option.ui.search.border.colour.b
						profile.option.ui.search.colour.border = nil
					end
					
					if profile.option.ui.search.colour.background then
						profile.option.ui.search.background = profile.option.ui.search.background or { }
						profile.option.ui.search.background.colour = profile.option.ui.search.background.colour or { }
						profile.option.ui.search.background.colour.r = profile.option.ui.search.colour.background.r or profile.option.ui.search.background.colour.r
						profile.option.ui.search.background.colour.g = profile.option.ui.search.colour.background.g or profile.option.ui.search.background.colour.g
						profile.option.ui.search.background.colour.b = profile.option.ui.search.colour.background.b or profile.option.ui.search.background.colour.b
						profile.option.ui.search.background.colour.a = profile.option.ui.search.colour.background.a or profile.option.ui.search.background.colour.a
						profile.option.ui.search.colour.background = nil
					end
					
				end
				
			end
		
			if profile.option.ui.rules then
			
				if profile.option.ui.rules.border then
					profile.option.ui.rules.border.style = ArkInventory.Const.Texture.BorderDefault
					profile.option.ui.rules.border.size = nil
					profile.option.ui.rules.border.offset = nil
					profile.option.ui.rules.border.scale = 1
					profile.option.ui.rules.border.file = nil
				end
				
				if profile.option.ui.rules.colour then
					
					if profile.option.ui.rules.colour.border then
						profile.option.ui.rules.border = profile.option.ui.rules.border or { }
						profile.option.ui.rules.border.colour = profile.option.ui.rules.border.colour or { }
						profile.option.ui.rules.border.colour.r = profile.option.ui.rules.colour.border.r or profile.option.ui.rules.border.colour.r
						profile.option.ui.rules.border.colour.g = profile.option.ui.rules.colour.border.g or profile.option.ui.rules.border.colour.g
						profile.option.ui.rules.border.colour.b = profile.option.ui.rules.colour.border.b or profile.option.ui.rules.border.colour.b
						profile.option.ui.rules.colour.border = nil
					end
				
					if profile.option.ui.rules.colour.background then
						profile.option.ui.rules.background = profile.option.ui.rules.background or { }
						profile.option.ui.rules.background.colour = profile.option.ui.rules.background.colour or { }
						profile.option.ui.rules.background.colour.r = profile.option.ui.rules.colour.background.r or profile.option.ui.rules.background.colour.r
						profile.option.ui.rules.background.colour.g = profile.option.ui.rules.colour.background.g or profile.option.ui.rules.background.colour.g
						profile.option.ui.rules.background.colour.b = profile.option.ui.rules.colour.background.b or profile.option.ui.rules.background.colour.b
						profile.option.ui.rules.background.colour.a = profile.option.ui.rules.colour.background.a or profile.option.ui.rules.background.colour.a
						profile.option.ui.rules.colour.background = nil
					end
					
				end
				
			end
			
		end
		
		ArkInventory.OutputWarning( "The border styles for each location have been reset to Blizzard Tooltip (default), the colour was able to be kept though" )
		
		
		profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0240
	if profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], profile_name, upgrade_version ) )
		
		if profile.option.location then
			
			for _, loc in pairs( profile.option.location ) do
				
				if loc.framehide then
					
					loc.title = loc.title or { }
					loc.title.hide = not not loc.framehide.header
					
					loc.search = loc.search or { }
					loc.search.hide = not not loc.framehide.search
					
					loc.status = loc.status or { }
					loc.status.hide = not not loc.framehide.status
					
					loc.changer = loc.changer or { }
					loc.changer.hide = not not loc.framehide.changer
					
					loc.framehide = nil
					
				end
				
			end
			
		end
		
		
		profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0260
	if profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], profile_name, upgrade_version ) )
		
		if profile.option.location then
			
			for k, v in pairs( profile.option.location ) do
				if v.anchor and v.anchor[k] then
					
					profile.option.anchor = profile.option.anchor or { }
					profile.option.anchor[k] = profile.option.anchor[k] or { }
					
					profile.option.anchor[k].point = v.anchor[k].point
					profile.option.anchor[k].locked = v.anchor[k].locked
					profile.option.anchor[k].t = v.anchor[k].t
					profile.option.anchor[k].b = v.anchor[k].b
					profile.option.anchor[k].l = v.anchor[k].l
					profile.option.anchor[k].r = v.anchor[k].r
					
				end
				v.anchor = nil
			end
			
		end
		
		
		profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0271
	if profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], profile_name, upgrade_version ) )
		
		if profile.option.location then
			for k, v in pairs( profile.option.location ) do
				if v.slot and v.slot.new and v.slot.new.cutoff then
					v.slot.new.cutoff = v.slot.new.cutoff * 60
				end
			end
		end
		
		
		profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 30404
	if profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], profile_name, upgrade_version ) )
		
		if profile.option.location then
			for k, v in pairs( profile.option.location ) do
				if v.sort then
					v.sort.method = v.sort.default or v.sort.method or 9999
					v.sort.default = nil
				end
			end
		end
		
		
		profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 30409
	if profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], profile_name, upgrade_version ) )
		
		if profile.option.location then
			for k, v in pairs( profile.option.location ) do
				if v.slot and v.slot.empty then
					if type( v.slot.empty.first ) == "boolean" then
						if v.slot.empty.first then
							v.slot.empty.first = 1
						else
							v.slot.empty.first = 0
						end
					end
				end
			end
		end
		
		
		profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 30420
	if profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], profile_name, upgrade_version ) )
		
		if profile.option.location then
			
			for k, v in pairs( profile.option.location ) do
				
				if v.slot and v.slot.new and v.slot.new.show then
					
					v.slot.age = v.slot.age or { }
					
					v.slot.age.show = v.slot.new.show
					v.slot.new.show = nil
					
					v.slot.age.cutoff = v.slot.new.cutoff
					v.slot.new.cutoff = 2
					
					if v.slot.new.colour then
						v.slot.age.colour = v.slot.age.colour or { }
						v.slot.age.colour.r = v.slot.new.colour.r
						v.slot.age.colour.g = v.slot.new.colour.g
						v.slot.age.colour.b = v.slot.new.colour.b
						v.slot.new.colour = nil
					end
				
				end
				
			end
			
		end
		
		
		profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 30602 -- LEGION VERSION WITH DATA LAYOUT CHANGES, ANYTHING BEFORE THIS IS SAFE TO UPGRADE DIRECTLY TO 30700
	if profile.option.version < upgrade_version then
		
		upgrade_version = 30700
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], profile_name, upgrade_version ) )
		
		-- 30602 changes
		
		-- copy the acedb profile data as is to the new global profile storage
		local id, newprofile = ArkInventory.ConfigInternalProfileAdd( profile_name )
		if id then
			
			local catset_id
			local design_id = { }
			
			for k1, v1 in pairs( ARKINVDB.profileKeys ) do
				if v1 == profile_name then
					local player = ArkInventory.GetPlayerStorage( k1 )
					player.data.profile = id
				end
			end
			
			-- transfer category set data out of profile
			if profile.option.category or profile.option.rule then
				
				local id, data = ArkInventory.ConfigInternalCategorysetAdd( profile_name )
				
				if id then
					
					if profile.option.category then
						ArkInventory.Table.Merge( profile.option.category, data.category.assign )
					end
					profile.option.category = nil
					
					if profile.option.rule then
						ArkInventory.Table.Merge( profile.option.rule, data.category.active[ArkInventory.Const.Category.Type.Rule] )
					end
					profile.option.rule = nil
					
					for k, v in pairs( ArkInventory.acedb.global.option.category[ArkInventory.Const.Category.Type.Custom].data ) do
						if v.used ~= "N" then
							data.category.active[ArkInventory.Const.Category.Type.Custom][k] = true
						end
					end
					
					catset_id = id
					
				end
				
			end
			
			
			if profile.option.anchor then
				for k, v in pairs( profile.option.anchor ) do
					newprofile.location[k].anchor.point = v.point
					newprofile.location[k].anchor.locked = v.locked
					newprofile.location[k].anchor.t = v.t
					newprofile.location[k].anchor.b = v.b
					newprofile.location[k].anchor.l = v.l
					newprofile.location[k].anchor.r = v.r
				end
				profile.option.anchor = nil
			end
			
			
			if profile.option.location then
				
				for loc_id, loc_data in pairs( profile.option.location ) do
					if ArkInventory.Global.Location[loc_id] and ArkInventory.Global.Location[loc_id].canView then
						
						local n = string.format( "%s - %s", profile_name, ArkInventory.Global.Location[loc_id].Name or loc_id )
						
						loc_data.layout = nil
						loc_data.theme = nil
						
						if loc_data.bar and loc_data.bar.data then
							for k, v in pairs( loc_data.bar.data ) do
								if v.sortorder then
									if not v.sort then
										v.sort = { }
									end
									v.sort.method = v.sortorder
									v.sortorder = nil
								end
							end
						end
						
						-- move style/layout data to designs
						local id, design = ArkInventory.ConfigInternalDesignAdd( "transfer" )
						if id then
							
							--ArkInventory.Output( "transferring profile data to style/layout ", n )
							
							ArkInventory.Table.Merge( loc_data, design )
							
							design.used = "Y"
							design.name = string.trim( n )
							
							design_id[loc_id] = id
							
						end
					end
					
				end
				
				profile.option.location = nil
				
			end
			
			for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
				if loc_data.canView then
					local id = ( profile.option.use and profile.option.use[loc_id] ) or loc_id
					newprofile.location[loc_id].style = design_id[id] or 1000
					newprofile.location[loc_id].layout = design_id[id] or 1000
					newprofile.location[loc_id].catset = catset_id or 1000
				end
			end
			
		end
		
		table.wipe( profile.option )
		
		
		profile.option.version = upgrade_version
		
		return
	
	end
	
	
	
	-- ANYTING ELSE FROM THE PTR/BETA, THE MESSY UPGRADE PATH - THIS IS WHY BACKUPS ARE A GOOD IDEA
	
	upgrade_version = 30604
	if profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], profile_name, upgrade_version ) )
		
		local player = ArkInventory.PlayerDataGet( )
		
		if profile.option.category or profile.option.rule then
			
			local id, data = ArkInventory.ConfigInternalCategorysetAdd( ArkInventory.db:GetCurrentProfile( ) )
			
			if id then
				
				catset = id
				
				if profile.option.category then
					ArkInventory.Table.Merge( profile.option.category, data.category.assign )
				end
				profile.option.category = nil
				
				if profile.option.rule then
					ArkInventory.Table.Merge( profile.option.rule, data.category.active[ArkInventory.Const.Category.Type.Rule] )
				end
				profile.option.rule = nil
				
				for k, v in pairs( ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Custom].data ) do
					if v.used ~= "N" then
						data.category.active[ArkInventory.Const.Category.Type.Custom][k] = true
					end
				end
				
			end
			
		end
		
		if profile.option.layout then
				for k, v in pairs( profile.option.layout ) do
				player.option[k].layout = v
			end
		end
		
		if profile.option.style then
			for k, v in pairs( profile.option.style ) do
				player.option[k].style = v
			end
		end
		
		if profile.option.catset then
			for k, v in pairs( profile.option.catset ) do
				player.option[k].catset = v
			end
		end
		
		profile.option.font = nil
		profile.option.frameStrata = nil
		
		
		profile.option.version = upgrade_version
		
	end
	
	
	-- ACEDB PROFILES NO LONGER USED
	-- AFTER THIS POINT EVERYTHING IS GLOBAL
	-- PROFILES UNDER 30700 WILL BE FIXED IN GLOBALS
	
end




function ArkInventory.DatabaseUpgradePostLoad( )
	
	--ArkInventory.Output( LIGHTYELLOW_FONT_COLOR_CODE, "DatabaseUpgradePostLoad" )
	
	local upgrade_version
	
	
	if not ArkInventory.acedb.global.option.version or ArkInventory.acedb.global.option.version == 0 then
		ArkInventory.acedb.global.option.version = ArkInventory.Const.Program.Version
	end
	
	if not ArkInventory.acedb.global.player.version or ArkInventory.acedb.global.player.version == 0 then
		ArkInventory.acedb.global.player.version = ArkInventory.Const.Program.Version
	end
	
	
	
	upgrade_version = 3.00
	if ArkInventory.acedb.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "rule", upgrade_version ) )
		
		if ArkInventory.acedb.global.option.rule then
			
			for k, v in pairs( ArkInventory.acedb.global.option.rule ) do
				ArkInventory.acedb.global.option.category[ArkInventory.Const.Category.Type.Rule].data[k] = v
				ArkInventory.acedb.global.option.rule[k] = nil
			end
			
			ArkInventory.acedb.global.option.category[ArkInventory.Const.Category.Type.Rule].next = ArkInventory.acedb.global.option.nextrule
			ArkInventory.acedb.global.option.nextrule = nil
			
		end
		
		ArkInventory.acedb.global.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0005
	if ArkInventory.acedb.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "option", upgrade_version ) )
		
		if ArkInventory.acedb.global.option.bugfix_alert_framelevel then
			ArkInventory.acedb.global.option.bugfix.alert = ArkInventory.acedb.global.option.bugfix_alert_framelevel
		end
		
		
		ArkInventory.acedb.global.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0223
	if ArkInventory.acedb.global.option.version < upgrade_version then
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "player", upgrade_version ) )
		ArkInventory.acedb.global.option.tooltip.scale = { enabled = false, amount = 1 }
		ArkInventory.acedb.global.option.version = upgrade_version
	end
	
	
	upgrade_version = 3.0230
	if ArkInventory.acedb.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "categories, rules and ldb", upgrade_version ) )
		
		local cat, cat_old
		
		cat = ArkInventory.acedb.global.option.sort.method.data
		for k in pairs( cat ) do
			cat[k].used = true
		end
		
		
		cat_old = ArkInventory.acedb.global.option.category[ArkInventory.Const.Category.Type.Custom].data
		ArkInventory.acedb.global.option.category[ArkInventory.Const.Category.Type.Custom].data = { }
		cat = ArkInventory.acedb.global.option.category[ArkInventory.Const.Category.Type.Custom].data
		for k, v in pairs( cat_old ) do
			if v then
				cat[k] = { used = true, name = v }
			else
				cat[k] = { used = false, name = "" }
			end
		end
		
		cat = ArkInventory.acedb.global.option.category[ArkInventory.Const.Category.Type.Rule].data
		for k, v in pairs( cat ) do
			if v then
				cat[k].used = true
			else
				cat[k] = { used = false, name = "" }
			end
		end
		
		
		for k, v in pairs( ArkInventory.acedb.global.player.data ) do
			if v.ldb.version and v.ldb.version < upgrade_version then
				v.ldb.mounts.track = nil
				v.ldb.version = upgrade_version
			end
		end
		
		
		ArkInventory.acedb.global.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0233
	if ArkInventory.acedb.global.option.version < upgrade_version then
		
		-- beta fix
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "categories", upgrade_version ) )
		
		local cat = ArkInventory.acedb.global.option.category[ArkInventory.Const.Category.Type.Custom].data
		for k, v in pairs( cat ) do
			
			local z = v.name
			
			while true do
				if type( z ) == "table" then
					z = z.name or "unknown"
				else
					break
				end
			end
				
			v.name = z
			
		end
		
		ArkInventory.acedb.global.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0237
	if ArkInventory.acedb.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "", upgrade_version ) )
		
		if ArkInventory.acedb.global.option.bugfix then
			
			if ArkInventory.acedb.global.option.bugfix.enable then
				ArkInventory.acedb.global.option.bugfix.framelevel.enable = ArkInventory.acedb.global.option.bugfix.enable
				ArkInventory.acedb.global.option.bugfix.enable = nil
			end
			
			ArkInventory.acedb.global.option.bugfix.framelevel.alert = 0
			ArkInventory.acedb.global.option.bugfix.alert = nil
			
		end
		
		ArkInventory.acedb.global.option.bugfix.zerosizebag.alert = true
		
		
		ArkInventory.acedb.global.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0248
	for k, v in pairs( ArkInventory.acedb.global.player.data ) do
		if v.ldb.version and v.ldb.version < upgrade_version then
			
			if v.ldb.currency and v.ldb.currency.tracked then
				for k2, v2 in pairs( v.ldb.currency.tracked ) do
					if v2 then
						v.ldb.tracking.currency.tracked[k2] = v2
					end
				end
			end
			
			v.ldb.currency = nil
			
			v.ldb.ammo = nil
			
			v.ldb.version = upgrade_version
			
		end
	end
	
	
	upgrade_version = 3.0250
	for k, v in pairs( ArkInventory.acedb.global.player.data ) do
		if v.ldb.version and v.ldb.version < upgrade_version then
			
			if v.ldb.mounts then
				
				if v.ldb.mounts.ground and v.ldb.mounts.ground.track then
					v.ldb.mounts.ground.track = nil
				end
			
				if v.ldb.mounts.flying and v.ldb.mounts.flying.track then
					v.ldb.mounts.flying.track = nil
				end
				
				if v.ldb.mounts.water and v.ldb.mounts.water.track then
					v.ldb.mounts.water.track = nil
				end
				
			end
			
			v.ldb.version = upgrade_version
			
		end
	end

	
	upgrade_version = 30311
	for k, v in pairs( ArkInventory.acedb.global.player.data ) do
		if v.ldb.version and v.ldb.version < upgrade_version then
			
			-- erase any previously selected pets
			for x in pairs( v.ldb.pets.selected ) do
				v.ldb.pets.selected[x] = nil
			end
			
			for x in pairs( v.ldb.tracking.currency.tracked ) do
				v.ldb.tracking.currency.tracked[x] = false
			end
			
			v.ldb.version = upgrade_version
			
		end
		
	end
	
	
	upgrade_version = 30316
	for k, v in pairs( ArkInventory.acedb.global.player.data ) do
		if v.ldb.version and v.ldb.version < upgrade_version then
			
			if v.ldb.mounts then
				
				if v.ldb.mounts.ground then
					v.ldb.mounts.l = v.ldb.mounts.ground
					v.ldb.mounts.ground = nil
				end
				
				if v.ldb.mounts.flying then
					v.ldb.mounts.a = v.ldb.mounts.flying
					v.ldb.mounts.flying = nil
				end
				
				if v.ldb.mounts.water then
					v.ldb.mounts.u = v.ldb.mounts.water
					v.ldb.mounts.water = nil
				end
				
			end
			
			v.ldb.version = upgrade_version
			
		end
	end
	
	
	upgrade_version = 30334
	if ArkInventory.acedb.global.player.version < upgrade_version then
		for k, v in pairs( ArkInventory.acedb.global.player.data ) do
			if v.version then
				v.version = nil
			end
			if v.ldb.version then
				v.ldb.version = nil
			end
		end
		ArkInventory.acedb.global.player.version = upgrade_version
	end
	
	
	upgrade_version = 30400
	if ArkInventory.acedb.global.player.version < upgrade_version then
		
		ArkInventory.EraseSavedData( nil, nil, true )
		
		for k, v1 in pairs( ArkInventory.acedb.global.player.data ) do
			if v1.display then
				for loc_id, v2 in pairs( v1.display ) do
					if v2.bag then
						for bag_id, v3 in pairs( v2.bag ) do
							v1.bagoptions[loc_id][bag_id].display = not not v3
						end
					end
				end
				v1.display = nil
			end
		end
		
		ArkInventory.acedb.global.player.version = upgrade_version
		
	end
	
	
	upgrade_version = 30407
	if ArkInventory.acedb.global.player.version < upgrade_version then
		ArkInventory.EraseSavedData( nil, ArkInventory.Const.Location.Pet, true )
	end
	
	
	upgrade_version = 30415
	if ArkInventory.acedb.global.player.version < upgrade_version then
		
		for _, v in pairs( ArkInventory.acedb.global.player.data ) do
			table.wipe( v.ldb.pets.selected )
		end
		
		ArkInventory.acedb.global.player.version = upgrade_version
		
	end
	
	
	upgrade_version = 30506
	if ArkInventory.acedb.global.player.version < upgrade_version then
		ArkInventory.EraseSavedData( nil, nil, true )
	end
	
	
	upgrade_version = 30602 -- LEGION
	if ArkInventory.acedb.global.player.version < upgrade_version then
		
		for _, data in pairs( ArkInventory.acedb.global.player.data ) do
			
			for k, v in pairs( data.monitor or { } ) do
				data.option[k].monitor = v
			end
			data.monitor = nil
			
			for k, v in pairs( data.save or { } ) do
				data.option[k].save = v
			end
			data.save = nil
			
			for k, v in pairs( data.control or { } ) do
				data.option[k].override = v
			end
			data.control = nil
			
			if data.bagoptions then
				for loc_id, v1 in pairs( data.bagoptions ) do
					for bag_id, v2 in pairs( v1 ) do
						data.option[loc_id].bag[bag_id] = ArkInventory.Table.Copy( v2 )
					end
				end
				data.bagoptions = nil
			end
			
		end
		
		for _, v in pairs( ArkInventory.acedb.global.option.category ) do
			for id, x in pairs( v.data ) do
				if id == 0 then
					ArkInventory.ConfigInternalCategoryCustomPurge( id )
				elseif x.used == true then
					x.used = "Y"
				elseif v.used == "N" then
					x.used = "D"
				end
			end
		end
		
		for id, v in pairs( ArkInventory.acedb.global.option.sort.method.data ) do
			if id == 0 then
				ArkInventory.ConfigInternalSortMethodPurge( id )
			elseif v.used == true then
				v.used = "Y"
			elseif v.used == "N" then
				v.used = "D"
			end
		end
		
		ArkInventory.acedb.global.player.version = upgrade_version
		
	end
	
	
	upgrade_version = 30604
	if ArkInventory.acedb.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "option", upgrade_version ) )
		
		for v1, v2 in pairs( ArkInventory.acedb.global.option.design.data ) do
			
			v2.slot.znew = nil
			
			for k, v in pairs( v2.slot.data ) do
				v.name = nil
				v.type = nil
				v.long = nil
				v.emptycolour = nil
				v.hide = nil
			end
			
			if v2.font.name then
				v2.font.face = v2.font.name
				v2.font.name = nil
			end
			
			for v3, v4 in pairs( v2.bar.data ) do
				if v4.label then
					v4.name.text = v4.label
					v4.label = nil
				end
			end
			
		end
		
		for v1, v2 in pairs( ArkInventory.acedb.global.option.catset.data ) do
			
			for k, v in pairs( v2.category ) do
				if type( v ) ~= "table" then
					v2.category.active[ArkInventory.Const.Category.Type.Rule][k] = v
					v2.category[k] = nil
				end
			end
			
			if v2.rule then
				
				for k, v in pairs( v2.rule ) do
					v2.category.active[ArkInventory.Const.Category.Type.Rule][k] = v
				end
				
				v2.rule = nil
				
			end
			
		end
		
		
		helper_CategoryRenumber( "1!303", nil ) -- empty key slot
		helper_CategoryRenumber( "1!406", nil ) -- key
		
		helper_CategoryRenumber( "1!114", "1!415" ) -- riding > SYSTEM_MOUNT
		helper_CategoryRenumber( "1!304", nil ) -- empty soul shard
		helper_CategoryRenumber( "1!310", nil ) -- bullet > projectile
		helper_CategoryRenumber( "1!311", nil ) -- arrow > projectile
		helper_CategoryRenumber( "1!410", nil ) -- projectile
		helper_CategoryRenumber( "1!413", nil ) -- soul shard
		helper_CategoryRenumber( "1!421", nil ) -- arrow > projectile
		helper_CategoryRenumber( "1!422", nil ) -- bullet > projectile
		
		helper_CategoryRenumber( "1!508", "1!510" ) -- weapon enchantment > TRADEGOODS_ENCHANTMENT
		helper_CategoryRenumber( "1!509", "1!510" ) -- armor enchantment > TRADEGOODS_ENCHANTMENT
		
		helper_CategoryRenumber( "1!425", "1!426" ) -- TRADEGOODS_DEVICES > CONSUMABLES_EXPLOSIVES_AND_DEVICES
		helper_CategoryRenumber( "1!433", nil ) -- CONSUMABLE_SCROLL
		helper_CategoryRenumber( "1!507", nil ) -- TRADEGOODS_MATERIALS
		helper_CategoryRenumber( "1!510", "1!440" ) -- TRADEGOODS_ENCHANTMENT > SYSTEM_ITEM_ENHANCEMENT
		
		
		ArkInventory.acedb.global.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 30611
	if ArkInventory.acedb.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "option", upgrade_version ) )
		
		for k1, v1 in pairs( ArkInventory.acedb.global.option.catset.data ) do
			
			for k2, v2 in pairs( v1.category.assign ) do
				
				local v = string.match( k2, "^%d+:(.+)$" )
				if v then
					v1.category.assign[v] = v2
					v1.category.assign[k2] = nil
				end
				
			end
			
		end
		
		
		ArkInventory.acedb.global.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 30700
	if ArkInventory.acedb.global.option.version < upgrade_version then
		
		-- bring all profiles up to date
		for k1, v1 in pairs( ARKINVDB.profiles ) do
			helper_UpgradeProfile( v1, k1 )
		end
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "", upgrade_version ) )
		
		-- recover lost profiles
		for profile_name, profile_data in pairs( ARKINVDB.profiles ) do
			if profile_data.option.version < 30700 then
				
				-- copy the acedb profile data as is to the new global profile storage
				local id, newprofile = ArkInventory.ConfigInternalProfileAdd( profile_name )
				if id then
					
					--ArkInventory.Output( "recovering profile ", profile_name )
					local player
					for k1, v1 in pairs( ARKINVDB.profileKeys ) do
						if v1 == profile_name then
							player = ArkInventory.GetPlayerStorage( k1 )
							player.data.profile = id
						end
					end
					
					if not player then
						
						ArkInventory.Output( "no active users for profile '", profile_name, "' unable to fully recover, please configure manually" )
						
					else
						
						ArkInventory.Output( "recovering profile '", profile_name, "' from player (", player.data.info.player_id, ") data" )
						
						--ArkInventory.Output( player.data.option )
						
						if player.data.option then
							local options = { "style", "layout", "catset", "monitor", "save", "override", "special", "notify" }
							for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
								if loc_data.canView then
									if player.data.option[loc_id] then
										for k, v in pairs( options ) do
											-- values can be false so specifically check for nil
											if player.data.option[loc_id][v] ~= nil then
												newprofile.location[loc_id][v] = player.data.option[loc_id][v]
											end
										end
									end
								end
							end
						end
					
					end
					
				end
			
			end
		end
		
		
		ArkInventory.acedb.global.version = upgrade_version
		
	end
	
	
	upgrade_version = 30701
	if ArkInventory.acedb.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "option", upgrade_version ) )
		
		if ArkInventory.acedb.global.option.restack.cleanup ~= nil then
			ArkInventory.acedb.global.option.restack.blizzard = ArkInventory.acedb.global.option.restack.cleanup
			ArkInventory.acedb.global.option.restack.cleanup = nil
		end
		
		for id, design in pairs( ArkInventory.acedb.global.option.design.data ) do
			for k, v in pairs( design.bag ) do
				if type( v ) ~= 'table' then
					design.bag[k] = { ["bar"] = v }
				end
				design[k] = nil
			end
		end
		
		
		
		ArkInventory.acedb.global.version = upgrade_version
		
	end
	
	
	upgrade_version = 30702
	if ArkInventory.acedb.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "profile", upgrade_version ) )
		
		for id, profile in pairs( ArkInventory.acedb.global.option.profile.data ) do
			if profile.anchor then
				for k, v in pairs( profile.anchor ) do
					profile.location[k].anchor.point = v.point
					profile.location[k].anchor.locked = v.locked
					profile.location[k].anchor.t = v.t
					profile.location[k].anchor.b = v.b
					profile.location[k].anchor.l = v.l
					profile.location[k].anchor.r = v.r
				end
				profile.anchor = nil
			end
		end
		
		
		ArkInventory.acedb.global.version = upgrade_version
		
	end
	
	
	upgrade_version = 30703
	if ArkInventory.acedb.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "style/layout", upgrade_version ) )
		
		for id, design in pairs( ArkInventory.acedb.global.option.design.data ) do
			if design.slot then
				if design.slot.data then
					for k, v in pairs( design.slot.data ) do
						v.long = nil
						v.type = nil
						if v.colour then
							v.colour.a = nil
						end
					end
				end
				design.slot.znew = nil
			end
		end
		
		
		ArkInventory.acedb.global.version = upgrade_version
		
	end
	
	
	upgrade_version = 30708
	if ArkInventory.acedb.global.player.version < upgrade_version then
		
		ArkInventory.EraseSavedData( )
		
		
		ArkInventory.acedb.global.version = upgrade_version
		
	end

	
	
	
	
	if ArkInventory.acedb.global.vendor then
		ArkInventory.acedb.global.vendor = nil
	end
	
	
	-- check sort keys
	ArkInventory.ConfigInternalSortMethodCheck( )
	
	
	-- check for character rename and move old data to new name
	local info = ArkInventory.GetPlayerInfo( )
	info.renamecheck = true
	for k, v in pairs( ArkInventory.acedb.global.player.data ) do
		if info.guid and info.guid == v.info.guid and not v.info.renamecheck then
			ArkInventory.acedb.global.player.data[info.player_id] = ArkInventory.Table.Copy( v )
			ArkInventory.Output( "character was renamed from ", v.info.name, " to ", info.name, ", data has been transferred" )
			ArkInventory.acedb.global.player.data[v.info.player_id] = ArkInventory.Table.Copy( ArkInventory.acedb.global.player.data[""] )
			break
		end
	end
	info.renamecheck = nil
	
	
	
	-- set versions to current mod version
	ArkInventory.acedb.global.version = ArkInventory.Const.Program.Version
	ArkInventory.acedb.global.option.version = ArkInventory.Const.Program.Version
	ArkInventory.acedb.global.player.version = ArkInventory.Const.Program.Version
	
	ArkInventory.CodexReset( )
	
end
