--[[
    Script Name    : Spells/Commoner/ShardLoveUnicorn.lua
    Script Author  : Skywalker646
    Script Date    : 2020.05.13 05:05:00
    Script Purpose : 
                   : 
--]]

function precast(Caster)
 if GetMount(Caster) > 0 then
        return false
    end

    return true
end

function cast(Caster, Target, Speed, SkillAmt)
--Summons a mount to ride    
SetMount(Caster, 9112)
SetMountColor(Caster, 255, 105, 180, 0, 0, 0)
    Say(Caster, "Model might not be accurate")


-- Increases your ground speed by 130%    
AddSpellBonus(Caster, 611, Speed)


end

function remove(Caster, Target)
SetMount(Caster, 0)
    RemoveSpellBonus(Caster)
    RemoveSkillBonus(Caster)
end