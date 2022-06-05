--[[
	Script Name	: Quests/QueensColony/tainted.lua
	Script Purpose	: This script is for the quest, "Tainted".
	Quest Name : Tainted
	
	Zone       : The Queen's Colony
	Quest Starter   : Deianeira
	Preceded By: Nothing
	Followed By: Ghosts and Goblins ()

	Script Author	: Scatman
	Script Date	: 2008.08.13
	Modified : 11/12/2020 added additional spawn id for toxic crawlers EmemJR
--]]

function Init(Quest)
	
	-- spider fang ring
	AddQuestStepKill(Quest, 1, "I need to clear the Tainted Forest of these toxic crawlers!", 4, 100, "I need to clear out the toxic crawlers to keep their poison from spreading throughout the Colony.", 1857, 2530084,2530202,2530201)
	AddQuestStepCompleteAction(Quest, 1, "step1_toxicCrawlers")

end

function Accepted(Quest, QuestGiver, Player)
	if QuestGiver ~= nil then
	   if GetDistance(Player, QuestGiver) < 30 then
	 FaceTarget(QuestGiver, Player)
	 
	 conversation = CreateConversation()
	 PlayFlavor(QuestGiver, "voiceover/english/tutorial_revamp/deianeira/tutorial_island02_revamp/quest/qst_deianeira_complete_111dc711.mp3", "", "thanks", 796380527, 3559718915, Player)
	 AddConversationOption(conversation, "I'll be back when I'm done with the spiders.")
	 StartConversation(conversation, QuestGiver, Player, "It's up to us to find the answers; they're never handed to us.")
	    end
	end
end

function Declined(Quest, QuestGiver, Player)
end

function step1_toxicCrawlers(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've cleared out many spiders and as a result found an unusual item.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've cleared out many spiders and as a result found an unusual item.")
	
    if Player ~= nil then
	GiveQuestItem(Quest, Player, "I've cleared out many spiders and as a result found an unusual item.", 10317)
	end	
	-- SPAWN Parchment Scrap (right-click this item to Examine it), spawn this in the Quest Reward window
	-- Description = I've cleared out many spiders and as a result found an unusual item.
	
	-- The edges of the parchment are torn and jagged as though ripped from a much larger document.
	--    Examine the parchment ().
	--    Put the parchment away.
	-- update quest step
	-- You can barely make out some writing on this scrap: "The toxic crawlers will be useful to cover our ... the
	-- totem ..." The reference to a totem is puzzling. Why would someone want a totem covered in spiders? There must
	-- be more pieces of this parchment amongst the toxic crawlers.
	--    Put the parchment away.
	
	AddQuestStepChat(Quest, 2, "I need to examine the parchment scrap to see if I can decipher anything.", 1, "There is more to be learned in the Tainted Forest.", 0, 2530092)
	AddQuestStepCompleteAction(Quest, 2, "step2_complete_examinedParchment")
end

function step2_complete_examinedParchment(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've examined the scrap.")
		UpdateQuestTaskGroupDescription(Quest, 2, "I've examined the scrap.")
	AddQuestStepKill(Quest, 3, "While hard to decipher, the writings indicate that there is a problem with the toxic crawlers. I'll try to find another piece of parchment on one of these spiders though it may take me a while to find one with more of this parchment.", 1, 25, "There is more to be learned in the Tainted Forest.", 2180, 2530084,2530202,2530201)
	AddQuestStepCompleteAction(Quest, 3, "step3_complete_toxicCrawlers")
end

function step3_complete_toxicCrawlers(Quest, QuestGiver, Player)
     	UpdateQuestStepDescription(Quest, 3, "I've found another piece of parchment.")
     		UpdateQuestTaskGroupDescription(Quest, 3, "I've found another piece of parchment.")
	-- The edges of the parchment are torn and jagged as though ripped from a much larger document.
	--    Put together the parchment pieces. ().
	--    Put the parchment away.
	-- You line up the parchment pieces. The newest piece adds enough new words that you can read: "The toxic crawlers
	-- will be useful to cover our tracks. Leave the totem in the eastern rocks..." Apparently Deianeira's concern
	-- about the spiders is well-placed, though not for the reasons she thinks. I must find more of this parchment
	-- to learn what this totem means.
	--    Roll the parchment up. ()
	-- update quest
	-- You carefully roll the parchment and stow it away.
	--    Put the parchment away.
	AddQuestStepChat(Quest, 4, "I need to put the parchment pieces together to learn more about the toxic crawlers.", 1, "There is more to be learned in the Tainted Forest.", 0, 2530092)
	AddQuestStepCompleteAction(Quest, 4, "step4_complete_putParchmentTogether")
end

function step4_complete_putParchmentTogether(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I've put the parchment together.")
	UpdateQuestTaskGroupDescription(Quest, 4, "I've put the parchment together.")
	AddQuestStepLocation(Quest, 5, "According to the parchment, there is something hidden in the rockpile at the eastern end of the Tainted Forest. I'll need to take a closer look.", 15, "There is more to be learned in the Tainted Forest.", 0, 92, 1, 122) 
	AddQuestStepCompleteAction(Quest, 5, "step5_complete_foundParchment")
	
	-- remove the old parchment
	-- summon Parchment Scrap

end

function step5_complete_foundParchment(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I've located the rest of the parchment.")
	UpdateQuestTaskGroupDescription(Quest, 5, "I've located the rest of the parchment.")
	--spawn "a piece of parchment harvestable"
	--only let Player see it
	--set harvestable to "Parchment Scrap" the one that looks like it was unrolled.
	    local zone = GetZone(Player)
		local Direspike = GetSpawnByLocationID(zone, 133770663, false)
        SpawnByLocationID(zone, 133770663,false)
	--SpawnMob(GetZone(Player), 2530194, true, 92.6042, 1.6355, 123.73, 290) OLD SPAWN METHOD DID NOT ALLOW LOOT DROP
	AddQuestStepObtainItem(Quest, 6,  "Now I need to gather the parchment pieces from the spider's nest. Hopefully they are from the parchment I'm trying to put together!", 1, 100,  "There is more to be learned in the Tainted Forest.", 75,  10315)
	AddQuestStepCompleteAction(Quest, 6, "step6_complete_harvestedParchment")
end

function step6_complete_harvestedParchment(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 6, "I've gathered the pieces of parchment from the spider's nest.")
		UpdateQuestTaskGroupDescription(Quest, 6, "I've gathered the pieces of parchment from the spider's nest.")
	-- The edges of the parchment are torn and jagged as though ripped from a much larger document.
	--    Piece together the parchment ().
	--    Put the parchment away.
	-- The last bit of parchment was caught on the web near the large pile of rocks. You piece it together and read:
	-- "The toxic crawlers will be useful to cover our tracks. Leave the totem in the eastern rocks beneath Direspike."
	-- Direspike must be a tainted spider with greater power. You realize you may have to flush him from his lair
	-- by picking off the nearby spiders until he appears to meet your challenge.
	--    Roll the parchment up. ()
	-- update quest
	-- You carefully roll the parchment and stow it away.
	--    Put the parchment away.
	AddQuestStepChat(Quest, 7, "I need to put together all the pieces of the parchment.", 1, "There is more to be learned in the Tainted Forest.", 0, 2530092)
	AddQuestStepCompleteAction(Quest, 7, "step7_complete_putParchmentTogether")
end

function step7_complete_putParchmentTogether(Quest, QuestGiver, Player)
	 UpdateQuestStepDescription(Quest, 7, "I've pieced the parchment together.")
	 	UpdateQuestTaskGroupDescription(Quest, 7, "I've pieced the parchment together.")
	 
	 -- remove old parchment
	 -- spawn direspike when player gets close to his loc
	SpawnMob(GetZone(Player), 2530106, false, 89.7797, 4.85852, 124.289, 300) 
	AddQuestStepKill(Quest, 8, "The parchment refers to Direspike. I must slay Direspike, the spider that must be at the root of this problem.", 1, 100, "There is more to be learned in the Tainted Forest.", 1859, 2530106)
	AddQuestStepCompleteAction(Quest, 8, "step8_complete_killedDireSpike")
end

function step8_complete_killedDireSpike(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 8, "I've slain Direspike and in the process destroyed the tainted totem.")
	UpdateQuestTaskGroupDescription(Quest, 8, "I've slain Direspike and in the process destroyed the tainted totem.")
	AddQuestStepChat(Quest, 9, "I should tell Deianeira that the toxic crawlers are not the source of the taint.", 1, "There is more to be learned in the Tainted Forest.", 0, 2530107)
	AddQuestStepCompleteAction(Quest, 9, "completed")
end

function completed(Quest, QuestGiver, Player)
    UpdateQuestStepDescription(Quest, 9, "I've spoken with Deianeira.")
    	UpdateQuestTaskGroupDescription(Quest, 9, "I've spoken with Deianeira.")
	UpdateQuestDescription(Quest, "While killing toxic crawlers to test Deianeira's theory on poison, I found a piece of parchment hinting that someone had influenced the toxic crawlers by hiding some kind of totem in their main nest. After I removed Direspike from the lair, the totem shattered on its own. The poison theory seems shattered as well.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
	   step1_toxicCrawlers(Quest, QuestGiver, Player)
	elseif Step == 2 then
	   step2_complete_examinedParchment(Quest, QuestGiver, Player)
	elseif Step == 3 then
	   step3_complete_toxicCrawlers(Quest, QuestGiver, Player)
	elseif Step == 4 then
	   step4_complete_putParchmentTogether(Quest, QuestGiver, Player)
	elseif Step == 5 then
	   step5_complete_foundParchment(Quest, QuestGiver, Player)
	elseif Step == 6 then
	   step6_complete_harvestedParchment(Quest, QuestGiver, Player)
	elseif Step == 7 then
	   step7_complete_putParchmentTogether(Quest, QuestGiver, Player)
	elseif Step == 8 then
	   step8_complete_killedDireSpike(Quest, QuestGiver, Player)
	end
end