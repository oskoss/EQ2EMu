--[[
    Script Name    : Spells/Fighter/Brawler/IndomitableWill.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.03 04:09:43
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, BaseCure)
    Level = GetLevel(Caster)
    SpellLevel = 13
    Mastery = SpellLevel + 10
    StatBonus = GetStr(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    TotalCure = BaseCure + LvlBonus
    
    CureByType(1,2,"", TotalCure)

end


