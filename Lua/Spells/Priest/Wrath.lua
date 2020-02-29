--[[
	Script Name	: Wrath.lua
	Script Purpose	: Priest Generic Direct Damage
	Script Author	: Zcoretri
	Script Date	: 15.March.2011
	Script Notes	:
--]]

function cast(Caster, Target, DmgType, MinDmg, MaxDmg)
    -- Instant Damage
    dmgAmount = math.random(MinDmg, MaxDmg)
    if MaxDmg ~= nil and MinDmg < MaxDmg then
        SpellDamage(Target, DmgType, dmgAmount)
    else
        SpellDamage(Target, DmgType, MinDmg)
    end
end

