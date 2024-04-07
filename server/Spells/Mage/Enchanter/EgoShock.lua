--[[
    Script Name    : Spells/Mage/Enchanter/EgoShock.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.27 05:11:18
    Script Purpose : 
                   : 
--]]

--[[ Info from spell_display_effects (remove from script when done)

*Inflicts 42 - 51 mental damage on target
*Roots target
*5% chance to dispel when target takes damage
*5% chance to dispel when target receives hostile action
*Epic targets gain an immunity to Root and Ability attacks will hit for their maximum damage. effects of 27.0 seconds and duration is reduced to 3.0 seconds.
*Resistibility increases against targets higher than level 29.

--]]


function cast(Caster, Target, DmgType, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 11
    Mastery = SpellLevel + 10
    StatBonus = GetInt(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StatBonus
    MinDmg = math.floor(DmgBonus) * 2 + MinVal
    MaxDmg = math.floor(DmgBonus) * 2 + MaxVal
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
        -- Roots target
    AddControlEffect(Target, 5)

    -- 5% chance to dispel when target takes damage
    AddProc(Target, 2, 5.0)

end

function proc(Caster, Target, Type)
    if Type == 2 then
        CancelSpell()
    end
end
    
function remove(Caster, Target)
    RemoveControlEffect(Target, 5)
end

