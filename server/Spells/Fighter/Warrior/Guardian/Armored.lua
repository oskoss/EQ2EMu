--[[
	Script Name	: Armored
	Script Purpose	: Guardian Defensive Stance script
	Script Author	: Zcoretri
	Script Date	: 2010.01.26
	Script Note	: Need "worn armor" effectiveness
--]]

function cast(Caster, Target, Physical, Avoidance, SkillAmt, Aggression, Defense, MitNox, MitElem, WornArmor)

    AddSpellBonus(Caster, 200, Physical)        -- physical
    AddSpellBonus(Caster, 696, Avoidance)       -- avoidance
    AddSpellBonus(Caster, 202, MitNox)          -- mitigation against noxious
    AddSpellBonus(Caster, 203, MitNox)          -- mitigation against arcane
    AddSpellBonus(Caster, 201, MitElem)         -- mitigation against elemental

    AddSkillBonus(Caster, 418532101, SkillAmt)  -- slashing
    AddSkillBonus(Caster, 3421494576, SkillAmt) -- crushing
    AddSkillBonus(Caster, 3048574950, SkillAmt) -- piercing
    AddSkillBonus(Caster, 723762198, Aggression)-- aggression
    AddSkillBonus(Caster, 609880714, Defense)   -- defense

    -- Increases the caster's effectiveness of worn armor vs physical damage by 15%
    -- TODO
end


function remove(Caster, Target)
    RemoveSkillBonus(Caster)
    RemoveSpellBonus(Caster)
end