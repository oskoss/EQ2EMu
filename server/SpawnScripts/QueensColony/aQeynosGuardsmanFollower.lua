--[[
    Script Name    : SpawnScripts/QueensColony/aQeynosGuardsmanFollower.lua
    Script Author  : Cynnar (edited by Rylec)
    Script Date    : 2018.10.07 10:10:32
    Script Purpose : Patrol follower. Script will set model type to allow all relevant races 
--]]

function spawn(NPC)
        setmodel(NPC)
	AddTimer(NPC, 900, "followguard_A")
end


function hailed(NPC, Spawn)
        FaceTarget(NPC, Spawn)
end

function respawn(NPC)
        spawn(NPC)
end

function setmodel(NPC)
        local RandomModel = math.random (1,4) 
        local shouttime = math.random (90000,270000)     

                if RandomModel == 1 then
                        SpawnSet(NPC, "model_type", "82") 
                	AddTimer(NPC, shouttime, "kerra")
                elseif RandomModel == 2 then
                        SpawnSet(NPC, "model_type", "110") 
                	AddTimer(NPC, shouttime, "dwarf")
                elseif RandomModel == 3 then
                        SpawnSet(NPC, "model_type", "112") 
                	AddTimer(NPC, shouttime, "barbarian")
                elseif RandomModel == 4 then
                        SpawnSet(NPC, "model_type", "134") 
                	AddTimer(NPC, shouttime, "human")
                end
end

function followguard_A(NPC)
	local zone = GetZone(NPC)
	local guard_A_placement = GetSpawnByLocationID(zone, 430688)
	local sli = GetSpawnLocationID(NPC)
    local leaderX = GetX(guard_A_placement)
    local leaderY = GetY(guard_A_placement)
    local leaderZ = GetZ(guard_A_placement)
    local speed = 2
       -- Say(NPC, "Leader location is: " .. GetX(guard_A_placement) .. ", " .. GetY(guard_A_placement) .. ", " .. GetZ(guard_A_placement))
    
    if sli == 133770887 then
		if GetDistance(NPC, guard_A_placement) >= 8 then
			speed = 5
                        MoveToLocation(NPC, leaderX - 2, leaderY, leaderZ, speed)
                else
                        speed = 2
                        MoveToLocation(NPC, leaderX - 2, leaderY, leaderZ, speed)
		end 
	elseif sli == 133770888 then
		if GetDistance(NPC, guard_A_placement) >= 8 then
                       -- Say(NPC, "Leader location is: " .. GetX(guard_A_placement) .. "")
                       -- Say(NPC, "My location is: " .. GetX(NPC) .. "")
			speed = 5
                        MoveToLocation(NPC, leaderX, leaderY, leaderZ - 2, speed)
                else
                        speed = 2
		        MoveToLocation(NPC, leaderX, leaderY, leaderZ - 2, speed)
		end 
	elseif sli == 133770889 then
		if GetDistance(NPC, guard_A_placement) >= 8 then
                        MoveToLocation(NPC, leaderX + 2, leaderY, leaderZ, speed)
          --  Say(NPC, "Leader location is: " .. GetX(guard_A_placement) .. "")
          --  Say(NPC, "My location is: " .. GetX(NPC) .. "")
			speed = 5
                else
                        speed = 2
                        MoveToLocation(NPC, leaderX + 2, leaderY, leaderZ, speed)
		end 
    end
        speed = 2
	AddTimer(NPC, 3000, "followguard_A")	
end

function kerra(NPC)
        math.randomseed(os.time())
        local choice = math.random (1,3)

        if choice == 1 then
                Say(NPC, "Wraaaaa!")
        elseif choice == 2 then
                Say(NPC, "For Qeynos!")
        elseif choice == 3 then
                Say(NPC, "Look at Luclin! Shar Vahl...")
                Emote(NPC, "groans.") 
        end

        local time = math.random (90000,2700000)       
	AddTimer(NPC, time, "kerra")	
end

function dwarf(NPC)
        math.randomseed(os.time())
        local choice = math.random (1,3)

        if choice == 1 then
                Say(NPC, "When I am off duty that rock is mine!")
                Emote(NPC, "points at a shiny stone.")                
        elseif choice == 2 then
                Say(NPC, "For the strength of Kaladim!")
        elseif choice == 3 then
                Say(NPC, "Onward boys and keep in line!")
        end

        local time = math.random (90000,2700000)       
	AddTimer(NPC, time, "dwarf")	
end

function barbarian(NPC)
        math.randomseed(os.time())
        local choice = math.random (1,3)

        if choice == 1 then
                Say(NPC, "For the love of Halas, I could use a stout!")
        elseif choice == 2 then
                Say(NPC, "All clear here!")
        elseif choice == 3 then
                Say(NPC, "I long to return to Qeynos.")
        end

        local time = math.random (90000,2700000)       
	AddTimer(NPC, time, "barbarian")	
end

function human(NPC)
        math.randomseed(os.time())
        local choice = math.random (1,3)

        if choice == 1 then
                Say(NPC, "I'll bet you an ale that I spot the next intruder first.")
                Emote(NPC, "smack his fist into his palm.")                
        elseif choice == 2 then
                Say(NPC, "In honor of the Queen.")
                Emote(NPC, "salutes.")  
        elseif choice == 3 then
                Say(NPC, "Keep your eyes peeled boys!")
        end

        local time = math.random (90000,2700000)       
	AddTimer(NPC, time, "human")	
end