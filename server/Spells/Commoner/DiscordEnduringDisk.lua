--[[
    Script Name    : Spells/Commoner/DiscordEnduringDisk.lua
    Script Author  : Skywalker646
    Script Date    : 2020.04.06 07:04:45
    Script Purpose : 
                   : 
--]]

function precast(Caster)
 if GetMount(Caster) > 0 then
        return false
    end

    return true
end

function cast(Caster, Target, Speed, Health)  
-- Summons a mount
SetMount(Caster, 10978)
    Say(Caster, "Might not be accurate model")


-- Increases your ground speed by 130%    
AddSpellBonus(Caster, 611, Speed, Speed)


--Increases Max Heath of caster by 300.0
    AddSpellBonus(Caster, 606, Health)



end


function remove(Caster, Target)
SetMount(Caster, 0)
    RemoveSpellBonus(Caster)
    RemoveSkillBonus(Caster)
end