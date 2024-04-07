--[[
    Script Name    : Spells/Fighter/Brawler/StaggeringStance.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.29 05:09:28
    Script Purpose : 
                   : 
--]]
--Note: Need to replace deflection with agility
function cast(Caster, Target, Chance, Agi)
    Level = GetLevel(Caster)
    SpellLevel = 18
    Mastery = SpellLevel + 10

    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    TotalAgi= LvlBonus * .5 + Agi
    
    AddSpellBonus(Caster, 2, TotalAgi)
    --AddProc(Target, 4, Chance)

end

function proc(Caster, Target, Type)
        Say(Caster, "Avoidance buff not implemented.")

end

   
function remove(Caster, Target)
        RemoveSkillBonus(Caster)

end

