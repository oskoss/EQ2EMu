--[[
    Script Name    : Spells/Priest/Cleric/LadonCombatHealing.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.26 08:02:12
    Script Purpose : 
                   : 
--]]
function cast(Caster, Target, MinVal, MaxVal)
    Level = GetLevel(Caster)
    local zone = GetZone(Caster)
    local Ladon = GetSpawnByLocationID(zone, 300448)
    SpellLevel = 16
    Mastery = SpellLevel + 10
    StatBonus = GetWis(Caster) / 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    HealBonus = LvlBonus + StatBonus
    MinHeal = math.floor(HealBonus + MinVal) * 4 
    MaxHeal = math.floor(HealBonus + MaxVal) * 5 
    
    SpellHeal("Heal", MinHeal, MaxHeal, Ladon)
    
        

end
