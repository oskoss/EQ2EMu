--[[
    Script Name    : Spells/Priest/Cleric/Templar/Sanctuary.lua
    Script Author  : neatz09
    Script Date    : 2020.10.27 12:10:19
    Script Purpose : 
                   : 
--]]

-- Makes group members (AE) immune to Root effects
-- Makes group members (AE) immune to Stifle effects
-- Makes group members (AE) immune to Stun effects
-- Makes group members (AE) immune to Fear effects
-- Makes group members (AE) immune to Daze effects
-- Makes group members (AE) immune to Mesmerize effects
-- 1% chance to dispel when target takes damage
-- 1% chance to dispel when target receives hostile action

function cast(Caster, Target, Chance)
	AddProc(Target, 15, 1, nil, 1)
	AddImmunitySpell(5, Target) --Root
	AddImmunitySpell(2, Target) --Stifle
	AddImmunitySpell(4, Target) --Stun
	AddImmunitySpell(6, Target) --Fear
	AddImmunitySpell(3, Target) --Daze
	AddImmunitySpell(1, Target) --Mez
		Say(Caster, "PVP Immunity not implemented.")
end

function proc(Caster, Target, Type, Chance)
	if Type == 15 then 
		CancelSpell()
					end
end

function remove(Caster, Target)
	RemoveProc(Target)
	RemoveImmunitySpell(5, Target) --Root
	RemoveImmunitySpell(2, Target) --Stifle
	RemoveImmunitySpell(4, Target) --Stun
	RemoveImmunitySpell(6, Target) --Fear
	RemoveImmunitySpell(3, Target) --Daze
	RemoveImmunitySpell(1, Target) --Mez
end