--[[
    Script Name    : Spells/Priest/Shaman/Phantasm.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.14 02:03:22
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, Hate)
    Level = GetLevel(Caster)
    SpellLevel = 13
    Mastery = SpellLevel + 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    HateMod = LvlBonus * 3
    Detaunt = Hate - HateMod
    
    AddHate(Caster, Target, Detaunt, 1)
    
    if IsEpic == false then
        AddControlEffect(Target, 6)
        AddProc(Target, 15, 30.0)
    end
end

function proc(Caster, Target, Type)
    if Type == 15 then
        CancelSpell()
    end
end

function remove(Caster, Target)
    RemoveControlEffect(Target, 6)
end

