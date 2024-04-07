--[[
	Script Name		: SpawnScripts/ScaleYard/VerinIthelz.lua
	Script Purpose	: Verin Ithelz
	Script Author	: torsten
	Script Date		: 2022.07.24
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

local VerinsNewThralls = 5701
local PreventativeMaintenance = 5702

function spawn(NPC)
    ProvidesQuest(NPC, VerinsNewThralls)
    ProvidesQuest(NPC, PreventativeMaintenance)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    if not HasQuest(Spawn, VerinsNewThralls) and not HasCompletedQuest(Spawn, VerinsNewThralls) then
        OfferQuest(NPC, Spawn, VerinsNewThralls)
    end
    if HasCompletedQuest(Spawn, VerinsNewThralls) then
        if not HasQuest(Spawn, PreventativeMaintenance) and not HasCompletedQuest(Spawn, PreventativeMaintenance) then
            OfferQuest(NPC, Spawn, PreventativeMaintenance)
        end
    end 
    if GetQuestStep(Spawn, VerinsNewThralls) == 2 then
        SetStepComplete(Spawn, VerinsNewThralls, 2)
    end
    if GetQuestStep(Spawn, PreventativeMaintenance) == 2 then
        SetStepComplete(Spawn, PreventativeMaintenance, 2)
    end
    
	RandomGreeting(NPC, Spawn)
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,2)

	if choice == 1 then
		PlayFlavor(NPC, "", "My trade will pick up again, you'll see.", "", 0, 0, Spawn, 0)
	elseif choice == 2 then
		PlayVoice(NPC, "voiceover/english/voice_emotes/greetings/greetings_2_1028.mp3", 0, 0, Spawn)
	end
end
--"You are no warrior in their eyes," said one of the woodcutters softly.  He was one of the Dervin thralls, his ankles bound by chains to the table upon which he cut larger hunks of wood into smaller pieces.

--I suppose. I have thralls of all kinds.  Some are manacled, some are corralled.  All are expensive ... especially the exotics, like the high elf here.  Brona the slaver exacts a pretty bit of coin for such as these.  If I don't find a cheaper source, my coffers will run dry.  May I perhaps seek your assistance?  
--Yes, I did. I'm looking for ways to increase my horde of thralls without paying Brona's steep prices. My contacts tell me that Zekvila is capturing orcs to work as her thralls. That broodling must not have better thralls than me! You must prevent her from capturing more orcs!
--Very good! Now let's see Zekvila upstage me! If she wants more thralls, she must empty her pockets to that thief Brona. Ha! Her entourage of thralls won't compete with my mighty force! If she tries, I'll sick my barbarian dogs on the wench! Here, add this coin to your purse.