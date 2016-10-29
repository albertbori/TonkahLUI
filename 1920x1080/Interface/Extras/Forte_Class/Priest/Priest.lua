--ForteXorcist v1.980.8 by Xus 28-09-2012 for 5.0


if FW.CLASS == "PRIEST" then
	local FW = FW;
	local FWL = FW.L;
	local PR = FW:ClassModule("Priest");
	
	local ST = FW:Module("Timer");
	local CA = FW:Module("Casting");
	local CD = FW:Module("Cooldown");
	
	FW:RegisterSet("Absolution Regalia",31061,31064,31067,31070,31065,34434,34528,34563);
	FW:RegisterSet("Velen's/Zabra's Regalia",
		48072,48073,48074,48075,48076,
		48077,48078,48079,48080,48081,
		48082,48083,48084,48085,48086,
		48087,48088,48089,48090,48091,
		48092,48093,48094,48095,48096,
		48097,48098,48099,48100,48101
	);	
		
	if ST then
		local F = ST.F;
		ST:SetDefaultHasted(1)
		
		:AddChannel(64843,1,2) -- Divine Hymn
 		
 		:AddSpell(  589,  18,"Default",	F.TICKS):SetSpellModSetB("Absolution Regalia",2,3) -- Shadow Word: Pain
		:AddSpell(34914,  15,"Default",	F.TICKS):SetSpellModSetB("Velen's/Zabra's Regalia",2,6) -- Vampiric Touch
 		:AddSpell(34433,  12,"Pet",		F.SUMMON) -- Shadowfiend
 		:AddSpell( 8122,   8,"Crowd",	F.AOE):SetSpellModGlph(56177,2) -- Psychic Scream
 		:AddSpell( 9484,  50,"Crowd",	F.UNIQUE) -- Shackle Undead
		--:AddSpell(  453,  15,"Crowd",	F.UNIQUE) -- Mind Soothe
		:AddSpell(   17,  15,"Buff",	F.BUFF) -- Power Word: Shield
		:AddSpell(  139,  12,"Heal",	F.HOT) -- Renew
		
		:AddSpell(158831,  6,"Default",F.TICKS):SetTickSpeed(1) -- Devouring Plague
		
		:AddSpell(15487,   5,"Crowd",	F.UNIQUE) -- Silence
		:AddSpell(14914,   7,"Default",	F.TICKS):SetTickSpeed(1) -- holy fire
		:AddSpell(33076,  30,"Buff",	F.BUFF) -- Prayer of Mending
		--:AddSpell(14893,  15,"Buff",	F.BUFF) -- Inspiration
		:AddSpell(33206,   8,"Buff",	F.BUFF) -- Pain Suppression
		:AddSpell(10060,  15,"Buff",	F.BUFF) -- Power Infusion
		:AddSpell(47788,  10,"Buff",	F.BUFF) -- Guardian Spirit
		:AddSpell(47515,  12,"Buff",	F.BUFF) -- Divine Aegis (PASSIVE)
		:AddSpell(70772,   9,"Heal",	F.HOT) -- Blessed Healing (2 set T10)
		
		:AddSpell(77485,   6,"Heal",	F.HOT):SetTickSpeed(1) -- Echo of Light
		
		:AddSpell(605,    30,"Pet",		F.CHARM) -- Dominate Mind
		
		:AddSpell(88625,   3,"Crowd",	F.UNIQUE) --Holy Word: Chastise
		
		:AddCooldown( 8092, 8) -- Mind Blast
		:AddCooldown(32379, 8) -- Shadow Word: Death
		
		:AddCooldown(88625,25) -- Holy Word: Chastise 
		:AddCooldown(88684,10) -- Holy Word: Serenity 
		:AddCooldown(88686,18) -- Holy Word: Sanctuary
	
		:AddCooldown(108920,30) -- Void Tendris
		:AddCooldown(123040,60) -- Mindbender
		
		----------
				
		-- id/name, hastarget, tickspeed
		:AddChannel(15407,1,1) -- Mind Flay
		:AddChannel(48045,1,1) -- Mind Sear
		:AddChannel(129197,1,1) -- Mind Sear
		
		--Priest Buffs
		:AddBuff(63735) -- Serendipity
		:AddBuff(128654) -- Surge of Light
		:AddBuff(59889) -- Borrowed Time
		--:AddBuff(34754) -- Holy Concentration
		:AddBuff(586) -- Fade
		:AddBuff(588) -- Inner fire
		:AddBuff(73413) -- Inner Will
		--:AddBuff(15257) -- Shadow Weaving
		:AddBuff(47585)  -- Dispersion
		:AddBuff(15286) -- Vampiric Embrace
		--:AddBuff(45237) -- Focused Will
		:AddBuff(77487) -- Shadow Orb
		--:AddBuff(95799) -- Empowered Shadow
		
		:AddBuff(81662) -- Evangelism
		--:AddBuff(87118) -- Dark Evangelism
		:AddBuff(81700) -- Archangel
		:AddBuff(87153) -- Dark Archangel
		
		-- weakened soul
 		:AddDebuff(6788)	
		:AddBuff(119032) -- t1-2
		
		:AddSpell(155361, 60,"Default",	F.TICKS) --t7-2

		:AddSpell(124430,   10,"Buff",	F.BUFF) --
		:AddSpell(123267,   10,"Buff",	F.BUFF) --
		:AddSpell(123254,   10,"Buff",	F.BUFF) -- TOF


		:AddSpell(64044,   45,"Crowd",	F.UNIQUE) -- √лубинный ужас
		
		:AddSpell(152118, 20,"Buff",	F.BUFF) -- ясность воли
		
		:AddCasterBuffs()
	end
	if CD then
		do
			local PLAYER = FW.PLAYER;
			local rapture,texture = FW:SpellName(47755); -- use name instead of id because of diff ranks
			local select = select;
			local function PR_CombatLogEvent(event,...)
				if select(5,...) == PLAYER and select(13,...) == rapture then
					CD:HiddenCooldown(rapture, 012, texture);
				end
			end
			FW:RegisterToEvent("COMBAT_LOG_EVENT_UNFILTERED",	PR_CombatLogEvent);
		end

		do
			local set2t17 = false
			local t17set = { 115560, 115561, 115562, 115563, 115564}
			local shadowSpec = 258
			
			local function Detect2T17()
				set2t17 = false
				local t17items = 0
				
				local currentSpec = GetSpecialization()
				local currentSpecID = currentSpec and GetSpecializationInfo(currentSpec) or 0
				
				if currentSpecID ~= shadowSpec then return end
				
				for i=1, #t17set do
					if IsEquippedItem(t17set[i]) then
						t17items = t17items + 1
					end
				end
				if t17items >= 2 then 
					set2t17 = true
					print("ForteXprcist 2pT17 Enabled. Spec", currentSpecID)
				else
					print("ForteXprcist 2pT17 Disabled. Spec", currentSpecID)
				end
			end
			
			FW:RegisterToEvent("PLAYER_ENTERING_WORLD",	Detect2T17);
			FW:RegisterToEvent("PLAYER_EQUIPMENT_CHANGED",	Detect2T17);
			FW:RegisterToEvent("PLAYER_SPECIALIZATION_CHANGED",	function(event, unit)
				unit = unit or "player"
				if unit ~= "player" then return end				
				Detect2T17()
			end);
			
			local function UpdateMBCooldown() 
				local numOrbs = UnitPower("player", SPELL_POWER_SHADOW_ORBS)
				local spell, rank, icon = GetSpellInfo(8092)
				local start, duration = GetSpellCooldown(8092)
				
				CD:CheckCooldown(spell,start,duration,icon,"Spell");
			end
	
			FW:RegisterToEvent("UNIT_POWER_FREQUENT", function(event, unit, power)
				if not set2t17 then return end
				if unit ~= "player" then return end
				if power ~= "SHADOW_ORBS" then return end
				
				UpdateMBCooldown() 
			end);
			
		end
		
		CD:AddCasterPowerupCooldowns();
	end
end
