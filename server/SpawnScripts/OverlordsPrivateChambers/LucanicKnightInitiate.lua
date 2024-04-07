--[[
    Script Name    : SpawnScripts/OverlordsPrivateChambers/LucanicKnightInitiate.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.24 11:09:14
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)
end

function aggro(NPC, Spawn)
--	PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/guard/darkelf_guard_service_evil_1_kill_gf_1ec6eff4.mp3", "Death to the enemies of Lucan!", "", 4030922503, 1352663696, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function victory(NPC,Spawn)
    if IsPlayer(Spawn) == true then
    AddTimer(NPC,1500,"FailureExit",1,Spawn)
    end
end   

function FailureExit(NPC,Spawn)
          FailExit = GetZone("SerpentSewer")
       Zone(FailExit,Spawn,-133.56, -0.21, 28.15, 41.26)
 end     