--[[
	Script Name		:	SpawnScripts/BeggarsCourt/Beggars_Court_Wanderers.luaBeggars_Court_Wanderers.lua
	Script Purpose	:	Waypoint Path for Beggars_Court_Wanderers.lua
	Script Author	:	Cynnar \\ Dorbin
	Script Date		:	7/8/2018 04:07:20 PM
	Script Notes	:	<special-instructions>
--]]

dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")
dofile("SpawnScripts/Generic/UnknownLanguage.lua")

function spawn(NPC)
waypoints(NPC)
SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    if not HasLanguage(Spawn,7)then
    Garbled(NPC,Spawn)
    else
    GenericEcologyHail(NPC, Spawn, faction)
end
end

function InRange(NPC,Spawn)
if GetFactionAmount(Spawn,12)<0 then
    FactionCheckCallout(NPC,Spawn,faction)
    else
    if not HasLanguage(Spawn,7)then
        if math.random(0,100)<40 then
        Garbled(NPC,Spawn)
        end
    else
end
end
end
    
function respawn(NPC)
		spawn(NPC)
	end
	
	

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -2.22, 4.25, -52.19, 2, 0)
	MovementLoopAddLocation(NPC, 1.12, 4.75, -50.66, 2, 1)
	MovementLoopAddLocation(NPC, 1.12, 4.75, -50.66, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 1.12, 4.75, -50.66, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 1.12, 4.75, -50.66, 2, 0)
	MovementLoopAddLocation(NPC, -0.95, 4.62, -48.96, 2, 0)
	MovementLoopAddLocation(NPC, -3.03, 4.25, -48.47, 2, 0)
	MovementLoopAddLocation(NPC, -5.82, 4, -46.53, 2, 0)
	MovementLoopAddLocation(NPC, -5.96, 4, -40.98, 2, 0)
	MovementLoopAddLocation(NPC, -6.91, 3.49, -37.73, 2, 0)
	MovementLoopAddLocation(NPC, -7.05, 3, -33.77, 2, 0)
	MovementLoopAddLocation(NPC, -5.73, 3, -28.01, 2, 0)
	MovementLoopAddLocation(NPC, -2.71, 3.5, -25.03, 2, 0)
	MovementLoopAddLocation(NPC, -0.28, 4, -25.22, 2, 0)
	MovementLoopAddLocation(NPC, 4.83, 4.25, -21.53, 2, 0)
	MovementLoopAddLocation(NPC, 7.08, 4.25, -19.58, 2, 0)
	MovementLoopAddLocation(NPC, 11.47, 4.25, -18.33, 2, 0)
	MovementLoopAddLocation(NPC, 12.02, 4, -15.98, 2, 0)
	MovementLoopAddLocation(NPC, 8.59, 3.5, -5.93, 2, 1)
	MovementLoopAddLocation(NPC, 8.59, 3.5, -5.93, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 8.59, 3.5, -5.93, 2, 0)
	MovementLoopAddLocation(NPC, 8.13, 3.5, -1.38, 2, 0)
	MovementLoopAddLocation(NPC, 7.68, 3.5, 0.65, 2, 0)
	MovementLoopAddLocation(NPC, 9.9, 3.5, 1.93, 2, 1)
	MovementLoopAddLocation(NPC, 9.9, 3.5, 1.93, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 9.5, 3.5, 1.43, 2, 0)
	MovementLoopAddLocation(NPC, 7.69, 3.5, 0.3, 2, 0)
	MovementLoopAddLocation(NPC, 3.2, 3.5, -3.73, 2, 0)
	MovementLoopAddLocation(NPC, -0.57, 3.5, -9.73, 2, 0)
	MovementLoopAddLocation(NPC, -0.02, 3.5, -14.56, 2, 1)
	MovementLoopAddLocation(NPC, -0.02, 3.5, -14.56, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -1.46, 3.5, -15.43, 2, 1)
	MovementLoopAddLocation(NPC, -1.46, 3.5, -15.43, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -1.08, 3.5, -19.37, 2, 0)
	MovementLoopAddLocation(NPC, -4.98, 3.39, -21.98, 2, 0)
	MovementLoopAddLocation(NPC, -7.68, 3, -25.86, 2, 0)
	MovementLoopAddLocation(NPC, -4.99, 4, -38.14, 2, 0)
	MovementLoopAddLocation(NPC, -6.17, 4, -44.67, 2, 0)
	MovementLoopAddLocation(NPC, -6.68, 4, -49.76, 2, 0)
end

function Drink(NPC)
        PlayFlavor(NPC,"","","drinking_idle",0,0)
    AddTimer(NPC,8000, "Drink2")
end

function Drink2(NPC)
  choice = math.random(1,4)   
        if choice == 1 then    
        PlayFlavor(NPC,"","","yawn",0,0)
        elseif choice == 2 then    
        PlayFlavor(NPC,"","","drinking_idle",0,0)
        elseif choice == 3 then    
        PlayFlavor(NPC,"","","sniff",0,0)
        else
        PlayFlavor(NPC,"","","happy",0,0)
        end            
    AddTimer(NPC,6000, "Drink3")
end

function Drink3(NPC)
        PlayFlavor(NPC,"","","drinking_idle",0,0)
end

