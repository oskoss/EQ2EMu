--[[
    Script Name    : Spells/Mage/Sorcerer/FrozenManacles.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.28 10:11:14
    Script Purpose : 
                   : 
--]]

function precast(Caster, Target)
    -- Does not affect Epic targets
    if IsEpic(Target) then
        return false, 43
    end

    return true
end

function cast(Caster, Target, Snare)
        Say(Caster, "Damage component not implemented.  Values not yet available.")

    -- Roots target
    AddControlEffect(Target, 5)

    -- 10% chance to dispel when target takes damage
    AddProc(Target, 2, 10.0)
end

function proc(Caster, Target, Type, Snare)
    if Type == 2 then
    RemoveControlEffect(Target, 5)    
    Spell = GetSpell(5501, GetSpellTier())
    SetSpellDataIndex(Spell, 0, Snare)
    CastCustomSpell(Spell, Target, Caster)
    end
 end

function remove(Caster, Target, Snare)
    RemoveControlEffect(Target, 5)
    Spell = GetSpell(5501, GetSpellTier(1))
    SetSpellDataIndex(Spell, 0, Snare)
    CastCustomSpell(Spell, Target, Caster)
end