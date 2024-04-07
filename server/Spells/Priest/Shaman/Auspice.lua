--[[
    Script Name    : Spells/Priest/Shaman/Auspice.lua
    Script Author  : LordPazuzu
    Script Date    : 3/14/2024
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, Power, Health)
    Level = GetLevel(Caster)
    SpellLevel = 16
    Mastery = SpellLevel + 10
    StatBonus = GetWis(Caster) / 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    Bonus = math.floor(StatBonus + LvlBonus)/2
    TotalPower = Power + Bonus 
    TotalHP = Health + Bonus

    AddSpellBonus(Target, 619, TotalPower)
    AddSpellBonus(Target, 606, TotalHP)
end

function remove(Caster, Target)
    RemoveSpellBonus(Target)

end

