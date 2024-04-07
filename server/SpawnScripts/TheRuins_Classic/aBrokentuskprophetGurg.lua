--[[
    Script Name    : SpawnScripts/TheRuins_Classic/aBrokentuskprophetGurg.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.03 01:01:32
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomWeapons(NPC)
    OrcArmorCommon(NPC)
    Brokentusk(NPC)
    AddTimer(NPC, 9000, "Gurg")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function Gurg(NPC)
	local zone = GetZone(NPC)
	local Gurg= GetSpawnByLocationID(zone, 133789171)

        local leaderX = GetX(Gurg)
        local leaderY = GetY(Gurg)
        local leaderZ = GetZ(Gurg)
        local speed = 2
    if  Gurg ~=nil and not IsInCombat(NPC) then   
	if GetDistance(NPC, Gurg) >= 2 then
        MoveToLocation(NPC, leaderX, leaderY, leaderZ, speed)
	end 
	end
	AddTimer(NPC, 1500, "Gurg")	
end

