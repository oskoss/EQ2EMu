--[[
    Script Name    : Spells/Headbutt.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.28 06:12:18
    Script Purpose : 
                   : 
--]]

function cast (NPC, Spawn)
    local MinVal =  4  
    local MaxVal =  6
    local MinPow =  -10 
    local MaxPow = -12
    damage(NPC,Spawn, MinVal, MaxVal, MinPow, MaxPow)
end

function tick (NPC, Spawn)
    local MinVal =  3  
    local MaxVal =  3
    local MinPow =  -8 
    local MaxPow = -9
    damage(NPC,Spawn, MinVal, MaxVal, MinPow, MaxPow)
end

function damage(NPC,Spawn, MinVal, MaxVal, MinPow, MaxPow)
    DmgBonus = GetInt(caster)/10
    MaxDmg = MaxVal + math.floor(DmgBonus)
    MinDmg = MinVal + math.floor(DmgBonus)
    DrainMin = MinPow - math.floor(DmgBonus)
    DrainMax = MaxPow - math.floor(DmgBonus)
    SpellDamage(Target, 3, MinDmg, MaxDmg)
    ModifyPower(Target, MakeRandomInt(DrainMin, DrainMax))
end

function remove (NPC, Spawn)
    
end
