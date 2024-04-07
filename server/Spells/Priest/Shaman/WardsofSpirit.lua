--[[
    Script Name    : Spells/Priest/Shaman/WardsofSpirit.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.14 04:03:01
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, BaseWard)
    Level = GetLevel(Caster)
    SpellLevel= 14
    Mastery = SpellLevel + 10
    StatBonus = GetWis(Caster) / 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    WardBonus = LvlBonus + StatBonus
    TotalWard = math.floor(WardBonus * 2) + BaseWard
    
    AddWard(TotalWard, 1)
end

function remove(Caster, Target)
    RemoveWard(Ward)
end
