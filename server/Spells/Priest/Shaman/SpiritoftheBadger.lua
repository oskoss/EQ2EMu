--[[
    Script Name    : Spells/Priest/Shaman/SpiritoftheBadger.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.16 08:03:38
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, BaseMit, Str)
    Level = GetLevel(Caster)
    SpellLevel =  19
    Mastery = SpellLevel + 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    TotalMit = LvlBonus * 2 + BaseMit
    
    AddSpellBonus(Target, 0, Str)
    AddSpellBonus(Target, 200, TotalMit)
end

function proc(Caster, Target, Type, BaseMit)
    --Nox Mit Proc
end 

function remove(Caster, Target)
    RemoveSpellBonus(Target)
    --RemoveProc(Target)
end
