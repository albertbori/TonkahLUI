local mod = DBM:NewMod(543, "DBM-Party-BC", 9, 252)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 606 $"):sub(12, -3))

mod:SetCreatureID(18473)
mod:SetEncounterID(1902)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 38197 40425",
	"SPELL_AURA_APPLIED 38245 43309"
)

local warnSheep					= mod:NewTargetAnnounce(38245, 3)

local specWarnArcaneExplosion	= mod:NewSpecialWarningSpell(38197, nil, nil, nil, 2, 2)

local timerArcaneExplosion		= mod:NewCastTimer(5, 38197, nil, nil, nil, 2)

local voiceArcaneExplosion		= mod:NewVoice(38197)--findshelter



function mod:SPELL_CAST_START(args)
	if args:IsSpellID(38197, 40425) then
		specWarnArcaneExplosion:Show()
		voiceArcaneExplosion:Play("findshelter")
		timerArcaneExplosion:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(38245, 43309) then
		warnSheep:Show(args.destName)
	end
end