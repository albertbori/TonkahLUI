local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table

ArkInventory.Lib.StaticDialog:Register( "BATTLE_PET_RENAME", {
	
	text = ArkInventory.Localise["RENAME"],
	hide_on_escape = true,
	show_while_dead = false,
	exclusive = true,
	
	buttons = {
		{
			text = ArkInventory.Localise["ACCEPT"],
			on_click = function( self )
				local text = self.editboxes[1]:GetText( )
				ArkInventory.PetJournal.SetName( self.data, text )
				PetJournal_UpdateAll( )
			end,
		},
		{
			text = PET_RENAME_DEFAULT_LABEL,
			on_click = function( self )
				ArkInventory.PetJournal.SetName( self.data, "" )
				PetJournal_UpdateAll( )
			end,
		},
		{
			text = ArkInventory.Localise["CANCEL"],
		},
	},
	
	editboxes = {
		{
			
			auto_focus = true,
			max_letters = 16,
			
			on_enter_pressed = function( self, data )
				ArkInventory.PetJournal.SetName( data, self:GetText( ) )
				PetJournal_UpdateAll( )
				ArkInventory.Lib.StaticDialog:Dismiss( "BATTLE_PET_RENAME", data )
			end,
			
			on_escape_pressed = function( self, data )
				ArkInventory.Lib.StaticDialog:Dismiss( "BATTLE_PET_RENAME", data )
			end,
			
		},
	},
	
	on_show = function( self, data )
		self.editboxes[1]:SetText( ArkInventory.PetJournal.GetPet( data ).cn or "" )
	end,
	
} )

ArkInventory.Lib.StaticDialog:Register( "BATTLE_PET_RELEASE", {
	
	hide_on_escape = true,
	show_while_dead = false,
	exclusive = true,
	
	buttons = {
		{
			text = ArkInventory.Localise["OKAY"],
			on_click = function( self )
				C_PetJournal.ReleasePetByID( self.data )
				if ( PetJournalPetCard.petID == self.data ) then
					PetJournal_ShowPetCard( 1 )
				end
			end,
		},
		{
			text = ArkInventory.Localise["CANCEL"],
		},
	},
	
	on_show = function( self, data )
		
		local pd = ArkInventory.PetJournal.GetPet( data )
		
		local qd = ""
		
		if pd.sd.isWild and pd.sd.canBattle then
			qd = _G[string.format( "ITEM_QUALITY%d_DESC", pd.rarity ) ]
			qd = string.format( ", %s%s|r", select( 5, ArkInventory.GetItemQualityColor( pd.rarity ) ), qd )
		end
		
		local text = string.format( "%s|r, %s %d%s", pd.fullname, LEVEL, pd.level, qd )
		
		self.text:SetText( string.format( PET_RELEASE_LABEL, text ) )
		
	end,
	
} )

ArkInventory.Lib.StaticDialog:Register( "BATTLE_PET_PUT_IN_CAGE", {
	
	text = PET_PUT_IN_CAGE_LABEL,
	hide_on_escape = true,
	show_while_dead = false,
	exclusive = true,
	
	buttons = {
		{
			text = ArkInventory.Localise["OKAY"],
			on_click = function( self )
				C_PetJournal.CagePetByID( self.data )
				if ( PetJournalPetCard.petID == self.data ) then
					PetJournal_ShowPetCard( 1 )
				end
			end,
		},
		{
			text = ArkInventory.Localise["CANCEL"],
		},
	},
	
} )

ArkInventory.Lib.StaticDialog:Register( "DESIGN_EXPORT", {
	
	text = ArkInventory.Localise["EXPORT"],
	hide_on_escape = true,
	exclusive = true,
	
	buttons = {
		{
			text = ArkInventory.Localise["CANCEL"],
		},
	},
	
	editboxes = {
		{
			auto_focus = true,
			width = 200,
			on_enter_pressed = function( self, data )
				ArkInventory.Lib.StaticDialog:Dismiss( "DESIGN_EXPORT" )
			end,
			on_escape_pressed = function( self, data )
				ArkInventory.Lib.StaticDialog:Dismiss( "DESIGN_EXPORT" )
			end,
		},
	},
	
	on_show = function( self, data )
		self.editboxes[1]:SetText( self.data or "" )
	end,
	
} )

ArkInventory.Lib.StaticDialog:Register( "DESIGN_IMPORT", {
	
	text = ArkInventory.Localise["IMPORT"],
	hide_on_escape = true,
	exclusive = true,
	
	buttons = {
		{
			text = ArkInventory.Localise["OKAY"],
			on_click = function( self )
				ArkInventory.ConfigInternalDesignImport( self:GetText( ) )
				ArkInventory.Lib.StaticDialog:Dismiss( "DESIGN_IMPORT" )
			end,
		},
		{
			text = ArkInventory.Localise["CANCEL"],
		},
	},
	
	editboxes = {
		{
			
			auto_focus = true,
			width = 200,
			
			on_enter_pressed = function( self, data )
				ArkInventory.ConfigInternalDesignImport( self:GetText( ) )
				ArkInventory.Lib.StaticDialog:Dismiss( "DESIGN_IMPORT" )
			end,
			
			on_escape_pressed = function( self, data )
				ArkInventory.Lib.StaticDialog:Dismiss( "DESIGN_IMPORT" )
			end,
		},
	},
	
	on_show = function( self, data )
		self.editboxes[1]:SetText( "" )
	end,
	
} )

