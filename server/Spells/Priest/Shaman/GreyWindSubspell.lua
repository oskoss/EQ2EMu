--[[
    Script Name    : Spells/Priest/Shaman/GreyWindSubspell.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.16 02:03:37
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    SetSpellSnareValue(Target, 0.67) 
    AddControlEffect(Target, 11)
    AddProc(Target, 15, 5)
end

function proc(Caster, Target, Type)
    if Type == 15 then
        CancelSpell()
    end
end

function remove(Caster, Target)
    RemoveControlEffect(Target, 11) 
end 

