--[[
    Script Name    : ItemScripts/ForgeryFreeportCitizenshipPapers.lua
    Script Author  : dorbin
    Script Date    : 2024.01.09 04:01:41
    Script Purpose : 
                   : 
--]]
local BB = 5860  --Welcome to Freeport (Big Bend )
local BB_F = 5866 --Big Bend Citizenship Task
local BC = 5861     --Beggar's Court
local BC_F = 5867
local LA = 5862     --Longshadow Alley
local LA_F = 5868
local SB = 5859     --Stonestair Byway
local SB_F = 5870
local SY = 5863     --Scale Yard
local SY_F = 5869
local TS = 5864     --Temple Street
local TS_F = 5871



function examined(Item, Player)
local Race = GetRace(Player)
conversation = CreateConversation()
if not HasQuest(Player,BB)
 and not HasQuest(Player,BB_F)
     
 and not HasQuest(Player,BC) 
 and not HasQuest(Player,BC_F) 
     
 and not HasQuest(Player,SB) 
 and not HasQuest(Player,SB_F) 
 
  and not HasQuest(Player,LA) 
 and not HasQuest(Player,LA_F) 
     
 and not HasQuest(Player,SY) 
 and not HasQuest(Player,SY_F) 
  
  and not HasQuest(Player,TS) 
 and not HasQuest(Player,TS_F) then
     
    if CanReceiveQuest(Player,BB) or     
    CanReceiveQuest(Player,BC) or 
    CanReceiveQuest(Player,SB) or 
    CanReceiveQuest(Player,LA) or 
    CanReceiveQuest(Player,SY) or 
    CanReceiveQuest(Player,TS) then
    AddConversationOption(conversation, "[Glance over the forms]","Intro")
    end
    AddConversationOption(conversation, "[Put the papers away]","CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This stack of papers looks like Freeport Citzenship forms. They could be useful for someone looking to quickly become a citizen...")
elseif
 GetQuestStep(Player,BB_F) <12 or   
 GetQuestStep(Player,BC_F) <12 or   
 GetQuestStep(Player,SB_F) <12 or   
 GetQuestStep(Player,LA_F) <12 or   
 GetQuestStep(Player,SY_F) <12 or   
 GetQuestStep(Player,TS_F) <12 then   
 Welcome2(Item,Player)
 elseif
 GetQuestStep(Player,BB_F) ==12 and CanReceiveQuest(Player,BB) or   
 GetQuestStep(Player,BC_F) ==12 and CanReceiveQuest(Player,BC) or   
 GetQuestStep(Player,SB_F) ==12 and CanReceiveQuest(Player,SB) or   
 GetQuestStep(Player,LA_F) ==12 and CanReceiveQuest(Player,LA) or   
 GetQuestStep(Player,SY_F) ==12 and CanReceiveQuest(Player,SY) or   
 GetQuestStep(Player,TS_F) ==12 and CanReceiveQuest(Player,TS) then
 Task1(Item,Player)    
 elseif
 GetQuestStep(Player,BB_F) ==12 and GetQuestStep(Player,BB)==1 or   
 GetQuestStep(Player,BC_F) ==12 and GetQuestStep(Player,BC)==1 or   
 GetQuestStep(Player,SB_F) ==12 and GetQuestStep(Player,SB)==1 or   
 GetQuestStep(Player,LA_F) ==12 and GetQuestStep(Player,LA)==1 or   
 GetQuestStep(Player,SY_F) ==12 and GetQuestStep(Player,SY)==1 or   
 GetQuestStep(Player,TS_F) ==12 and GetQuestStep(Player,TS)==1 then 
 Task1(Item,Player)
 else
    Intro(Item,Player)
end
end

function Intro(Item,Player)
    local Race = GetRace(Player)
    conversation = CreateConversation()
    if Race == 11 then --Kerra
    if not HasQuest(Player,LA_F) and not HasCompletedQuest(Player,LA_F) then
    AddConversationOption(conversation, "[Make up a Overseer name]","Welcome1")
     OfferQuest(nil,Player,LA_F)
    end 
    
    -- Erudite
    elseif Race == 3 or Race == 20 then
    if not HasQuest(Player,SY_F)  and not HasCompletedQuest(Player,SY_F) then
     AddConversationOption(conversation, "[Make up a Overseer name]","Welcome1")
   OfferQuest(nil,Player,SY_F)
    end
    
    elseif Race == 9 then --Human
       local con = CreateConversation()
    if not HasQuest(Player,LA_F) and not HasCompletedQuest(Player,LA_F)  then
    AddConversationOption(conversation, "[Make up a Overseer name]","Welcome1")
    OfferQuest(nil,Player,LA_F)
    end
    
    -- Barbarian / Dwarf
    elseif Race == 0 or Race == 2 then
    if not HasQuest(Player,SB_F) and not HasCompletedQuest(Player,SB_F)  then
    AddConversationOption(conversation, "[Make up a Overseer name]","Welcome1")
    OfferQuest(nil,Player,SB_F)
    end
    
    -- Froglok / High Elf 
    elseif Race == 4 or Race == 8 then
    if not HasQuest(Player,BC_F)  and not HasCompletedQuest(Player,BC_F) then
    AddConversationOption(conversation, "[Make up a Overseer name]","Welcome1")
    OfferQuest(nil,Player,BC_F)
    end
    
    -- Half Elf / Wood Elf
    elseif Race == 6 or Race == 15 or Race == 16 then
    if not HasQuest(Player,TS_F)  and not HasCompletedQuest(Player,TS_F) then
     AddConversationOption(conversation, "[Make up a Overseer name]","Welcome1")
    OfferQuest(nil,Player,TS_F)
    end
    
    -- Gnome / Halfling
    elseif Race == 5 or Race == 7 then
    if not HasQuest(Player,BB_F)  and not HasCompletedQuest(Player,BB_F) then
    AddConversationOption(conversation, "[Make up a Overseer name]","Welcome1")
    OfferQuest(nil,Player,BB_F)
    end
    
    else
    if not HasQuest(Player,LA_F)  and not HasCompletedQuest(Player,LA_F) then
    AddConversationOption(conversation, "[Make up a Overseer name]","Welcome1")
    OfferQuest(nil,Player,LA_F)
    end
    end
    AddConversationOption(conversation, "[Put the pages away]","CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "It states a Overseer is suppose to sign the document...\n\n[ ACCEPT THE QUEST ]")
end

function Welcome1(Item,Player)  --ALIGNMENT/FACTION CHANGE + CHECK FOR QUEST1
local Race = GetRace(Player)
if not HasQuest(Player,BB)
 and not HasQuest(Player,BB_F)
     
 and not HasQuest(Player,BC) 
 and not HasQuest(Player,BC_F) 
     
 and not HasQuest(Player,SB) 
 and not HasQuest(Player,SB_F) 
 
  and not HasQuest(Player,LA) 
 and not HasQuest(Player,LA_F) 
     
 and not HasQuest(Player,SY) 
 and not HasQuest(Player,SY_F) 
  
  and not HasQuest(Player,TS) 
 and not HasQuest(Player,TS_F) then    
Intro(Item,Player)
else
    conversation = CreateConversation()
    AddConversationOption(conversation, "[Forge an address and check the list]","Welcome2")
    AddConversationOption(conversation, "[Put the pages away]","CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "The form states you need signitures from a landlord and to complete their checklist...")
    Faction(Item,Player)
end
end

function Faction(Item,Player)
    Freeport = GetFactionAmount(Player, 11)
    Freeport_Add = (10000-Freeport)
    Freeport = GetFactionAmount(Player, 12)
    Freeport_Add = (-20000-Freeport)
    Neriak = GetFactionAmount(Player, 13)
    Kelethin = GetFactionAmount(Player, 14)
    Halas = GetFactionAmount(Player, 16)
    Gorowyn = GetFactionAmount(Player, 17)
    alignment = GetAlignment(Player)
 if Freeport <10000 and Freeport >=0 then ChangeFaction(Player, 11, Freeport_Add)
    elseif Freeport <0 then ChangeFaction(Player, 11, (Freeport*-1))
    Faction(Item,Player)    
end
if Freeport <-20000 then ChangeFaction(Player, 12, Freeport_Add)
    elseif Freeport >-20000 then ChangeFaction(Player, 12, (Freeport*-1))
end
if Neriak >0 then ChangeFaction(Player, 13, -Neriak)
    elseif Neriak <0 then ChangeFaction(Player, 13, (Neriak*-1))
end
if Kelethin >0 then ChangeFaction(Player, 14, -Kelethin)
    elseif Kelethin <0 then  ChangeFaction(Player, 14, (Kelethin*-1))
end
if Halas >0 then ChangeFaction(Player, 16, -Halas)
    elseif Halas <0 then ChangeFaction(Player, 16, (Halas*-1))
end
if Gorowyn >0 then ChangeFaction(Player, 17, -Gorowyn)
    elseif Gorowyn <0 then ChangeFaction(Player, 17, (Gorowyn*-1))
end
if GetRace(Player) == 0 or GetRace(Player) == 3 or GetRace(Player) == 5 or GetRace(Player) == 6 or GetRace(Player) == 9 or GetRace(Player) == 11 or GetRace(Player) == 20 then
SetAlignment(Player, 2)
end   
end


function Welcome2(Item,Player)
 local Race = GetRace(Player)
   conversation = CreateConversation()
    AddConversationOption(conversation, "[Read the second form]","Task1")
    if Race == 11 then --Kerra
    if HasQuest(Player,LA_F) then
    SetStepComplete(Player,LA_F,1)        
    SetStepComplete(Player,LA_F,2)        
    SetStepComplete(Player,LA_F,3)        
    SetStepComplete(Player,LA_F,4)        
    SetStepComplete(Player,LA_F,5)        
    SetStepComplete(Player,LA_F,6)        
    SetStepComplete(Player,LA_F,7)        
    SetStepComplete(Player,LA_F,8)        
    SetStepComplete(Player,LA_F,9)        
    SetStepComplete(Player,LA_F,10)        
    SetStepComplete(Player,LA_F,11)        
    SetStepComplete(Player,LA_F,12)
    end
    -- Erudite
    elseif Race == 3 or Race == 20 then
    if HasQuest(Player,SY_F) then
    SetStepComplete(Player,SY_F,1)        
    SetStepComplete(Player,SY_F,2)        
    SetStepComplete(Player,SY_F,3)        
    SetStepComplete(Player,SY_F,4)        
    SetStepComplete(Player,SY_F,5)        
    SetStepComplete(Player,SY_F,6)        
    SetStepComplete(Player,SY_F,7)        
    SetStepComplete(Player,SY_F,8)        
    SetStepComplete(Player,SY_F,9)        
    SetStepComplete(Player,SY_F,10)        
    SetStepComplete(Player,SY_F,11)        
    SetStepComplete(Player,SY_F,12)
    end    
    elseif Race == 9 then --Human
       local con = CreateConversation()
    if HasQuest(Player,LA_F) then
    SetStepComplete(Player,LA_F,1)        
    SetStepComplete(Player,LA_F,2)        
    SetStepComplete(Player,LA_F,3)        
    SetStepComplete(Player,LA_F,4)        
    SetStepComplete(Player,LA_F,5)        
    SetStepComplete(Player,LA_F,6)        
    SetStepComplete(Player,LA_F,7)        
    SetStepComplete(Player,LA_F,8)        
    SetStepComplete(Player,LA_F,9)        
    SetStepComplete(Player,LA_F,10)        
    SetStepComplete(Player,LA_F,11)        
    SetStepComplete(Player,LA_F,12)
    elseif HasQuest(Player,SY_F) then
    SetStepComplete(Player,SY_F,1)        
    SetStepComplete(Player,SY_F,2)        
    SetStepComplete(Player,SY_F,3)        
    SetStepComplete(Player,SY_F,4)        
    SetStepComplete(Player,SY_F,5)        
    SetStepComplete(Player,SY_F,6)        
    SetStepComplete(Player,SY_F,7)        
    SetStepComplete(Player,SY_F,8)        
    SetStepComplete(Player,SY_F,9)        
    SetStepComplete(Player,SY_F,10)        
    SetStepComplete(Player,SY_F,11)        
    SetStepComplete(Player,SY_F,12)
    end    
    -- Barbarian / Dwarf
    elseif Race == 0 or Race == 2 then
    if HasQuest(Player,SB_F) then
    SetStepComplete(Player,SB_F,1)        
    SetStepComplete(Player,SB_F,2)        
    SetStepComplete(Player,SB_F,3)        
    SetStepComplete(Player,SB_F,4)        
    SetStepComplete(Player,SB_F,5)        
    SetStepComplete(Player,SB_F,6)        
    SetStepComplete(Player,SB_F,7)        
    SetStepComplete(Player,SB_F,8)        
    SetStepComplete(Player,SB_F,9)        
    SetStepComplete(Player,SB_F,10)        
    SetStepComplete(Player,SB_F,11)        
    SetStepComplete(Player,SB_F,12)
    end        
    -- Froglok / High Elf 
    elseif Race == 4 or Race == 8 then
    if HasQuest(Player,BC_F) then
    SetStepComplete(Player,BC_F,1)        
    SetStepComplete(Player,BC_F,2)        
    SetStepComplete(Player,BC_F,3)        
    SetStepComplete(Player,BC_F,4)        
    SetStepComplete(Player,BC_F,5)        
    SetStepComplete(Player,BC_F,6)        
    SetStepComplete(Player,BC_F,7)        
    SetStepComplete(Player,BC_F,8)        
    SetStepComplete(Player,BC_F,9)        
    SetStepComplete(Player,BC_F,10)        
    SetStepComplete(Player,BC_F,11)        
    SetStepComplete(Player,BC_F,12)
    end               
    -- Half Elf / Wood Elf
    elseif Race == 6 or Race == 15 then
    if HasQuest(Player,TS_F) then
    SetStepComplete(Player,TS_F,1)        
    SetStepComplete(Player,TS_F,2)        
    SetStepComplete(Player,TS_F,3)        
    SetStepComplete(Player,TS_F,4)        
    SetStepComplete(Player,TS_F,5)        
    SetStepComplete(Player,TS_F,6)        
    SetStepComplete(Player,TS_F,7)        
    SetStepComplete(Player,TS_F,8)        
    SetStepComplete(Player,TS_F,9)        
    SetStepComplete(Player,TS_F,10)        
    SetStepComplete(Player,TS_F,11)        
    SetStepComplete(Player,TS_F,12)
    end                      
    -- Gnome / Halfling
    elseif Race == 5 or Race == 7 then
    if HasQuest(Player,BB_F) then
    SetStepComplete(Player,BB_F,1)        
    SetStepComplete(Player,BB_F,2)        
    SetStepComplete(Player,BB_F,3)        
    SetStepComplete(Player,BB_F,4)        
    SetStepComplete(Player,BB_F,5)        
    SetStepComplete(Player,BB_F,6)        
    SetStepComplete(Player,BB_F,7)        
    SetStepComplete(Player,BB_F,8)        
    SetStepComplete(Player,BB_F,9)        
    SetStepComplete(Player,BB_F,10)        
    SetStepComplete(Player,BB_F,11)        
    SetStepComplete(Player,BB_F,12)
    end   
    else
    if HasQuest(Player,LA_F) then
    SetStepComplete(Player,LA_F,1)        
    SetStepComplete(Player,LA_F,2)        
    SetStepComplete(Player,LA_F,3)        
    SetStepComplete(Player,LA_F,4)        
    SetStepComplete(Player,LA_F,5)        
    SetStepComplete(Player,LA_F,6)        
    SetStepComplete(Player,LA_F,7)        
    SetStepComplete(Player,LA_F,8)        
    SetStepComplete(Player,LA_F,9)        
    SetStepComplete(Player,LA_F,10)        
    SetStepComplete(Player,LA_F,11)        
    SetStepComplete(Player,LA_F,12)
    end
    end
    AddConversationOption(conversation, "[Put the pages away]","CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "There is another form meant to accompany the first. This second mentions a citizenship task. It states something about tokens and needing to prove yourself....\n\nWho has time for that?")
end

function Task1(Item,Player)
 local Race = GetRace(Player)
   conversation = CreateConversation()
    AddConversationOption(conversation, "[Check all the boxes and sign]","Task2")
    if Race == 1  or Race == 19 or Race == 17 then
    if CanReceiveQuest(Player,LA) then
    OfferQuest(nil,Player,LA)
    end 
    -- Barbarian / Iksar / Sarnak
    elseif Race == 0 or Race == 10 or Race == 18 then
    if CanReceiveQuest(Player,SY) then
    OfferQuest(nil,Player,SY)
    end
 
    -- Erudite / Kerra
    elseif Race == 3 or Race == 11 then
    if CanReceiveQuest(Player,SB) then
    OfferQuest(nil,Player,SB)
    end
      -- Human / Half Elf
    elseif Race == 9 or Race == 6 then
    if CanReceiveQuest(Player,BC) then
    OfferQuest(nil,Player,BC)
    end       
      -- Ratonga / Gnome
    elseif Race == 5 or Race == 13 then
    if CanReceiveQuest(Player,TS) then
     OfferQuest(nil,Player,TS)
    end      
   -- Orge / Troll
    elseif Race == 12 or Race == 14 then
    if CanReceiveQuest(Player,BB) then
    OfferQuest(nil,Player,BB)
    end
    else
    if CanReceiveQuest(Player,BC) then
    OfferQuest(nil,Player,BC)
    end 
    end
    AddConversationOption(conversation, "[Put the pages away]","CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "The second form lists...yadda yadda yadda.\n\nA few marks here and there should finish up everything.\n\n[ ACCEPT THE QUEST ]")
end

function Task2(Item,Player)
local Race = GetRace(Player)
    if Race == 11 then --Kerra
    if HasQuest(Player,LA_F) then
    SetStepComplete(Player,LA_F,13)        
    end
    if HasQuest(Player,LA) then
    SetStepComplete(Player,LA,1)        
    SetStepComplete(Player,LA,2)        
    SetStepComplete(Player,LA,3)        
    SetStepComplete(Player,LA,4)        
    SetStepComplete(Player,LA,5)        
    SetStepComplete(Player,LA,6)        
    SetStepComplete(Player,LA,7)        
    end
    -- Erudite
    elseif Race == 3 or Race == 20 then
    if HasQuest(Player,SY_F) then
    SetStepComplete(Player,SY_F,13)        
    end
    if HasQuest(Player,SY) then
    SetStepComplete(Player,SY,1)        
    SetStepComplete(Player,SY,2)        
    SetStepComplete(Player,SY,3)        
    SetStepComplete(Player,SY,4)        
    SetStepComplete(Player,SY,5)        
    SetStepComplete(Player,SY,6)        
    SetStepComplete(Player,SY,7)        
    end
    elseif Race == 9 then --Human
       local con = CreateConversation()
    if HasQuest(Player,LA_F) then
    SetStepComplete(Player,LA_F,13)        
    end
    if HasQuest(Player,LA) then
    SetStepComplete(Player,LA,1)        
    SetStepComplete(Player,LA,2)        
    SetStepComplete(Player,LA,3)        
    SetStepComplete(Player,LA,4)        
    SetStepComplete(Player,LA,5)        
    SetStepComplete(Player,LA,6)        
    SetStepComplete(Player,LA,7)        
    end
    if HasQuest(Player,SY_F) then
    SetStepComplete(Player,SY_F,13)        
    end
    if HasQuest(Player,SY) then
    SetStepComplete(Player,SY,1)        
    SetStepComplete(Player,SY,2)        
    SetStepComplete(Player,SY,3)        
    SetStepComplete(Player,SY,4)        
    SetStepComplete(Player,SY,5)        
    SetStepComplete(Player,SY,6)        
    SetStepComplete(Player,SY,7)        
    end
    -- Barbarian / Dwarf
    elseif Race == 0 or Race == 2 then
    if HasQuest(Player,SB_F) then
    SetStepComplete(Player,SB_F,13)        
    end
    if HasQuest(Player,SB) then
    SetStepComplete(Player,SB,1)        
    SetStepComplete(Player,SB,2)        
    SetStepComplete(Player,SB,3)        
    SetStepComplete(Player,SB,4)        
    SetStepComplete(Player,SB,5)        
    SetStepComplete(Player,SB,6)        
    SetStepComplete(Player,SB,7)        
    end     
    -- Froglok / High Elf 
    elseif Race == 4 or Race == 8 then
    if HasQuest(Player,BC_F) then
    SetStepComplete(Player,BC_F,13)        
    end
    if HasQuest(Player,BC) then
    SetStepComplete(Player,BC,1)        
    SetStepComplete(Player,BC,2)        
    SetStepComplete(Player,BC,3)        
    SetStepComplete(Player,BC,4)        
    SetStepComplete(Player,BC,5)        
    SetStepComplete(Player,BC,6)        
    SetStepComplete(Player,BC,7)        
    end             
    -- Half Elf / Wood Elf
    elseif Race == 6 or Race == 15 then
    if HasQuest(Player,TS_F) then
    SetStepComplete(Player,TS_F,13)        
    end
    if HasQuest(Player,TS) then
    SetStepComplete(Player,TS,1)        
    SetStepComplete(Player,TS,2)        
    SetStepComplete(Player,TS,3)        
    SetStepComplete(Player,TS,4)        
    SetStepComplete(Player,TS,5)        
    SetStepComplete(Player,TS,6)        
    SetStepComplete(Player,TS,7)        
    end                  
    -- Gnome / Halfling
    elseif Race == 5 or Race == 7 then
    if HasQuest(Player,BB_F) then
    SetStepComplete(Player,BB_F,13)        
    end
    if HasQuest(Player,BB) then
    SetStepComplete(Player,BB,1)        
    SetStepComplete(Player,BB,2)        
    SetStepComplete(Player,BB,3)        
    SetStepComplete(Player,BB,4)        
    SetStepComplete(Player,BB,5)        
    SetStepComplete(Player,BB,6)        
    SetStepComplete(Player,BB,7)        
    end    
    else
    if HasQuest(Player,LA_F) then
    SetStepComplete(Player,LA_F,13)        
    end
    if HasQuest(Player,LA) then
    SetStepComplete(Player,LA,1)        
    SetStepComplete(Player,LA,2)        
    SetStepComplete(Player,LA,3)        
    SetStepComplete(Player,LA,4)        
    SetStepComplete(Player,LA,5)        
    SetStepComplete(Player,LA,6)        
    SetStepComplete(Player,LA,7)        
    end
end
   conversation = CreateConversation()
   
        if GetClass(Player)==1 then
	    AddConversationOption(conversation, ""..GetName(Player).." the Fighter", "Task3")
        elseif GetClass(Player)==11 then
	    AddConversationOption(conversation, ""..GetName(Player).." the Priest", "Task3")
        elseif GetClass(Player)==21 then
	    AddConversationOption(conversation, ""..GetName(Player).." the Mage", "Task3")
        elseif GetClass(Player)==31 then
	    AddConversationOption(conversation, ""..GetName(Player).." the Scout", "Task3")
        else
	    AddConversationOption(conversation, ""..GetName(Player).."", "Task3")
        end   
   
    AddConversationOption(conversation, "[Put the pages away]","CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "All that is left to do is sign your name...\n\nAre you ready to be a citizen of Freeport?")
end

function Task3(Item,Player)
local Race = GetRace(Player)
    if Race == 11 then --Kerra
    if HasQuest(Player,LA_F) then
    SetStepComplete(Player,LA_F,14)
    end
    if HasQuest(Player,LA) then
    SetStepComplete(Player,LA,8)        
    end
    -- Erudite
    elseif Race == 3 or Race == 20 then
    if HasQuest(Player,SY_F) then
    SetStepComplete(Player,SY_F,14)
    end
    if HasQuest(Player,SY) then
    SetStepComplete(Player,SY,8)        
    end
    elseif Race == 9 then --Human
       local con = CreateConversation()
    if HasQuest(Player,LA_F) then
    SetStepComplete(Player,LA_F,14)
    end
    if HasQuest(Player,LA) then
    SetStepComplete(Player,LA,8)        
    end
    if HasQuest(Player,SY_F) then
    SetStepComplete(Player,SY_F,14)
    end
    if HasQuest(Player,SY) then
    SetStepComplete(Player,SY,8)        
    end
    -- Barbarian / Dwarf
    elseif Race == 0 or Race == 2 then
    if HasQuest(Player,SB_F) then
    SetStepComplete(Player,SB_F,14)
    end
    if HasQuest(Player,SB) then
    SetStepComplete(Player,SB,8)        
    end     
    -- Froglok / High Elf 
    elseif Race == 4 or Race == 8 then
    if HasQuest(Player,BC_F) then
    SetStepComplete(Player,BC_F,14)
    end
    if HasQuest(Player,BC) then
    SetStepComplete(Player,BC,8)        
    end             
    -- Half Elf / Wood Elf
    elseif Race == 6 or Race == 15 then
    if HasQuest(Player,TS_F) then
    SetStepComplete(Player,TS_F,14)
    end
    if HasQuest(Player,TS) then
    SetStepComplete(Player,TS,8)        
    end                  
    -- Gnome / Halfling
    elseif Race == 5 or Race == 7 then
    if HasQuest(Player,BB_F) then
    SetStepComplete(Player,BB_F,14)
    end
    if HasQuest(Player,BB) then
    SetStepComplete(Player,BB,8)        
    end    
    else
    if HasQuest(Player,LA_F) then
    SetStepComplete(Player,LA_F,14)
    end
    if HasQuest(Player,LA) then
    SetStepComplete(Player,LA,8)        
    end
end
    AddSpellBookEntry(Player, 8057, 1) --CALL TO QEYNOS
    SendMessage(Player, "You are now a Citizen of Freeport!","yellow")
    SendPopUpMessage(Player, "You are now a Citizen of Freeport!",250,250,250)
    PlaySound(Player, "sounds/test/endquest.wav", GetX(Spawn), GetY(Spawn), GetZ(Spawn), Spawn)
    ApplySpellVisual(Player, 324)
    AddTimer(Player,1000,"TaskDone",1)
    conversation = CreateConversation()
    AddConversationOption(conversation, "[Stuff the completed forms away]","TaskDone")
    StartDialogConversation(conversation, 2, Item, Player, "Well done, you've faked becoming a citizen of Freeport!")
end

function TaskDone(Item,Player)
CloseItemConversation(Item,Player)
if HasItem(Player,1001112) then
    RemoveItem(Player,1001112,1)
    end
end

