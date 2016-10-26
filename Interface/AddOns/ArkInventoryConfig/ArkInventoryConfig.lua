--[[

License: All Rights Reserved, (c) 2006-2016

$Revision: 1707 $
$Date: 2016-08-14 23:47:44 +1000 (Sun, 14 Aug 2016) $

]]--


local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table





--[[
	
	info.options = the options table
	info[0] = slash command
	info[1] = first group name
	...
	info[#info] = current option name
	info.arg
	info.handler
	info.type
	info.option = current option
	info.uiType
	info.uiName
	
	Currently inherited are: set, get, func, confirm, validate, disabled, hidden
	
]]--


function ArkInventory.ConfigRefresh( )
	--ArkInventory.Output( "ConfigRefresh" )
	ArkInventory.CodexReset( )
	ArkInventory.ConfigInternal( ) -- make sure the table is created
	LibStub("AceConfigRegistry-3.0"):NotifyChange( ArkInventory.Const.Frame.Config.Internal )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
end

function ArkInventory:EVENT_ARKINV_CONFIG_UPDATE( msg, ... )
	--ArkInventory.Output( "EVENT_ARKINV_CONFIG_UPDATE" )
	ArkInventory.ConfigRefresh( )
end

ArkInventory:RegisterMessage( "EVENT_ARKINV_CONFIG_UPDATE" )

local function ConfigGetNode( info, level )
	
	local level = level or #info - 1
	if level < 1 then level = 1 end
	if level > #info then level = #info end
	
	local node = info.options
	local path = ""
	
	for k = 1, level do
		if k == 1 then
			path = info[k]
		else
			path = string.format( "%s:%s", path, info[k] )
		end
		node = node.args[info[k]]
	end
	
	return node, path
	
end

local function ConfigGetNodeArg( info, level )
	
	local node, path = ConfigGetNode( info, level )
	
	if not node or node.arg == nil then
		
		local p = ""
		for k = 1, #info do
			if k == 1 then
				p = info[k]
			else
				p = string.format( "%s:%s", p, info[k] )
			end
		end
		
		ArkInventory.OutputError( "bad code. ", path, " does not have an arg value.  requested from ", p )
		return nil
	end
	
	return node.arg
	
end

local function helperColourGet( v )
	
	assert( v, "bad code: missing parameter" )
	assert( type( v ) == "table", "bad code: parameter is not a table" )
	
	local f = "%.3f"
	
	local r = tonumber( string.format( f, v.r or 1 ) )
	local g = tonumber( string.format( f, v.g or 1 ) )
	local b = tonumber( string.format( f, v.b or 1 ) )
	local a = tonumber( string.format( f, v.a or 1 ) )
	
	return r, g, b, a
	
end

local function helperColourSet( v, r, g, b, a )
	
	assert( v, "bad code: missing parameter" )
	assert( type( v ) == "table", "bad code: parameter is not a table" )
	
	local f = "%.3f"
	
	v.r = tonumber( string.format( f, r or 1 ) )
	v.g = tonumber( string.format( f, g or 1 ) )
	v.b = tonumber( string.format( f, b or 1 ) )
	if a then
		v.a = tonumber( string.format( f, a or 1 ) )
	end
	
end

local anchorpoints = {
	[ArkInventory.Const.Anchor.TopRight] = ArkInventory.Localise["TOPRIGHT"],
	[ArkInventory.Const.Anchor.BottomRight] = ArkInventory.Localise["BOTTOMRIGHT"],
	[ArkInventory.Const.Anchor.BottomLeft] = ArkInventory.Localise["BOTTOMLEFT"],
	[ArkInventory.Const.Anchor.TopLeft] = ArkInventory.Localise["TOPLEFT"],
}

function ArkInventory.ConfigInternal( )
	
	local path = ArkInventory.Config.Internal
	
	path.args = {
		
		version = {
			cmdHidden = true,
			order = 100,
			name = ArkInventory.Global.Version,
			type = "description",
		},
		
		notes = {
			cmdHidden = true,
			order = 200,
			name = function( ) 
				local t = GetAddOnMetadata( ArkInventory.Const.Program.Name, string.format( "Notes-%s", GetLocale( ) ) ) or ""
				if t == "" then
					t = GetAddOnMetadata( ArkInventory.Const.Program.Name, "Notes" ) or ""
				end
				return t or ""
			end,
			type = "description",
		},
		
		system = {
			cmdHidden = true,
			order = 300,
			name = ArkInventory.Localise["GENERAL"],
			desc = ArkInventory.Localise["CONFIG_SYSTEM_TEXT"],
			type = "group",
			args = {
				font = {
					order = 100,
					name = ArkInventory.Localise["FONT"],
					desc = ArkInventory.Localise["CONFIG_SYSTEM_FONT_TEXT"],
					type = "select",
					width = "double",
					dialogControl = "LSM30_Font",
					values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.FONT ),
					get = function( info )
						return ArkInventory.db.option.font.face or ArkInventory.Const.Font.Face
					end,
					set = function( info, v )
						ArkInventory.db.option.font.face = v
						ArkInventory.MediaAllFontSet( v )
					end,
				},
				height = {
					order = 110,
					name = ArkInventory.Localise["FONT_SIZE"],
					type = "range",
					min = ArkInventory.Const.Font.MinHeight,
					max = ArkInventory.Const.Font.MaxHeight,
					step = 1,
					get = function( info )
						return ArkInventory.db.option.font.height
					end,
					set = function( info, v )
						local v = math.floor( v )
						if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
						if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
						if ArkInventory.db.option.font.height ~= v then
							ArkInventory.db.option.font.height = v
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
						end
					end,
				},
				restack = {
					order = 130,
					name = ArkInventory.Localise["RESTACK"],
					desc = ArkInventory.Localise["RESTACK_TYPE"],
					type = "select",
					values = function( )
						local t = {
							[1] = string.format( "%s: %s", ArkInventory.Localise["BLIZZARD"], ArkInventory.Localise["CLEANUP"] ),
							[2] = string.format( "%s: %s", ArkInventory.Const.Program.Name, ArkInventory.Localise["RESTACK"] ),
						}
						return t
					end,
					get = function( info )
						if ArkInventory.db.option.restack.blizzard then
							return 1
						else
							return 2
						end
					end,
					set = function( info, v )
						if v == 1 then
							ArkInventory.db.option.restack.blizzard = true
						else
							ArkInventory.db.option.restack.blizzard = false
						end
					end,
				},
				reposition = {
					order = 140,
					name = ArkInventory.Localise["CONFIG_SYSTEM_REPOSITION_ONSHOW"],
					desc = ArkInventory.Localise["CONFIG_SYSTEM_REPOSITION_ONSHOW_TEXT"],
					type = "toggle",
					get = function( info )
						return ArkInventory.db.option.auto.reposition
					end,
					set = function( info, v )
						ArkInventory.db.option.auto.reposition = v
					end,
				},
				auto = {
					cmdHidden = true,
					order = 100,
					name = ArkInventory.Localise["CONFIG_AUTO"],
					type = "group",
					args = {
						auto_open = {
							order = 100,
							type = "group",
							inline = true,
							name = " ",
							args = {
								header = {
									order = 10,
									name = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"] ),
									type = "header",
									width = "full",
								},
								bank = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_AUTO_OPEN_BANK"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_OPEN_BANK"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.open.bank
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.bank = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								vault = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_AUTO_OPEN_VAULT"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_OPEN_VAULT"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.open.vault
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.vault = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								mail = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_AUTO_OPEN_MAIL"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_OPEN_MAIL"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.open.mail
										--return true
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.mail = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								merchant = {
									order = 400,
									name = ArkInventory.Localise["CONFIG_AUTO_OPEN_MERCHANT"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_OPEN_MERCHANT"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.open.merchant
										--return true
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.merchant = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								trade = {
									order = 500,
									name = ArkInventory.Localise["CONFIG_AUTO_OPEN_TRADE"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_OPEN_TRADE"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.open.trade
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.trade = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								auction = {
									order = 600,
									name = ArkInventory.Localise["CONFIG_AUTO_OPEN_AUCTION"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_OPEN_AUCTION"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.open.auction
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.auction = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								void = {
									order = 700,
									name = ArkInventory.Localise["CONFIG_AUTO_OPEN_VOID"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_OPEN_VOID"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.open.void
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.void = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
							},
						},
						auto_close = {
							order = 200,
							type = "group",
							inline = true,
							name = " ",
							args = {
								header = {
									order = 10,
									name = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"] ),
									type = "header",
									width = "full",
								},
								bank = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_AUTO_CLOSE_BANK"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_CLOSE_BANK"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.close.bank
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.bank = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								vault = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_AUTO_CLOSE_VAULT"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_CLOSE_VAULT"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.close.vault
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.vault = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								mail = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_AUTO_CLOSE_MAIL"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_CLOSE_MAIL"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.close.mail
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.mail = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								merchant = {
									order = 400,
									name = ArkInventory.Localise["CONFIG_AUTO_CLOSE_MERCHANT"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_CLOSE_MERCHANT"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.close.merchant
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.merchant = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								trade = {
									order = 500,
									name = ArkInventory.Localise["CONFIG_AUTO_CLOSE_TRADE"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_CLOSE_TRADE"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.close.trade
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.trade = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								auction = {
									order = 600,
									name = ArkInventory.Localise["CONFIG_AUTO_CLOSE_AUCTION"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_CLOSE_AUCTION"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.close.auction
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.auction = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								void = {
									order = 700,
									name = ArkInventory.Localise["CONFIG_AUTO_CLOSE_VOID"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_CLOSE_VOID"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.close.void
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.void = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								combat = {
									order = 800,
									name = ArkInventory.Localise["CONFIG_AUTO_CLOSE_COMBAT"],
									--desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"], ArkInventory.Localise["CONFIG_AUTO_CLOSE_COMBAT"] ), 
									type = "toggle",
									width = "double",
									get = function( info )
										return ArkInventory.db.option.auto.close.combat
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.combat = v
									end,
								},
							},
						},
					},
				},
				tooltip = {
					order = 200,
					name = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP"],
					type = "group",
					--inline = true,
					args = {
						basic = {
							order = 100,
							name = ArkInventory.Localise["GENERAL"],
							type = "group",
							inline = true,
							args = {
								show = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_ENABLE_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.tooltip.show
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.show = v
									end,
								},
								paint = {
									order = 200,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_CLASSCOLOUR_TEXT"],
									type = "toggle",
									disabled = function( info )
										return not ArkInventory.db.option.tooltip.show
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.colour.class
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.colour.class = v
										ArkInventory.ObjectCountClear( )
									end,
								},
								empty = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_EMPTY_ADD"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_EMPTY_ADD_TEXT"],
									type = "toggle",
									disabled = function( info )
										return not ArkInventory.db.option.tooltip.show
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.add.empty
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.add.empty = v
									end,
								},
							},
						},
						scale = {
							order = 200,
							name = ArkInventory.Localise["SCALE"],
							type = "group",
							inline = true,
							disabled = function( info )
								return not ArkInventory.db.option.tooltip.show
							end,
							args = {
								enabled = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_SCALE_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.tooltip.scale.enabled
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.scale.enabled = v
										for _, obj in pairs( ArkInventory.Global.Tooltip.WOW ) do
											if v then
												obj:SetScale( ArkInventory.db.option.tooltip.scale.amount or 1 )
											else
												obj:SetScale( 1 )
											end
										end
									end,
								},
								value = {
									order = 200,
									name = ArkInventory.Localise["SCALE"],
									type = "range",
									min = 0.5,
									max = 2,
									step = 0.05,
									isPercent = true,
									disabled = function( )
										return not ArkInventory.db.option.tooltip.scale.enabled
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.scale.amount
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.5 then v = 0.5 end
										if v > 2 then v = 2 end
										if ArkInventory.db.option.tooltip.scale.amount ~= v then
											ArkInventory.db.option.tooltip.scale.amount = v
											for _, obj in pairs( ArkInventory.Global.Tooltip.WOW ) do
												obj:SetScale( ArkInventory.db.option.tooltip.scale.amount or 1 )
											end
										end
									end,
								},
							},
						},
						count = {
							order = 300,
							name = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_ADD"],
							type = "group",
							inline = true,
							disabled = function( info )
								return not ArkInventory.db.option.tooltip.show
							end,
							args = {
								enabled = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_ADD_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.tooltip.add.count
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.add.count = v
									end,
								},
								colour = {
									order = 200,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_COLOUR_TEXT"],
									type = "color",
									hasAlpha = false,
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.add.count
									end,
									get = function( info )
										return helperColourGet( ArkInventory.db.option.tooltip.colour.count )
									end,
									set = function( info, r, g, b )
										helperColourSet( ArkInventory.db.option.tooltip.colour.count, r, g, b )
									end,
								},
								me = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_SELF_ONLY"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_SELF_ONLY_TEXT"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.add.count
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.me
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.me = v
										ArkInventory.ObjectCountClear( )
									end,
								},
								highlight = {
									order = 310,
									name = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_HIGHLIGHT"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_HIGHLIGHT_TEXT"],
									type = "input",
									width = "half",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.add.count or ArkInventory.db.option.tooltip.me
									end,
									get = function( info )
										return string.sub( string.trim( ArkInventory.db.option.tooltip.highlight ), 1, 3 )
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.highlight = string.sub( string.trim( v ), 1, 3 )
										ArkInventory.ObjectCountClear( )
									end,
								},
								faction = {
									order = 400,
									name = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_FACTION_ONLY"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_FACTION_ONLY_TEXT"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.add.count or ArkInventory.db.option.tooltip.me
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.faction
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.faction = v
										ArkInventory.ObjectCountClear( )
									end,
								},
								realm = {
									order = 410,
									name = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_REALM_ONLY"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_REALM_ONLY_TEXT"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.add.count or ArkInventory.db.option.tooltip.me
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.realm
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.realm = v
										ArkInventory.ObjectCountClear( )
									end,
								},
								crossrealm = {
									order = 420,
									name = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_CROSSREALM"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_CROSSREALM_TEXT"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.add.count or ArkInventory.db.option.tooltip.me or not ArkInventory.db.option.tooltip.realm
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.crossrealm
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.crossrealm = v
										ArkInventory.ObjectCountClear( )
									end,
								},
								vault = {
									order = 500,
									name = ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Name,
									desc = string.format( ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_VAULT_TEXT"], ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Name ),
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.add.count or ArkInventory.db.option.tooltip.me
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.add.vault
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.add.vault = v
										ArkInventory.ObjectCountClear( )
									end,
								},
								showtabs = {
									order = 600,
									name = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_VAULT_TABS"],
									desc = string.format( ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_VAULT_TABS_TEXT"], ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Name ),
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.add.count or ArkInventory.db.option.tooltip.me or not ArkInventory.db.option.tooltip.add.vault
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.add.tabs
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.add.tabs = v
										ArkInventory.ObjectCountClear( )
									end,
								},
							},
						},
						battlepet = {
							order = 400,
							name = ArkInventory.Localise["BATTLEPET"],
							type = "group",
							inline = true,
							args = {
								custom = {
									order = 100,
									name = ArkInventory.Localise["CUSTOM"],
									type = "group",
									inline = true,
									args = {
										enabled = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_CUSTOM_ENABLE_TEXT"],
											type = "toggle",
											get = function( info )
												return ArkInventory.db.option.tooltip.battlepet.enable
											end,
											set = function( info, v )
												ArkInventory.db.option.tooltip.battlepet.enable = v
											end,
										},
										source = {
											order = 200,
											name = SOURCES,
											desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_SOURCE_TEXT"],
											type = "toggle",
											disabled = function( )
												return not ArkInventory.db.option.tooltip.battlepet.enable
											end,
											get = function( info )
												return ArkInventory.db.option.tooltip.battlepet.source
											end,
											set = function( info, v )
												ArkInventory.db.option.tooltip.battlepet.source = v
											end,
										},
										description = {
											order = 300,
											name = ArkInventory.Localise["DESCRIPTION"],
											desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_DESCRIPTION_TEXT"],
											type = "toggle",
											disabled = function( )
												return not ArkInventory.db.option.tooltip.battlepet.enable
											end,
											get = function( info )
												return ArkInventory.db.option.tooltip.battlepet.description
											end,
											set = function( info, v )
												ArkInventory.db.option.tooltip.battlepet.description = v
											end,
										},
									},
								},
								mouseover = {
									order = 200,
									name = ArkInventory.Localise["MOUSEOVER"],
									type = "group",
									inline = true,
									args = {
										enabled = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_MOUSEOVER_ENABLE_TEXT"],
											type = "toggle",
											get = function( info )
												return ArkInventory.db.option.tooltip.battlepet.mouseover.enable
											end,
											set = function( info, v )
												ArkInventory.db.option.tooltip.battlepet.mouseover.enable = v
											end,
										},
										source = {
											order = 200,
											name = SOURCES,
											desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_SOURCE_TEXT"],
											type = "toggle",
											disabled = function( )
												return not ArkInventory.db.option.tooltip.battlepet.mouseover.enable
											end,
											get = function( info )
												return ArkInventory.db.option.tooltip.battlepet.mouseover.source
											end,
											set = function( info, v )
												ArkInventory.db.option.tooltip.battlepet.mouseover.source = v
											end,
										},
										description = {
											order = 300,
											name = ArkInventory.Localise["DESCRIPTION"],
											desc = ArkInventory.Localise["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_DESCRIPTION_TEXT"],
											type = "toggle",
											disabled = function( )
												return not ArkInventory.db.option.tooltip.battlepet.mouseover.enable
											end,
											get = function( info )
												return ArkInventory.db.option.tooltip.battlepet.mouseover.description
											end,
											set = function( info, v )
												ArkInventory.db.option.tooltip.battlepet.mouseover.description = v
											end,
										},
									},
								},
							},
						},
					},
				},
				bugfix = {
					order = 200,
					name = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND"],
					type = "group",
					--inline = true,
					args = {
						framelevel = {
							order = 100,
							name = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL"],
							type = "group",
							inline = true,
							args = {
								desc = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_TEXT"],
									type = "description",
								},
								enabled = {
									order = 200,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.bugfix.framelevel.enable
									end,
									set = function( info, v )
										ArkInventory.db.option.bugfix.framelevel.enable = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
									end,
								},
								alert = {
									order = 300,
									name = ArkInventory.Localise["ALERT"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_TEXT"],
									type = "select",
									disabled = function( )
										return not ArkInventory.db.option.bugfix.framelevel.enable
									end,
									values = function( )
										local t = { }
										t[0] = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE0"]
										t[1] = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE1"]
										t[2] = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE2"]
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.bugfix.framelevel.alert or 0
									end,
									set = function( info, v )
										ArkInventory.db.option.bugfix.framelevel.alert = v
									end,
								},
							},
						},
						zerosizebag = {
							order = 200,
							name = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND_ZEROSIZEBAG"],
							type = "group",
							inline = true,
							args = {
								desc = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND_ZEROSIZEBAG_TEXT"],
									type = "description",
								},
								enabled = {
									order = 200,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND_TEXT"],
									type = "toggle",
									disabled = true,
									get = function( info )
										return ArkInventory.db.option.bugfix.zerosizebag.enable
									end,
									set = function( info, v )
										ArkInventory.db.option.bugfix.zerosizebag.enable = v
									end,
								},
								alert = {
									order = 300,
									name = ArkInventory.Localise["ALERT"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND_ZEROSIZEBAG_ALERT_TEXT"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.bugfix.zerosizebag.enable
									end,
									get = function( info )
										return ArkInventory.db.option.bugfix.zerosizebag.alert
									end,
									set = function( info, v )
										ArkInventory.db.option.bugfix.zerosizebag.alert = v
									end,
								},
							},
						},
						combatyield = {
							order = 300,
							name = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND_COMBAT_YIELD"],
							type = "group",
							inline = true,
							args = {
								enabled = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND_COMBAT_YIELD_ENABLED_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.Global.Thread.WhileInCombat
									end,
									set = function( info, v )
										ArkInventory.Global.Thread.WhileInCombat = v
									end,
								},
								items = {
									order = 200,
									name = ArkInventory.Localise["ITEMS"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_WORKAROUND_COMBAT_YIELD_COUNT_TEXT"],
									type = "range",
									min = 1,
									max = ArkInventory.Const.MAX_BAG_SIZE,
									step = 1,
									disabled = function( info )
										return not ArkInventory.Global.Thread.WhileInCombat
									end,
									get = function( info )
										return ArkInventory.db.option.combat.yieldafter or 30
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 1 then v = 1 end
										if v > ArkInventory.Const.MAX_BAG_SIZE then v = ArkInventory.Const.MAX_BAG_SIZE end
										ArkInventory.db.option.combat.yieldafter = v
									end,
								},
							},
						},
					},
				},
				bucket = {
					cmdHidden = true,
					order = 200,
					name = ArkInventory.Localise["CONFIG_SYSTEM_TIMERS"],
					--desc = ArkInventory.Localise["CONFIG_SYSTEM_TIMERS"],
					type = "group",
					--inline = true,
					args = {
						bag = {
							order = 100,
							name = ArkInventory.Localise["LOCATION_BAG"],
							type = "group",
							inline = true,
							args = {
								custom = {
									order = 100,
									name = ArkInventory.Localise["CUSTOM"],
									desc = string.format( ArkInventory.Localise["CONFIG_SYSTEM_TIMERS_TEXT"], ArkInventory.Localise["LOCATION_BAG"] ),
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.bucket[ArkInventory.Const.Location.Bag]
									end,
									set = function( info, v )
										if not v then
											ArkInventory.db.option.bucket[ArkInventory.Const.Location.Bag] = nil
										else
											ArkInventory.db.option.bucket[ArkInventory.Const.Location.Bag] = 0.5
										end
									end,
								},
								value = {
									order = 200,
									name = ArkInventory.Localise["SECONDS"],
									type = "range",
									min = 0.1,
									max = 5,
									step = 0.05,
									disabled = function( )
										return not ArkInventory.db.option.bucket[ArkInventory.Const.Location.Bag]
									end,
									get = function( info )
										return ArkInventory.db.option.bucket[ArkInventory.Const.Location.Bag] or 0.5
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.1 then v = 0.1 end
										if v > 5 then v = 5 end
										ArkInventory.db.option.bucket[ArkInventory.Const.Location.Bag] = v
									end,
								},
							},
						},
						mail = {
							order = 200,
							name = ArkInventory.Localise["MAIL"],
							type = "group",
							inline = true,
							args = {
								custom = {
									order = 100,
									name = ArkInventory.Localise["CUSTOM"],
									desc = string.format( ArkInventory.Localise["CONFIG_SYSTEM_TIMERS_TEXT"], ArkInventory.Localise["MAIL"] ),
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.bucket[ArkInventory.Const.Location.Mail]
									end,
									set = function( info, v )
										if not v then
											ArkInventory.db.option.bucket[ArkInventory.Const.Location.Mail] = nil
										else
											ArkInventory.db.option.bucket[ArkInventory.Const.Location.Mail] = 2
										end
									end,
								},
								value = {
									order = 200,
									name = ArkInventory.Localise["SECONDS"],
									type = "range",
									min = 0.1,
									max = 10,
									step = 0.05,
									disabled = function( )
										return not ArkInventory.db.option.bucket[ArkInventory.Const.Location.Mail]
									end,
									get = function( info )
										return ArkInventory.db.option.bucket[ArkInventory.Const.Location.Mail] or 2
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.1 then v = 0.1 end
										if v > 10 then v = 10 end
										ArkInventory.db.option.bucket[ArkInventory.Const.Location.Mail] = v
									end,
								},
							},
						},
						vault = {
							order = 300,
							name = ArkInventory.Localise["LOCATION_VAULT"],
							type = "group",
							inline = true,
							args = {
								custom = {
									order = 100,
									name = ArkInventory.Localise["CUSTOM"],
									desc = string.format( ArkInventory.Localise["CONFIG_SYSTEM_TIMERS_TEXT"], ArkInventory.Localise["LOCATION_VAULT"] ),
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.bucket[ArkInventory.Const.Location.Vault]
									end,
									set = function( info, v )
										if not v then
											ArkInventory.db.option.bucket[ArkInventory.Const.Location.Vault] = nil
										else
											ArkInventory.db.option.bucket[ArkInventory.Const.Location.Vault] = 1.5
										end
									end,
								},
								value = {
									order = 200,
									name = ArkInventory.Localise["SECONDS"],
									type = "range",
									min = 0.1,
									max = 5,
									step = 0.05,
									disabled = function( )
										return not ArkInventory.db.option.bucket[ArkInventory.Const.Location.Vault]
									end,
									get = function( info )
										return ArkInventory.db.option.bucket[ArkInventory.Const.Location.Vault] or 1.5
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.1 then v = 0.1 end
										if v > 5 then v = 5 end
										ArkInventory.db.option.bucket[ArkInventory.Const.Location.Vault] = v
									end,
								},
							},
						},
					},
				},
				messages = {
					cmdHidden = true,
					order = 200,
					name = ArkInventory.Localise["CONFIG_SYSTEM_MESSAGES"],
					type = "group",
					args = {
						restack = {
							order = 100,
							name = ArkInventory.Localise["RESTACK"],
							type = "group",
							inline = true,
							args = {
								bag = {
									order = ArkInventory.Const.Location.Bag,
									name = ArkInventory.Global.Location[ArkInventory.Const.Location.Bag].Name,
									desc = ArkInventory.Localise["CONFIG_SYSTEM_MESSAGES_RESTACK_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.restack[ArkInventory.Const.Location.Bag]
									end,
									set = function( info, v )
										ArkInventory.db.option.message.restack[ArkInventory.Const.Location.Bag] = v
									end,
								},
								bank = {
									order = ArkInventory.Const.Location.Bank,
									name = ArkInventory.Global.Location[ArkInventory.Const.Location.Bank].Name,
									desc = ArkInventory.Localise["CONFIG_SYSTEM_MESSAGES_RESTACK_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.restack[ArkInventory.Const.Location.Bank]
									end,
									set = function( info, v )
										ArkInventory.db.option.message.restack[ArkInventory.Const.Location.Bank] = v
									end,
								},
								vault = {
									order = ArkInventory.Const.Location.Vault,
									name = ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Name,
									desc = ArkInventory.Localise["CONFIG_SYSTEM_MESSAGES_RESTACK_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.restack[ArkInventory.Const.Location.Vault]
									end,
									set = function( info, v )
										ArkInventory.db.option.message.restack[ArkInventory.Const.Location.Vault] = v
									end,
								},

							},
						},
						translation = {
							order = 200,
							name = ArkInventory.Localise["CONFIG_SYSTEM_MESSAGES_TRANSLATION"],
							type = "group",
							inline = true,
							args = {
								interim = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_SYSTEM_MESSAGES_TRANSLATION_INTERIM"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_MESSAGES_TRANSLATION_INTERIM_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.translation.interim
									end,
									set = function( info, v )
										ArkInventory.db.option.message.translation.interim = v
									end,
								},
								final = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_SYSTEM_MESSAGES_TRANSLATION_FINAL"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_MESSAGES_TRANSLATION_FINAL_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.translation.final
									end,
									set = function( info, v )
										ArkInventory.db.option.message.translation.final = v
									end,
								},
							},
						},
						battlepet = {
							order = 300,
							name = PET_BATTLE_INFO,
							type = "group",
							inline = true,
							args = {
								opponent = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_SYSTEM_MESSAGES_BATTLEPET_OPPONENT"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_MESSAGES_BATTLEPET_OPPONENT_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.battlepet.opponent
									end,
									set = function( info, v )
										ArkInventory.db.option.message.battlepet.opponent = v
									end,
								},
							},
						},
--[[
						mount = {
							order = 400,
							name = "mount",
							type = "group",
							inline = true,
							args = {
								warnings = {
									order = 100,
									name = "warnings",
									desc = "description required - stops the warning messages about having no usable mounts",
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.mount.warnings
									end,
									set = function( info, v )
										ArkInventory.db.option.message.mount.warnings = v
									end,
								},
							},
						},
]]--
					},
				},
				
				junk = {
					order = 200,
					name = ArkInventory.Localise["CONFIG_JUNK"],
					type = "group",
					inline = true,
					width = "full",
					args = {
						sell = {
							order = 100,
							name = ArkInventory.Localise["CONFIG_JUNK_SELL"],
							desc = ArkInventory.Localise["CONFIG_JUNK_SELL_TEXT"],
							type = "toggle",
							get = function( info )
								return ArkInventory.db.option.junk.sell
							end,
							set = function( info, v )
								ArkInventory.db.option.junk.sell = not ArkInventory.db.option.junk.sell
							end,
						},
						limit = {
							order = 200,
							name = ArkInventory.Localise["CONFIG_JUNK_LIMIT"],
							desc = string.format( ArkInventory.Localise["CONFIG_JUNK_LIMIT_TEXT"], BUYBACK_ITEMS_PER_PAGE ),
							type = "toggle",
							disabled = function( info )
								return not ArkInventory.db.option.junk.sell
							end,
							get = function( info )
								return ArkInventory.db.option.junk.limit
							end,
							set = function( info, v )
								ArkInventory.db.option.junk.limit = not ArkInventory.db.option.junk.limit
							end,
						},
						delete = {
							order = 300,
							name = ArkInventory.Localise["DELETE"],
							desc = ArkInventory.Localise["CONFIG_JUNK_DELETE_TEXT"],
							type = "toggle",
							width = "half",
							disabled = function( info )
								return not ArkInventory.db.option.junk.sell
							end,
							get = function( info )
								return ArkInventory.db.option.junk.delete
							end,
							set = function( info, v )
								ArkInventory.db.option.junk.delete = not ArkInventory.db.option.junk.delete
							end,
						},
						notify = {
							order = 400,
							name = ArkInventory.Localise["NOTIFY"],
							desc = ArkInventory.Localise["CONFIG_JUNK_NOTIFY_TEXT"],
							type = "toggle",
							width = "half",
							disabled = function( info )
								return not ArkInventory.db.option.junk.sell
							end,
							get = function( info )
								return ArkInventory.db.option.junk.notify
							end,
							set = function( info, v )
								ArkInventory.db.option.junk.notify = not ArkInventory.db.option.junk.notify
							end,
						},
					},
				},
				menu = {
					order = 300,
					name = ArkInventory.Localise["MENU"],
					type = "group",
					inline = true,
					width = "full",
					args = {
						height = {
							order = 100,
							name = ArkInventory.Localise["FONT_SIZE"],
							type = "range",
							min = ArkInventory.Const.Font.MinHeight,
							max = ArkInventory.Const.Font.MaxHeight,
							step = 1,
							get = function( info )
								return ArkInventory.db.option.menu.font.height
							end,
							set = function( info, v )
								local v = math.floor( v )
								if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
								if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
								if ArkInventory.db.option.menu.font.height ~= v then
									ArkInventory.db.option.menu.font.height = v
									ArkInventory.MediaMenuFontSet( nil, v )
								end
							end,
						},
					},
				},
				newitemglow = {
					order = 400,
					name = ArkInventory.Localise["NEW_ITEM_GLOW"],
					type = "group",
					inline = true,
					width = "full",
					args = {
						show = {
							order = 100,
							name = ArkInventory.Localise["ENABLED"],
							type = "toggle",
							get = function( info )
								return ArkInventory.db.option.newitemglow.enable
							end,
							set = function( info, v )
								ArkInventory.db.option.newitemglow.enable = v
							end,
						},
						colour = {
							order = 200,
							name = ArkInventory.Localise["COLOUR"],
							type = "color",
							hasAlpha = true,
							disabled = function( info )
								return not ArkInventory.db.option.newitemglow.enable
							end,
							get = function( info )
								return helperColourGet( ArkInventory.db.option.newitemglow.colour )
							end,
							set = function( info, r, g, b, a )
								helperColourSet( ArkInventory.db.option.newitemglow.colour, r, g, b, a )
								
							end,
						},
					},
				},
			},
		},
		control = {
			cmdHidden = true,
			order = 700,
			name = ArkInventory.Localise["CONTROLS"],
			type = "group",
			childGroups = "tab",
			args = {
				profile_name = {
					order = 1,
					type = "description",
					name = function( )
						local me = ArkInventory.GetPlayerCodex( )
						return string.format( "%s: [%s] %s", ArkInventory.Localise["CONFIG_PROFILE_CURRENT"], me.profile_id, me.profile.name )
					end,
					width = "full",
					fontSize = "large",
					disabled = true,
				},
			}, -- computed 
		},
		search = {
			cmdHidden = true,
			order = 1000,
			name = ArkInventory.Localise["SEARCH"],
			type = "group",
			args = {
				display = {
					order = 100,
					name = ArkInventory.Localise["SHOW"],
					desc = ArkInventory.Localise["SEARCH"],
					type = "execute",
					func = function( )
						ArkInventory.Frame_Search_Show( )
					end,
				},
				scale = {
					order = 200,
					name = ArkInventory.Localise["SCALE"],
					desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_SCALE_TEXT"],
					type = "range",
					min = 0.4,
					max = 2,
					step = 0.05,
					isPercent = true,
					get = function( info )
						return ArkInventory.db.option.ui.search.scale
					end,
					set = function( info, v )
						local v = math.floor( v / 0.05 ) * 0.05
						if v < 0.4 then v = 0.4 end
						if v > 2 then v = 2 end
						if ArkInventory.db.option.ui.search.scale ~= v then
							ArkInventory.db.option.ui.search.scale = v
							ArkInventory.Frame_Search_Paint( )
						end
					end,
				},
				background = {
					order = 1200,
					name = ArkInventory.Localise["BACKGROUND"],
					type = "group",
					inline = true,
					args = {
						style = {
							order = 100,
							name = ArkInventory.Localise["STYLE"],
							desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_TEXT"],
							type = "select",
							dialogControl = "LSM30_Background",
							values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND ),
							get = function( info )
								return ArkInventory.db.option.ui.search.background.style or ArkInventory.Const.Texture.BackgroundDefault
							end,
							set = function( info, v )
								if ArkInventory.db.option.ui.search.background.style ~= v then
									ArkInventory.db.option.ui.search.background.style = v
									ArkInventory.Frame_Search_Paint( )
								end
							end,
						},
						colour = {
							order = 200,
							name = ArkInventory.Localise["COLOUR"],
							desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BACKGROUND_COLOUR_TEXT"],
							type = "color",
							hasAlpha = true,
							hidden = function( info )
								return ArkInventory.db.option.ui.search.background.style ~= ArkInventory.Const.Texture.BackgroundDefault
							end,
							get = function( info )
								return helperColourGet( ArkInventory.db.option.ui.search.background.colour )
							end,
							set = function( info, r, g, b, a )
								helperColourSet( ArkInventory.db.option.ui.search.background.colour, r, g, b, a )
								ArkInventory.Frame_Search_Paint( )
							end,
						},
					},
				},
				border = {
					order = 1300,
					name = ArkInventory.Localise["BORDER"],
					type = "group",
					inline = true,
					args = {
						style = {
							order = 100,
							name = ArkInventory.Localise["STYLE"],
							desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_TEXT"],
							type = "select",
							dialogControl = "LSM30_Border",
							values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BORDER ),
							get = function( info )
								return ArkInventory.db.option.ui.search.border.style or ArkInventory.Const.Texture.BorderDefault
							end,
							set = function( info, v )
								if ArkInventory.db.option.ui.search.border.style ~= v then
									
									ArkInventory.db.option.ui.search.border.style = v
									
									local sd = ArkInventory.Const.Texture.Border[v] or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault]
									ArkInventory.db.option.ui.search.border.size = sd.size
									ArkInventory.db.option.ui.search.border.offset = sd.offset
									ArkInventory.db.option.ui.search.border.scale = sd.scale
									
									ArkInventory.Frame_Search_Paint( )
									
								end
							end,
						},
						colour = {
							order = 200,
							name = ArkInventory.Localise["COLOUR"],
							desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_COLOUR_TEXT"],
							type = "color",
							hidden = function( )
								return ArkInventory.db.option.ui.search.border.style == ArkInventory.Const.Texture.BorderNone
							end,
							hasAlpha = false,
							get = function( info )
								return helperColourGet( ArkInventory.db.option.ui.search.border.colour )
							end,
							set = function( info, r, g, b )
								helperColourSet( ArkInventory.db.option.ui.search.border.colour, r, g, b )
								ArkInventory.Frame_Search_Paint( )
							end,
						},
						size = {
							order = 300,
							name = ArkInventory.Localise["HEIGHT"],
							type = "input",
							hidden = function( )
								 return ArkInventory.db.option.ui.search.border.style == ArkInventory.Const.Texture.BorderNone
							end,
							get = function( info )
								return string.format( "%i", ArkInventory.db.option.ui.search.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size )
							end,
							set = function( info, v )
								local v = math.floor( tonumber( v ) or 0 )
								if v < 0 then v = 0 end
								if ArkInventory.db.option.ui.search.border.size ~= v then
									ArkInventory.db.option.ui.search.border.size = v
									ArkInventory.Frame_Search_Paint( )
								end
							end,
						},
						offset = {
							order = 400,
							name = ArkInventory.Localise["OFFSET"],
							type = "input",
							hidden = function( info )
								return ArkInventory.db.option.ui.search.border.style == ArkInventory.Const.Texture.BorderNone
							end,
							get = function( info )
								return string.format( "%i", ArkInventory.db.option.ui.search.border.offset or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offset  )
							end,
							set = function( info, v )
								local v = math.floor( tonumber( v ) or 0 )
								if v < 0 then v = 0 end
								if ArkInventory.db.option.ui.search.border.offset ~= v then
									ArkInventory.db.option.ui.search.border.offset = v
									ArkInventory.Frame_Search_Paint( )
								end
							end,
						},
						scale = {
							order = 500,
							name = ArkInventory.Localise["SCALE"],
							desc = ArkInventory.Localise["CONFIG_BORDER_SCALE_TEXT"],
							type = "range",
							min = 0.25,
							max = 4,
							step = 0.05,
							isPercent = true,
							hidden = function( )
								return ArkInventory.db.option.ui.search.border.style == ArkInventory.Const.Texture.BorderNone
							end,
							get = function( info )
								return ArkInventory.db.option.ui.search.border.scale or 1
							end,
							set = function( info, v )
								local v = math.floor( v / 0.05 ) * 0.05
								if v < 0.25 then v = 0.25 end
								if v > 4 then v = 4 end
								if ArkInventory.db.option.ui.search.border.scale ~= v then
									ArkInventory.db.option.ui.search.border.scale = v
									ArkInventory.Frame_Search_Paint( )
								end
							end,
						},
					},
				},
				strata = {
					order = 300,
					name = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA"],
					desc = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA_TEXT"],
					type = "select",
					values = function( )
						local t = {
							[1] = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_LOW"],
							[2] = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_MEDIUM"],
							[3] = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_HIGH"],
						}
						return t
					end,
					get = function( info )
						
						local v = ArkInventory.db.option.ui.search.strata
						if v == "LOW" then
							return 1
						elseif v == "MEDIUM" then
							return 2
						elseif v == "HIGH" then
							return 3
						end
						
					end,
					set = function( info, v )
						
						local v = v
						if v == 1 then
							v = "LOW"
						elseif v == 2 then
							v = "MEDIUM"
						elseif v == 3 then
							v = "HIGH"
						end
						
						ArkInventory.db.option.ui.search.strata = v
						ArkInventory.Frame_Search_Hide( )
						
					end,
				},
			},
		},
		ldb = {
			cmdHidden = true,
			order = 1100,
			name = ArkInventory.Localise["LDB"],
			type = "group",
			childGroups = "tab",
			args = {
				mounts = {
					order = 100,
					type = "group",
					childGroups = "tab",
					name = function( )
						return ArkInventory.Localise["WOW_ITEM_CLASS_MISC_MOUNT"]
					end,
					args = { },
				},
			},
		},
		new_rules = {
			hidden = true,
			order = 1000,
			name = ArkInventory.Localise["CONFIG_RULE_PLURAL"],
			type = "group",
			childGroups = "tab",
			args = {
				rules = {
					order = 100,
					name = ArkInventory.Localise["CONFIG_RULE_PLURAL"],
					type = "group",
					args = { },
				},
			},
		},
		rules = {
			cmdHidden = true,
			order = 1000,
			name = ArkInventory.Localise["CONFIG_RULE_PLURAL"],
			type = "group",
			args = {
				display = {
					order = 100,
					name = ArkInventory.Localise["SHOW"],
					desc = ArkInventory.Localise["CONFIG_RULE_PLURAL"],
					type = "execute",
					func = function( )
						ArkInventory.Frame_Rules_Show( )
					end,
				},
				scale = {
					order = 200,
					name = ArkInventory.Localise["SCALE"],
					desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_SCALE_TEXT"],
					type = "range",
					min = 0.4,
					max = 2,
					step = 0.05,
					isPercent = true,
					get = function( info )
						return ArkInventory.db.option.ui.rules.scale
					end,
					set = function( info, v )
						local v = math.floor( v / 0.05 ) * 0.05
						if v < 0.4 then v = 0.4 end
						if v > 2 then v = 2 end
						if ArkInventory.db.option.ui.rules.scale ~= v then
							ArkInventory.db.option.ui.rules.scale = v
							ArkInventoryRules.Frame_Rules_Paint( )
						end
					end,
				},
				strata = {
					order = 300,
					name = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA"],
					desc = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA_TEXT"],
					type = "select",
					values = function( )
						local t = {
							[1] = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_LOW"],
							[2] = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_MEDIUM"],
							[3] = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_HIGH"],
						}
						return t
					end,
					get = function( info )
						
						local v = ArkInventory.db.option.ui.rules.strata
						if v == "LOW" then
							return 1
						elseif v == "MEDIUM" then
							return 2
						elseif v == "HIGH" then
							return 3
						end
						
					end,
					set = function( info, v )
						
						local v = v
						if v == 1 then
							v = "LOW"
						elseif v == 2 then
							v = "MEDIUM"
						elseif v == 3 then
							v = "HIGH"
						end
						
						ArkInventory.db.option.ui.rules.strata = v
						ArkInventory.Frame_Rules_Hide( )
						
					end,
				},
				background = {
					order = 1200,
					name = ArkInventory.Localise["BACKGROUND"],
					type = "group",
					inline = true,
					args = {
						style = {
							order = 100,
							name = ArkInventory.Localise["BACKGROUND"],
							desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_TEXT"],
							type = "select",
							dialogControl = "LSM30_Background",
							values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND ),
							get = function( info )
								return ArkInventory.db.option.ui.rules.background.style or ArkInventory.Const.Texture.BackgroundDefault
							end,
							set = function( info, v )
								if ArkInventory.db.option.ui.rules.background.style ~= v then
									ArkInventory.db.option.ui.rules.background.style = v
									ArkInventoryRules.Frame_Rules_Paint( )
								end
							end,
						},
						colour = {
							order = 200,
							name = ArkInventory.Localise["COLOUR"],
							desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BACKGROUND_COLOUR_TEXT"],
							type = "color",
							hasAlpha = true,
							hidden = function( info )
								return ArkInventory.db.option.ui.rules.background.style ~= ArkInventory.Const.Texture.BackgroundDefault
							end,
							get = function( info )
								return helperColourGet( ArkInventory.db.option.ui.rules.background.colour )
							end,
							set = function( info, r, g, b, a )
								helperColourSet( ArkInventory.db.option.ui.rules.background.colour, r, g, b, a )
								ArkInventoryRules.Frame_Rules_Paint( )
							end,
						},
					},
				},
				border = {
					order = 1300,
					name = ArkInventory.Localise["BORDER"],
					type = "group",
					inline = true,
					args = {
						style = {
							order = 100,
							name = ArkInventory.Localise["STYLE"],
							desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_TEXT"],
							type = "select",
							dialogControl = "LSM30_Border",
							values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BORDER ),
							get = function( info )
								return ArkInventory.db.option.ui.rules.border.style or ArkInventory.Const.Texture.BorderDefault
							end,
							set = function( info, v )
								if v ~= ArkInventory.db.option.ui.rules.border.style then
									
									ArkInventory.db.option.ui.rules.border.style = v
									
									local sd = ArkInventory.Const.Texture.Border[v] or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault]
									ArkInventory.db.option.ui.rules.border.size = sd.size
									ArkInventory.db.option.ui.rules.border.offset = sd.offset
									ArkInventory.db.option.ui.rules.border.scale = sd.scale

									ArkInventoryRules.Frame_Rules_Paint( )
									
								end
							end,
						},
						colour = {
							order = 200,
							name = ArkInventory.Localise["COLOUR"],
							desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_COLOUR_TEXT"],
							type = "color",
							hidden = function( )
								return ArkInventory.db.option.ui.rules.border.style == ArkInventory.Const.Texture.BorderNone
							end,
							hasAlpha = false,
							get = function( info )
								return helperColourGet( ArkInventory.db.option.ui.rules.border.colour )
							end,
							set = function( info, r, g, b )
								helperColourSet( ArkInventory.db.option.ui.rules.border.colour, r, g, b )
								ArkInventoryRules.Frame_Rules_Paint( )
							end,
						},
						size = {
							order = 300,
							name = ArkInventory.Localise["HEIGHT"],
							type = "input",
							hidden = function( )
								return ArkInventory.db.option.ui.rules.border.style == ArkInventory.Const.Texture.BorderNone
							end,
							get = function( info )
								return string.format( "%i", ArkInventory.db.option.ui.rules.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size )
							end,
							set = function( info, v )
								local v = math.floor( tonumber( v ) or 0 )
								if v < 0 then v = 0 end
								if ArkInventory.db.option.ui.rules.border.size ~= v then
									ArkInventory.db.option.ui.rules.border.size = v
									ArkInventoryRules.Frame_Rules_Paint( )
								end
							end,
						},
						offset = {
							order = 400,
							name = ArkInventory.Localise["OFFSET"],
							type = "input",
							hidden = function( info )
								return ArkInventory.db.option.ui.rules.border.style == ArkInventory.Const.Texture.BorderNone
							end,
							get = function( info )
								return string.format( "%i", ArkInventory.db.option.ui.rules.border.offset or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offset  )
							end,
							set = function( info, v )
								local v = math.floor( tonumber( v ) or 0 )
								if v < 0 then v = 0 end
								if ArkInventory.db.option.ui.rules.border.offset ~= v then
									ArkInventory.db.option.ui.rules.border.offset = v
									ArkInventoryRules.Frame_Rules_Paint( )
								end
							end,
						},
						scale = {
							order = 500,
							name = ArkInventory.Localise["SCALE"],
							desc = ArkInventory.Localise["CONFIG_BORDER_SCALE_TEXT"],
							type = "range",
							min = 0.25,
							max = 4,
							step = 0.05,
							isPercent = true,
							hidden = function( )
								return ArkInventory.db.option.ui.rules.border.style == ArkInventory.Const.Texture.BorderNone
							end,
							get = function( info )
								return ArkInventory.db.option.ui.rules.border.scale or 1
							end,
							set = function( info, v )
								local v = math.floor( v / 0.05 ) * 0.05
								if v < 0.25 then v = 0.25 end
								if v > 4 then v = 4 end
								if ArkInventory.db.option.ui.rules.border.scale ~= v then
									ArkInventory.db.option.ui.rules.border.scale = v
									ArkInventoryRules.Frame_Rules_Paint( )
								end
							end,
						},
					},
				},
			},
		},
		enabled = {
			cmdHidden = true,
			order = 1200,
			name = ArkInventory.Localise["ENABLED"],
			type = "toggle",
			get = function( info )
				return ArkInventory:IsEnabled( )
			end,
			set = function( info, v )
				if v then
					ArkInventory:Enable( )
				else
					ArkInventory:Disable( )
				end
			end,
		},
		debug = {
			cmdHidden = true,
			order = 1300,
			name = ArkInventory.Localise["CONFIG_DEBUG"],
			type = "toggle",
			get = function( info )
				return ArkInventory.Const.Debug
			end,
			set = function( info, v )
				ArkInventory.OutputDebugModeSet( not ArkInventory.Const.Debug )
			end,
		},
		settings = {
			cmdHidden = true,
			order = 600,
			name = ArkInventory.Localise["SETTINGS"],
			type = "group",
			childGroups = "tab",
			args = {
				sortmethod = {
					cmdHidden = true,
					order = 100,
					name = ArkInventory.Localise["CONFIG_SORTING_METHOD_PLURAL"],
					type = "group",
					args = { },
				},
				design = {
					cmdHidden = true,
					order = 300,
					name = string.format( "%s / %s", ArkInventory.Localise["CONFIG_STYLE_PLURAL"], ArkInventory.Localise["CONFIG_LAYOUT_PLURAL"] ),
					type = "group",
					args = { },
				},
				category = {
					cmdHidden = true,
					order = 200,
					name = ArkInventory.Localise["CONFIG_CATEGORY_PLURAL"],
					type = "group",
					childGroups = "tab",
					args = {
						system = {
							order = 100,
							name = ArkInventory.Localise["CATEGORY_SYSTEM"],
							type = "group",
							--hidden = true,
							args = {
								tbd = {
									order = 100,
									name = "to be implemented",
									type = "description",
								},
							},
						},
						custom = {
							order = 200,
							name = ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM_PLURAL"],
							type = "group",
							args = { },
						},
						rule = {
							--hidden = true,
							order = 300,
							name = ArkInventory.Localise["CONFIG_RULE_PLURAL"],
							type = "group",
							args = {
								tbd = {
									order = 100,
									name = "to be implemented",
									type = "description",
								},
							},
						},
						catset = {
							order = 900,
							name = ArkInventory.Localise["CONFIG_CATEGORY_SET_PLURAL"],
							type = "group",
							args = { },
						},
					},
				},
			},
		},
		myprofiles = {
			cmdHidden = true,
			order = 9000,
			name = ArkInventory.Localise["CONFIG_PROFILE_PLURAL"],
			type = "group",
			childGroups = "tab",
			args = {
				bundle = {
					order = 100,
					name = ArkInventory.Localise["CONFIG_PROFILE_PLURAL"],
					type = "group",
					args = { },
				},
			}, 
		},
		
	}
	
	ArkInventory.ConfigInternalControl( )
	
	ArkInventory.ConfigInternalSortMethod( )
	
	ArkInventory.ConfigInternalCategoryCustom( )
	
	ArkInventory.ConfigInternalCategoryRule( )
	
	ArkInventory.ConfigInternalCategoryset( )
	
	ArkInventory.ConfigInternalDesign( )
	
	ArkInventory.ConfigInternalProfile( )
	
	ArkInventory.ConfigInternalLDBMounts( path.args.ldb.args.mounts.args )
	
end

function ArkInventory.ConfigInternalControl( )
	
	local path = ArkInventory.Config.Internal.args.control.args
	
	local me = ArkInventory.GetPlayerCodex( ) -- **** move it into each function?
	
	local args1 = {
		
		monitor = {
			order = 100,
			type = "toggle",
			name = ArkInventory.Localise["CONFIG_CONTROL_MONITOR"],
			desc = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["CONFIG_CONTROL_MONITOR_TEXT"], ArkInventory.Global.Location[loc_id].Name, me.player.data.info.name )
			end,
			disabled = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return not ArkInventory.Global.Location[loc_id].canPurge
			end,
			get = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return me.profile.location[loc_id].monitor
			end,
			set = function( info, v )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				me.profile.location[loc_id].monitor = v
			end,
		},
		save = {
			order = 200,
			type = "toggle",
			name = ArkInventory.Localise["SAVE"],
			desc = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["CONFIG_CONTROL_SAVE_TEXT"], ArkInventory.Global.Location[loc_id].Name, me.player.data.info.name )
			end,
			get = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return me.profile.location[loc_id].save
			end,
			set = function( info, v )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				me.profile.location[loc_id].save = v
			end,
		},
		notify = {
			order = 300,
			type = "toggle",
			name = ArkInventory.Localise["NOTIFY"],
			desc = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["CONFIG_CONTROL_NOTIFY_ERASE_TEXT"], ArkInventory.Global.Location[loc_id].Name )
			end,
			disabled = function( info )
--				local loc_id = ConfigGetNodeArg( info, #info - 1 )
--				return me.profile.location[loc_id].save
			end,
			get = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return me.profile.location[loc_id].notify
			end,
			set = function( info, v )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				me.profile.location[loc_id].notify = v
			end,
		},
		override = {
			order = 400,
			type = "toggle",
			name = ArkInventory.Localise["CONFIG_CONTROL_OVERRIDE"],
			desc = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["CONFIG_CONTROL_OVERRIDE_TEXT"], ArkInventory.Const.Program.Name, ArkInventory.Global.Location[loc_id].Name )
			end,
			disabled = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return not ArkInventory.Global.Location[loc_id].canOverride
			end,
			get = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return me.profile.location[loc_id].override
			end,
			set = function( info, v )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				me.profile.location[loc_id].override = v
				
				if v then
					
					-- enabling ai for location - hide open blizzard frames
					
					if loc_id == ArkInventory.Const.Location.Bag then
						CloseAllBags( )
					elseif loc_id == ArkInventory.Const.Location.Bank and ArkInventory.Global.Mode.Bank then
						CloseBankFrame( )
					elseif loc_id == ArkInventory.Const.Location.Vault and ArkInventory.Global.Mode.Vault then
						CloseGuildBankFrame( )
					end
					
				else
					
					-- disabling ai for location - hide ai frame
					
					ArkInventory.Frame_Main_Hide( loc_id )
					
				end
				
				ArkInventory.BlizzardAPIHook( false, true )
				
			end,
		},
		special = {
			order = 450,
			type = "toggle",
			name = ArkInventory.Localise["SPECIAL"],
			desc = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["CONFIG_CONTROL_SPECIAL_TEXT"], ArkInventory.Const.Program.Name, ArkInventory.Global.Location[loc_id].Name )
			end,
			get = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return me.profile.location[loc_id].special
			end,
			set = function( info, v )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				me.profile.location[loc_id].special = v
			end,
		},
		anchor = {
			order = 500,
			name = ArkInventory.Localise["ANCHOR"],
			desc = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["ANCHOR_TEXT1"], ArkInventory.Global.Location[loc_id].Name )
			end,
			type = "select",
			values = function( )
				return anchorpoints
			end,
			get = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return me.profile.location[loc_id].anchor.point
			end,
			set = function( info, v )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				if me.profile.location[loc_id].anchor.point ~= v then
					me.profile.location[loc_id].anchor.point = v
					ArkInventory.Frame_Main_Anchor_Set( loc_id )
				end
			end,
		},
		locked = {
			order = 600,
			type = "toggle",
			name = ArkInventory.Localise["LOCK"],
			desc = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["CONFIG_CONTROL_ANCHOR_LOCK_TEXT"], ArkInventory.Global.Location[loc_id].Name )
			end,
			get = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return me.profile.location[loc_id].anchor.locked
			end,
			set = function( info, v )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				me.profile.location[loc_id].anchor.locked = v
				ArkInventory.Frame_Main_Anchor_Set( loc_id )
			end,
		},
		blueprint = {
			order = 900,
			name = "",
			type = "group",
			inline = true,
			width = "full",
			args = {
				style = {
					order = 100,
					type = "select",
					name = ArkInventory.Localise["CONFIG_STYLE"],
					desc = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return string.format( ArkInventory.Localise["CONFIG_CONTROL_BLUEPRINT_TEXT"], ArkInventory.Global.Location[loc_id].Name, ArkInventory.Localise["CONFIG_STYLE"] )
					end,
					width = "double",
					values = function( )
						local t = { }
						for id, data in pairs( ArkInventory.db.option.design.data ) do
							if data.used == "Y" then
								local n = data.name
								if data.system then
									n = string.format( "* %s", n )
								end
								t[id] = string.format( "[%04i] %s", id, n )
							end
						end
						return t
					end,
					get = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return me.profile.location[loc_id].style
					end,
					set = function( info, v )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						me.profile.location[loc_id].style = v
						ArkInventory.CodexReset( loc_id )
						ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Init )
					end,
				},
				layout = {
					order = 200,
					type = "select",
					name = ArkInventory.Localise["CONFIG_LAYOUT"],
					desc = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return string.format( ArkInventory.Localise["CONFIG_CONTROL_BLUEPRINT_TEXT"], ArkInventory.Global.Location[loc_id].Name, ArkInventory.Localise["CONFIG_LAYOUT"] )
					end,
					width = "double",
					values = function( )
						local t = { }
						for id, data in pairs( ArkInventory.db.option.design.data ) do
							if data.used == "Y" then
								local n = data.name
								if data.system then
									n = string.format( "* %s", n )
								end
								t[id] = string.format( "[%04i] %s", id, n )
							end
						end
						return t
					end,
					get = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return me.profile.location[loc_id].layout
					end,
					set = function( info, v )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						me.profile.location[loc_id].layout = v
						ArkInventory.CodexReset( loc_id )
						ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Init )
					end,
				},
				categoryset = {
					order = 300,
					type = "select",
					name = ArkInventory.Localise["CONFIG_CATEGORY_SET"],
					desc = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return string.format( ArkInventory.Localise["CONFIG_CONTROL_BLUEPRINT_TEXT"], ArkInventory.Global.Location[loc_id].Name, ArkInventory.Localise["CONFIG_CATEGORY_SET"] )
					end,
					width = "double",
					values = function( )
						local t = { }
						for id, data in pairs( ArkInventory.db.option.catset.data ) do
							if data.used == "Y" then
								local n = data.name
								if data.system then
									n = string.format( "* %s", n )
								end
								t[id] = string.format( "[%04i] %s", id, n )
							end
						end
						return t
					end,
					get = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return me.profile.location[loc_id].catset
					end,
					set = function( info, v )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						me.profile.location[loc_id].catset = v
						ArkInventory.CodexReset( loc_id )
						ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Init )
					end,
				},
			},
		},
		
	}
	
	
	for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
		if loc_data.canView then
			path[string.format( "%i", loc_id )] = {
				order = loc_id,
				arg = loc_id,
				name = loc_data.Name,
				type = "group",
				args = args1,
			}
		end
	end
	
 end

function ArkInventory.ConfigInternalSortMethod( )

	local path = ArkInventory.Config.Internal.args.settings.args.sortmethod
	
	path.args = {
		list_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_ADD_TEXT"], ArkInventory.Localise["CONFIG_SORTING_METHOD"] ),
			type = "input",
			disabled = ArkInventory.Global.Options.ConfigSortMethodListShow ~= 1,
			get = function( )
				return ""
			end,
			set = function( info, v )
				ArkInventory.ConfigInternalSortMethodAdd( v )
			end,
		},
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [1] = ArkInventory.Localise["SORT_BY_NAME"], [2] = ArkInventory.Localise["SORT_BY_NUMBER"] }
				return t
			end,
			get = function( info )
				return ArkInventory.Global.Options.ConfigSortMethodListSort
			end,
			set = function( info, v )
				ArkInventory.Global.Options.ConfigSortMethodListSort = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_show = {
			order = 300,
			name = ArkInventory.Localise["SHOW"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [1] = ArkInventory.Localise["ACTIVE"], [2] = ArkInventory.Localise["DELETED"] }
				return t
			end,
			get = function( info )
				return ArkInventory.Global.Options.ConfigSortMethodListShow
			end,
			set = function( info, v )
				ArkInventory.Global.Options.ConfigSortMethodListShow = v
				ArkInventory.ConfigInternalSortMethod( )
			end,
		},
		list_reload = {
			order = 400,
			name = ArkInventory.Localise["RELOAD"],
			type = "execute",
			width = "half",
			hidden = true,
			func = function( )
				ArkInventory.ConfigRefresh( )
			end,
		},
	}
	
	ArkInventory.ConfigInternalSortMethodData( path.args )
	
end

function ArkInventory.ConfigInternalSortMethodData( path )
	
	local args3 = {
		enabled = {
			order = 100,
			name = function( info )
				local id = ConfigGetNodeArg( info, #info - 4 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				
				local checked = v.active[key]
				local n = ArkInventory.Localise[string.upper( string.format( "CONFIG_SORTING_INCLUDE_%s", key ) )]
				if checked then
					n = string.format( "%s%s%s", GREEN_FONT_COLOR_CODE, n, FONT_COLOR_CODE_CLOSE )
				else
					n = string.format( "%s%s%s", RED_FONT_COLOR_CODE, n, FONT_COLOR_CODE_CLOSE )
				end
				return n
			end,
			desc = function( info )
				local id = ConfigGetNodeArg( info, #info - 4 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				local checked = v.active[key]
				local n = ArkInventory.Localise[string.upper( string.format( "CONFIG_SORTING_INCLUDE_%s_TEXT", key ) )]
				if not checked then
					n = string.format( "%s%s%s%s%s", n, "\n\n", RED_FONT_COLOR_CODE, ArkInventory.Localise["CONFIG_SORTING_NOT_INCLUDED"], FONT_COLOR_CODE_CLOSE )
				end
				return n
			end,
			type = "toggle",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 4 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				return v.system
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 4 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				return v.active[key]
			end,
			set = function( info, r )
				local id = ConfigGetNodeArg( info, #info - 4 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				v.active[key] = r
				ArkInventory.LocationSetValue( nil, "resort", true )
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
			end,
		},
		up = {
			order = 20,
			name = ArkInventory.Localise["MOVE_UP"],
			desc = function( info )
				local key = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["CONFIG_SORTING_MOVE_UP_TEXT"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.Localise[string.upper( string.format( "CONFIG_SORTING_INCLUDE_%s", key ) )], FONT_COLOR_CODE_CLOSE ) )
			end,
			type = "execute",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 4 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				local checked = v.active[key]
				return v.system or not checked or p == 1
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 4 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalSortMethodMoveUp( id, key )
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
			end,
		},
		down = {
			order = 30,
			name = ArkInventory.Localise["MOVE_DOWN"],
			desc = function( info )
				local key = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["CONFIG_SORTING_MOVE_DOWN_TEXT"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.Localise[string.upper( string.format( "CONFIG_SORTING_INCLUDE_%s", key ) )], FONT_COLOR_CODE_CLOSE ) )
			end,
			type = "execute",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 4 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				local checked = v.active[key]
				return ArkInventory.db.option.sort.method.data[id].system or not checked or p == m
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 4 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalSortMethodMoveDown( id, key )
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
			end,
		},
		revtext = {
			order = 400,
			name = ArkInventory.Localise["CONFIG_SORTING_INCLUDE_NAME_REVERSE"],
			desc = ArkInventory.Localise["CONFIG_SORTING_INCLUDE_NAME_REVERSE_TEXT"],
			type = "toggle",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 4 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				return v.system or not v.active.name
			end,
			hidden = function( info )
				local key = ConfigGetNodeArg( info, #info - 1 )
				return key ~= "name"
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 4 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				return v.reversed
			end,
			set = function( info, r )
				local id = ConfigGetNodeArg( info, #info - 4 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				v.reversed = r
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
			end,
		},
	}
	
	
	local args2 = { }
	for sortkey, active in pairs( ArkInventory.Const.SortKeys ) do
		
		if active then
			args2[sortkey] = {
				order = function( info )
					local id = ConfigGetNodeArg( info, #info - 3 )
					return ArkInventory.ConfigInternalSortMethodGetPosition( id, sortkey )
				end,
				name = "",
				type = "group",
				inline = true,
				hidden = false,
				arg = sortkey,
				args = args3,
			}
		end
	end
	
	
	local args1 = {
		action_rename = {
			order = 100,
			name = ArkInventory.Localise["RENAME"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_RENAME_TEXT"], ArkInventory.Localise["CONFIG_SORTING_METHOD"] ),
			type = "input",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				return v.system or ArkInventory.Global.Options.ConfigSortMethodListShow ~= 1
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				return v.name
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalSortMethodRename( id, v )
				ArkInventory.ConfigInternalSortMethod( )
			end,
		},
		action_delete = {
			order = 200,
			name = ArkInventory.Localise["DELETE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_DELETE_TEXT"], ArkInventory.Localise["CONFIG_SORTING_METHOD"] )
			end,
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigSortMethodListShow ~= 1,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				return v.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalSortMethodDelete( id )
			end,
		},
		action_restore = {
			order = 200,
			name = ArkInventory.Localise["RESTORE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_RESTORE_TEXT"], ArkInventory.Localise["CONFIG_SORTING_METHOD"] )
			end,
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigSortMethodListShow ~= 2,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				return v.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalSortMethodRestore( id )
			end,
		},
		action_copy = {
			order = 300,
			name = ArkInventory.Localise["COPY_FROM"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_COPY_TEXT"], ArkInventory.Localise["CONFIG_SORTING_METHOD"] ),
			type = "select",
			width = "double",
			hidden = ArkInventory.Global.Options.ConfigSortMethodListShow ~= 1,
			values = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local t = { }
				for k, v in pairs( ArkInventory.db.option.sort.method.data ) do
					if v.used == "Y" and k ~= id then
						local n = v.name
						if v.system then
							n = string.format( "* %s", n )
						end
						n = string.format( "[%04i] %s", k, n )
						t[k] = n
					end
				end
				return t
			end,
			get = function( )
				return ""
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalSortMethodCopy( v, id )
				ArkInventory.ConfigRefresh( )
			end,
		},
		action_purge = {
			order = 400,
			name = ArkInventory.Localise["PURGE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_PURGE_TEXT"], ArkInventory.Localise["CONFIG_SORTING_METHOD"] ),
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigSortMethodListShow ~= 2,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalSortMethodPurge( id )
			end,
		},
		bundle = {
			order = 5000,
			name = "",
			type = "group",
			inline = true,
			disabled = ArkInventory.Global.Options.ConfigSortMethodListShow ~= 1,
			args = {
				style = {
					order = 100,
					name = ArkInventory.Localise["STYLE"],
					desc = ArkInventory.Localise["CONFIG_SORTING_METHOD_TEXT"],
					type = "select",
					disabled = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local v = ArkInventory.ConfigInternalSortMethodGet( id )
						return v.system or ArkInventory.Global.Options.ConfigSortMethodListShow ~= 1
					end,
					values = function( )
						local t = { [1] = ArkInventory.Localise["CONFIG_SORTING_METHOD_BAGSLOT"], [2] = ArkInventory.Localise["CONFIG_SORTING_METHOD_USER"] }
						return t
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local v = ArkInventory.ConfigInternalSortMethodGet( id )
						if v.bagslot then
							v = 1
						else
							v = 2
						end
						return v
					end,
					set = function( info, r )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local v = ArkInventory.ConfigInternalSortMethodGet( id )
						if r == 1 then
							v.bagslot = true
						else
							v.bagslot = false
						end
						ArkInventory.LocationSetValue( nil, "resort", true )
						ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
					end,
				},
				direction = {
					order = 200,
					name = ArkInventory.Localise["DIRECTION"],
					desc = ArkInventory.Localise["CONFIG_SORTING_DIRECTION_TEXT"],
					type = "select",
					disabled = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local v = ArkInventory.ConfigInternalSortMethodGet( id )
						return v.system or ArkInventory.Global.Options.ConfigSortMethodListShow ~= 1
					end,
					values = function( )
						local t = { [1] = ArkInventory.Localise["ASCENDING"], [2] = ArkInventory.Localise["DECENDING"] }
						return t
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local v = ArkInventory.ConfigInternalSortMethodGet( id )
						if v.ascending then
							v = 1
						else
							v = 2
						end
						return v
					end,
					set = function( info, r )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local v = ArkInventory.ConfigInternalSortMethodGet( id )
						if r == 1 then
							v.ascending = true
						else
							v.ascending = false
						end
						ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
					end,
				},
				order = {
					order = 300,
					name = ArkInventory.Localise["CONFIG_SORTING_ORDER"],
					type = "group",
					inline = true,
					disabled = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local v = ArkInventory.ConfigInternalSortMethodGet( id )
						return v.system or ArkInventory.Global.Options.ConfigSortMethodListShow ~= 1
					end,
					hidden = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local v = ArkInventory.ConfigInternalSortMethodGet( id )
						return v.bagslot or ArkInventory.Global.Options.ConfigSortMethodListShow ~= 1
					end,
					args = args2,
				},
			},
		},
	}
	
	for id, data in pairs( ArkInventory.db.option.sort.method.data ) do
		
		if ( data.used == "Y" and ArkInventory.Global.Options.ConfigSortMethodListShow == 1 ) or ( data.used == "D" and ArkInventory.Global.Options.ConfigSortMethodListShow == 2 ) then
			
			if not data.system then
				
				local n = data.name
				
				if ArkInventory.Global.Options.ConfigSortMethodListSort == 1 then
					n = string.format( "%s [%04i]", n, id )
				else
					n = string.format( "[%04i] %s", id, n )
				end
				
				path[string.format( "%i", id )] = {
					order = 500,
					type = "group",
					name = n,
					arg = id,
					childGroups = "tab",
					args = args1,
				}
				
			end
			
		end
		
	end
	
end

function ArkInventory.ConfigInternalCategoryCustom( )
	
	local path = ArkInventory.Config.Internal.args.settings.args.category.args.custom
	
	path.args = {
		list_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_ADD_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM"] ),
			type = "input",
			disabled = ArkInventory.Global.Options.ConfigCategoryCustomListShow ~= 1,
			get = function( )
				return ""
			end,
			set = function( info, v )
				ArkInventory.Lib.Dewdrop:Close( )
				ArkInventory.ConfigInternalCategoryCustomAdd( v )
			end,
		},
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [1] = ArkInventory.Localise["SORT_BY_NAME"], [2] = ArkInventory.Localise["SORT_BY_NUMBER"] }
				return t
			end,
			get = function( info )
				return ArkInventory.Global.Options.ConfigCategoryCustomListSort
			end,
			set = function( info, v )
				ArkInventory.Global.Options.ConfigCategoryCustomListSort = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_show = {
			order = 300,
			name = ArkInventory.Localise["SHOW"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [1] = ArkInventory.Localise["ACTIVE"], [2] = ArkInventory.Localise["DELETED"] }
				return t
			end,
			get = function( info )
				return ArkInventory.Global.Options.ConfigCategoryCustomListShow
			end,
			set = function( info, v )
				ArkInventory.Global.Options.ConfigCategoryCustomListShow = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_reload = {
			order = 400,
			name = ArkInventory.Localise["RELOAD"],
			type = "execute",
			width = "half",
			hidden = true,
			func = function( )
				ArkInventory.ConfigInternalCategoryCustom( )
			end,
		},
		categoryset = {
			order = 500,
			type = "select",
			name = ArkInventory.Localise["CONFIG_CATEGORY_SET"],
			width = "double",
			disabled = ArkInventory.Global.Options.ConfigCategoryCustomListShow ~= 1,
			values = function( )
				local t = { }
				for id, data in pairs( ArkInventory.db.option.catset.data ) do
					if data.used == "Y" then
						local n = data.name
						if data.system then
							n = string.format( "* %s", n )
						end
						t[id] = string.format( "[%04i] %s", id, n )
					end
				end
				return t
			end,
			get = function( info )
				return ArkInventory.Global.Options.ConfigCategoryRuleListSet
			end,
			set = function( info, v )
				ArkInventory.Global.Options.ConfigCategoryRuleListSet = v
				ArkInventory.ConfigRefresh( )
			end,
		},
	}
	
	ArkInventory.ConfigInternalCategoryCustomData( path.args )
	
end

function ArkInventory.ConfigInternalCategoryCustomData( path )
	
	local args1 = {
		action_rename = { 
			order = 100,
			name = ArkInventory.Localise["RENAME"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_RENAME_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM"] ),
			type = "input",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryCustomGet( id )
				return cat.system or ArkInventory.Global.Options.ConfigCategoryCustomListShow ~= 1
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryCustomGet( id )
				return cat.name
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryCustomRename( id, v )
				ArkInventory.ConfigInternalCategoryCustom( )
			end,
		},
		action_delete = { 
			order = 200,
			name = ArkInventory.Localise["DELETE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_DELETE_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM"] )
			end,
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigCategoryCustomListShow ~= 1,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryCustomGet( id )
				return cat.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryCustomDelete( id )
			end,
		},
		action_restore = { 
			order = 200,
			name = ArkInventory.Localise["RESTORE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_RESTORE_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM"] )
			end,
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigCategoryCustomListShow ~= 2,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryCustomGet( id )
				return cat.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryCustomRestore( id )
			end,
		},
		action_purge = {
			order = 400,
			name = ArkInventory.Localise["PURGE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_PURGE_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM"] ),
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigCategoryCustomListShow ~= 2,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryCustomPurge( id )
			end,
		},
		enabled = {
			order = 150,
			name = ArkInventory.Localise["ENABLED"],
			type = "toggle",
			disabled = function( info )
				return ( ArkInventory.Global.Options.ConfigCategoryRuleListSet == 9999 ) or ( ArkInventory.Global.Options.ConfigCategoryCustomListShow ~= 1 )
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local catset = ArkInventory.ConfigInternalCategorysetGet( ArkInventory.Global.Options.ConfigCategoryRuleListSet )
				return catset.category.active[ArkInventory.Const.Category.Type.Custom][id]
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local catset = ArkInventory.ConfigInternalCategorysetGet( ArkInventory.Global.Options.ConfigCategoryRuleListSet )
				catset.category.active[ArkInventory.Const.Category.Type.Custom][id] = v
				ArkInventory.ItemCacheClear( )
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
			end,
		},
	}
	
	local catset = ArkInventory.ConfigInternalCategorysetGet( ArkInventory.Global.Options.ConfigCategoryRuleListSet )
	
	for id, data in pairs( ArkInventory.db.option.category[ArkInventory.Const.Category.Type.Custom].data ) do
		
		if ( data.used == "Y" and ArkInventory.Global.Options.ConfigCategoryCustomListShow == 1 ) or ( data.used == "D" and ArkInventory.Global.Options.ConfigCategoryCustomListShow == 2 ) then
			
			if not data.system then
				
				local n = data.name
			
				if ArkInventory.Global.Options.ConfigCategoryCustomListSort == 1 then
					n = string.format( "%s [%04i]", n, id )
				else
					n = string.format( "[%04i] %s", id, n )
				end
				
				path[string.format( "%i", id )] = {
					order = 500,
					name = n,
					arg = id,
					icon = function( )
						if catset.category.active[ArkInventory.Const.Category.Type.Custom][id] then
							return ArkInventory.Const.Texture.CategoryEnabled
						else
							return ArkInventory.Const.Texture.CategoryDisabled
						end
					end,
					type = "group",
					args = args1,
				}
				
			end
			
		end
		
	end
	
end

function ArkInventory.ConfigInternalCategoryRule( )
	
	local path = ArkInventory.Config.Internal.args.settings.args.category.args.rule
	
	path.args = {
		list_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_ADD_TEXT"], ArkInventory.Localise["CATEGORY_RULE"] ),
			type = "input",
			disabled = ArkInventory.Global.Options.ConfigCategoryRuleListShow ~= 1,
			get = function( )
				return ""
			end,
			set = function( info, v )
				ArkInventory.Lib.Dewdrop:Close( )
				ArkInventory.ConfigInternalCategoryRuleAdd( v )
			end,
		},
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [1] = ArkInventory.Localise["SORT_BY_NAME"], [2] = ArkInventory.Localise["SORT_BY_NUMBER"], [3] = ArkInventory.Localise["ORDER"] }
				return t
			end,
			get = function( info )
				return ArkInventory.Global.Options.ConfigCategoryRuleListSort
			end,
			set = function( info, v )
				ArkInventory.Global.Options.ConfigCategoryRuleListSort = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_show = {
			order = 300,
			name = ArkInventory.Localise["SHOW"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [1] = ArkInventory.Localise["ACTIVE"], [2] = ArkInventory.Localise["DELETED"] }
				return t
			end,
			get = function( info )
				return ArkInventory.Global.Options.ConfigCategoryRuleListShow
			end,
			set = function( info, v )
				ArkInventory.Global.Options.ConfigCategoryRuleListShow = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_reload = {
			order = 400,
			name = ArkInventory.Localise["RELOAD"],
			type = "execute",
			width = "half",
			hidden = true,
			func = function( )
				ArkInventory.ConfigInternalCategoryRule( )
			end,
		},
		categoryset = {
			order = 500,
			type = "select",
			name = ArkInventory.Localise["CONFIG_CATEGORY_SET"],
			width = "double",
			disabled = ArkInventory.Global.Options.ConfigCategoryRuleListShow ~= 1,
			values = function( )
				local t = { }
				for id, data in pairs( ArkInventory.db.option.catset.data ) do
					if data.used == "Y" then
						local n = data.name
						if data.system then
							n = string.format( "* %s", n )
						end
						t[id] = string.format( "[%04i] %s", id, n )
					end
				end
				return t
			end,
			get = function( info )
				return ArkInventory.Global.Options.ConfigCategoryRuleListSet
			end,
			set = function( info, v )
				ArkInventory.Global.Options.ConfigCategoryRuleListSet = v
				ArkInventory.ConfigRefresh( )
			end,
		},
	}
	
	ArkInventory.ConfigInternalCategoryRuleData( path.args )
	
end

function ArkInventory.ConfigInternalCategoryRuleData( path )
	
	local args1 = {
		action_rename = { 
			order = 100,
			name = ArkInventory.Localise["RENAME"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_RENAME_TEXT"], ArkInventory.Localise["CATEGORY_RULE"] ),
			type = "input",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
				return cat.system or ArkInventory.Global.Options.ConfigCategoryRuleListShow ~= 1
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
				return cat.name
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryRuleRename( id, v )
				ArkInventory.ConfigInternalCategoryRule( )
			end,
		},
		action_delete = { 
			order = 200,
			name = ArkInventory.Localise["DELETE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_DELETE_TEXT"], ArkInventory.Localise["CATEGORY_RULE"] )
			end,
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigCategoryRuleListShow ~= 1,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
				return cat.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryRuleDelete( id )
			end,
		},
		action_restore = { 
			order = 200,
			name = ArkInventory.Localise["RESTORE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_RESTORE_TEXT"], ArkInventory.Localise["CATEGORY_RULE"] )
			end,
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigCategoryRuleListShow ~= 2,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
				return cat.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryRuleRestore( id )
			end,
		},
		action_purge = {
			order = 400,
			name = ArkInventory.Localise["PURGE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_PURGE_TEXT"], ArkInventory.Localise["CATEGORY_RULE"] ),
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigCategoryRuleListShow ~= 2,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryRulePurge( id )
			end,
		},
		enabled = {
			order = 150,
			name = ArkInventory.Localise["ENABLED"],
			type = "toggle",
			disabled = function( info )
				return ( ArkInventory.Global.Options.ConfigCategoryRuleListSet == 9999 ) or ( ArkInventory.Global.Options.ConfigCategoryRuleListShow ~= 1 )
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local catset = ArkInventory.ConfigInternalCategorysetGet( ArkInventory.Global.Options.ConfigCategoryRuleListSet )
				return catset.category.active[ArkInventory.Const.Category.Type.Rule][id]
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local catset = ArkInventory.ConfigInternalCategorysetGet( ArkInventory.Global.Options.ConfigCategoryRuleListSet )
				catset.category.active[ArkInventory.Const.Category.Type.Rule][id] = v
				ArkInventory.ItemCacheClear( )
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
			end,
		},
	
		rule = { 
			order = 1000,
			name = ArkInventory.Localise["CATEGORY_RULE"],
			type = "group",
			inline = true,
			args = {
				order = {
					order = 100,
					name = ArkInventory.Localise["ORDER"],
					type = "range",
					min = 0,
					max = 9999,
					step = 1,
					disabled = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
						return cat.system or ArkInventory.Global.Options.ConfigCategoryRuleListShow ~= 1
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
						return cat.order
					end,
					set = function( info, v )
						local v = math.floor( v )
						if v < 0 then v = 0 end
						if v > 9999 then v = 9999 end
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
						if cat.order ~= v then
							cat.order = v
							ArkInventory.ItemCacheClear( )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
						end
					end,
				},
				damaged = {
					order = 50,
					name = string.format( "%s%s%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["RULE_DAMAGED_TEXT"], FONT_COLOR_CODE_CLOSE ),
					type = "description",
					fontSize = "medium",
					hidden = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
						return not cat.damaged
					end,
				},
				formula = {
					order = 200,
					name = ArkInventory.Localise["RULE_FORMULA"],
					type = "input",
					width = "full",
					multiline = 10,
					disabled = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
						return cat.system or ArkInventory.Global.Options.ConfigCategoryRuleListShow ~= 1
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
						return cat.formula
					end,
					set = function( info, v )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
						if cat.formula ~= v then
							cat.formula = v
							-- check formula
							
							
							ArkInventory.ItemCacheClear( )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							--LibStub( "AceConfigRegistry-3.0" ):NotifyChange( ArkInventory.Const.Frame.Config.Internal )
						end
					end,
				},
			},
		},
	
	}
	
	local catset = ArkInventory.ConfigInternalCategorysetGet( ArkInventory.Global.Options.ConfigCategoryRuleListSet )
	
	for id, data in pairs( ArkInventory.db.option.category[ArkInventory.Const.Category.Type.Rule].data ) do
		
		if ( data.used == "Y" and ArkInventory.Global.Options.ConfigCategoryRuleListShow == 1 ) or ( data.used == "D" and ArkInventory.Global.Options.ConfigCategoryRuleListShow == 2 ) or ( data.used == "Y" and ArkInventory.Global.Options.ConfigCategoryRuleListShow == 3 ) then
			
			if not data.system then
				
				local n = data.name
				
				if ArkInventory.Global.Options.ConfigCategoryRuleListSort == 1 then
					n = string.format( "%s [%04i] [%04i]", n, id, data.order )
				elseif ArkInventory.Global.Options.ConfigCategoryRuleListSort == 3 then
					n = string.format( "[%04i] %s [%04i]", data.order, n, id )
				else
					n = string.format( "[%04i] %s [%04i]", id, n, data.order )
				end
				
				path[string.format( "%i", id )] = {
					order = 500,
					name = n,
					arg = id,
					icon = function( )
						if data.damaged then
							return ArkInventory.Const.Texture.CategoryDamaged
						end
						if catset.category.active[ArkInventory.Const.Category.Type.Rule][id] then
							return ArkInventory.Const.Texture.CategoryEnabled
						else
							return ArkInventory.Const.Texture.CategoryDisabled
						end
					end,
					type = "group",
					args = args1,
				}
				
			end
			
		end
		
	end
	
end

function ArkInventory.ConfigInternalCategoryset( )
	
	local path = ArkInventory.Config.Internal.args.settings.args.category.args.catset
	
	path.args = {
		list_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_ADD_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_SET"] ),
			type = "input",
			disabled = function( )
				return ArkInventory.Global.Options.ConfigCategorysetListShow ~= 1
			end,
			get = function( )
				return ""
			end,
			set = function( info, v )
				ArkInventory.Lib.Dewdrop:Close( )
				ArkInventory.ConfigInternalCategorysetAdd( v )
			end,
		},
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [1] = ArkInventory.Localise["SORT_BY_NAME"], [2] = ArkInventory.Localise["SORT_BY_NUMBER"] }
				return t
			end,
			get = function( info )
				return ArkInventory.Global.Options.ConfigCategorysetListSort
			end,
			set = function( info, v )
				ArkInventory.Global.Options.ConfigCategorysetListSort = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_show = {
			order = 300,
			name = ArkInventory.Localise["SHOW"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [1] = ArkInventory.Localise["ACTIVE"], [2] = ArkInventory.Localise["DELETED"] }
				return t
			end,
			get = function( info )
				return ArkInventory.Global.Options.ConfigCategorysetListShow
			end,
			set = function( info, v )
				ArkInventory.Global.Options.ConfigCategorysetListShow = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_reload = {
			order = 400,
			name = ArkInventory.Localise["RELOAD"],
			type = "execute",
			width = "half",
			hidden = true,
			func = function( )
				ArkInventory.ConfigInternalCategoryset( )
			end,
		},
	}
	
	ArkInventory.ConfigInternalCategorysetData( path.args )
	
end

function ArkInventory.ConfigInternalCategorysetData( path )
	
	local args1 = {
		action_rename = { 
			order = 100,
			name = ArkInventory.Localise["RENAME"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_RENAME_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_SET"] ),
			type = "input",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategorysetGet( id )
				return cat.system or ArkInventory.Global.Options.ConfigCategorysetListShow ~= 1
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategorysetGet( id )
				return cat.name
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategorysetRename( id, v )
				ArkInventory.ConfigInternalCategoryset( )
			end,
		},
		action_delete = { 
			order = 200,
			name = ArkInventory.Localise["DELETE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_DELETE_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_SET"] )
			end,
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigCategorysetListShow ~= 1,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategorysetGet( id )
				return cat.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategorysetDelete( id )
			end,
		},
		action_restore = { 
			order = 200,
			name = ArkInventory.Localise["RESTORE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_RESTORE_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_SET"] )
			end,
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigCategorysetListShow ~= 2,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategorysetGet( id )
				return cat.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategorysetRestore( id )
			end,
		},
		action_copy = {
			order = 300,
			name = ArkInventory.Localise["COPY_FROM"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_COPY_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_SET"] ),
			type = "select",
			width = "double",
			hidden = ArkInventory.Global.Options.ConfigCategorysetListShow ~= 1,
			values = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local t = { }
				for k, v in pairs( ArkInventory.db.option.catset.data ) do
					if v.used == "Y" and k ~= id then
						local n = v.name
						if v.system then
							n = string.format( "* %s", n )
						end
						n = string.format( "[%04i] %s", k, n )
						t[k] = n
					end
				end
				return t
			end,
			get = function( )
				return ""
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategorysetCopy( v, id )
				ArkInventory.ConfigRefresh( )
			end,
		},
		action_purge = {
			order = 400,
			name = ArkInventory.Localise["PURGE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_PURGE_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_SET"] ),
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigCategorysetListShow ~= 2,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategorysetPurge( id )
			end,
		},
		catset = {
			order = 500,
			name = ArkInventory.Localise["CONFIG_CATEGORY_SET_DESCRIPTION"],
			type = "description",
			fontSize = "medium",
			width = "full",
		},
	}
	
	for id, data in pairs( ArkInventory.db.option.catset.data ) do
		
		if ( data.used == "Y" and ArkInventory.Global.Options.ConfigCategorysetListShow == 1 ) or ( data.used == "D" and ArkInventory.Global.Options.ConfigCategorysetListShow == 2 ) then
			
			if not data.system then
				
				local n = data.name
				
				if ArkInventory.Global.Options.ConfigCategorysetListSort == 1 then
					n = string.format( "%s [%04i]", n, id )
				else
					n = string.format( "[%04i] %s", id, n )
				end
				
				path[string.format( "%i", id )] = {
					order = 500,
					name = n,
					arg = id,
					type = "group",
					args = args1,
				}
				
			end
			
		end
		
	end
	
end

function ArkInventory.ConfigInternalDesign( )
	
	local path = ArkInventory.Config.Internal.args.settings.args.design
	
	path.args = {
		list_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_ADD_TEXT"], ArkInventory.Localise["CONFIG_DESIGN"] ),
			type = "input",
			disabled = ArkInventory.Global.Options.ConfigDesignListShow ~= 1,
			get = function( )
				return ""
			end,
			set = function( info, v )
				ArkInventory.Lib.Dewdrop:Close( )
				ArkInventory.ConfigInternalDesignAdd( v )
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [1] = ArkInventory.Localise["SORT_BY_NAME"], [2] = ArkInventory.Localise["SORT_BY_NUMBER"] }
				return t
			end,
			get = function( info )
				return ArkInventory.Global.Options.ConfigDesignListSort
			end,
			set = function( info, v )
				ArkInventory.Global.Options.ConfigDesignListSort = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_show = {
			order = 300,
			name = ArkInventory.Localise["SHOW"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [1] = ArkInventory.Localise["ACTIVE"], [2] = ArkInventory.Localise["DELETED"] }
				return t
			end,
			get = function( info )
				return ArkInventory.Global.Options.ConfigDesignListShow
			end,
			set = function( info, v )
				ArkInventory.Global.Options.ConfigDesignListShow = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_reload = {
			order = 400,
			name = ArkInventory.Localise["RELOAD"],
			type = "execute",
			width = "half",
			hidden = true,
			func = function( )
				ArkInventory.ConfigInternalDesign( )
			end,
		},
		list_import = {
			order = 500,
			name = ArkInventory.Localise["IMPORT"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_IMPORT_TEXT"], ArkInventory.Localise["CONFIG_DESIGN"] ),
			type = "execute",
			width = "half",
			func = function( )
				ArkInventory.Lib.StaticDialog:Spawn( "DESIGN_IMPORT" )
			end,
		},
	}
	
	ArkInventory.ConfigInternalDesignData( path.args )
	
 end

function ArkInventory.ConfigInternalDesignData( path )
	
	local arg_loc = 3
	
	local args2 = {
		["reset"] = {
			order = 999,
			name = ArkInventory.Localise["DEFAULT"],
			desc = "PH: reset to default colours",
			type = "execute",
			hidden = false,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 5 )
				local style = ArkInventory.ConfigInternalDesignGet( id )
				local def = ArkInventory.ConfigInternalDesignGet( 0 )
				for k in pairs( ArkInventory.Const.Slot.Data ) do
					style.slot.data[k].colour.r = def.slot.data[k].colour.r
					style.slot.data[k].colour.g = def.slot.data[k].colour.g
					style.slot.data[k].colour.b = def.slot.data[k].colour.b
				end
				ArkInventory.Frame_Item_Empty_Paint_All( )
			end,
		},
	}
	
	for k, v in pairs( ArkInventory.Const.Slot.Data ) do
		if not v.hide then
			args2[string.format( "%i", k )] = {
				order = 100,
				name = function( )
					return ArkInventory.Const.Slot.Data[k].long
				end,
				desc = function( )
					return string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_COLOUR_TEXT"], ArkInventory.Const.Slot.Data[k].long )
				end,
				type = "color",
				hasAlpha = false,
				hidden = false,
				get = function( info )
					local id = ConfigGetNodeArg( info, #info - 5 )
					local style = ArkInventory.ConfigInternalDesignGet( id )
					return helperColourGet( style.slot.data[k].colour )
				end,
				set = function( info, r, g, b )
					local id = ConfigGetNodeArg( info, #info - 5 )
					local style = ArkInventory.ConfigInternalDesignGet( id )
					helperColourSet( style.slot.data[k].colour, r, g, b )
					ArkInventory.Frame_Item_Empty_Paint_All( )
				end,
			}
		end
	end
	
	local args1 = {
		action_rename = {
			order = 100,
			name = ArkInventory.Localise["RENAME"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_RENAME_TEXT"], ArkInventory.Localise["CONFIG_DESIGN"] ),
			type = "input",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalDesignGet( id )
				return style.system or ArkInventory.Global.Options.ConfigDesignListShow ~= 1
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalDesignGet( id )
				return style.name
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalDesignRename( id, v )
				ArkInventory.ConfigInternalDesign( )
			end,
		},
		action_delete = {
			order = 200,
			name = ArkInventory.Localise["DELETE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_DELETE_TEXT"], ArkInventory.Localise["CONFIG_DESIGN"] )
			end,
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigDesignListShow ~= 1,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalDesignGet( id )
				return style.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalDesignDelete( id )
			end,
		},
		action_restore = {
			order = 200,
			name = ArkInventory.Localise["RESTORE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_RESTORE_TEXT"], ArkInventory.Localise["CONFIG_DESIGN"] )
			end,
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigDesignListShow ~= 2,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalDesignGet( id )
				return style.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalDesignRestore( id )
			end,
		},
		action_copy = {
			order = 300,
			name = ArkInventory.Localise["COPY_FROM"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_COPY_TEXT"], ArkInventory.Localise["CONFIG_DESIGN"] ),
			type = "select",
			width = "double",
			hidden = ArkInventory.Global.Options.ConfigDesignListShow ~= 1,
			values = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local t = { }
				for k, v in pairs( ArkInventory.db.option.design.data ) do
					if v.used == "Y" and k ~= id then
						local n = v.name
						if v.system then
							n = string.format( "* %s", n )
						end
						n = string.format( "[%04i] %s", k, n )
						t[k] = n
					end
				end
				return t
			end,
			get = function( )
				return ""
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalDesignCopy( v, id )
				ArkInventory.ConfigRefresh( )
			end,
		},
		action_purge = {
			order = 400,
			name = ArkInventory.Localise["PURGE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_PURGE_TEXT"], ArkInventory.Localise["CONFIG_DESIGN"] ),
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigDesignListShow ~= 2,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalDesignPurge( id )
			end,
		},
		action_export = {
			order = 500,
			name = ArkInventory.Localise["EXPORT"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_EXPORT_TEXT"], ArkInventory.Localise["CONFIG_DESIGN"] ),
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigDesignListShow ~= 1,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalDesignGet( id )
				return style.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalDesignExport( id )
			end,
		},
		
		window = {
			order = 100,
			name = ArkInventory.Localise["CONFIG_DESIGN_WINDOW"],
			type = "group",
			--childGroups = "tab",
			disabled = ArkInventory.Global.Options.ConfigDesignListShow ~= 1,
			args = {
				style = {
					order = 100,
					name = ArkInventory.Localise["CONFIG_STYLE"],
					type = "group",
					args = {
						style = {
							order = 10,
							name = ArkInventory.Localise["CONFIG_STYLE_DESCRIPTION"],
							fontSize = "medium",
							type = "description"
						},
						window = {
							order = 100,
							name = ArkInventory.Localise["CONFIG_DESIGN_WINDOW"],
							type = "group",
							args = {
								strata = {
									order = 1,
									name = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA"],
									desc = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA_TEXT"],
									type = "select",
									values = function( )
										local t = {
											[1] = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_LOW"],
											[2] = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_MEDIUM"],
											[3] = ArkInventory.Localise["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_HIGH"],
										}
										return t
									end,
									get = function( info )
										
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										
										local v = style.window.strata
										if v == "LOW" then
											return 1
										elseif v == "MEDIUM" then
											return 2
										elseif v == "HIGH" then
											return 3
										end
										
									end,
									set = function( info, v )
										
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										
										local v = v
										if v == 1 then
											v = "LOW"
										elseif v == 2 then
											v = "MEDIUM"
										elseif v == 3 then
											v = "HIGH"
										end
										style.window.strata = v
										
										for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
											ArkInventory.Frame_Main_Hide( loc_id )
										end
										
									end,
								},
								scale = {
									order = 2,
									name = ArkInventory.Localise["SCALE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_SCALE_TEXT"],
									type = "range",
									min = 0.4,
									max = 2,
									step = 0.05,
									isPercent = true,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.scale
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.4 then v = 0.4 end
										if v > 2 then v = 2 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.scale ~= v then
											style.window.scale = v
											ArkInventory.Frame_Main_Scale_All( )
										end
									end,
								},
								padding = {
									order = 3,
									name = ArkInventory.Localise["PADDING"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_PADDING_TEXT"],
									type = "range",
									min = 4,
									max = 32,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.pad
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 4 then v = 4 end
										if v > 32 then v = 32 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.pad ~= v then
											style.window.pad = math.floor( v )
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								width = {
									order = 4,
									name = ArkInventory.Localise["WIDTH"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_WIDTH_TEXT"],
									type = "range",
									min = 6,
									max = 60,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.width
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 6 then v = 6 end
										if v > 60 then v = 60 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.width ~= v then
											style.window.width = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								height = {
									order = 5,
									name = ArkInventory.Localise["HEIGHT"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_HEIGHT_TEXT"],
									type = "range",
									min = 200,
									max = 2000,
									step = 20,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.height
									end,
									set = function( info, v )
										local v = math.floor( v )
										local v = math.floor( v / 40 ) * 40
										if v < 200 then v = 200 end
										if v > 2000 then v = 2000 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.height ~= v then
											style.window.height = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								font = {
									order = 10,
									name = ArkInventory.Localise["FONT"],
									type = "group",
									hidden = true,
									args = {
										custom = {
											order = 100,
											name = ArkInventory.Localise["CUSTOM"],
											type = "toggle",
											disabled = true,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.font.custom
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.font.custom = not style.font.custom
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
											end,
										},
										face = {
											order = 110,
											name = ArkInventory.Localise["FONT"],
											--desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_FONT_CUSTOM_TEXT"],
											type = "select",
											width = "double",
											dialogControl = "LSM30_Font",
											values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.FONT ),
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.font.custom
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.font.face
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												if style.font.face ~= v then
													style.font.face = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
												end
											end,
										},
										height = {
											order = 120,
											name = ArkInventory.Localise["FONT_SIZE"],
											--desc = ArkInventory.Localise["CONFIG_DESIGN_FONT_HEIGHT_TEXT"],
											type = "range",
											min = ArkInventory.Const.Font.MinHeight,
											max = ArkInventory.Const.Font.MaxHeight,
											step = 1,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.font.custom
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.font.height
											end,
											set = function( info, v )
												local v = math.floor( v )
												if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
												if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												if style.font.height ~= v then
													style.font.height = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
												end
											end,
										},
									},
								},
							},
						},
						title = {
							order = 1100,
							name = ArkInventory.Localise["SUBFRAME_NAME_TITLE"],
							type = "group",
							inline = false,
							args = {
								hide = {
									order = 100,
									type = "toggle",
									name = ArkInventory.Localise["HIDE"],
									desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_FRAME_HIDE_TEXT"], ArkInventory.Localise["SUBFRAME_NAME_TITLE"] ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.title.hide
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.title.hide = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
									end,
								},
								size = {
									order = 200,
									type = "select",
									name = ArkInventory.Localise["HEIGHT"],
									values = function( )
										local t = { [ArkInventory.Const.Window.Title.SizeNormal] = ArkInventory.Localise["CONFIG_DESIGN_FRAME_TITLE_SIZE_NORMAL"], [ArkInventory.Const.Window.Title.SizeThin] = ArkInventory.Localise["CONFIG_DESIGN_FRAME_TITLE_SIZE_THIN"] }
										return t
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.title.size
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.title.size = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								online = {
									order = 300,
									name = ArkInventory.Localise["ONLINE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_TITLE_ONLINE_COLOUR_TEXT"],
									type = "color",
									hasAlpha = false,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.title.colour.online )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.title.colour.online, r, g, b )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,	
								},
								offline = {
									order = 400,
									name = ArkInventory.Localise["OFFLINE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_TITLE_OFFLINE_COLOUR_TEXT"],
									type = "color",
									hasAlpha = false,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.title.colour.offline )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.title.colour.offline, r, g, b )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								height = {
									order = 120,
									name = ArkInventory.Localise["FONT_SIZE"],
									--desc = ArkInventory.Localise["CONFIG_DESIGN_FONT_HEIGHT_TEXT"],
									type = "range",
									min = ArkInventory.Const.Font.MinHeight,
									max = ArkInventory.Const.Font.MaxHeight,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.title.font.height
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
										if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.title.font.height ~= v then
											style.title.font.height = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
										end
									end,
								},
							},
						},
						search = {
							order = 1200,
							name = ArkInventory.Localise["SEARCH"],
							type = "group",
							inline = false,
							args = {
								hide = {
									order = 100,
									name = ArkInventory.Localise["HIDE"],
									type = "toggle",
									desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_FRAME_HIDE_TEXT"], ArkInventory.Localise["SEARCH"] ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.search.hide
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.search.hide = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								height = {
									order = 150,
									name = ArkInventory.Localise["FONT_SIZE"],
									type = "range",
									min = ArkInventory.Const.Font.MinHeight,
									max = ArkInventory.Const.Font.MaxHeight,
									step = 1,
									set = function( info, v )
										local v = math.floor( v )
										if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
										if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
										if ArkInventory.db.option.font.height ~= v then
											local id = ConfigGetNodeArg( info, #info - 4 )
											local style = ArkInventory.ConfigInternalDesignGet( id )
											if style.search.font.height ~= v then
												style.search.font.height = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
											end
										end
									end,
								},
								searchlabel = {
									order = 200,
									name = ArkInventory.Localise["LABEL"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_SEARCH_LABEL_COLOUR_TEXT"],
									type = "color",
									hasAlpha = false,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.search.label.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.search.label.colour, r, g, b )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,	
								},
								searchtext = {
									order = 300,
									name = ArkInventory.Localise["TEXT"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_SEARCH_TEXT_COLOUR_TEXT"],
									type = "color",
									hasAlpha = false,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.search.text.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.search.text.colour, r, g, b )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
							},
						},
						changer = {
							order = 1300,
							name = ArkInventory.Localise["SUBFRAME_NAME_BAGCHANGER"],
							type = "group",
							inline = false,
							args = {
								hide = {
									order = 100,
									name = ArkInventory.Localise["HIDE"],
									type = "toggle",
									desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_FRAME_HIDE_TEXT"], ArkInventory.Localise["SUBFRAME_NAME_BAGCHANGER"] ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.changer.hide
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.changer.hide = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								highlight = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT"],
									type = "group",
									inline = true,
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT_TEXT"],
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.changer.highlight.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.changer.highlight.show = v
												ArkInventory.ItemCacheClear( )
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										colour = {
											order = 200,
											name = ArkInventory.Localise["COLOUR"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT_COLOUR_TEXT"],
											type = "color",
											hasAlpha = false,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return helperColourGet( style.changer.highlight.colour )
											end,
											set = function( info, r, g, b )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												helperColourSet( style.changer.highlight.colour, r, g, b )
												ArkInventory.Frame_Main_Paint_All( )
											end,	
										},
									},
								},
								free = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_DESIGN_FRAME_CHANGER_FREE"],
									type = "group",
									inline = true,
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_CHANGER_FREE_TEXT"],
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.changer.freespace.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.changer.freespace.show = v
												ArkInventory.ItemCacheClear( )
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										colour = {
											order = 200,
											name = ArkInventory.Localise["COLOUR"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_CHANGER_FREE_COLOUR_TEXT"],
											type = "color",
											hasAlpha = false,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return helperColourGet( style.changer.freespace.colour )
											end,
											set = function( info, r, g, b )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												helperColourSet( style.changer.freespace.colour, r, g, b )
												ArkInventory.Frame_Changer_Update( ArkInventory.Const.Location.Bag )
												ArkInventory.Frame_Changer_Update( ArkInventory.Const.Location.Bank )
												ArkInventory.Frame_Changer_Update( ArkInventory.Const.Location.Vault )
											end,
										},
									},
								},
							},
						},
						status = {
							order = 1400,
							name = ArkInventory.Localise["STATUS"],
							type = "group",
							inline = false,
							args = {
								hide = {
									order = 100,
									name = ArkInventory.Localise["HIDE"],
									type = "toggle",
									desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_FRAME_HIDE_TEXT"], ArkInventory.Localise["STATUS"] ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.status.hide
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.status.hide = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								height = {
									order = 120,
									name = ArkInventory.Localise["FONT_SIZE"],
									--desc = ArkInventory.Localise["CONFIG_DESIGN_FONT_HEIGHT_TEXT"],
									type = "range",
									min = ArkInventory.Const.Font.MinHeight,
									max = ArkInventory.Const.Font.MaxHeight,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.status.font.height
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
										if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.status.font.height ~= v then
											style.status.font.height = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
										end
									end,
								},
								emptytext = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_DESIGN_FRAME_STATUS_EMPTY"],
									type = "group",
									inline = true,
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_STATUS_EMPTY_TEXT"],
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.emptytext.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.status.emptytext.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										colour = {
											order = 200,
											name = ArkInventory.Localise["LDB_BAGS_COLOUR_USE"],
											desc = ArkInventory.Localise["LDB_BAGS_COLOUR_USE_TEXT"],
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.emptytext.colour
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.status.emptytext.colour = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										full = {
											order = 300,
											name = ArkInventory.Localise["LDB_BAGS_STYLE"],
											desc = ArkInventory.Localise["LDB_BAGS_STYLE_TEXT"],
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.emptytext.full
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.status.emptytext.full = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										includetype = {
											order = 400,
											name = ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE"],
											desc = ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE_TEXT"],
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.emptytext.includetype
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.status.emptytext.includetype = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
									},
								},
							},
						},
						background = {
							order = 300,
							name = ArkInventory.Localise["BACKGROUND"],
							type = "group",
							args = {
								style = {
									order = 100,
									name = ArkInventory.Localise["STYLE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_TEXT"],
									type = "select",
									width = "double",
									dialogControl = "LSM30_Background",
									values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.background.style or ArkInventory.Const.Texture.BackgroundDefault
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.background.style ~= v then
											style.window.background.style = v
											ArkInventory.Frame_Main_Paint_All( )
										end
									end,
								},
								colour = {
									order = 200,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BACKGROUND_COLOUR_TEXT"],
									type = "color",
									hasAlpha = true,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.background.style ~= ArkInventory.Const.Texture.BackgroundDefault
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.window.background.colour )
									end,
									set = function( info, r, g, b, a )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.window.background.colour, r, g, b, a )
										ArkInventory.Frame_Main_Paint_All( )
									end,
								},
							},
						},	
						border = {
							order = 400,
							name = ArkInventory.Localise["BORDER"],
							type = "group",
							args = {
								style = {
									order = 100,
									name = ArkInventory.Localise["STYLE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_TEXT"],
									type = "select",
									width = "double",
									dialogControl = "LSM30_Border",
									values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BORDER ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.border.style or ArkInventory.Const.Texture.BorderDefault
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.border.style ~= v then
											
											style.window.border.style = v
											
											local sd = ArkInventory.Const.Texture.Border[v] or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault]
											style.window.border.size = sd.size
											style.window.border.offset = sd.offset
											style.window.border.scale = sd.scale
											
											ArkInventory.Frame_Main_Paint_All( )
											
										end
									end,
								},
								colour = {
									order = 200,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_COLOUR_TEXT"],
									type = "color",
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									hasAlpha = false,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.window.border.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.window.border.colour, r, g, b )
										ArkInventory.Frame_Main_Paint_All( )
									end,
								},
								size = {
									order = 300,
									name = ArkInventory.Localise["HEIGHT"],
									type = "input",
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return string.format( "%i", style.window.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size )
									end,
									set = function( info, v )
										local v = math.floor( tonumber( v ) or 0 )
										if v < 0 then v = 0 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.border.size ~= v then
											style.window.border.size = v
											ArkInventory.Frame_Main_Paint_All( )
										end
									end,
								},
								offset = {
									order = 400,
									name = ArkInventory.Localise["OFFSET"],
									type = "input",
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return string.format( "%i", style.window.border.offset or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offset )
									end,
									set = function( info, v )
										local v = math.floor( tonumber( v ) or 0 )
										if v < 0 then v = 0 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.border.offset ~= v then
											style.window.border.offset = v
											ArkInventory.Frame_Main_Paint_All( )
										end
									end,
								},
								scale = {
									order = 500,
									name = ArkInventory.Localise["SCALE"],
									desc = ArkInventory.Localise["CONFIG_BORDER_SCALE_TEXT"],
									type = "range",
									min = 0.25,
									max = 4,
									step = 0.05,
									isPercent = true,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.border.scale or 1
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.25 then v = 0.25 end
										if v > 4 then v = 4 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.border.scale ~= v then
											style.window.border.scale = v
											ArkInventory.Frame_Main_Paint_All( )
										end
									end,
								},
							},
						},
						sorting = {
							order = 200,
							name = ArkInventory.Localise["CONFIG_SORTING"],
							type = "group",
							args = {
								method = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_SORTING_METHOD"],
									desc = ArkInventory.Localise["CONFIG_SORTING_METHOD_TEXT"],
									type = "select",
									width = "double",
									values = function( )
										local t = { }
										for k, v in pairs( ArkInventory.db.option.sort.method.data ) do
											if v.used == "Y" then
												local n = v.name
												if v.system then
													n = string.format( "* %s", n )
												end
												n = string.format( "[%04i] %s", k, n )
												t[k] = n
											end
										end
										return t
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.sort.method
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.sort.method = v
										ArkInventory.LocationSetValue( nil, "resort", true )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
									end,
								},
								when = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_SORTING_WHEN"],
									desc = string.format( "%s\n\n\n%s: %s\n\n%s: %s\n\n%s: %s", ArkInventory.Localise["CONFIG_SORTING_WHEN_TEXT"], ArkInventory.Localise["CONFIG_SORTING_WHEN_INSTANT"], ArkInventory.Localise["CONFIG_SORTING_WHEN_INSTANT_TEXT"], ArkInventory.Localise["CONFIG_SORTING_WHEN_OPEN"], ArkInventory.Localise["CONFIG_SORTING_WHEN_OPEN_TEXT"], ArkInventory.Localise["CONFIG_SORTING_WHEN_MANUAL"], ArkInventory.Localise["CONFIG_SORTING_WHEN_MANUAL_TEXT"] ),
									type = "select",
									values = function( )
										local t = {
											[ArkInventory.Const.SortWhen.Instant] = ArkInventory.Localise["CONFIG_SORTING_WHEN_INSTANT"],
											[ArkInventory.Const.SortWhen.Open] = ArkInventory.Localise["CONFIG_SORTING_WHEN_OPEN"],
											[ArkInventory.Const.SortWhen.Manual] = ArkInventory.Localise["CONFIG_SORTING_WHEN_MANUAL"],
										}
										return t
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.sort.when
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.sort.when = v
									end,
								},
							},
						},
					},
				},
				layout = {
					order = 200,
					name = ArkInventory.Localise["CONFIG_LAYOUT"],
					type = "group",
					args = {
						layout = {
							order = 10,
							name = ArkInventory.Localise["CONFIG_LAYOUT_DESCRIPTION"],
							fontSize = "medium",
							type = "description"
						},
					},
				},
			},
		},
		bars = {
			order = 200,
			name = ArkInventory.Localise["CONFIG_DESIGN_BAR"],
			type = "group",
			--childGroups = "tab",
			disabled = ArkInventory.Global.Options.ConfigDesignListShow ~= 1,
			args = {
				style = {
					order = 100,
					name = ArkInventory.Localise["CONFIG_STYLE"],
					type = "group",
					args = {
						style = {
							order = 10,
							name = ArkInventory.Localise["CONFIG_STYLE_DESCRIPTION"],
							fontSize = "medium",
							type = "description"
						},
						bars = {
							order = 100,
							name = ArkInventory.Localise["CONFIG_DESIGN_BAR"],
							type = "group",
							args = {
								anchor = {
									order = 100,
									name = ArkInventory.Localise["ANCHOR"],
									desc = string.format( ArkInventory.Localise["ANCHOR_TEXT2"], ArkInventory.Localise["CONFIG_DESIGN_BAR"], "" ),
									type = "select",
									values = function( )
										return anchorpoints
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.anchor
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.anchor ~= v then
											style.bar.anchor = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								compact = {
									order = 400,
									name = ArkInventory.Localise["CONFIG_DESIGN_BAR_COMPACT"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_COMPACT_TEXT"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.compact
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.bar.compact = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
								per_row = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_DESIGN_BAR_PER_ROW"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_PER_ROW_TEXT"],
									type = "range",
									min = 1,
									max = 40,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.per
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 1 then v = 1 end
										if v > 16 then v = 16 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.per ~= v then
											style.bar.per = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								empty = {
									order = 500,
									name = ArkInventory.Localise["CONFIG_DESIGN_BAR_SHOW_EMPTY"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_SHOW_EMPTY_TEXT"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.showempty
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.bar.showempty = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
							},
						},
						padding = {
							order= 600,
							name = ArkInventory.Localise["PADDING"],
							type = "group",
							args = {
								internal = {
									order = 100,
									name = ArkInventory.Localise["INTERNAL"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_PADDING_INTERNAL_TEXT"],
									type = "range",
									min = 4,
									max = 32,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.pad.internal
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 4 then v = 4 end
										if v > 32 then v = 32 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.pad.internal ~= v then
											style.bar.pad.internal = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								external = {
									order = 200,
									name = ArkInventory.Localise["EXTERNAL"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_PADDING_EXTERNAL_TEXT"],
									type = "range",
									min = 0,
									max = 32,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.pad.external
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 0 then v = 0 end
										if v > 32 then v = 32 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.pad.external ~= v then
											style.bar.pad.external = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
							},
						},
						background = {
							order = 650,
							name = ArkInventory.Localise["BACKGROUND"],
							type = "group",
							args = {
								style = {
									order = 100,
									name = ArkInventory.Localise["STYLE"],
									type = "select",
									width = "double",
									disabled = true,
									dialogControl = "LSM30_Background",
									values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										--return style.bar.background.style
										return ArkInventory.Const.Texture.BackgroundDefault
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.bar.background.style = v
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
								colour = {
									order = 200,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_BACKGROUND_TEXT"],
									type = "color",
									hasAlpha = true,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										--return style.bar.background.style ~= ArkInventory.Const.Texture.BackgroundDefault
										return false
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.bar.background.colour )
									end,
									set = function( info, r, g, b, a )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.bar.background.colour, r, g, b, a )
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
							},
						},	
						border = {
							order = 700,
							name = ArkInventory.Localise["BORDER"],
							type = "group",
							args = {
								style = {
									order = 100,
									name = ArkInventory.Localise["STYLE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_BORDER_STYLE_TEXT"],
									type = "select",
									width = "double",
									dialogControl = "LSM30_Border",
									values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BORDER ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.border.style or ArkInventory.Const.Texture.BorderDefault
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.border.style ~= v then
											
											style.bar.border.style = v
											
											local sd = ArkInventory.Const.Texture.Border[v] or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault]
											style.bar.border.size = sd.size
											style.bar.border.offset = sd.offset
											style.bar.border.scale = sd.scale
		
											ArkInventory.Frame_Bar_Paint_All( )
											
										end
									end,
								},
								colour = {
									order = 200,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_BORDER_COLOUR_TEXT"],
									type = "color",
									hasAlpha = false,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.bar.border.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.bar.border.colour, r, g, b )
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
								size = {
									order = 300,
									name = ArkInventory.Localise["HEIGHT"],
									type = "input",
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return string.format( "%i", style.bar.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size )
									end,
									set = function( info, v )
										local v = math.floor( tonumber( v ) or 0 )
										if v < 0 then v = 0 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.border.size ~= v then
											style.bar.border.size = v
											ArkInventory.Frame_Bar_Paint_All( )
										end
									end,
								},
								offset = {
									order = 400,
									name = ArkInventory.Localise["OFFSET"],
									type = "input",
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return string.format( "%i", style.bar.border.offset or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offset  )
									end,
									set = function( info, v )
										local v = math.floor( tonumber( v ) or 0 )
										if v < 0 then v = 0 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.border.offset ~= v then
											style.bar.border.offset = v
											ArkInventory.Frame_Main_Paint_All( )
										end
									end,
								},
								scale = {
									order = 500,
									name = ArkInventory.Localise["SCALE"],
									type = "range",
									min = 0.25,
									max = 4,
									step = 0.05,
									isPercent = true,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.border.scale or 1
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.25 then v = 0.25 end
										if v > 4 then v = 4 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.border.scale ~= v then
											style.bar.border.scale = v
											ArkInventory.Frame_Bar_Paint_All( )
										end
									end,
								},
							},
						},
						label = {
							order = 800,
							name = ArkInventory.Localise["NAME"],
							type = "group",
							args = {
								show = {
									order = 100,
									type = "toggle",
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_NAME_SHOW_TEXT"],
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.name.show
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.bar.name.show = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
								colour = {
									order = 200,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_NAME_COLOUR_TEXT"],
									type = "color",
									hasAlpha = false,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.bar.name.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.bar.name.colour, r, g, b )
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
								height = {
									order = 300,
									name = ArkInventory.Localise["FONT_SIZE"],
									--desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_NAME_HEIGHT_TEXT"],
									type = "range",
									min = ArkInventory.Const.Font.MinHeight,
									max = ArkInventory.Const.Font.MaxHeight,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.name.height
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
										if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.name.height ~= v then
											style.bar.name.height = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								anchor = {
									order = 400,
									name = ArkInventory.Localise["ANCHOR"],
									desc = string.format( ArkInventory.Localise["ANCHOR_TEXT2"], ArkInventory.Localise["NAME"], "" ),
									type = "select",
									values = function( )
										local anchorpoints = {
											[ArkInventory.Const.Anchor.Automatic] = ArkInventory.Localise["AUTOMATIC"],
											[ArkInventory.Const.Anchor.Top] = ArkInventory.Localise["TOP"],
											[ArkInventory.Const.Anchor.Bottom] = ArkInventory.Localise["BOTTOM"],
										}
										return anchorpoints
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.name.anchor
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.name.anchor ~= v then
											style.bar.name.anchor = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
							},
						},
					},
				},
				layout = {
					order = 200,
					name = ArkInventory.Localise["CONFIG_LAYOUT"],
					type = "group",
					args = {
						layout = {
							order = 10,
							name = ArkInventory.Localise["CONFIG_LAYOUT_DESCRIPTION"],
							fontSize = "medium",
							type = "description"
						},
					},
				},
			},
		},
		items = {
			order = 300,
			name = ArkInventory.Localise["ITEMS"],
			type = "group",
			--childGroups = "tab",
			disabled = ArkInventory.Global.Options.ConfigDesignListShow ~= 1,
			args = {
				style = {
					order = 100,
					name = ArkInventory.Localise["CONFIG_STYLE"],
					type = "group",
					args = {
						style = {
							order = 10,
							name = ArkInventory.Localise["CONFIG_STYLE_DESCRIPTION"],
							fontSize = "medium",
							type = "description"
						},
						items = {
							order = 100,
							name = ArkInventory.Localise["ITEMS"],
							type = "group",
							args = {
								anchor = {
									order = 100,
									name = ArkInventory.Localise["ANCHOR"],
									desc = string.format( ArkInventory.Localise["ANCHOR_TEXT2"], ArkInventory.Localise["ITEMS"], "" ),
									type = "select",
									values = function( )
										return anchorpoints
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.anchor
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.anchor ~= v then
											style.slot.anchor = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								padding = {
									order = 200,
									name = ArkInventory.Localise["PADDING"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_PADDING_TEXT"],
									type = "range",
									min = 1,
									max = 16,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.pad
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 1 then v = 1 end
										if v > 16 then v = 16 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.pad ~= v then
											style.slot.pad = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								fade = {
									order = 400,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_FADE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_FADE_TEXT"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.offline.fade
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.offline.fade = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								tint = {
									order = 500,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_TINT_USABLE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_TINT_USABLE_TEXT"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.unusable.tint
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.unusable.tint = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								scale = {
									order = 700,
									name = ArkInventory.Localise["SCALE"],
									type = "range",
									min = 0.25,
									max = 4,
									step = 0.05,
									isPercent = true,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.scale or 1
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.25 then v = 0.25 end
										if v > 4 then v = 4 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.scale ~= v then
											style.slot.scale = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								compress = {
									order = 800,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_COMPRESS"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_COMPRESS_TEXT"],
									type = "range",
									min = 0,
									max = 5,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.compress or 0
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( v )
										if v < 0 then v = 0 end
										if v > 5 then v = 5 end
										style.slot.compress = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
							},
						},
						cooldown = {
							order = 550,
							name = ArkInventory.Localise["COOLDOWN"],
							type = "group",
							args = {
								enable = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_COOLDOWN_SHOW_TEXT"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.cooldown.show
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.cooldown.show = v
										ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								global = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_COOLDOWN_GLOBAL"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_COOLDOWN_GLOBAL_TEXT"],
									type = "toggle",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.cooldown.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.cooldown.global
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.cooldown.global = v
										ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								combat = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_COOLDOWN_COMBAT"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_COOLDOWN_COMBAT_TEXT"],
									type = "toggle",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.cooldown.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.cooldown.combat
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.cooldown.combat = v
									end,
								},
							},
						},
						border = {
							order = 700,
							name = ArkInventory.Localise["BORDER"],
							type = "group",
							args = {
								style = {
									order = 100,
									name = ArkInventory.Localise["STYLE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_STYLE_TEXT"],
									type = "select",
									width = "double",
									dialogControl = "LSM30_Border",
									values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BORDER ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.style or ArkInventory.Const.Texture.BorderDefault
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.border.style ~= v then
											
											style.slot.border.style = v
											
											local sd = ArkInventory.Const.Texture.Border[v] or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault]
											style.slot.border.size = sd.size
											style.slot.border.offset = sd.offset
											style.slot.border.scale = sd.scale
											
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											
										end
									end,
								},
								rarity = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_RARITY"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_RARITY_TEXT"],
									type = "toggle",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.rarity
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.border.rarity = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								raritycutoff = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_RARITY_CUTOFF"],
									desc = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_RARITY_CUTOFF_TEXT"], _G[string.format( "ITEM_QUALITY%d_DESC", style.slot.border.raritycutoff or 0 )] )
									end,
									type = "select",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.style == ArkInventory.Const.Texture.BorderNone or not style.slot.border.rarity
									end,
									values = function( )
										local t = { }
										for z in pairs( ITEM_QUALITY_COLORS ) do
											if z >= 0 then
												t[tostring( z )] = _G[string.format( "ITEM_QUALITY%d_DESC", z )]
											end
										end
										return t
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return tostring( style.slot.border.raritycutoff or 0 )
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.border.raritycutoff = tonumber( v )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								size = {
									order = 400,
									name = ArkInventory.Localise["HEIGHT"],
									type = "input",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return string.format( "%i", style.slot.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size )
									end,
									set = function( info, v )
										local v = math.floor( tonumber( v ) or 0 )
										if v < 0 then v = 0 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.border.size ~= v then
											style.slot.border.size = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								offset = {
									order = 500,
									name = ArkInventory.Localise["OFFSET"],
									type = "input",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return string.format( "%i", style.slot.border.offset or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offset )
									end,
									set = function( info, v )
										local v = math.floor( tonumber( v ) or 0 )
										if v < 0 then v = 0 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.border.offset ~= v then
											style.slot.border.offset = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								scale = {
									order = 600,
									name = ArkInventory.Localise["SCALE"],
									type = "range",
									min = 0.25,
									max = 4,
									step = 0.05,
									isPercent = true,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.scale or 1
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.25 then v = 0.25 end
										if v > 4 then v = 4 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.border.scale ~= v then
											style.slot.border.scale = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
							},
						},
						empty = {
							order = 600,
							name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY"],
							type = "group",
							args = {
								icon = {
									order = 100,
									name = ArkInventory.Localise["ICON"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_ICON_TEXT"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.empty.icon
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.empty.icon = v
										ArkInventory.Frame_Item_Empty_Paint_All( )
									end,
								},
								alpha = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_ALPHA"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_ALPHA_TEXT"],
									type = "range",
									min = 0,
									max = 1,
									step = 0.01,
									isPercent = true,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.empty.icon
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.empty.alpha or 1
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( v / 0.01 ) * 0.01
										if v < 0 then v = 0 end
										if v > 1 then v = 1 end
										if style.slot.empty.alpha ~= v then
											style.slot.empty.alpha = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								border = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_BORDER"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_BORDER_TEXT"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.empty.border
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.empty.border = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								sort = {
									order = 400,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_POSITION"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_POSITION_TEXT"],
									type = "select",
									values = {
										[1] = ArkInventory.Localise["FIRST"],
										[2] = ArkInventory.Localise["LAST"],
									},
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.empty.position == true then
											return 1 -- ArkInventory.Localise["FIRST"]
										else
											return 2 --ArkInventory.Localise["LAST"]
										end
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if v == 1 then
											style.slot.empty.position = true
										else
											style.slot.empty.position = false
										end
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
								first = {
									order = 500,
									--name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_FIRST"],
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_COMPRESS"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_FIRST_TEXT"],
									type = "range",
									min = 0,
									max = 5,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.empty.first or 0
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( v )
										if v < 0 then v = 0 end
										if v > 5 then v = 5 end
										if style.slot.empty.first ~= v then
											style.slot.empty.first = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								clump = {
									order = 600,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_CLUMP"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_CLUMP_TEXT"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.empty.clump
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.empty.clump = v
										ArkInventory.ItemCacheClear( )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
								colour = {
									order = 900,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_COLOUR"],
									type = "group",
									inline = true,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 5 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.empty.icon and not style.slot.empty.border
									end,
									args = args2,
								},
							},
						},
						age = {
							order = 800,
							name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_AGE"],
							type = "group",
							args = {
								show = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_AGE_SHOW_TEXT"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.age.show
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.age.show = not style.slot.age.show
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								height = {
									order = 200,
									name = ArkInventory.Localise["FONT_SIZE"],
									type = "range",
									min	= ArkInventory.Const.Font.MinHeight,
									max = ArkInventory.Const.Font.MaxHeight,
									step = 1,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.age.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.age.font.height
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( v )
										if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
										if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
										if style.slot.age.font.height ~= v then
											style.slot.age.font.height = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								colour = {
									order = 300,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_AGE_COLOUR_TEXT"],
									type = "color",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.age.show
									end,
									hasAlpha = false,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.slot.age.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.slot.age.colour, r, g, b )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								cutoff = {
									order = 400,
									name = string.format( "%s (%s)", ArkInventory.Localise["DURATION"], ArkInventory.Localise["MINUTES"] ),
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_AGE_CUTOFF_TEXT"],
									type = "input",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.age.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return string.format( "%i", style.slot.age.cutoff )
									end,
									set = function( info, v )
										local v = math.floor( tonumber( v ) or 0 )
										if v < 0 then v = 0 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.age.cutoff ~= v then
											style.slot.age.cutoff = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
							},
						},
						new_item = {
							order = 900,
							name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_NEW"],
							type = "group",
							args = {
								show = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_NEW_ENABLED_TEXT"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.new.enable
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.new.enable = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
								cutoff = {
									order = 300,
									name = string.format( "%s (%s)", ArkInventory.Localise["DURATION"], ArkInventory.Localise["MINUTES"] ),
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_NEW_CUTOFF_TEXT"],
									type = "input",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.new.enable
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return string.format( "%i", style.slot.new.cutoff )
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( tonumber( v ) or 0 )
										if v < 0 then v = 1 end
										if style.slot.new.cutoff ~= v then
											style.slot.new.cutoff = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
							},
						},
						itemcount = {
							order = 110,
							name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMCOUNT_SHOW"],
							type = "group",
							args = {
								show = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMCOUNT_SHOW_TEXT"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.itemcount.show
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.itemcount.show = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								height = {
									order = 200,
									name = ArkInventory.Localise["FONT_SIZE"],
									type = "range",
									min	= ArkInventory.Const.Font.MinHeight,
									max = ArkInventory.Const.Font.MaxHeight,
									step = 1,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.itemcount.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.itemcount.font.height
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( v )
										if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
										if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
										if style.slot.itemcount.font.height ~= v then
											style.slot.itemcount.font.height = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
										end
									end,
								},
								colour = {
									order = 300,
									name = ArkInventory.Localise["COLOUR"],
									type = "color",
									hasAlpha = false,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.itemcount.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.slot.itemcount.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.slot.itemcount.colour, r, g, b )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,	
								},
							},
						},
						itemlevel = {
							order = 120,
							name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMLEVEL_SHOW"],
							type = "group",
							args = {
								show = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMLEVEL_SHOW_TEXT"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.itemlevel.show
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.itemlevel.show = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								height = {
									order = 200,
									name = ArkInventory.Localise["FONT_SIZE"],
									type = "range",
									min	= ArkInventory.Const.Font.MinHeight,
									max = ArkInventory.Const.Font.MaxHeight,
									step = 1,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.itemlevel.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.itemlevel.font.height
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( v )
										if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
										if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
										if style.slot.itemlevel.font.height ~= v then
											style.slot.itemlevel.font.height = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								colour = {
									order = 300,
									name = ArkInventory.Localise["COLOUR"],
									--desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMLEVEL_COLOUR_TEXT"],
									type = "color",
									hasAlpha = false,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.itemlevel.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.slot.itemlevel.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.slot.itemlevel.colour, r, g, b )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,	
								},
							},
						},
					},
				},
				layout = {
					order = 200,
					name = ArkInventory.Localise["CONFIG_LAYOUT"],
					type = "group",
					args = {
						layout = {
							order = 10,
							name = ArkInventory.Localise["CONFIG_LAYOUT_DESCRIPTION"],
							fontSize = "medium",
							type = "description"
						},
					},
				},
			},
		},
	}
	
	
	for id, data in pairs( ArkInventory.db.option.design.data ) do
		
		if ( data.used == "Y" and ArkInventory.Global.Options.ConfigDesignListShow == 1 ) or ( data.used == "D" and ArkInventory.Global.Options.ConfigDesignListShow == 2 ) then
			
			if not data.system then
				
				local n = data.name
				
				if ArkInventory.Global.Options.ConfigDesignListSort == 1 then
					n = string.format( "%s [%04i]", n, id )
				else
					n = string.format( "[%04i] %s", id, n )
				end
				
				path[string.format( "%i", id )] = {
					order = 500,
					type = "group",
					name = n,
					arg = id,
					childGroups = "tab",
					args = args1,
				}
				
			end
			
		end
		
	end
	
 end

function ArkInventory.ConfigInternalProfile( )
	
	local path = ArkInventory.Config.Internal.args.myprofiles.args.bundle
	
	path.args = {
		list_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_ADD_TEXT"], ArkInventory.Localise["CONFIG_PROFILE"] ),
			type = "input",
			disabled = ArkInventory.Global.Options.ConfigProfileListShow ~= 1,
			get = function( )
				return ""
			end,
			set = function( info, v )
				ArkInventory.Lib.Dewdrop:Close( )
				ArkInventory.ConfigInternalProfileAdd( v )
			end,
		},
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [1] = ArkInventory.Localise["SORT_BY_NAME"], [2] = ArkInventory.Localise["SORT_BY_NUMBER"] }
				return t
			end,
			get = function( info )
				return ArkInventory.Global.Options.ConfigProfileListSort
			end,
			set = function( info, v )
				ArkInventory.Global.Options.ConfigProfileListSort = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_show = {
			order = 300,
			name = ArkInventory.Localise["SHOW"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [1] = ArkInventory.Localise["ACTIVE"], [2] = ArkInventory.Localise["DELETED"] }
				return t
			end,
			get = function( info )
				return ArkInventory.Global.Options.ConfigProfileListShow
			end,
			set = function( info, v )
				ArkInventory.Global.Options.ConfigProfileListShow = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_reload = {
			order = 400,
			name = ArkInventory.Localise["RELOAD"],
			type = "execute",
			width = "half",
			hidden = true,
			func = function( )
				ArkInventory.ConfigRefresh( )
			end,
		},
		
		current = {
			order = 1000,
			type = "select",
			name = ArkInventory.Localise["CONFIG_PROFILE_CURRENT"],
			width = "double",
			values = function( )
				local t = { }
				for id, data in pairs( ArkInventory.db.option.profile.data ) do
					if data.used == "Y" then
						local n = data.name
						if data.system then
							n = string.format( "* %s", n )
						end
						t[id] = string.format( "[%04i] %s", id, n )
					end
				end
				return t
			end,
			get = function( info )
				local me = ArkInventory.GetPlayerCodex( )
				return me.player.data.profile
			end,
			set = function( info, v )
				local me = ArkInventory.GetPlayerCodex( )
				if me.player.data.profile ~= v then
					me.player.data.profile = v
					ArkInventory.ConfigRefresh( )
					ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
				end
			end,
		},
		
	}
	
	ArkInventory.ConfigInternalProfileData( path.args )
	
 end

function ArkInventory.ConfigInternalProfileData( path )
	
	local args1 = {
		action_rename = {
			order = 100,
			name = ArkInventory.Localise["RENAME"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_RENAME_TEXT"], ArkInventory.Localise["CONFIG_PROFILE"] ),
			type = "input",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalProfileGet( id )
				return style.system or ArkInventory.Global.Options.ConfigProfileListShow ~= 1
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalProfileGet( id )
				return style.name
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalProfileRename( id, v )
				ArkInventory.ConfigInternalProfile( )
			end,
		},
		action_delete = {
			order = 200,
			name = ArkInventory.Localise["DELETE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_DELETE_TEXT"], ArkInventory.Localise["CONFIG_PROFILE"] )
			end,
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigProfileListShow ~= 1,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalProfileGet( id )
				return style.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalProfileDelete( id )
			end,
		},
		action_restore = {
			order = 200,
			name = ArkInventory.Localise["RESTORE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_RESTORE_TEXT"], ArkInventory.Localise["CONFIG_PROFILE"] )
			end,
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigProfileListShow ~= 2,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalProfileGet( id )
				return style.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalProfileRestore( id )
			end,
		},
		action_copy = {
			order = 300,
			name = ArkInventory.Localise["COPY_FROM"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_COPY_TEXT"], ArkInventory.Localise["CONFIG_PROFILE"] ),
			type = "select",
			width = "double",
			hidden = ArkInventory.Global.Options.ConfigProfileListShow ~= 1,
			values = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local t = { }
				for k, v in pairs( ArkInventory.db.option.profile.data ) do
					if v.used == "Y" and k ~= id then
						local n = v.name
						if v.system then
							n = string.format( "* %s", n )
						end
						n = string.format( "[%04i] %s", k, n )
						t[k] = n
					end
				end
				return t
			end,
			get = function( )
				return ""
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalProfileCopy( v, id )
				ArkInventory.ConfigRefresh( )
			end,
		},
		action_purge = {
			order = 400,
			name = ArkInventory.Localise["PURGE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_PURGE_TEXT"], ArkInventory.Localise["CONFIG_PROFILE"] ),
			type = "execute",
			width = "half",
			hidden = ArkInventory.Global.Options.ConfigProfileListShow ~= 2,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalProfilePurge( id )
			end,
		},
		
	}
	
	for id, data in pairs( ArkInventory.db.option.profile.data ) do
		
		if ( data.used == "Y" and ArkInventory.Global.Options.ConfigProfileListShow == 1 ) or ( data.used == "D" and ArkInventory.Global.Options.ConfigProfileListShow == 2 ) then
			
			if not data.system then
				
				local n = data.name
				
				if ArkInventory.Global.Options.ConfigProfileListSort == 1 then
					n = string.format( "%s [%04i]", n, id )
				else
					n = string.format( "[%04i] %s", id, n )
				end
				
				path[string.format( "%i", id )] = {
					order = 500,
					type = "group",
					name = n,
					arg = id,
					childGroups = "tab",
					args = args1,
				}
				
			end
			
		end
		
	end
	
 end


function ArkInventory.ConfigInternalLDBMounts( path )
	
	local me = ArkInventory.GetPlayerCodex( )
	
	local args3 = { }
	
	args3["mt"] = {
		order = 1,
		name = "mount type",
		type = "select",
		values = function( info )
			
			local index = ConfigGetNodeArg( info, #info - 2 )
			local md = ArkInventory.Collection.Mount.GetMount( index )
			
			local t = { }
			for mountType, k in pairs( ArkInventory.Const.MountTypes ) do
				t[k] = ArkInventory.Localise[string.upper( string.format( "LDB_MOUNTS_TYPE_%s", mountType ) )]
				if md.mto == k then
					t[k] = string.format( "%s (%s)", t[k], ArkInventory.Localise["DEFAULT"] )
				end
			end
			
			return t
			
		end,
		get = function( info )
			
			local index = ConfigGetNodeArg( info, #info - 2 )
			local md = ArkInventory.Collection.Mount.GetMount( index )
			
			return md.mt
			
		end,
		set = function( info, v )
			
			local index = ConfigGetNodeArg( info, #info - 2 )
			local md = ArkInventory.Collection.Mount.GetMount( index )
			
			--ArkInventory.Output( "new mount correction for ", string.format( "%.12f", md.spell ), ": ", v )
			
			ArkInventory.db.option.mount.correction[md.spell] = v
			
			ArkInventory.Collection.Mount.ApplyUserCorrections( )
			
			ArkInventory.LDB.Mounts:Update( )
			
			local args2 = ConfigGetNodeArg( info, #info - 1 )
			ArkInventory.ConfigInternalLDBMountsUpdate( path, args2 )
			
		end,
	}
	
	
	args3["summon"] = {
		order = 9,
		type = "execute",
		name = ArkInventory.Localise["SUMMON"],
		func = function( info )
			local index = ConfigGetNodeArg( info, #info - 2 )
			ArkInventory.Collection.Mount.Summon( index )
		end,
	}
	
	
	local args2 = { }
	args2["mountname"] = {
		order = 1,
		type = "description",
		name = function( info ) 
			local index = ConfigGetNodeArg( info, #info - 1 )
			local md = ArkInventory.Collection.Mount.GetMount( index )
			return string.format( "%s (%s)", md.name, md.spell )
		end,
	}
	args2["capabilities"] = {
		order = 10,
		type = "group",
		name = "",
		inline = true,
		arg = args2,  -- check what this was needed for
		args = args3,
	}
	
	
	path["!UseTravelForm"] = {
		name = string.format( ArkInventory.Localise["LDB_MOUNTS_TRAVEL_FORM"], ArkInventory.Localise["SPELL_DRUID_TRAVEL_FORM"] ),
		desc = string.format( ArkInventory.Localise["LDB_MOUNTS_TRAVEL_FORM_TEXT"], ArkInventory.Localise["SPELL_DRUID_TRAVEL_FORM"] ),
		type = "toggle",
		disabled = me.player.data.info.class ~= "DRUID",
		get = function( info )
			return me.player.data.ldb.travelform
		end,
		set = function( info )
			me.player.data.ldb.travelform = not me.player.data.ldb.travelform
		end,
	}
	
	for mountType, k in pairs( ArkInventory.Const.MountTypes ) do
		
		path[mountType] = {
			order = k,
			cmdHidden = true,
			type = "group",
			name = ArkInventory.Localise[string.upper( string.format( "LDB_MOUNTS_TYPE_%s", mountType ) )],
			arg = mountType,
		}
		
	end
	
	ArkInventory.ConfigInternalLDBMountsUpdate( path, args2 )
	
end

function ArkInventory.ConfigInternalLDBMountsUpdate( path, args2 )
	
	for mountType in pairs( ArkInventory.Const.MountTypes ) do
		
		if not path[mountType].args then
			path[mountType].args = { }
		end
		local mountList = path[mountType].args
		
		for _, md in ArkInventory.Collection.Mount.Iterate( ) do
			
			if md.owned then
				
				local mountKey = tostring( md.index )
				local ok = false
				
				if not ok and md.mt == ArkInventory.Const.MountTypes[mountType] then
					ok = true
				end
				
				if not ok and mountType == "x" and md.mt ~= md.mto then
					-- show anything that has been changed on the custom tab as well
					ok = true
				end
				
				if ok then
					if not mountList[mountKey] then
						--new mount, add it
						mountList[mountKey] = {
							type = "group",
							name = md.name,
							arg = md.index,
							args = args2,
						}
					else
						-- mount is already in the list, ignore
					end
				else
					if mountList[mountKey] then
						-- shouldnt be in this list, remove it 
						table.wipe( mountList[mountKey] )
						mountList[mountKey] = nil
					end
				end
				
			end
			
		end
		
	end
	
end

-- run on load
ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
