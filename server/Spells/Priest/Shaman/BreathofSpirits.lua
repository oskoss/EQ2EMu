--[[
    Script Name    : Spells/Priest/Shaman/BreathofSpirits.lua
    Script Author  : LordPazuzu
    Script Date    : 3/13/2024
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel= 14
    Mastery = SpellLevel + 10
    StatBonus = GetWis(Caster) / 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    HealBonus = LvlBonus + StatBonus
    MinHeal = MinVal + math.floor(HealBonus *2)
    MaxHeal = MaxVal + math.floor(HealBonus *2)
    
    SpellHeal("Heal", MinHeal, MaxHeal)
end


