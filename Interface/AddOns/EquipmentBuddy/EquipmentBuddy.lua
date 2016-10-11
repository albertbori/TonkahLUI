local EquipmentBuddy = CreateFrame("Frame")
local queueset = queueset
					
local Items = 	{		--Fishing Poles--
						6365, -- Strong Fishing Pole
						46337, -- Staats' Fishing Pole
						6256, -- Fishing Pole
						6366, -- Darkwood Fishing Pole
						6367, -- Big Iron Fishing Pole
						25978, -- Seth's Graphite Fishing Pole
						19022, -- Nat Pagles Extreme Angler FC-5000
						45858, -- Nat's Lucky Fishing Pole
						45992, -- Jeweled Fishing Pole
						45991, -- Bone Fishing Pole
						19970, -- Arcanite Fishing Pole
						44050, -- Mastercraft Kalu'ak Fishing Pole
						84661, -- Dragon Fishing Pole
						84660, -- Pandaren Fishing Pole
						120163, -- Thruk's Fishing Rod
						118381, -- Ephemeral Fishing Pole
						116826, -- Draenic Fishing Pole
						116825, -- Savage Fishing Pole
						133755, --Underlight Angler
						
						--Other Items--
						52716, --Twilight Fire Lance
						46106, --Argent Lance
						46069, --Alliance Lance
						46070, --Horde Lance
						37892, --Green Brewfest Stein
						32912, --Yellow Brewfest Stein
						33016, --Blue Brewfest Stein
						44731, --Bouquet of Ebon Roses
						22206} --Bouquet of Red Roses

local MountIDs = {
		[39710] = "Aviana's Guardian",
		[40719] = "Aviana's Guardian",
		[40720] = "Aviana's Guardian",
		[40723] = "Aviana's Guardian",
		}						
local ArgentMountIDs = {}
						
EquipmentBuddy:RegisterEvent("ADDON_LOADED")
EquipmentBuddy:RegisterEvent("PLAYER_REGEN_DISABLED")
EquipmentBuddy:RegisterEvent("PLAYER_ENTERING_WORLD")
EquipmentBuddy:RegisterEvent("EQUIPMENT_SWAP_FINISHED")
EquipmentBuddy:RegisterEvent("PLAYER_REGEN_ENABLED")
EquipmentBuddy:RegisterEvent("TRADE_SKILL_SHOW")
EquipmentBuddy:RegisterEvent("TRADE_SKILL_CLOSE")
EquipmentBuddy:RegisterEvent("UNIT_EXITED_VEHICLE")
EquipmentBuddy:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
--EquipmentBuddy:RegisterEvent("EQUIPMENT_SETS_CHANGED")


local function DoEquip() -- equip function
	local inInstance, instanceType = IsInInstance()	
	local currentSpec = GetSpecialization()
		if currentSpec == 1 then
			if instanceType == "party" or instanceType == "raid" then
				if ebname ~= nil then
				local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebname)
					if not isEquipped then
						UseEquipmentSet(ebname)
					end
				end
			elseif instanceType == "arena" or instanceType == "pvp" then
				if ebpvpname ~= nil then
				local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebpvpname)
					if not isEquipped then
						UseEquipmentSet(ebpvpname)
					end
				end
			elseif instanceType == "none" then
				for i,v in pairs(Items) do
				if IsEquippedItem(v) then
					if ebpvpmode == true and ebpvpname then
						UseEquipmentSet(ebpvpname)
					elseif ebpvpmode == nil  and ebname then
						UseEquipmentSet(ebname)
					end
				end
				end
			end
		elseif currentSpec == 2 then
			if instanceType == "party" or instanceType == "raid" then
				if ebname2 ~= nil then
				local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebname2)
					if not isEquipped then
						UseEquipmentSet(ebname2)
					end
				end
			elseif instanceType == "arena" or instanceType == "pvp" then
				if ebpvpname2 ~= nil then
				local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebpvpname2)
					if not isEquipped then
						UseEquipmentSet(ebpvpname2)
					end
				end
			elseif instanceType == "none" then
				for i,v in pairs(Items) do
				if IsEquippedItem(v) then
					if ebpvpmode == true and ebpvpname2 then
						UseEquipmentSet(ebpvpname2)
					elseif ebpvpmode == nil  and ebname2 then
						UseEquipmentSet(ebname2)
					end
				end
				end
			end
		elseif currentSpec == 3 then
			if instanceType == "party" or instanceType == "raid" then
				if ebname3 ~= nil then
				local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebname3)
					if not isEquipped then
						UseEquipmentSet(ebname3)
					end
				end
			elseif instanceType == "arena" or instanceType == "pvp" then
				if ebpvpname3 ~= nil then
				local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebpvpname3)
					if not isEquipped then
						UseEquipmentSet(ebpvpname3)
					end
				end
			elseif instanceType == "none" then
				for i,v in pairs(Items) do
				if IsEquippedItem(v) then
					if ebpvpmode == true and ebpvpname3 then
						UseEquipmentSet(ebpvpname3)
					elseif ebpvpmode == nil  and ebname3 then
						UseEquipmentSet(ebname3)
					end
				end
				end
			end
			elseif currentSpec == 4 then
			if instanceType == "party" or instanceType == "raid" then
				if ebname4 ~= nil then
				local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebname4)
					if not isEquipped then
						UseEquipmentSet(ebname4)
					end
				end
			elseif instanceType == "arena" or instanceType == "pvp" then
				if ebpvpname4 ~= nil then
				local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebpvpname4)
					if not isEquipped then
						UseEquipmentSet(ebpvpname4)
					end
				end
			elseif instanceType == "none" then
				for i,v in pairs(Items) do
				if IsEquippedItem(v) then
					if ebpvpmode == true and ebpvpname4 then
						UseEquipmentSet(ebpvpname4)
					elseif ebpvpmode == nil  and ebname4 then
						UseEquipmentSet(ebname4)
					end
				end
				end
			end
		end
end

local function eventHandler(self, event, ...)

if event == "ADDON_LOADED" then
local addon = ...
	if addon == "EquipmentBuddy" then
		if not ebname and not ebname2 and not ebpvpname and not ebpvpname2 and not ebname3 and not ebname4 and not ebpvpname3 and not ebpvpname4 then
			DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r No sets chosen. Please choose sets in the settings tab for this addon to work.")
		end
		 -- Set Stored Options
			if ebenable == true or ebenable == nil then
				myCheckButton_GlobalName:SetChecked(true)
			else
				myCheckButton_GlobalName:SetChecked(false)
			end
			if ebfishingmode == true then
				myCheckButton_GlobalName2:SetChecked(true)
			else
				myCheckButton_GlobalName2:SetChecked(false)
			end
			if ebcooking == true then
				myCheckButton_GlobalName3:SetChecked(true)
				UIDropDownMenu_EnableDropDown(Cookset)
				UIDropDownMenu_EnableDropDown(Cookpet)
			else
				myCheckButton_GlobalName3:SetChecked(false)
				UIDropDownMenu_DisableDropDown(Cookset)
				UIDropDownMenu_DisableDropDown(Cookpet)
			end
			if ebpvpmode == true then
				myCheckButton_GlobalName4:SetChecked(true)
			else
				myCheckButton_GlobalName4:SetChecked(false)
			end
			if ebjoustingmode == true then
				myCheckButton_GlobalName5:SetChecked(true)
			else
				myCheckButton_GlobalName5:SetChecked(false)
			end
			if ebspecmode == true then
				myCheckButton_GlobalName6:SetChecked(true)
			else
				myCheckButton_GlobalName6:SetChecked(false)
			end
			if ebinstance == true or ebinstance == nil then
				myCheckButton_GlobalName7:SetChecked(true)
			else
				myCheckButton_GlobalName7:SetChecked(false)
			end
			if ebcombat == true or ebcombat == nil then
				myCheckButton_GlobalName8:SetChecked(true)
			else
				myCheckButton_GlobalName8:SetChecked(false)
			end
			if ebname then
				UIDropDownMenu_SetText(Mydropdown, ebname)
			end
			if ebname2 then
				UIDropDownMenu_SetText(Secondary, ebname2)
			end
			if ebname3 then
				UIDropDownMenu_SetText(Seventh, ebname3)
			end
			if ebname4 then
				UIDropDownMenu_SetText(Eighth, ebname4)
			end
			if ebpvpname then
				UIDropDownMenu_SetText(Fifth, ebpvpname)
			end
			if ebpvpname2 then
				UIDropDownMenu_SetText(Sixth, ebpvpname2)
			end
			if ebpvpname3 then
				UIDropDownMenu_SetText(Ninth, ebpvpname3)
			end
			if ebpvpname4 then
				UIDropDownMenu_SetText(Tenth, ebpvpname4)
			end
			if ebcookingname then
				UIDropDownMenu_SetText(Cookset, ebcookingname)
			end
			if ebpetname then
				UIDropDownMenu_SetText(Cookpet, ebpetname)
			end
		--end
		if UnitFactionGroup("player") == "Alliance" then
			ArgentMountIDs ={
				[33790] = "Stabled Exodar Elekk",
				[33793] = "Stabled Gnomeregan Mechanostrider",
				[33794] = "Stabled Darnassian Nightsaber",
				[33795] = "Stabled Ironforge Ram",
				[33800] = "Stabled Stormwind Steed",
				[33843] = "Stabled Quel'dorei Steed",
				[36557] = "Argent Warhorse",
				[33870] = "Stabled Argent Warhorse",
				[34125] = "Stabled Campaign Warhorse",
			}
		else
			 ArgentMountIDs ={
				[33791] = "Stabled Silvermoon Hawkstrider",
				[33792] = "Stabled Thunder Bluff Kodo",
				[33796] = "Stabled Darkspear Raptor",
				[33798] = "Stabled Forsaken Warhorse",
				[33799] = "Stabled Orgrimmar Wolf",
				[33842] = "Stabled Sunreaver Hawkstrider",
				[36558] = "Argent Battleworg",
				[33870] = "Stabled Argent Warhorse",
				[34125] = "Stabled Campaign Warhorse",
			}
		end
	end

elseif event == "PLAYER_REGEN_DISABLED" then -- entered combat, equip a weapon if no suitable weapon
	if ebenable == false or UnitInVehicle("player") or ebcombat == false then
		return;
	else
		local inInstance, instanceType = IsInInstance()
		if not inInstance then
			DoEquip()
		end
	end

elseif event == "PLAYER_ENTERING_WORLD" then
	if ebenable == false then
		return;
	end
	local inInstance, instanceType = IsInInstance() 
	if inInstance and ebinstance ~= false then -- set determined and zoned into an instance
		DoEquip()
	end
	if eblastset and ebfishingmode == true then
		if not inInstance then 
			local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(eblastset)
			if isEquipped then
				return; -- already equipped do nothing
			end
			UseEquipmentSet(eblastset) -- not the last set, re-equip last set
			RaidNotice_AddMessage( RaidWarningFrame, string.format("|cffffff00EquipmentBuddy:|r Switched back to set |cff00ff00 %s|r", eblastset ), ChatTypeInfo["RAID_WARNING"] );	
			
		end
	end

elseif event == "EQUIPMENT_SWAP_FINISHED" then -- finished equipping a gearset
local ok, setname = ...
	if ebenable == false then 
		return;
	end
	
	--[[if ok and UnitAffectingCombat("player") and not UnitInVehicle("player") then
		RaidNotice_AddMessage( RaidWarningFrame, string.format("|cffffff00EquipmentBuddy:|r Switched to set |cff00ff00 %s|r", setname ), ChatTypeInfo["RAID_WARNING"] );
	else]]if not ok and UnitAffectingCombat("player") and not UnitInVehicle("player") then
		RaidNotice_AddMessage( RaidWarningFrame, string.format("|cffffff00EquipmentBuddy:|r Could not switch to set |cff00ff00 %s|r", setname ), ChatTypeInfo["RAID_WARNING"] );
		queueset = true --couldn't swap so queue set
	end
	local inInstance, instanceType = IsInInstance()
	if not UnitAffectingCombat("player") and not inInstance then
		local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(setname)
		if ok == true and missingItems == 0 and eblastset ~= setname then	-- indicates a usable set
			eblastset = setname
		end
	end

elseif event == "PLAYER_REGEN_ENABLED" then
	if not eblastset or ebenable == false or UnitInVehicle("player") then
		return;
	end	
	local inInstance, instanceType = IsInInstance()
	
	if ebfishingmode == true then
		if not inInstance then 		
		local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(eblastset)
			if isEquipped then
				return;
			end
		UseEquipmentSet(eblastset) -- not the last set, re-equip last set
		--RaidNotice_AddMessage( RaidWarningFrame, string.format("|cffffff00EquipmentBuddy:|r Switched back to set |cff00ff00 %s|r", eblastset ), ChatTypeInfo["RAID_WARNING"] );	
			
	end
	end
	if queueset == true then -- set couldn't be equipped so do so now
		if ebfishingmode == true then
			local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(eblastset)
				if isEquipped then
					queueset = nil -- set is already on do nothing
				end	
		else
			DoEquip()
			queueset = nil --set equipped clear queued set
		end
	end
elseif event == "TRADE_SKILL_SHOW" then -- for cooking set
	if not ebcooking or ebenable == false or UnitInVehicle("player") then
		return;
	end
	if not C_TradeSkillUI.IsTradeSkillLinked() and C_TradeSkillUI.GetTradeSkillLine() == 185 and not InCombatLockdown() then
		if ebcooking == true and ebcookingname then
			for i = 1, GetNumEquipmentSets() do
			local name, icon, setID, isEquipped, totalItems, equippedItems, inventoryItems, missingItems, ignoredSlots = GetEquipmentSetInfo(i)
				if isEquipped then
					eblastcookingset = name
					if name == ebcookingname then
						return;
					end
				end
			end
				UseEquipmentSet(ebcookingname)
				if ebpetID then
					local summonedPetID = C_PetJournal.GetSummonedPetGUID();
					if summonedPetID ~= ebpetID then
						C_PetJournal.SummonPetByGUID(ebpetID)
						ebpetwassummoned = true
					end
				end
		end
	end
elseif event == "TRADE_SKILL_CLOSE" then
	if not ebcooking or ebenable == false or UnitInVehicle("player") then
		return;
	end
	if not InCombatLockdown() and eblastcookingset then
			local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(eblastcookingset)
			if isEquipped then
				return;
			end
		UseEquipmentSet(eblastcookingset)
		eblastcookingset = nil
		if ebpetID then
			local summonedPetID = C_PetJournal.GetSummonedPetGUID();
			if summonedPetID == ebpetID and ebpetwassummoned then
				C_PetJournal.SummonPetByGUID(ebpetID)
				ebpetwassummoned = nil
			end
		end
	end
elseif event == "UNIT_EXITED_VEHICLE" then
local unit = ...
	--DEFAULT_CHAT_FRAME:AddMessage("exited vehicle") -- debug message
	if not ebjoustingmode or ebenable == false or UnitInVehicle("player") or unit ~= "player" then
		return;
	end
	if ebfishingmode == true and eblastset~= nil and unit == "player" and not UnitAffectingCombat("player") then
		if IsEquippedItem(52716) or IsEquippedItem(46106) or IsEquippedItem(46069) or IsEquippedItem(46070) then -- was jousting
		local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(eblastset)
			if not isEquipped then
				UseEquipmentSet(eblastset)
				--RaidNotice_AddMessage( RaidWarningFrame, string.format("|cffffff00EquipmentBuddy:|r Switched back to set |cff00ff00 %s|r", eblastset ), ChatTypeInfo["RAID_WARNING"] );	
			end
		end
	end

--elseif event == "EQUIPMENT_SETS_CHANGED" then
	--for i = 1, GetNumEquipmentSets() do
		--local name, icon, setID, isEquipped, totalItems, equippedItems, inventoryItems, missingItems, ignoredSlots = GetEquipmentSetInfo(i)
	--end

	
elseif event == "ACTIVE_TALENT_GROUP_CHANGED" then
local talentgroup = ...	
	if ebenable == false or ebspecmode == nil then 
		return;
	end
	local currentSpec = GetSpecialization()
	if currentSpec == 1 then
		if ebpvpmode == true and ebpvpname ~= nil then
		local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebpvpname)
				if not isEquipped then
					UseEquipmentSet(ebpvpname)
					--eblastset = ebpvpname
				end
		elseif ebpvpmode == nil and ebname ~= nil then
		local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebname)
				if not isEquipped then
					UseEquipmentSet(ebname)
					--eblastset = ebname
				end
		end
	elseif currentSpec == 2 then
		if ebpvpmode == true and ebpvpname2 ~= nil then
		local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebpvpname2)
				if not isEquipped then
					UseEquipmentSet(ebpvpname2)
					--eblastset = ebpvpname2
				end
		elseif ebpvpmode == nil and ebname2 ~= nil then
		local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebname2)
				if not isEquipped then
					UseEquipmentSet(ebname2)
					--eblastset = ebname2
				end
		end
	elseif currentSpec == 3 then
		if ebpvpmode == true and ebpvpname3 ~= nil then
		local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebpvpname3)
				if not isEquipped then
					UseEquipmentSet(ebpvpname3)
					--eblastset = ebpvpname3
				end
		elseif ebpvpmode == nil and ebname3 ~= nil then
		local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebname3)
				if not isEquipped then
					UseEquipmentSet(ebname3)
					--eblastset = ebname3
				end
		end
	elseif currentSpec == 4 then
		if ebpvpmode == true and ebpvpname4 ~= nil then
		local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebpvpname4)
				if not isEquipped then
					UseEquipmentSet(ebpvpname4)
					--eblastset = ebpvpname4
				end
		elseif ebpvpmode == nil and ebname4 ~= nil then
		local icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(ebname4)
				if not isEquipped then
					UseEquipmentSet(ebname4)
					--eblastset = ebname4
				end
		end
	end
end
end
EquipmentBuddy:SetScript("OnEvent", eventHandler)

local function Lance(self, ...)
	if not ebjoustingmode or ebenable == false or UnitInVehicle("player") then
		return;
	end
	local unitGUID = UnitGUID("mouseover")
	--DEFAULT_CHAT_FRAME:AddMessage(unitGUID) -- debug message
	if not unitGUID then
		return
	end
	
	local unitType = unitGUID:sub(5, 5)
	
	if unitType ~= "3" and unitType ~= "5" then
       return
	end
	local inRange = CheckInteractDistance("mouseover", 3);
	local npcID = tonumber(unitGUID:sub(7, 10), 16)

	if MountIDs[npcID] then
        if inRange then
		if GetItemCount(52716) > 0 then
			EquipItemByName(52716)
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r You do not have a lance in your bags.")
		end
		end
    end
	if ArgentMountIDs[npcID] then
		if inRange then
		if GetItemCount(46106) > 0 then
			EquipItemByName(46106)
		elseif GetItemCount(46069) > 0 then
			EquipItemByName(46069)
		elseif GetItemCount(46070) > 0 then
			EquipItemByName(46070)
		elseif GetItemCount(46106) == 0 and GetItemCount(46069) == 0 and GetItemCount(46070) == 0 then
			DEFAULT_CHAT_FRAME:AddMessage("|cffffff00EquipmentBuddy:|r You do not have a lance in your bags.")
		end
		end
	end
end
GameTooltip:HookScript("OnShow", Lance)