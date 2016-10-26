	
ArkInventory.Const.MoneyTypeInfo = { }

ArkInventory.Const.MoneyTypeInfo["PLAYER"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { "PLAYER_MONEY", "PLAYER_TRADE_MONEY", "SEND_MAIL_MONEY_CHANGED", "SEND_MAIL_COD_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,
	
	UpdateFunc = function( )
		return GetMoney( ) - GetCursorMoney( ) - GetPlayerTradeMoney( )
	end,

	PickupFunc = function( amount )
		PickupPlayerMoney( amount )
	end,

	DropFunc = function( )
		DropCursorMoney( )
	end,

	collapse = 1,
	canPickup = 1,
	showSmallerCoins = "Backpack"

}

ArkInventory.Const.MoneyTypeInfo["STATIC"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )

		moneyFrame.events = { }
		
	end,

	UpdateFunc = function( moneyFrame )
		return moneyFrame.staticMoney
	end,

	collapse = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["GUILDBANK"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )

		moneyFrame.events = { "GUILDBANK_UPDATE_MONEY" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end
		
	end,

	UpdateFunc = function( )
		return GetGuildBankMoney( ) - GetCursorMoney( )
	end,

	PickupFunc = function( amount )
		PickupGuildBankMoney( amount )
	end,

	DropFunc = function( )
		DropCursorMoney( )
	end,

	collapse = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["GUILDBANK_WITHDRAW"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { "GUILDBANK_UPDATE_WITHDRAWMONEY" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,
	
	UpdateFunc = function( )
		
		local amount = 0
		
		if CanWithdrawGuildBankMoney( ) or CanGuildBankRepair( ) then
			amount = min( GetGuildBankMoney( ),  GetGuildBankWithdrawMoney( ) )
			if amount < 0 then
				amount = GetGuildBankMoney( )
			end
		end
		
		return amount
		
	end,

	collapse = 1,
	showSmallerCoins = "Backpack",
	
}

ArkInventory.Const.MoneyTypeInfo["GUILDBANK_REPAIR"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( moneyFrame )

		assert( moneyFrame, "code error: moneyFrame argument is missing" )

		return moneyFrame.staticMoney
		
	end,

	collapse = 1,
	showSmallerCoins = "Backpack",
	
}

ArkInventory.Const.MoneyTypeInfo["AUCTION"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )

		return moneyFrame.staticMoney
		
	end,
	
	showSmallerCoins = "Backpack",
	fixedWidth = 1,
	collapse = 1,
	truncateSmallCoins = nil,
	
}

ArkInventory.Const.MoneyTypeInfo["PLAYER_TRADE"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { "PLAYER_TRADE_MONEY" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( )
		return GetPlayerTradeMoney( )
	end,

	PickupFunc = function( amount )
		PickupTradeMoney( amount )
	end,

	DropFunc = function( )
		AddTradeMoney( )
	end,

	collapse = 1,
	canPickup = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["TARGET_TRADE"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { "TRADE_MONEY_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( )
		return GetTargetTradeMoney( )
	end,

	collapse = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["SEND_MAIL"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { "SEND_MAIL_MONEY_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( )
		return GetSendMailMoney( )
	end,

	PickupFunc = function( amount )
		PickupSendMailMoney( amount )
	end,

	DropFunc = function( )
		AddSendMailMoney( )
	end,

	collapse = nil,
	canPickup = 1,
	showSmallerCoins = "Backpack",
	
}

ArkInventory.Const.MoneyTypeInfo["SEND_MAIL_COD"] = {
	
	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { "SEND_MAIL_COD_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( )
		return GetSendMailCOD( )
	end,

	PickupFunc = function( amount )
		PickupSendMailCOD( amount )
	end,

	DropFunc = function( )
		AddSendMailCOD( )
	end,

	collapse = 1,
	canPickup = 1,
	
}

function ArkInventory.MoneyFrame_OnEvent( moneyFrame, event, ... )

	assert( moneyFrame, "code error: moneyFrame argument is missing" )

	if not moneyFrame.info or not moneyFrame:IsVisible( ) then
		return
	end

	ArkInventory.MoneyFrame_UpdateMoney( moneyFrame )
	
end

function ArkInventory.MoneyFrame_OnEnter( moneyFrame )
	
	assert( moneyFrame, "code error: moneyFrame argument is missing" )
	
	if not moneyFrame:IsVisible( ) then
		return
	end
	
	local parent = moneyFrame:GetParent( ):GetParent( )
	if parent and parent.ARK_Data then
		
		local x, a, b
		
		x = moneyFrame:GetBottom( ) + ( moneyFrame:GetTop( ) - moneyFrame:GetBottom( ) ) / 2
		if ( x >= ( GetScreenHeight( ) / 2 ) ) then
			a = "BOTTOM"
		else
			a = "TOP"
		end
		
		x = moneyFrame:GetLeft( ) + ( moneyFrame:GetRight( ) - moneyFrame:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			b = "RIGHT"
		else
			b = "LEFT"
		end
		
		GameTooltip:SetOwner( moneyFrame, string.format( "ANCHOR_%s", a ) )
		GameTooltip:ClearLines( )
		
		ArkInventory.MoneyFrame_Tooltip( GameTooltip, parent.ARK_Data.loc_id )
		
		GameTooltip:Show( )
		
	end
	
end

function ArkInventory.SmallMoneyFrame_OnLoad( moneyFrame, moneyType )

	assert( moneyFrame, "code error: moneyFrame argument is missing" )
	
	local moneyType = moneyType or "PLAYER"
	moneyFrame.small = 1
	
	ArkInventory.MoneyFrame_SetType( moneyFrame, moneyType )
	
end

function ArkInventory.MoneyFrame_SetType( moneyFrame, moneyType )
	
	assert( moneyFrame, "code error: moneyFrame argument is missing" )
	
	local info = ArkInventory.Const.MoneyTypeInfo[moneyType]
	if not info then
		ArkInventory.OutputError( "code error: invalid moneyType [", moneyType, "] assigned to frame [", moneyFrame:GetName( ), "], deafulting to PLAYER" )
		info = ArkInventory.Const.MoneyTypeInfo["PLAYER"]
	end
	
	if moneyFrame.events then
		-- this money frame has already been used for something else, clean it up
		moneyFrame:UnregisterAllEvents( )
		moneyFrame.events = nil
	end

	moneyFrame.info = info
	moneyFrame.moneyType = moneyType
	
	-- register the events required
	if info.OnloadFunc then
		info.OnloadFunc( moneyFrame )
	end
	
	local frameName = moneyFrame:GetName( )
	if info.canPickup then
		--_G[string.format( "%s%s", frameName, "GoldButton" )]:EnableMouse( true )
		--_G[string.format( "%s%s", frameName, "SilverButton" )]:EnableMouse( true )
		--_G[string.format( "%s%s", frameName, "CopperButton" )]:EnableMouse( true )
		
		_G[string.format( "%s%s", frameName, "GoldButton" )]:RegisterForClicks( "LeftButtonUp" )
		_G[string.format( "%s%s", frameName, "SilverButton" )]:RegisterForClicks( "LeftButtonUp" )
		_G[string.format( "%s%s", frameName, "CopperButton" )]:RegisterForClicks( "LeftButtonUp" )
	else
		--_G[string.format( "%s%s", frameName, "GoldButton" )]:EnableMouse( false )
		--_G[string.format( "%s%s", frameName, "SilverButton" )]:EnableMouse( false )
		--_G[string.format( "%s%s", frameName, "CopperButton" )]:EnableMouse( false )
		
		_G[string.format( "%s%s", frameName, "GoldButton" )]:RegisterForClicks( )
		_G[string.format( "%s%s", frameName, "SilverButton" )]:RegisterForClicks( )
		_G[string.format( "%s%s", frameName, "CopperButton" )]:RegisterForClicks( )
	end

	ArkInventory.MoneyFrame_UpdateMoney( moneyFrame )
	
end

function ArkInventory.MoneyFrame_UpdateMoney( moneyFrame )

	assert( moneyFrame, "code error: moneyFrame argument is missing" )
	
	if not moneyFrame:IsVisible( ) then
		return
	end
	
	if moneyFrame.info then
		
		local moneyAmount = moneyFrame.info.UpdateFunc( moneyFrame )
		
		if moneyAmount then
			MoneyFrame_Update( moneyFrame:GetName( ), moneyAmount )
		end
		
		if moneyFrame.hasPickup == 1 then
			UpdateCoinPickupFrame( moneyAmount )
		end
		
	else
		
		ArkInventory.OutputError( "moneyType not set for moneyFrame [", moneyFrame:GetName( ), "]" )
		
	end
	
end

function ArkInventory.MoneyText( money, condense )
	
	local money = money or 0
	local colorblindMode = ( ENABLE_COLORBLIND_MODE == "1" )
	
	local numGold = floor( money / COPPER_PER_GOLD )
	local numSilver = floor( ( money - ( numGold * COPPER_PER_GOLD ) ) / COPPER_PER_SILVER )
	local numCopper = mod( money, COPPER_PER_SILVER )
	
	local txtGold = ""
	local txtSilver = ""
	local txtCopper = ""
	
	local leading_zero_format = "%d%s"
	local SILVER_AMOUNT_TEXTURE = SILVER_AMOUNT_TEXTURE
	local COPPER_AMOUNT_TEXTURE = COPPER_AMOUNT_TEXTURE
	
	
	if money >= COPPER_PER_GOLD then
		
		if colorblindMode then
			txtGold = string.format( "%s%s", FormatLargeNumber( numGold ), GOLD_AMOUNT_SYMBOL )
		else
			txtGold = string.format( GOLD_AMOUNT_TEXTURE_STRING, FormatLargeNumber( numGold ), 0, 0 )
		end
		
		leading_zero_format = "%02d%s"
		SILVER_AMOUNT_TEXTURE = string.gsub( SILVER_AMOUNT_TEXTURE, "%%d", "%%02d", 1 )
		
	end
	
	
	if money >= COPPER_PER_SILVER then
		
		if colorblindMode then
			txtSilver = string.format( leading_zero_format, numSilver, SILVER_AMOUNT_SYMBOL )
		else
			txtSilver = string.format( SILVER_AMOUNT_TEXTURE, numSilver, 0, 0 )
		end
		
		COPPER_AMOUNT_TEXTURE = string.gsub( COPPER_AMOUNT_TEXTURE, "%%d", "%%02d", 1 )
		
	end
	
	
--	if numSilver > 0 or numGold > 0 then
		
		if colorblindMode then
			txtCopper = string.format( leading_zero_format, numCopper, COPPER_AMOUNT_SYMBOL )
		else
			txtCopper = string.format( COPPER_AMOUNT_TEXTURE, numCopper, 0, 0 )
		end
		
--	end
	
	if condense then
		
		local txt = ""
		if numCopper > 0 then
			txt = string.format( "%s %s", txtCopper, txt )
		end
		
		if numSilver > 0 or numCopper > 0 then
			txt = string.format( "%s %s", txtSilver, txt )
		end
		
		if numGold > 0 then
			txt = string.format( "%s %s", txtGold, txt )
		end
		
		return string.trim( txt )
		
	else
		
		return string.trim( string.format( "%s %s %s", txtGold, txtSilver, txtCopper ) )
		
	end
	
end

function ArkInventory.MoneyFrame_Tooltip( tooltip, loc_id )
	
	if not tooltip then return end
	if not ArkInventory.db.option.tooltip.add.count then return end
	
	local total = 0
	
	local codex = ArkInventory.GetPlayerCodex( loc_id )
	if loc_id then
		local codex = ArkInventory.GetLocationCodex( loc_id )
	end
	
	tooltip:AddDoubleLine( ArkInventory.Localise["CHARACTER"], ArkInventory.Localise["TOOLTIP_GOLD_AMOUNT"] )
	
	local just_me = ArkInventory.db.option.tooltip.me
	local ignore_vaults = not ArkInventory.db.option.tooltip.add.vault
	local my_realm = ArkInventory.db.option.tooltip.realm
	local include_crossrealm = ArkInventory.db.option.tooltip.crossrealm
	local ignore_other_faction = ArkInventory.db.option.tooltip.faction
	
	local paint = ArkInventory.db.option.tooltip.colour.class
	local colour = ""
	if paint then
		colour = HIGHLIGHT_FONT_COLOR_CODE
	end
	
	for pn, pd in ArkInventory.spairs( ArkInventory.db.player.data ) do
		
		if ( not ( ( pd.info.class == "GUILD" ) or ( pd.info.class == "ACCOUNT" ) ) ) and ( pd.info.name ) then
			if ( not my_realm ) or ( ( my_realm and ( ( codex.player.data.info.realm == pd.info.realm ) ) ) or ( my_realm and include_crossrealm and ArkInventory.IsConnectedRealm( codex.player.data.info.realm, pd.info.realm ) ) ) then
				if ( not ignore_other_faction ) or ( ignore_other_faction and ( ( codex.player.data.info.faction == pd.info.faction ) ) ) then
					if ( not just_me ) or ( just_me and ( ( codex.player.data.info.player_id == pd.info.player_id ) ) ) then
						
						total = total + ( pd.info.money or 0 )
						
						local name = ArkInventory.DisplayName3( pd.info, paint, codex.player.data.info )
						
						local hl = ""
						if not ArkInventory.db.option.tooltip.me and codex.player.data.info.player_id == pd.info.player_id then
							hl = ArkInventory.db.option.tooltip.highlight
						end
						
						name = string.format( "%s%s|r", hl, name )
						
						ArkInventory.TooltipSetMoneyText( tooltip, pd.info.money or 0, name )
						
					end
				end
			end
		end
	end
	
	tooltip:AddDoubleLine( " ", " " )
	ArkInventory.TooltipSetMoneyText( tooltip, total, ArkInventory.Localise["TOTAL"] )
	
	total = 0
	
	if not just_me and not ignore_vaults then
		
		for pn, pd in pairs( ArkInventory.db.player.data ) do
			if pd.info.class == "GUILD" and pd.info.name then
				if ( not my_realm ) or ( ( my_realm and ( ( codex.player.data.info.realm == pd.info.realm ) ) ) or ( my_realm and include_crossrealm and ArkInventory.IsConnectedRealm( codex.player.data.info.realm, pd.info.realm ) ) ) then
					if ( not ignore_other_faction ) or ( ignore_other_faction and ( ( codex.player.data.info.faction == pd.info.faction ) ) ) then
						total = 1
					end
				end
			end
		end
		
		if total > 0 then
			
			tooltip:AddDoubleLine( " ", " " )
			tooltip:AddDoubleLine( " ", " " )
			
			tooltip:AddDoubleLine( ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Name, ArkInventory.Localise["TOOLTIP_GOLD_AMOUNT"] )
			
			for pn, pd in ArkInventory.spairs( ArkInventory.db.player.data ) do
				
				if pd.info.class == "GUILD" and pd.info.name then
					if ( not my_realm ) or ( ( my_realm and ( ( codex.player.data.info.realm == pd.info.realm ) ) ) or ( my_realm and include_crossrealm and ArkInventory.IsConnectedRealm( codex.player.data.info.realm, pd.info.realm ) ) ) then
						if ( not ignore_other_faction ) or ( ignore_other_faction and ( ( codex.player.data.info.faction == pd.info.faction ) ) ) then
							ArkInventory.TooltipSetMoneyText( tooltip, pd.info.money or 0, ArkInventory.DisplayName3( pd.info, paint, codex.player.data.info ) )
						end
					end
				end
				
			end
			
		end
		
	end
	
end
