--[[
    Script Name    : SpawnScripts/OverlordsPrivateChambers/LucanicKnightInitiateMale.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.24 11:09:01
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)
end

function aggro(NPC, Spawn)
	 PlayFlavor(NPC, "voiceover/english/lucanic_knight_initiate/fprt_ph_3r03/quest_f_betrayal_fightone_2_callout1_a40b5115.mp3", "This one's a bit puny, wouldn't you say?", "", 1414515790, 3686356188)
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