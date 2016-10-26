-- forcibly load required libraries if not already loaded - required when running disembedded (some curse users)

local function loadExternal( addonname )
	if not IsAddOnLoaded( addonname ) then
		LoadAddOn( addonname )
	end
end

loadExternal( "Ace3" )
loadExternal( "AceGUI-3.0-SharedMediaWidgets" )
loadExternal( "LibPeriodicTable-3.1" )
loadExternal( "LibSharedMedia-3.0" )
loadExternal( "LibDataBroker-1.1" )
loadExternal( "LibDialog-1.0" )
loadExternal( "BattlePetBreedID" )
