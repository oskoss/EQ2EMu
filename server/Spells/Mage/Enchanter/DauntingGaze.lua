--[[
    Script Name    : Spells/Mage/Enchanter/DauntingGaze.lua
    Script Author  : LordPazuzu
    Script Date    : 11/4/2023
    Script Purpose : 
                   : 
--]]

-- Decreases power of target by 79 - 97
-- Stuns target
--     If Target is not Epic
-- Resistibility increases against targets higher than level 29.

function precast(Caster, Target)
    -- Does not affect Epic targets
    if IsEpic(Target) then
        return false, 43
    end
    return true
end

function cast(Caster, Target, MaxVal, MinVal)
	Level = GetLevel(Caster)
    SpellLevel = 13
    Mastery = SpellLevel + 10
    StatBonus = GetInt(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    TotalBonus = math.floor(LvlBonus + StatBonus)
	DrainLow = MinVal - TotalBonus
	DrainHigh = MaxVal - TotalBonus
	TotalDrain = math.random(DrainLow, DrainHigh)
	
	
	Say(Caster, "Resistability not implemented")
	AddControlEffect(Target, 4)
	ModifyPower(Target, TotalDrain)
end

function remove(Caster, Target)
    RemoveControlEffect(Target, 4)
end