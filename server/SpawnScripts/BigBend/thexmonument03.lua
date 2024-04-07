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
        if HasLanguage(Spawn,2) and GetQuestStepProgress(Spawn,TheStolenArtifactsofThex,3)==0 then
        AddConversationOption(con, "Make a note of the artifact.","Dialog2")
        end
        StartDialogConversation(con, 1, NPC, Spawn, "This is an ancient artifact. It has sadistic looking symbols bordering writing that is written in Thexian, an ancient dark elf language.")
end
end

function Dialog2(NPC, Spawn)
        local con = CreateConversation()
    SetStepComplete(Spawn, TheStolenArtifactsofThex, 3)
    AddConversationOption(con, "Stop studying.","Close")
    StartDialogConversation(con, 1, NPC, Spawn, "You make a note of the location of the Thex artifact as ordered by Kylanith D'Lar.")
end

function Close(NPC,Spawn)
    CloseConversation(NPC,Spawn)
end
function respawn(NPC)
	spawn(NPC)
end