--[[
    Script Name    : Spells/Commoner/Blind.lua
    Script Author  : terrible
    Script Date    : 2023.09.06 11:09:25
    Script Purpose : 
                   : 
--]]

--[[
 Applies Blind:
    1. Daze target
    2. Blur target
    3. Reduce movement of target
]]

function cast(Caster, Target, Timer, Snare)
    if not IsEpic(Target) then
        --Dazes the target
        AddControlEffect(Target, 3)
        BlurVision(Target, 1.0)
        SetSpeedMultiplier(Target, Snare)
    end
end

function remove(Caster, Target)
    RemoveControlEffect(Target, 3)
    BlurVision(Target, 0)
    SetSpeedMultiplier(Target, 1)
end