--[[
    Script Name    : Spells/Priest/Shaman/HealingRitual.lua
    Script Author  : neatz09
    Script Date    : 2019.12.14 02:12:03
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel= 18
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
end

function remove(Caster, Target)
    RemoveSpellBonus(Target)

end
