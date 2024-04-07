--[[
    Script Name    : Spells/Commoner/BlightoftheMorning.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.10 11:10:34
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, DmgType, MinVal, MaxVal)
    SetSpellTriggerCount(100, 1)
    AddProc(Caster, 3, 8)

end

function proc(Caster, Target, Type, DmgType, MinVal, MaxVal)
    Spell = GetSpell(2550441)
    DmgBonus = math.floor(GetInt(Caster)/10)
    MinDmg = MinVal + DmgBonus
    MaxDmg = MaxVal + DmgBonus
    
    if Type == 3 then
		SetSpellDataIndex(Spell, 0, DmgType)
		SetSpellDataIndex(Spell, 1, MinDmg)
		SetSpellDataIndex(Spell, 2, MaxDmg)
			CastCustomSpell(Spell, Caster, Target)
			RemoveTriggerFromSpell(1)
	end
    
end



function remove(Caster, Target)
    RemoveProc(Caster)
end
