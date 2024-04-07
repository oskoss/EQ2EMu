--[[
    Script Name    : Spells/Fighter/Brawler/ThunderingFistsClassic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.07 04:09:28
    Script Purpose : 
                   : 
--]]

--[[ Info from spell_display_effects (remove from script when done)

While active, this combat art grants the brawler a small chance to briefly stun their target with each melee hit.

--]]


function cast(Caster, Target, Chance)
    AddProc(Caster, 3, Chance)
end

function proc(Caster, Target, Type)
    if Type == 3 then
        CastSpell(Target, 5510, GetSpellTier())
        end
end

function remove(Caster, Target)
    RemoveProc(Caster)
end
