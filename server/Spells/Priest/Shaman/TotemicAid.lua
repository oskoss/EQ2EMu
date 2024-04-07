--[[
    Script Name    : Spells/Priest/Shaman/TotemicAid.lua
    Script Author  : LordPazuzu
    Script Date    : 3/15/2024
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel= 17
    Mastery = SpellLevel + 10
    StatBonus = GetWis(Caster) / 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    HealBonus = math.floor(LvlBonus + StatBonus) * 2
    MinHeal = MinVal + HealBonus
    MaxHeal = MaxVal + HealBonus
    
    SpellHeal("Heal", MinHeal, MaxHeal)
    CureByType(1, 3, "", (GetLevel(Caster) * 1.08) + 1)
end

function remove(Caster, Target)
    RemoveSpellBonus(Target)

end

