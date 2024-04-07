--[[
    Script Name    : Spells/Traditions/NecroticVenom.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.29 03:08:53
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, MainVal, DoTVal)
    Level = GetLevel(Caster)
    SpellLevel = 3
    Mastery = SpellLevel + 5
   
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    TotalDmg = MainVal + LvlBonus
    SpellDamage(Target, 2, TotalDmg, TotalDmg)
    if IsPlayer(Target) and GetClientVersion(Target) <= 526 then
    SpawnSet(Target,"visual_state",2774)
    else
    SpawnSet(Target,"visual_state",2774)
    end   
end


function tick(Caster, Target, MainVal, DoTVal)
    Level = GetLevel(Caster)
    SpellLevel = 3
    Mastery = SpellLevel + 5
   
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    PowerDrain = 0 - DoTVal - LvlBonus
    ModifyPower(Target, PowerDrain)
    --Emote(Caster, "'s Necrotic Venom poisons"...Target..."draining"...PowerDrain..."points of power.")
    if IsPlayer(Target) and GetClientVersion(Target) <= 526 then
    SpawnSet(Target,"visual_state",2774)
    else
    SpawnSet(Target,"visual_state",2774)
    end   
end

function remove(Caster, Target)
    SpawnSet(Target,"visual_state",35542)
end
