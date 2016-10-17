-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2016 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{["Armor"] = 9.99, ["Leech"] = 3.52, ["Versatility"] = 2.71, ["HasteRating"] = 2.53, ["Stamina"] = 2.13, ["MasteryRating"] = 1.68, ["Avoidance"] = 1.66, ["CritRating"] = 1.64, ["Strength"] = 1.21, ["MinDamage"] = 0.06/2, ["MaxDamage"] = 0.06/2, ["MovementSpeed"] = 0.01}
) -- deathknightblood_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{["Strength"] = 8.07, ["CritRating"] = 6.8, ["HasteRating"] = 6.53, ["Versatility"] = 5.73, ["MasteryRating"] = 5.44, ["MinDamage"] = (3.25+1.75)/4, ["MaxDamage"] = (3.25+1.75)/4, ["MovementSpeed"] = 0.48, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
) -- deathknightfrost_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{["Strength"] = 8.23, ["CritRating"] = 6.9, ["HasteRating"] = 6.73, ["Versatility"] = 5.28, ["MasteryRating"] = 4.79, ["MinDamage"] = 1.96/2, ["MaxDamage"] = 1.96/2, ["MovementSpeed"] = 0.26, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
) -- deathknightunholy_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{["CritRating"] = 8.25, ["Agility"] = 8.14, ["Versatility"] = 6.96, ["HasteRating"] = 6.66, ["MinDamage"] = (6.53+2.45)/4, ["MaxDamage"] = (6.53+2.45)/4, ["MasteryRating"] = 6.19, ["MovementSpeed"] = 0.58, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
) -- demonhunterhavoc_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{["Armor"] = 12.76, ["Leech"] = 2.98, ["MasteryRating"] = 1.85, ["Versatility"] = 1.8, ["Stamina"] = 1.68, ["Agility"] = 1.67, ["HasteRating"] = 1.52, ["CritRating"] = 1.38, ["Avoidance"] = 1.35, ["MinDamage"] = (0.12+0)/4, ["MaxDamage"] = (0.12+0)/4, ["MovementSpeed"] = 0.01}
) -- demonhuntervengeance_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{["Intellect"] = 8.68, ["HasteRating"] = 7.57, ["CritRating"] = 6.33, ["Versatility"] = 6.21, ["MasteryRating"] = 5.78, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- druidbalance_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{["Agility"] = 11.59, ["CritRating"] = 7.9, ["Versatility"] = 7.43, ["HasteRating"] = 7.21, ["MasteryRating"] = 6.94, ["MinDamage"] = (5.07+0)/4, ["MaxDamage"] = (5.07+0)/4, ["Leech"] = 0.03, ["Avoidance"] = 0.02, ["MovementSpeed"] = 0.01}
) -- druidferal_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{["Armor"] = 13.94, ["Avoidance"] = 1.13, ["Versatility"] = 0.67, ["MasteryRating"] = 0.58, ["HasteRating"] = 0.43, ["CritRating"] = 0.33, ["Agility"] = 0.15, ["Leech"] = 0.07, ["Stamina"] = 0.03, ["MovementSpeed"] = 0.02, ["MinDamage"] = (0.01+0)/4, ["MaxDamage"] = (0.01+0)/4}
) -- druidguardian_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{["Intellect"] = 13.79, ["MasteryRating"] = 13.41, ["CritRating"] = 10.54, ["Versatility"] = 9.15, ["HasteRating"] = 6.8, ["Leech"] = 3.79, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- druidrestoration_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{["Agility"] = 9.09, ["MasteryRating"] = 7.35, ["HasteRating"] = 6.2, ["CritRating"] = 5.67, ["Versatility"] = 5.35, ["MinDamage"] = (1.68+0)/4, ["MaxDamage"] = (1.68+0)/4, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- hunterbeastmastery_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{["MasteryRating"] = 9.62, ["Agility"] = 7.82, ["MinDamage"] = (7.24+0)/2, ["MaxDamage"] = (7.24+0)/2, ["CritRating"] = 6.77, ["HasteRating"] = 6.58, ["Versatility"] = 5.83, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- huntermarksmanship_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{["Agility"] = 9.92, ["Versatility"] = 6.11, ["CritRating"] = 5.89, ["HasteRating"] = 5.03, ["MasteryRating"] = 2.58, ["MinDamage"] = (2.25+0)/2, ["MaxDamage"] = (2.25+0)/2, ["Leech"] = 0.03, ["Avoidance"] = 0.02, ["MovementSpeed"] = 0.01}
) -- huntersurvival_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{["Intellect"] = 7.73, ["MasteryRating"] = 6.46, ["CritRating"] = 6.27, ["Versatility"] = 6.09, ["HasteRating"] = 5.12, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- magearcane_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{["CritRating"] = 7.86, ["Intellect"] = 7.73, ["Versatility"] = 5.62, ["HasteRating"] = 5.55, ["MasteryRating"] = 5.15, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- magefire_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{["HasteRating"] = 8.87, ["Intellect"] = 8.83, ["CritRating"] = 8.05, ["Versatility"] = 6.18, ["MasteryRating"] = 5.2, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- magefrost_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{["Armor"] = 1.79, ["Leech"] = 1.64, ["CritRating"] = 1.43, ["Stamina"] = 1.39, ["Avoidance"] = 1.35, ["HasteRating"] = 0.66, ["MasteryRating"] = 0.53, ["Versatility"] = 0.45, ["Agility"] = 0.4, ["MovementSpeed"] = 0.02, ["MinDamage"] = (0.01+0)/2, ["MaxDamage"] = (0.01+0)/2}
) -- monkbrewmaster_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{["Intellect"] = 14.22, ["CritRating"] = 10.13, ["Versatility"] = 9.9, ["HasteRating"] = 5.05, ["MasteryRating"] = 4.59, ["Leech"] = 3.29, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- monkmistweaver_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{["Agility"] = 10.13, ["MasteryRating"] = 6.84, ["CritRating"] = 6.02, ["Versatility"] = 5.97, ["HasteRating"] = 4.55, ["MinDamage"] = (1.54+0.78)/4, ["MaxDamage"] = (1.54+0.78)/4, ["MovementSpeed"] = 0.23, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
) -- monkwindwalker_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{["Intellect"] = 14.76, ["MasteryRating"] = 13.29, ["CritRating"] = 12.23, ["Versatility"] = 9.91, ["Leech"] = 2.84, ["HasteRating"] = 0.31, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- paladinholy_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{["Armor"] = 4.92, ["Leech"] = 2.5, ["Avoidance"] = 2.01, ["Versatility"] = 1.51, ["MasteryRating"] = 1.37, ["HasteRating"] = 0.77, ["CritRating"] = 0.71, ["Stamina"] = 0.6, ["Strength"] = 0.54, ["MovementSpeed"] = 0.02, ["MinDamage"] = (0.01+0)/4, ["MaxDamage"] = (0.01+0)/4}
) -- paladinprotection_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{["HasteRating"] = 7.76, ["Strength"] = 7.6, ["CritRating"] = 6.34, ["Versatility"] = 6.03, ["MinDamage"] = (5.57+0)/4, ["MaxDamage"] = (5.57+0)/4, ["MasteryRating"] = 5.11, ["MovementSpeed"] = 0.31, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
) -- paladinretribution_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{["Intellect"] = 15.73, ["CritRating"] = 11.05, ["Versatility"] = 10.23, ["MasteryRating"] = 9.37, ["HasteRating"] = 6.83, ["Leech"] = 0.91, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- priestdiscipline_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{["Intellect"] = 14.75, ["CritRating"] = 12.4, ["MasteryRating"] = 11.08, ["Versatility"] = 9.72, ["HasteRating"] = 3.9, ["Leech"] = 2.61, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- priestholy_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{["HasteRating"] = 15.18, ["CritRating"] = 11.8, ["Intellect"] = 8.55, ["MasteryRating"] = 7.46, ["Versatility"] = 5.97, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- priestshadow_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{["Agility"] = 10.91, ["CritRating"] = 8.67, ["MasteryRating"] = 8.5, ["Versatility"] = 7.37, ["HasteRating"] = 5.15, ["MinDamage"] = (3.41+1.75)/4, ["MaxDamage"] = (3.41+1.75)/4, ["MovementSpeed"] = 0.65, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
) -- rogueassassination_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{["Agility"] = 10.73, ["MasteryRating"] = 8.13, ["Versatility"] = 7.11, ["HasteRating"] = 6.85, ["CritRating"] = 6.64, ["MinDamage"] = (3.2+1.53)/4, ["MaxDamage"] = (3.2+1.53)/4, ["MovementSpeed"] = 0.07, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
) -- rogueoutlaw_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{["Agility"] = 11.13, ["MasteryRating"] = 7.49, ["Versatility"] = 7.37, ["CritRating"] = 6.96, ["MinDamage"] = (6.43+0.52)/4, ["MaxDamage"] = (6.43+0.52)/4, ["HasteRating"] = 6.24, ["MovementSpeed"] = 0.46, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
) -- roguesubtlety_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{["Intellect"] = 8.2, ["CritRating"] = 7.19, ["HasteRating"] = 6.62, ["Versatility"] = 5.8, ["MasteryRating"] = 5.79, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- shamanelemental_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{["MasteryRating"] = 10.12, ["Agility"] = 9.83, ["HasteRating"] = 8.86, ["Versatility"] = 7.06, ["CritRating"] = 6.91, ["MinDamage"] = (4.81+1.78)/4, ["MaxDamage"] = (4.81+1.78)/4, ["MovementSpeed"] = 0.38, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
) -- shamanenhancement_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{["Intellect"] = 13.96, ["CritRating"] = 12.39, ["Versatility"] = 9.27, ["HasteRating"] = 7.84, ["MasteryRating"] = 10.12, ["Leech"] = 3.51, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- shamanrestoration_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{["HasteRating"] = 9.71, ["MasteryRating"] = 8.85, ["Intellect"] = 7.78, ["CritRating"] = 6.04, ["Versatility"] = 5.53, ["MovementSpeed"] = 0.05, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
) -- warlockaffliction_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{["HasteRating"] = 11.13, ["Intellect"] = 8.21, ["CritRating"] = 6.63, ["Versatility"] = 6.53, ["MasteryRating"] = 5.86, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- warlockdemonology_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{["HasteRating"] = 8.4, ["Intellect"] = 8.26, ["MasteryRating"] = 7.84, ["CritRating"] = 6.59, ["Versatility"] = 6.08, ["Leech"] = 0.03, ["MovementSpeed"] = 0.02, ["Avoidance"] = 0.01}
) -- warlockdestruction_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{["MasteryRating"] = 10.31, ["HasteRating"] = 8.02, ["Strength"] = 7.06, ["MinDamage"] = (6.84+0)/4, ["MaxDamage"] = (6.84+0)/4, ["Versatility"] = 5.99, ["CritRating"] = 5.22, ["Leech"] = 0.03, ["Avoidance"] = 0.02, ["MovementSpeed"] = 0.01}
) -- warriorarms_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{["HasteRating"] = 10.25, ["MasteryRating"] = 8.34, ["Versatility"] = 7.72, ["CritRating"] = 7.47, ["Strength"] = 7.05, ["MinDamage"] = (4.42+2.12)/4, ["MaxDamage"] = (4.42+2.12)/4, ["MovementSpeed"] = 0.28, ["Leech"] = 0.02, ["Avoidance"] = 0.01}
) -- warriorfury_pve_preraid

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{["Armor"] = 7.87, ["Leech"] = 2.37, ["Versatility"] = 2.28, ["Strength"] = 1.96, ["Avoidance"] = 1.86, ["MasteryRating"] = 1.8, ["Stamina"] = 0.89, ["CritRating"] = 0.66, ["HasteRating"] = 0.55, ["MovementSpeed"] = 0.02, ["MinDamage"] = (0.01+0)/4, ["MaxDamage"] = (0.01+0)/4}
) -- warriorprotection_pve_preraid

------------------------------------------------------------

-- PawnMrRobotScaleProviderOptions.LastAdded keeps track of the last time that we tried to automatically enable scales for this character.
if not PawnMrRobotScaleProviderOptions then PawnMrRobotScaleProviderOptions = { } end
if not PawnMrRobotScaleProviderOptions.LastAdded then PawnMrRobotScaleProviderOptions.LastAdded = 0 end

local _, Class = UnitClass("player")
if PawnMrRobotScaleProviderOptions.LastClass ~= nil and Class ~= PawnMrRobotScaleProviderOptions.LastClass then
	-- If the character has changed class since last time, let's start over.
	PawnSetAllScaleProviderScalesVisible(ScaleProviderName, false)
	PawnMrRobotScaleProviderOptions.LastAdded = 0
end
PawnMrRobotScaleProviderOptions.LastClass = Class

-- These scales are new, and we don't need any upgrade logic yet.
PawnMrRobotScaleProviderOptions.LastAdded = 1

-- After this function terminates there's no need for it anymore, so cause it to self-destruct to save memory.
PawnMrRobotScaleProvider_AddScales = nil

end -- PawnMrRobotScaleProvider_AddScales

------------------------------------------------------------

PawnAddPluginScaleProvider(ScaleProviderName, PawnLocal.UI.AskMrRobotProvider, PawnMrRobotScaleProvider_AddScales)
