--[[
    Script Name    : Spells/Pet/TelluricBash.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.19 06:11:15
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, DmgType, MinVal, MaxVal)
  local StrBonus = math.floor(GetStr(Caster) / 10)
  local MinDmg = math.floor(MinVal + StrBonus)
  local MaxDmg = math.floor(MaxVal + StrBonus)
  
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
    
    if not IsEpic(Target) then 
		CastSpell(Target, 5001, GetSpellTier())
	end
	
end
