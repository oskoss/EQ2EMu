--[[
    Script Name    : Spells/Priest/Shaman/EidolicWard.lua
    Script Author  : LordPazuzu
    Script Date    : 3/14/2024
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, BaseWard)
    Level = GetLevel(Caster)
    SpellLevel = 15
    Mastery = SpellLevel + 10
    StatBonus = GetWis(Caster) / 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    WardBonus = LvlBonus + StatBonus
    TotalWard = BaseWard + math.floor(WardBonus * 2)

    AddWard(TotalWard)
end

function remove(Caster, Target)
    local heal = GetWardAmountLeft(Target)
    SpellHeal("Heal", heal, heal)
    RemoveWard(Caster)
end

