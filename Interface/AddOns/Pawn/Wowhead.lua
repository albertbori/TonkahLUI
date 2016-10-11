-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2016 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Wowhead scales
------------------------------------------------------------

local ScaleProviderName = "Wowhead"

function PawnWowheadScaleProvider_AddScales()



PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	nil, -- no stat value overrides
	1 -- normalize values
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	nil, -- no stat value overrides
	1 -- normalize values
)

------------------------------------------------------------

-- PawnWowheadScaleProviderOptions.LastAdded keeps track of the last time that we tried to automatically enable scales for this character.
if not PawnWowheadScaleProviderOptions then PawnWowheadScaleProviderOptions = { } end
if not PawnWowheadScaleProviderOptions.LastAdded then PawnWowheadScaleProviderOptions.LastAdded = 0 end

local _, Class = UnitClass("player")
if PawnWowheadScaleProviderOptions.LastClass ~= nil and Class ~= PawnWowheadScaleProviderOptions.LastClass then
	-- If the character has changed class since last time, let's start over.
	PawnSetAllScaleProviderScalesVisible(ScaleProviderName, false)
	PawnWowheadScaleProviderOptions.LastAdded = 0
end
PawnWowheadScaleProviderOptions.LastClass = Class

local function DeleteOldScale(Spec)
	local ScaleName = PawnGetProviderScaleName(ScaleProviderName, Spec)
	PawnCommon.Scales[ScaleName] = nil
	-- Also delete leftover starter scales from the WoD launch.
	ScaleName = PawnGetProviderScaleName("Starter", Spec)
	PawnCommon.Scales[ScaleName] = nil
end 

if PawnWowheadScaleProviderOptions.LastAdded < 5 then
	-- First, delete the old Wowhead scales, just to keep peoples' SavedVariables nice and tidy.
	DeleteOldScale("WarriorArms")
	DeleteOldScale("WarriorFury")
	DeleteOldScale("WarriorTank")
	DeleteOldScale("PaladinHoly")
	DeleteOldScale("PaladinTank")
	DeleteOldScale("PaladinRetribution")
	DeleteOldScale("HunterBeastMastery")
	DeleteOldScale("HunterMarksman")
	DeleteOldScale("HunterSurvival")
	DeleteOldScale("RogueAssassination")
	DeleteOldScale("RogueCombat")
	DeleteOldScale("RogueSubtlety")
	DeleteOldScale("PriestDiscipline")
	DeleteOldScale("PriestHoly")
	DeleteOldScale("PriestShadow")
	DeleteOldScale("DeathKnightBloodTank")
	DeleteOldScale("DeathKnightFrostDps")
	DeleteOldScale("DeathKnightUnholyDps")
	DeleteOldScale("ShamanElemental")
	DeleteOldScale("ShamanEnhancement")
	DeleteOldScale("ShamanRestoration")
	DeleteOldScale("MageArcane")
	DeleteOldScale("MageFire")
	DeleteOldScale("MageFrost")
	DeleteOldScale("WarlockAffliction")
	DeleteOldScale("WarlockDemonology")
	DeleteOldScale("WarlockDestruction")
	DeleteOldScale("DruidBalance")
	DeleteOldScale("DruidFeralDps")
	DeleteOldScale("DruidFeralTank")
	DeleteOldScale("DruidRestoration")
	DeleteOldScale("MonkBrewmaster")
	DeleteOldScale("MonkMistweaver")
	DeleteOldScale("MonkWindwalker")
	DeleteOldScale("DemonHunterTest")
	-- Then, enable the new scales.
	local Index
	for Index = 1, GetNumSpecializations() do
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, Class .. Index), true)
	end
end

-- Don't reenable those scales again after the user has disabled them previously.
PawnWowheadScaleProviderOptions.LastAdded = 5

-- After this function terminates there's no need for it anymore, so cause it to self-destruct to save memory.
PawnWowheadScaleProvider_AddScales = nil

end -- PawnWowheadScaleProvider_AddScales

------------------------------------------------------------

-- *** Change ProviderStarter to Provider when real Wowhead values are in
PawnAddPluginScaleProvider(ScaleProviderName, PawnLocal.Wowhead.ProviderStarter, PawnWowheadScaleProvider_AddScales)
