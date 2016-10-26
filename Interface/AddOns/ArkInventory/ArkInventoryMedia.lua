
function ArkInventory.MediaRegister( )
	
	if ArkInventory.Lib.SharedMedia then
		-- all fonts sourced from http://www.fontfreak.com and were specified as freeware, if this is not the case then please let me know and i will remove them from the mod
		
		-- fonts
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.FONT, "Anime Ace", [[Interface\AddOns\ArkInventory\Fonts\animeace.ttf]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.FONT, "Designer Block", [[Interface\AddOns\ArkInventory\Fonts\DESIB___.ttf]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.FONT, "DestructoBeam BB", [[Interface\AddOns\ArkInventory\Fonts\destructobeambb_reg.ttf]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.FONT, "Dreamspeak", [[Interface\AddOns\ArkInventory\Fonts\dfdrsp__.TTF]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.FONT, "Drummon", [[Interface\AddOns\ArkInventory\Fonts\Drummon.ttf]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.FONT, "Dustismo", [[Interface\AddOns\ArkInventory\Fonts\Dustismo.ttf]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.FONT, "Emblem", [[Interface\AddOns\ArkInventory\Fonts\Emblem.ttf]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.FONT, "Electrofied", [[Interface\AddOns\ArkInventory\Fonts\electr.ttf]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.FONT, "SF Diego Sans", [[Interface\AddOns\ArkInventory\Fonts\SF Diego Sans.ttf]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.FONT, "SF Laundromatic", [[Interface\AddOns\ArkInventory\Fonts\SF Laundromatic.ttf]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.FONT, "Zekton", [[Interface\AddOns\ArkInventory\Fonts\zekton__.ttf]] )
		
		
		-- borders
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.BORDER, "ArkInventory Square 1", [[Interface\AddOns\ArkInventory\Images\BorderSquare1.tga]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.BORDER, "ArkInventory Square 2", [[Interface\AddOns\ArkInventory\Images\BorderSquare2.tga]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.BORDER, "ArkInventory Square 3", [[Interface\AddOns\ArkInventory\Images\BorderSquare3.tga]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.BORDER, "ArkInventory Tooltip 1", [[Interface\AddOns\ArkInventory\Images\BorderTooltip1.tga]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.BORDER, "ArkInventory Tooltip 2", [[Interface\AddOns\ArkInventory\Images\BorderTooltip2.tga]] )
		ArkInventory.Lib.SharedMedia:Register( ArkInventory.Lib.SharedMedia.MediaType.BORDER, "ArkInventory Tooltip 3", [[Interface\AddOns\ArkInventory\Images\BorderTooltip3.tga]] )
		
		
		-- backgrounds
		--lib.MediaType.BACKGROUND
		
		--refresh media if more are added after mod is loaded
		ArkInventory.Lib.SharedMedia.RegisterCallback( ArkInventory, "LibSharedMedia_Registered", "MediaUpdate" )
		ArkInventory.Lib.SharedMedia.RegisterCallback( ArkInventory, "LibSharedMedia_SetGlobal", "MediaUpdate" )
		
	else
		
		ArkInventory.OutputWarning( "LibSharedMedia not loaded, unable to register shared media" )
		
	end
	
end

local function helper_fontpath( face )
	
	local face = face or ( ArkInventory.db and ArkInventory.db.option.font.face ) or [[Friz Quadrata TT]]
	
	local path = ArkInventory.Lib.SharedMedia:Fetch( ArkInventory.Lib.SharedMedia.MediaType.FONT, face )
	if not path then
		ArkInventory.OutputWarning( "unknown font: ", face )
		path = ArkInventory.Lib.SharedMedia:Fetch( ArkInventory.Lib.SharedMedia.MediaType.FONT, ArkInventory.Const.Font.Face )
		if not path then
			ArkInventory.OutputError( "code error: default font is unknown" )
			return
		end
	end
	
	return path
	
end

local function helper_fontsize( size )
	
	local size = size
	if type( size ) ~= "number" then
	   -- size can be -1.#QNAN (some invalid number when its first created) so just nil it
		size = nil
	end
	size = size or ( ArkInventory.db and ArkInventory.db.option.font.height ) or 10
	size = math.floor( ( size or 0 ) + 0.5 )
	
	if size < ArkInventory.Const.Font.MinHeight then
		size = ArkInventory.Const.Font.MinHeight
	elseif size > ArkInventory.Const.Font.MaxHeight then
		size = ArkInventory.Const.Font.MaxHeight
	end
	
	return size
	
end

local function helper_fontinfo( face, size )
	
	local path = helper_fontpath( face )
	local size = helper_fontsize( size )
	
	return path, face, size
	
end

function ArkInventory.MediaObjectFontSet( obj, face, size )
	
	if obj == nil or not ( obj["GetFont"] and obj["SetFont"] ) then
		return
	end
	
	local path_old, size_old, flags = obj:GetFont( )
	size_old = helper_fontsize( size_old )
	
	local path = path_old
	local size = size or size_old
	
	if face then
		path, face, size = helper_fontinfo( face, size )
		if not path then
			path = old_path
		end
	end
	
	if path_old ~= path or size_old ~= size then
       	obj:SetFont( path, size, flags )
	end
	
end

function ArkInventory.MediaMenuFontSet( face, size )
	
	local face = face
	local path
	local size = size
	
	if face then
		path = helper_fontpath( face )
	end
	
	if size then
		size = helper_fontsize( size )
	end
	
	ArkInventory.Lib.Dewdrop:SetStandardFont( path, size )
	
end

function ArkInventory.MediaFrameFontSet( frame, face, size )
	
	if frame ~= nil and type( frame ) == "string" then
		frame = _G[frame]
	end
	
	if not frame then return end
	
	local testpath = helper_fontinfo( face, size )
	if not testpath then
		return
	end
	
	for _, obj in pairs( { frame:GetRegions( ) } ) do
		ArkInventory.MediaObjectFontSet( obj, face, size )
	end

	for _, obj in pairs( { frame:GetChildren( ) } ) do
		ArkInventory.MediaObjectFontSet( obj, face, size )
	end

	for _, obj in pairs( { frame:GetChildren( ) } ) do
		ArkInventory.MediaFrameFontSet( obj, face, size )
	end
	
end

function ArkInventory.MediaAllFontSet( face, size )
	
	for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
		if loc_data.canView then
			local frame = ArkInventory.Frame_Main_Get( loc_id )
			ArkInventory.MediaFrameFontSet( frame, face, size )
		end
	end
	
	ArkInventory.MediaFrameFontSet( ARKINV_Search, face, size )
	ArkInventory.MediaFrameFontSet( ARKINV_Rules, face, size )
	
	ArkInventory.MediaMenuFontSet( face )
	
end

function ArkInventory.MediaUpdate( )
	ArkInventory.MediaAllFontSet( ArkInventory.db.option.font.face )
	ArkInventory.Frame_Main_Paint_All( )
end


function ArkInventory.MediaFrameDefaultFontSet( frame )
	if ArkInventory.db then
		ArkInventory.MediaFrameFontSet( frame, ArkInventory.db.option.font.face )
	end
end
