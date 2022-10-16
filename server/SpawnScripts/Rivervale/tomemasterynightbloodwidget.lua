--[[
    Script Name    : SpawnScripts/Rivervale/tomemasterynightbloodwidget.lua
    Script Author  : Dorbin
    Script Date    : 2022.06.07 05:06:53
    Script Purpose : 
                   : 
--]]
local LnLQuest = 5406
local Book = 14182

function spawn(NPC)
Check(NPC,Spawn)
SetPlayerProximityFunction(NPC, 10, "InRange", Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC, Spawn)
if HasItem(Spawn,Book,1) or HasCompletedQuest(Spawn,LnLQuest) then
    SetAccessToEntityCommand(Spawn,NPC,"Search bookshelf", 0)
    SpawnSet(NPC, "show_command_icon", 0)
    SpawnSet(NPC, "display_hand_icon", 0)
else
    SetAccessToEntityCommand(Spawn,NPC,"Search bookshelf", 1)
    SpawnSet(NPC, "show_command_icon", 1)
    SpawnSet(NPC, "display_hand_icon", 1)
    end
end

function Check(NPC,Spawn)
if HasItem(Spawn,Book,1) or HasCompletedQuest(Spawn,LnLQuest) then
    SpawnSet(NPC, "show_command_icon", 0)
    SpawnSet(NPC, "display_hand_icon", 0)    
    SetAccessToEntityCommand(Spawn,NPC,"Search bookshelf", 0)
else
    SetAccessToEntityCommand(Spawn,NPC,"Search bookshelf", 1)
    SpawnSet(NPC, "show_command_icon", 1)
    SpawnSet(NPC, "display_hand_icon", 1)
    end
end

function casted_on(NPC, Spawn, SpellName)
  if SpellName == 'Search bookshelf' then
    SummonItem(Spawn,Book,1)
    AddTimer(NPC, 100, "Check", 1, Spawn)
    end
end