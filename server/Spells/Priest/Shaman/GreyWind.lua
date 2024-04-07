--[[
    Script Name    : Spells/Priest/Shaman/GreyWind.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.15 06:03:43
    Script Purpose : 
                   : 
--]]

--[[ Info from spell_display_effects (remove from script when done)

*Applies Grey Winds.  Lasts for 10.0 seconds.
	*Slows target by 33.4%
	*5% chance to dispel when target receives hostile action
	*5% chance to dispel when target takes damage
*Inflicts 42 - 52 cold damage on target

--]]

function cast(Caster, Target, DmgType, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 15
    Mastery = SpellLevel + 10
    StatBonus = GetInt(Caster) / 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    DmgBonus = math.floor(LvlBonus + StatBonus) * 2
    MinDmg = MinVal + DmgBonus
    MaxFmg = MaxVal + DmgBonus
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
    CastSpell(Target, 180021, 1, Caster)
end







