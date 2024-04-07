--[[
    Script Name    : Spells/Mage/Enchanter/OverwhelmingSilence.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.29 09:11:30
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, PowerMax, PowerMin)
	local Power = math.random(PowerMin, PowerMax)
	if not IsEpic(Target) then 
		AddControlEffect(Target, 2)
			end
	    ModifyPower(Target, Power)
end

function tick(Caster, Target, PowerMax, PowerMin)
	local Power = math.random(PowerMin, PowerMax)
	ModifyPower(Target, Power)
end


function remove(Caster, Target)
    RemoveControlEffect(Target, 2)

end


