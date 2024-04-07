--[[
    Script Name    : Spells/Priest/Shaman/ExpungeElements.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.16 05:03:48
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, Ward)
    CureByType(1, 3, "", (GetLevel(Caster) * 1.08) + 1)
    AddWard(Target, Ward, 1)
end

function remove(Caster, Target)
    RemoveWard(Target)
end
