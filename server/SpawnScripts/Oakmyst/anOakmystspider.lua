--[[
    Script Name    : SpawnScripts/Oakmyst/anOakmystspider.lua
    Script Author  : Ememjr
    Script Date    : 2019.10.14 10:10:38
    Script Purpose : 
                   : 
--]]

function hailed(NPC, Spawn)
   
end

function spawn(NPC)
    ChooseMovement(NPC)
end

function ChooseMovement(NPC)
	local choice = math.random(1, 4)
	if choice == 1 then
		clockwise1(NPC)
	elseif choice == 2 then
		clockwise2(NPC)
	elseif choice == 3 then
               counter_clockwise1(NPC)
	elseif choice == 4 then
               counter_clockwise2(NPC)
	end
end

function respawn(NPC)
	spawn(NPC)
end

function clockwise1(NPC)
	local x = GetX(NPC)
	local y = GetY(NPC)
	local z = GetZ(NPC)
	MovementLoopAddLocation(NPC, x + 1.5 , y, z - 2 , 1, math.random(2, 10))
	MovementLoopAddLocation(NPC, x - .5 , y, z - 3, 1, math.random(2, 10))
	MovementLoopAddLocation(NPC, x - 3, y, z + 2.5 , 1, math.random(2, 10))
	MovementLoopAddLocation(NPC, x + .5 , y, z + 2 , 1, math.random(2, 10))


        --MovementLoopAddLocation(NPC, x + 3 , y, z - 4 , 1, math.random(2, 5))
	--MovementLoopAddLocation(NPC, x - 1 , y, z - 6, 1, math.random(2, 5))
	--MovementLoopAddLocation(NPC, x - 6, y, z + 5 , 1, math.random(2, 5))
	--MovementLoopAddLocation(NPC, x + 1 , y, z + 4 , 1, math.random(2, 5))
end

function clockwise2(NPC)
	local x = GetX(NPC)
 	local y = GetY(NPC)
	local z = GetZ(NPC)
	MovementLoopAddLocation(NPC, x + 1 , y, z - 2 , 1, math.random(2, 10))
	MovementLoopAddLocation(NPC, x - 3.5 , y, z - .5 , 1, math.random(2, 10))
	MovementLoopAddLocation(NPC, x     , y, z + 1 , 1, math.random(2, 10))
	MovementLoopAddLocation(NPC, x + 2.5 , y, z + .5 , 1, math.random(2, 10))
end

function counter_clockwise1(NPC)
	local x = GetX(NPC)
	local y = GetY(NPC)
	local z = GetZ(NPC)
	MovementLoopAddLocation(NPC, x - 1.5 , y, z + 1 , 1, math.random(2, 10))
	MovementLoopAddLocation(NPC, x + .5 , y, z + 3, 1, math.random(2, 10))
	MovementLoopAddLocation(NPC, x + 2, y, z - 2.5 , 1, math.random(2, 10))
	MovementLoopAddLocation(NPC, x - .5 , y, z - 2 , 1, math.random(2, 10))
end

function counter_clockwise2(NPC)
	local x = GetX(NPC)
	local y = GetY(NPC)
	local z = GetZ(NPC)
	MovementLoopAddLocation(NPC, x - 1 , y, z + 2 , 1, math.random(2, 10))
	MovementLoopAddLocation(NPC, x + 1.5 , y, z + .5 , 1, math.random(2, 10))
	MovementLoopAddLocation(NPC, x     , y, z - 1 , 1, math.random(2, 10))
	MovementLoopAddLocation(NPC, x - 2.5 , y, z - .5 , 1, math.random(2, 10))
end

