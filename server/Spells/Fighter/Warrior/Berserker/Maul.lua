--[[
    Script Name    : Spells/Fighter/Warrior/Berserker/Maul.lua
    Script Author  : Dello
    Script Date    : 10/06/2014
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, DmgType, MinVal, MaxVal, SkillAmt)

    AddSkillBonus(Target, GetSkillIDByName("Slashing"), SkillAmt)

    AddSkillBonus(Target, GetSkillIDByName("Piercing"), SkillAmt)

    AddSkillBonus(Target, GetSkillIDByName("Crushing"), SkillAmt)

    if MaxVal ~= nil and MinVal < MaxVal then
        SpellDamage(Target, DmgType, math.random(MinVal, MaxVal))
    else
        SpellDamage(Target, DmgType, MinVal)
    end
end

function remove(Caster, Target)
    RemoveSkillBonus(Target)
end
