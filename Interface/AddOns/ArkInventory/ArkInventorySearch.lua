local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


function ArkInventory.Frame_Search_Hide( )
	if ARKINV_Search then
		ARKINV_Search:Hide( )
	end
end
	
function ArkInventory.Frame_Search_Show( )
	
	if not ArkInventory.LoadAddOn( "ArkInventorySearch" ) then return end
	
	if ARKINV_Search then
		ARKINV_Search:Show( )
		ArkInventory.Frame_Main_Level( ARKINV_Search )
	end
	
end

function ArkInventory.Frame_Search_Toggle( )
	
	if ARKINV_Search and ARKINV_Search:IsVisible( ) then
		ArkInventory.Frame_Search_Hide( )
	else
		ArkInventory.Frame_Search_Show( )
	end
	
end
