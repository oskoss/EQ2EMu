--[[
    Script Name    : Spells/Scout/Bard/SingingShot.lua
    Script Author  : neatz09
    Script Date    : 2020.11.06 06:11:13
    Script Purpose : 
                   : 
--]]
function precast(Caster, Target)
    -- Requires bow
    local item = GetEquippedItemBySlot(Caster, 16)
    if not item or GetItemType(item) ~= 2 then
        -- no item or item is not a ranged item (no way to determine different range items currently)
        return false, 68
    end

    return true
end

function cast(Caster, Target, DmgType, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 16
    Mastery = SpellLevel + 10
    StatBonus = GetAgi(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StatBonus
    MinDmg = math.floor(DmgBonus) * 2 + MinVal
    MaxDmg = math.floor(DmgBonus) * 2 + MaxVal
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
end
