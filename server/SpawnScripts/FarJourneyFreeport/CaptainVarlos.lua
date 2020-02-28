--[[
    Script Name    : SpawnScripts/FarJourneyFreeport/CaptainVarlos.lua
    Script Author  : Cynnar
    Script Date    : 2019.09.28 03:09:56
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)

end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
	
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("Ahoy! 'Tis good to see you awake. Ya seem a little squiffy, least ya' cheated death!")
	Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_001.mp3", 1930075150, 2666442405)
	Dialog.AddEmote("salute")
    Dialog.AddOption("Where am I?", "temp1")
    Dialog.Start()
end

function temp1(NPC, Spawn)
	Say(NPC, "Testing function call")
end

function respawn(NPC)

end

