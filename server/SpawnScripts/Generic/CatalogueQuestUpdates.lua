--[[
    Script Name    : SpawnScripts/Generic/CatalogueQuestUpdates.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.10 10:09:20
    Script Purpose : Facilitates updates for Catalogue Quest updates. Only created catalogue quests are referenced here. 
                        The script requires the 'Catalogue Creature' ability to be cast, Player to be on the right Quest, and the Appropriate Target/Update to complete the quest step.
                   : 
--]]
local OutlyingQeynos = 519
local Antonica = 5885


function casted_on(NPC, Spawn, Message)
    if Message == "Catalogue Creature" then

 --OUTLYING QEYNOS GUIDE-------------------------------------------------------  

        if HasQuest(Spawn, OutlyingQeynos) then 

    --OAKMYST FAIRIES        
            if GetSpawnID(NPC) == 8300048 or GetSpawnID(NPC) == 8300049 or GetSpawnID(NPC) == 8300050 or GetSpawnID(NPC) == 8300014 or GetSpawnID(NPC) == 8300015 or GetSpawnID(NPC) == 8300011 then         
    
		            if  GetQuestStepProgress(Spawn,OutlyingQeynos,1) == 0 then
			        SetStepComplete(Spawn, OutlyingQeynos, 1)
			        local con = CreateConversation()
                    AddConversationOption(con, "Close the entry.")
                    StartDialogConversation(con, 1, NPC, Spawn, "Oakmyst Fairy\n\n\"Oakmyst fairies should not be mistaken for sweet innocent pranksters. In a world of spirits, these fairies embody deception. Many tales are told to children of Qeynos about being led off into the woods by playful fayefolk, never to be seen again. Sadly, those tales are more true than I’d like to admit.\"\n\n-Heirophant Aldalad")
                    end
    --SUNSHIMMER SPRITE                
            elseif GetSpawnID(NPC) == 8300051 or GetSpawnID(NPC) == 8300052 or GetSpawnID(NPC) == 8300053 or GetSpawnID(NPC) == 8300006 or GetSpawnID(NPC) == 8300052 or GetSpawnID(NPC) == 8300012 then         
    
		            if  GetQuestStepProgress(Spawn,OutlyingQeynos,2) == 0 then
			        SetStepComplete(Spawn, OutlyingQeynos, 2)
			        local con = CreateConversation()
                    AddConversationOption(con, "Close the entry.")
                    StartDialogConversation(con, 1, NPC, Spawn, "Sunshimmer Sprite\n\n\"Sprites are a newer addition to the Oakmyst since The Cataclysm. Supposedly hailing from more enchanted waters, they were swept in from the torrential winds. My fellow trackers have had difficulty determining the terms the sprites have made with the resident fairies to occupy the same woods. It is also unknown how they may shift the balance of these woods.\"\n\n-Tracker Kelnis")
                    end
    --BADGER CUB                
            elseif GetSpawnID(NPC) == 8300001 then         
    
		            if  GetQuestStepProgress(Spawn,OutlyingQeynos,3) == 0 then
			        SetStepComplete(Spawn, OutlyingQeynos, 3)
			        local con = CreateConversation()
                    AddConversationOption(con, "Close the entry.")
                    StartDialogConversation(con, 1, NPC, Spawn, "Badger Cub\n\n\"Badger cubs go weeks before their ear canals develop. This lack of hearing causes the parental badgers to remain nearby at all times to provide a familiar scent. If a parent badger loses their young, for whatever reason, their temperament becomes vicious. The increased aggression empowers their attacks and manifests in their actual claws - a perfect ingredient for infusing nature's rage into mundane objects!\"\n\n-Yanari Cyellann")
                    end
    --RUINS SKULKER                
            elseif GetSpawnID(NPC) == 8270058 or GetSpawnID(NPC) == 8270059 or GetSpawnID(NPC) == 8270060 then         
    
		            if  GetQuestStepProgress(Spawn,OutlyingQeynos,4) == 0 then
			        SetStepComplete(Spawn, OutlyingQeynos, 4)
			        local con = CreateConversation()
                    AddConversationOption(con, "Close the entry.")
                    StartDialogConversation(con, 1, NPC, Spawn, "Ruins Skulker\n\n\"The aqua goblins here in the ruins crawled out of the sea once the dust settled from the chunks of Luclin that collided in the old mage quarter. They have this insatiable need to collect and trade trinkets they find amongst each other. You have to wonder where they put it all…\"\n\n-Sergeant at Arms Uthros")
                    end 
    --FLAMEPAW LOYALIST                
            elseif GetSpawnID(NPC) == 8270010 then         
    
		            if  GetQuestStepProgress(Spawn,OutlyingQeynos,5) == 0 then
			        SetStepComplete(Spawn, OutlyingQeynos, 5)
			        local con = CreateConversation()
                    AddConversationOption(con, "Close the entry.")
                    StartDialogConversation(con, 1, NPC, Spawn, "Flamepaw Loyalist\n\n\"Kinloc Flamepaw was renowned in the Age of Turmoil for his control of summoning magic in Qeynos. Aspiring mages flocked to him for protection from The Shattering as Luclin succumbed to its fate. Fortunately for us, he sacrificed himself to protect Qeynos. He did this by weaving together elements to absorb most of the impacts… His aspiring students were not as lucky. Even now, those mages still cling to Kinloc's remains, searching for answers. \"\n\n-Bellengere the Three")
                    end
                    
    --SLEEPLESS ONE                
            elseif GetSpawnID(NPC) == 8270018 or GetSpawnID(NPC) == 8270066 then         
    
		            if  GetQuestStepProgress(Spawn,OutlyingQeynos,6) == 0 then
			        SetStepComplete(Spawn, OutlyingQeynos, 6)
			        local con = CreateConversation()
                    AddConversationOption(con, "Close the entry.")
                    StartDialogConversation(con, 1, NPC, Spawn, "Sleepless One\n\n\"Not all students of the arcane are as focused as I would like. Ages ago, meditation to regain precious mana was a common practice. This required closing your mind to distraction and feeling the mana flow through you. Still in the old magician guild ruins, these students continue their meditations- even in undeath. They might not even know they're dead!\n\nI'de doubt if today's students have that sort of attention span... \"\n\n-Telamina Garendell") 
                    end 
    --ALABASTER GOLEM                
            elseif GetSpawnID(NPC) == 8260021 or GetSpawnID(NPC) == 8260022 or GetSpawnID(NPC) == 8260077 or GetSpawnID(NPC) == 8260079 then         
    
		            if  GetQuestStepProgress(Spawn,OutlyingQeynos,7) == 0 then
			        SetStepComplete(Spawn, OutlyingQeynos, 7)
			        local con = CreateConversation()
                    AddConversationOption(con, "Close the entry.")
                    StartDialogConversation(con, 1, NPC, Spawn, "Alabaster Golem\n\n\"It is believed that waters with trace magical properties have seeped below the old ruins of the original Three Towers and have impacted the geology below. The affected stones themselves became animated, similar to the guardians above - smoothing their edges through repetative movements.\n\nRumor is that gnolls have taken these malformed constructs as ‘pets.’ Can you imagine? Gnolls?! \"\n\n-Elspeth Astley of the Three Towers") 
                    end 
    --DUSTPAW GUARD               
            elseif GetSpawnID(NPC) == 8260006 then         
    
		            if  GetQuestStepProgress(Spawn,OutlyingQeynos,8) == 0 then
			        SetStepComplete(Spawn, OutlyingQeynos, 8)
			        local con = CreateConversation()
                    AddConversationOption(con, "Close the entry.")
                    StartDialogConversation(con, 1, NPC, Spawn, "Dustpaw Guard\n\n\"Fortunately for Qeynos, the splintered gnoll factions down in the caves have distractions that keep them in their tunnels. With little exposure to the outside dangers, their guards spend more time protecting their treasures than their kin. If a treasure hunter were savvy enough, they might find some tucked away in their ornamental chests… if you don’t mind the smell of wet dog.\"\n\n-Knight-Lieutenant Laughlin") 
                    end 
    --ALBINO PYTHON               
            elseif GetSpawnID(NPC) == 8260024 then         
    
		            if  GetQuestStepProgress(Spawn,OutlyingQeynos,9) == 0 then
			        SetStepComplete(Spawn, OutlyingQeynos, 9)
			        local con = CreateConversation()
                    AddConversationOption(con, "Close the entry.")
                    StartDialogConversation(con, 1, NPC, Spawn, "Albino Python\n\n\"A purveyor of exotic beasts offered me a rare specimen a few years ago - a white python. Supposedly traded as pets from old Neriak between the upper class, I pounced at the opportunity to make a few gold on such a rare find. Little did I know that the thing was pregnant!\"\n\n-Donovan Herald, Pet Shop Owner") 
                    end 
    --BOG SLUDGE               
            elseif GetSpawnID(NPC) == 8290004 then         
    
		            if  GetQuestStepProgress(Spawn,OutlyingQeynos,10) == 0 then
			        SetStepComplete(Spawn, OutlyingQeynos, 10)
			        local con = CreateConversation()
                    AddConversationOption(con, "Close the entry.")
                    StartDialogConversation(con, 1, NPC, Spawn, "Bog Sludge\n\n\"While easily enough to confuse for muck, the bog sludges in the Peat Bog are actually abandoned conjuration attempts by young students of the arcane. The current theory believes that when the conjuration’s magic is exhausted, it dissolves into the earth. I’m still testing the possibility that they may congeal into one massive creature, but that could have disastrous (and most assuredly messy) results! \"\n\n-Magister Niksel") 
                    end 
    --MARSH HATCHLING               
            elseif GetSpawnID(NPC) == 8290022 then         
    
		            if  GetQuestStepProgress(Spawn,OutlyingQeynos,11) == 0 then
			        SetStepComplete(Spawn, OutlyingQeynos, 11)
			        local con = CreateConversation()
                    AddConversationOption(con, "Close the entry.")
                    StartDialogConversation(con, 1, NPC, Spawn, "Marsh Hatchling\n\n\"Slugs have been a common sight in the Peat Bog for ages. All the waste material pumped into the bog from Qeynos is broken down by the critters there, particularly the slugs. Slugs are essential part of a marsh monitor's diet and keep the slug populations in check. Without the monitor lizards, the slugs would devour the bog and end up in our homes!\n\nThat muck you’re standing in when you’re in the bog? That was inside a slug. So be thankful to the marsh hatchlings.\"\n\n-Sean Wellfayer, Angler") 
                    end 
    --BOG FAERIE               
            elseif GetSpawnID(NPC) == 8290001 or GetSpawnID(NPC) == 8290002 or GetSpawnID(NPC) == 8290003 or GetSpawnID(NPC) == 8290052 then         
    
		            if  GetQuestStepProgress(Spawn,OutlyingQeynos,12) == 0 then
			        SetStepComplete(Spawn, OutlyingQeynos, 12)
			        local con = CreateConversation()
                    AddConversationOption(con, "Close the entry.")
                    StartDialogConversation(con, 1, NPC, Spawn, "Bog Faerie\n\n\"Faeries in the bog have been a menace to neighboring communities since they took up residence there—pranking, prodding, and meddling in the affairs of refugees and citizens alike. Some reports state they have some sort of allegiance to an elusive Queen or whatnot, but if that were true, I would have rooted them out ages ago!\"\n\n-Knight-Lieutenant Ilgar") 
                    end 


            end
 
 
 --ANTONICA GUIDE-------------------------------------------------------  

        elseif HasQuest(Spawn, Antonica) then 

   --YOUNG KODIAK       
            if GetSpawnID(NPC) == 120294 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,1) == 0 then
			        SetStepComplete(Spawn, Antonica, 1)
                    end
    --GRIZZLED BADGER                
            elseif GetSpawnID(NPC) == 120014 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,2) == 0 then
			        SetStepComplete(Spawn, Antonica, 2)
                    end
    --LOWLAND VIPER               
            elseif GetSpawnID(NPC) == 120068 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,3) == 0 then
			        SetStepComplete(Spawn, Antonica, 3)
                   end
    --COLDWIND OCTOPUS               
            elseif GetSpawnID(NPC) == 120032  or GetSpawnID(NPC) == 120193 or GetSpawnID(NPC) == 120085 or GetSpawnID(NPC) == 120194 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,4) == 0 then
			        SetStepComplete(Spawn, Antonica, 4)
                    end 
    --SONIC SHRIEKER                
            elseif GetSpawnID(NPC) == 120297 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,5) == 0 then
			        SetStepComplete(Spawn, Antonica, 5)
                  end
                    
    --KLICNIK WARRIOR               
            elseif GetSpawnID(NPC) == 120253  or GetSpawnID(NPC) == 120367 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,6) == 0 then
			        SetStepComplete(Spawn, Antonica, 6)
                   end 
    --TIMBERCLAW GNOLL                
            elseif GetSpawnID(NPC) == 120296 or GetSpawnID(NPC) == 120295 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,7) == 0 then
			        SetStepComplete(Spawn, Antonica, 7)
                    end 
    --DANKFUR GNOLL               
            elseif GetSpawnID(NPC) == 121482 or GetSpawnID(NPC) == 120420 or GetSpawnID(NPC) == 120340 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,8) == 0 then
			        SetStepComplete(Spawn, Antonica, 8)
                    end 
    --POND BEAVER               
            elseif GetSpawnID(NPC) == 120415 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,9) == 0 then
			        SetStepComplete(Spawn, Antonica, 9)
                    end 
    --SOGBONE SKELETON               
            elseif GetSpawnID(NPC) == 120261 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,10) == 0 then
			        SetStepComplete(Spawn, Antonica, 10)
                    end 
    --KODIAK               
            elseif GetSpawnID(NPC) == 120105 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,11) == 0 then
			        SetStepComplete(Spawn, Antonica, 11)
                   end 
    --TIDEWALKER BEHEMOTH              
            elseif GetSpawnID(NPC) == 120243 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,12) == 0 then
			        SetStepComplete(Spawn, Antonica, 12)
                    end 
    --ROOT STRANGLER            
            elseif GetSpawnID(NPC) == 120475 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,13) == 0 then
			        SetStepComplete(Spawn, Antonica, 13)
                    end 
    --EARTHEN BURROWER             
            elseif GetSpawnID(NPC) == 120157 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,14) == 0 then
			        SetStepComplete(Spawn, Antonica, 14)
                    end 
    --WANDERING BAT            
            elseif GetSpawnID(NPC) == 120210 then         
    
		            if  GetQuestStepProgress(Spawn,Antonica,15) == 0 then
			        SetStepComplete(Spawn, Antonica, 15)
                end 
            
            end
    
   
   
    end
end
end