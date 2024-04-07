--[[
    Script Name    : SpawnScripts/WayfarersRest/asuspiciouscrate.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.23 03:09:19
    Script Purpose : 
                   : 
--]]

function spawn(NPC)

end

function casted_on(NPC, Spawn, Message)
    local zone = GetZone(NPC)
    local Crate = (GetSpawnByLocationID(zone,133786873))
    local Barrel = (GetSpawnByLocationID(zone,133786872))
    if Message == "Inspect" then
		if Crate ~= nil then
            PlayFlavor(Crate,"","","result_dispell1_out",0,0)
            AddTimer(Crate,1500,"Despawning")
        end
		if Barrel ~= nil then
            PlayFlavor(Barrel,"","","result_dispell1_out",0,0)
            AddTimer(Barrel,1500,"Despawning")
        end
		if NPC ~= nil then
            PlayFlavor(NPC,"","","result_dispell1_out",0,0)
            AddTimer(NPC,1500,"Despawning")
        end            
end
end


function Despawning(NPC,Spawn)
    local zone = GetZone(NPC)
    local Crate = (GetSpawnByLocationID(zone,133786873))
    local Barrel = (GetSpawnByLocationID(zone,133786872))
    local Wall = (GetSpawnByLocationID(zone,133786875))
		if Crate ~= nil then
            Despawn(Crate)
        end
		if Barrel ~= nil then
            Despawn(Barrel)
        end
		if NPC ~= nil then
            Despawn(NPC)
		if Wall ~= nil then
            Despawn(Wall)
        end
        end           
end

function respawn(NPC)
	spawn(NPC)
end