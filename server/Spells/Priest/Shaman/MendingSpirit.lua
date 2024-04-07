--[[
    Script Name    : Spells/Priest/Shaman/MendingSpirit.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.14 08:03:32
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, Ward)
    CureByType(1, 1, "", (GetLevel(Caster) * 1.08) + 1)
    AddWard(Target, Ward, 1)
end

function remove(Caster, Target)
    RemoveWard(Target)
end
