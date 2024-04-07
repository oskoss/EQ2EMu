--[[
    Script Name    : SpawnScripts/BigBend/thexmonument04broken.lua
    Script Author  : torsten
    Script Date    : 2022.07.20 06:07:41
    Script Purpose : 
                   : 
--]]

local TheStolenArtifactsofThex = 5683

function casted_on(NPC, Spawn, SpellName)
    if SpellName == 'inspect' then
        local con = CreateConversation()
        AddConversationOption(con, "Stop inspecting.","Close")
        if HasLanguage(Spawn,2) and GetQuestStepProgress(Spawn,TheStolenArtifactsofThex,6)==0 then
        AddConversationOption(con, "Make a note of the artifact.","Dialog2")
        end
        StartDialogConversation(con, 1, NPC, Spawn, "This is a gravestone made of ancient looking stone. The name of the deceased appears on the stone as well as odd writing of a foreign language. The name looks to have been added more recently than the foreign writing.")
end
end

function Dialog2(NPC, Spawn)
    local con = CreateConversation()
    SetStepComplete(Spawn, TheStolenArtifactsofThex, 6)
    AddConversationOption(con, "Stop studying.","Close")
    StartDialogConversation(con, 1, NPC, Spawn, "You make a note of the location of the Thex artifact as ordered by Kylanith D'Lar.")
end

function Close(NPC,Spawn)
    CloseConversation(NPC,Spawn)
end

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end