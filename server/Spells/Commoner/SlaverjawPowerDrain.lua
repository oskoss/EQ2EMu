--[[
    Script Name    : Spells/Commoner/SlaverjawPowerDrain.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.27 08:09:52
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target)
    AddProc(Caster, 1, 100.0)

end

function proc(Caster, Target)
    if type == 1 then
        ModifyPower(Target, -7)
    end
    
end


function remove(Caster, Target)
    RemoveProc(Caster)
end

