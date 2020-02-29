--[[
    Script Name    : Spells/Fighter/Crusader/Paladin/WrathStance.lua
    Script Author  : Jabantiz
    Script Date    : 2013.12.05 06:12:58
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, statBonus, skillReduction, skillBonus)
    -- Increases STR of caster by 11.9
    AddSpellBonus(Target, 0, statBonus)
    -- Decreases Defense of caster by 1.8
    AddSkillBonus(Target, 609880714, skillReduction)
    -- Increases Disruption, Slashing, Piercing and Crushing of caster by 2.4
    AddSkillBonus(Target, 613995491, skillBonus)
    AddSkillBonus(Target, 418532101, skillBonus)
    AddSkillBonus(Target, 3048574950, skillBonus)
    AddSkillBonus(Target, 3421494576, skillBonus)
    
end

function remove(Caster, Target)
    RemoveSpellBonus(Target)
    RemoveSkillBonus(Target)
end
