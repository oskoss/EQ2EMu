--[[
    Script Name    : Spells/Priest/Shaman/SpectralWard.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.03.02 09:03:17
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, BaseWard)
    Level = GetLevel(Caster)
    SpellLevel = 12
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


