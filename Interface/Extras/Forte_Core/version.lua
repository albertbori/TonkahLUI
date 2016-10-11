local addon = ...
local C = {}
local __ver = 2
local addonChannel = "FXverCH"
local remindMeagain = true
local name
local string_match = string.match
local format = format
local SendAddonMessage = SendAddonMessage
local tonumber = tonumber
local sendmessagethottle = 20
local versioncheck = 0

if not IsAddonMessagePrefixRegistered(addonChannel) then
	RegisterAddonMessagePrefix(addonChannel)
end

function C:AddonMessage(msg, channel)

	if channel == "GUILD" and IsInGuild() then
		SendAddonMessage(addonChannel, msg, "GUILD")
	else
		local chatType = "PRINT"
		if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) or IsInRaid(LE_PARTY_CATEGORY_INSTANCE) then
			chatType = "INSTANCE_CHAT"
		elseif IsInRaid(LE_PARTY_CATEGORY_HOME) then
			chatType = "RAID"
		elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
			chatType = "PARTY"
		end
			
		if chatType == "PRINT" then
			
		else
			SendAddonMessage(addonChannel, msg, chatType)
		end
	end
end

local function constructVersion(ver)
	local d1, d2, d3 = strsplit(".", ver)
	
	d1 = d1 or "0"
	d2 = d2 or "0"
	d3 = d3 or "0"
	
	if #d2 == 1 then
	   d2 = "00"..d2
	end
	if #d2 == 2 then
	   d2 = "0"..d2
	end
	if #d3 == 1 then
	   d3 = "00"..d3
	end
	if #d3 == 2 then
	   d3 = "0"..d3
	end
	
	return tonumber(d1..d2..d3)
end

local events = CreateFrame("Frame")
events:SetScript("OnEvent", function(self, event, ...)
	self[event](self, event, ...)
end)

function events:CHAT_MSG_ADDON(event, prefix, message, channel, sender)
	if prefix ~= addonChannel then return end
	if sender == name then return end
	if not remindMeagain then return end	
	local version, source = strsplit(":", message)	
	if version and source then
		local cntrV = constructVersion(version)
		local cntrmV = constructVersion(C.myVersionT)
	
		if cntrV > cntrmV then
			remindMeagain = false
			print("ForteXorcist: New version".." "..version.." ".."availible on".." ".."http://aleaaddons.ru")
		end
	end
end

function events:SendAddonIndo()
	if GetTime() < versioncheck then return end
	versioncheck = GetTime() + sendmessagethottle
	C:AddonMessage(format("%s:%s", C.myVersionT, C.VersionSource))
end

function events:SendAddonIndo2()
	if GetTime() < versioncheck then return end
	versioncheck = GetTime() + sendmessagethottle
	C:AddonMessage(format("%s:%s", C.myVersionT, C.VersionSource , "GUILD"))
end

events.GROUP_ROSTER_UPDATE = events.SendAddonIndo
events.PLAYER_ENTERING_WORLD = events.SendAddonIndo2
events.PLAYER_ENTERING_BATTLEGROUND = events.SendAddonIndo
events.GROUP_JOINED = events.SendAddonIndo
events.RAID_INSTANCE_WELCOME = events.SendAddonIndo
events.ZONE_CHANGED_NEW_AREA = events.SendAddonIndo

events.GUILD_MOTD = events.SendAddonIndo2
events.GUILD_NEWS_UPDATE = events.SendAddonIndo2
events.GUILD_ROSTER_UPDATE = events.SendAddonIndo2


events:RegisterEvent("PLAYER_LOGIN")

function events:PLAYER_LOGIN()
	local version = GetAddOnMetadata(addon, "Version") or "0"
	local version_c = version:gsub("%.", "")
	
	name = UnitName("player").."-"..GetRealmName()

	C.myVersionT = version
	C.myVersion = tonumber(version_c) or 0
	C.VersionSource = GetAddOnMetadata(addon, "VersionType") or "main"
	
	print("ForteXorcist: Loaded v"..version..". New updates availible on".." ".."http://aleaaddons.ru")
	
	events:RegisterEvent("CHAT_MSG_ADDON")
	events:RegisterEvent("GROUP_ROSTER_UPDATE")
	events:RegisterEvent("PLAYER_ENTERING_WORLD")
	events:RegisterEvent("PLAYER_ENTERING_BATTLEGROUND")
	events:RegisterEvent("GROUP_JOINED")
	events:RegisterEvent("RAID_INSTANCE_WELCOME")
	events:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	events:RegisterEvent("GUILD_MOTD")
	events:RegisterEvent("GUILD_NEWS_UPDATE")
	events:RegisterEvent("GUILD_ROSTER_UPDATE")
	
	events:SendAddonIndo()
	events:SendAddonIndo2()
end

do
	local sptimers_developer = "\124TInterface\\Icons\\spell_shadow_shadowwordpain:%d\124t"
	local h2p_com = "\124TInterface\\AddOns\\"..addon.."\\media\\h2p_large_2_large:%d:%d:0:1:64:64:0:64:7:50\124t"
	local feraldd_com = "\124TInterface\\Icons\\ability_druid_catform:%d\124t"
	
	local highlighy_player = {	
	
		["Twintop-Kel'Thuzad"] = h2p_com,
		['Алеа-Термоштепсель'] = h2p_com,
		['Алеа-Гордунни'] = h2p_com,
		['Тэваро-Термоштепсель'] = h2p_com,
		["Spinalcrack-Mal'Ganis"] = h2p_com,
		['Ashleycakez-BleedingHollow'] = h2p_com,
		['Veiled-Server'] = h2p_com,
		
		['Val-TwistingNether'] = h2p_com,
		['Layline-TwistingNether'] = h2p_com,
		['Lavy-TwistingNether'] = h2p_com,		
		['Shayera-TwistingNether'] = h2p_com,
		['Michalka-TwistingNether'] = h2p_com,
		['Marliene-TwistingNether'] = h2p_com,

		['Blackmorgrim-Frostwolf'] = h2p_com,
		
		['Hygeiah-Anvilmar'] = h2p_com,
		['Derevka-Whisperwind'] = h2p_com,
		
		['Adinne-Exodar'] = h2p_com,
		['Vampzhampz-Stormreaver'] = h2p_com,
		
		["Elvenbane-Vek'nilash"] = h2p_com,
		["Naerchan-Mal'Ganis"] = h2p_com, 
		
		["Эйблтулав-Гордунни"] = feraldd_com,
	}

	local function GetToon(presID)
		if presID and tonumber(presID) then
			local _, toonName, client, realmName = BNGetToonInfo(tonumber(presID))
			local toonName2 = nil
			if client == "WoW" then
				toonName2 = format("%s-%s", toonName, gsub(realmName," ", ''))		
				return toonName2
			end
		end
		return toonName2
	end
	
	
	local hooks = {}
	local string_match = string.match
	local string_gsub = string.gsub
	local function AddMessage(frame, text, red, green, blue, messageId, holdTime)
		
		
		local name, fontSize = GetChatWindowInfo(frame:GetID())
		
		local name = string_match(text, "|Hplayer:([^:]+).-|h.-|h")		
		local bnpres = string_match(text, "|k:(%d+):(%d+):BN_WHISPER")
		
		if bnpres then
			local toon = GetToon(bnpres) 
			local highlight = highlighy_player[toon]

			if highlight then			
				text = string_gsub(text, "|HBNplayer:", format(highlight,fontSize, fontSize) .." %1")
			end
		elseif name then
			local highlight = highlighy_player[name]
			if highlight then
				text = string_gsub(text, "|Hplayer:", format(highlight,fontSize, fontSize).." %1")
			end			
		end

		return hooks[frame](frame, text, red, green, blue, messageId, holdTime)
	end

	local event = CreateFrame("Frame")
	event:RegisterEvent("PLAYER_LOGIN")
	event:SetScript("OnEvent", function(self, event, ...)

		if event == "PLAYER_LOGIN" then

			C_Timer.After(0.3, function()	
				for i = 1, NUM_CHAT_WINDOWS do
					if i ~= 2 then
						local frame = _G[("ChatFrame%d"):format(i)]
						
						if not frame.__aleaaddonsnameTargs then
							frame.__aleaaddonsnameTargs = true
							hooks[frame] = frame.AddMessage
							frame.AddMessage = AddMessage
						end
					end
					
				end
				
				local function checkForNewWindows()
					for i=NUM_CHAT_WINDOWS+1, NUM_CHAT_WINDOWS+10 do			
						local frame = _G[("ChatFrame%d"):format(i)]
						if frame and not hooks[frame] and not frame.__aleaaddonsnameTargs then
							frame.__aleaaddonsnameTargs = true
							hooks[frame] = frame.AddMessage
							frame.AddMessage = AddMessage
						end
					end
				end

				hooksecurefunc("FCF_OpenTemporaryWindow", checkForNewWindows)
			end)
		end
	end)
end