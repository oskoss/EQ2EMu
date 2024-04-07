--[[
    Script Name    : SpawnScripts/DownBelow/AncientStatue.lua
    Script Author  : Dorbin
    Script Date    : 2022.01.08 04:01:07
    Script Purpose : 
                   : 
--]]
--You begin to place the scepter in the statue's hand, but meet some resistance.  A ring of filth and decay has built over the ages underneath the palm.  As you push the scepter into the open hand of the statue, a small golden object drops from the finger of the semi-closed palm.  You bend down to discover a tiny, dirty ring.
local Scepter = 5369 -- An Ancient Scepter

function spawn(NPC)
		SetRequiredQuest(NPC, Scepter, 1, 1)
    SetPlayerProximityFunction(NPC, 10, "InRange", Spawn)
end

function casted_on(NPC, Spawn, SpellName)
  if SpellName == 'Replace scepter' then
       local con = CreateConversation()
        AddConversationOption(con, "What could this be...","Success")
        StartDialogConversation(con, 1, NPC, Spawn, "You begin to place the scepter in the statue's hand, but meet some resistance.  A ring of filth and decay has built over the ages underneath the palm.  As you push the scepter into the open hand of the statue, a small golden object drops from the finger of the semi-closed palm.  You bend down to discover a tiny, dirty ring.")
    end
end

function Success(NPC,Spawn)
    PlayFlavor(Spawn,"","","gathering_success",0,0)
    SetStepComplete(Spawn, Scepter, 1)
    CloseItemConversation(NPC,Spawn)
end

function InRange(NPC, Spawn)
 if HasQuest(Spawn, Scepter) and GetQuestStep(Spawn,Scepter)==1  then
    SendMessage(Spawn,"The ancient scepter thrums as you near the old statue in the nearby alcove.","yellow")
    SendPopUpMessage(Spawn,"The ancient scepter thrums as you near the old statue in the nearby alcove.",225,225,0)
end
end

function respawn(NPC)
	spawn(NPC)
end