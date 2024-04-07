--[[
    Script Name    : Spells/Pet/TelluricStrike.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.18 02:11:37
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, MinVal, MaxVal, DmgType, DmgLow, DmgHigh, MinHate, MaxHate)
  local IntBonus = GetInt(Caster) / 10
  local MinDmg = math.floor(DmgLow + IntBonus)
  local MaxDmg = math.floor(DmgHigh + IntBonus)
  local MinHate = math.floor(MinVal + IntBonus)
  local MaxHate = math.floor(MaxVal + IntBonus)
  
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)

    AddHate(Caster, Target, MakeRandomInt(MinHate, MaxHate), 1)
    
end

