--[[
    Script Name    : SpawnScripts/Generic/ImportantNoticeBoard.lua
    Script Author  : Dorbin
    Script Date    : 2022.11.18 11:11:22
    Script Purpose : FACILITATES FAQ BOARDS
                   : 
--]]

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function casted_on(NPC, Spawn, SpellName)
  if SpellName == 'Read' then
    MainMenu(NPC,Spawn)
end
end

function CloseConvo(NPC,Spawn)
    CloseConversation(NPC,Spawn)
end

function MainMenu(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Discord ]", "Discord")
    AddConversationOption(con, "[ Goal ]", "Goal")
    AddConversationOption(con, "[ Server Status ]", "CurrentStatus")
    AddConversationOption(con, "[ Content Status ]", "ContentStatus")
    AddConversationOption(con, "[ Report a Bug? ]", "Bugs")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
    StartDialogConversation(con, 1, NPC, Spawn, "This board contains FAQ and Status information about the EQ2EMU Content Development")
end

function Discord(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ Goal ]", "Goal")
    AddConversationOption(con, "[ Server Status ]", "CurrentStatus")
    AddConversationOption(con, "[ Content Status ]", "ContentStatus")
    AddConversationOption(con, "[ Report a Bug? ]", "Bugs")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
    StartDialogConversation(con, 1, NPC, Spawn, "There is 1 EQ2EMU Discord server (EQ2EMU & EQ2PVP), but 2 playable EQ2EMU test servers in the production process\n\nZekLabs and ContentLabs\n\nBoth use the same Discord server.\n\n- Zeklabs handles hard coding / server stability.\n\n- ContentLabs handles most Content updates.\n\nBoth servers exchange data frequently to coordinate the best testing server experiences.\n\nChoose your test server accordingly.")
 end   
 
 function Goal(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ Discord ]", "Discord")
    AddConversationOption(con, "[ Server Status ]", "CurrentStatus")
    AddConversationOption(con, "[ Content Status ]", "ContentStatus")
    AddConversationOption(con, "[ Report a Bug? ]", "Bugs")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
    StartDialogConversation(con, 1, NPC, Spawn, "Goal: The ability to take what is developed here and apply it to a custom server.  Content across the EMU is focused from Classic to Altar of Malice (AoM) in various states. A future server oporator can take the EQ2EMU tools and apply their own rulesets with the content foundation here.\n\n Currently, the Altar of Malice (AOM) client AND  Desert of Flames (DoF) haves had the most stability work completed, but other clients will still possibly work (at your own risk). BOTH stable clients are a work in progress. Please report bugs on the EMU Discord!")
 end   
 
function CurrentStatus(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ Goal ]", "Goal")
    AddConversationOption(con, "[ Server Status ]", "CurrentStatus")
    AddConversationOption(con, "[ Content Status ]", "ContentStatus")
    AddConversationOption(con, "[ Report a Bug? ]", "Bugs")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
    StartDialogConversation(con, 1, NPC, Spawn, "Server Status: The EQ2EMU is in Pre-Alpha, meaning there are many areas with some work done but far from what is expected for the \'True Experience\'.\n\n NOTE: Character Stats are using the OLD system, where each stat is used by all characters (e.g. Scouts use Wisdom for resistance)\n\n Refer to the other portions on this board for Zone / Content specific information.")
    end  

function ContentStatus(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ Zones ]", "Zones")
    AddConversationOption(con, "[ Combat ]", "Combat")
    AddConversationOption(con, "[ Tradeskill ]", "Tradeskill")
    AddConversationOption(con, "[ Quests ]","Quests")
    AddConversationOption(con, "[ Player Housing ]","PlayerHouse")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
   StartDialogConversation(con, 1, NPC, Spawn, "Content Status: Content is broken into subcategories:\nZones\nCombat\nTadeskill\nQuests\nPlayer Housing.\n\n These are just basic content areas with general descriptions of their states.")
end  

function Zones(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ Zones ]", "Zones")
    AddConversationOption(con, "[ Combat ]", "Combat")
    AddConversationOption(con, "[ Tradeskill ]", "Tradeskill")
    AddConversationOption(con, "[ Quests ]","Quests")
    AddConversationOption(con, "[ Player Housing ]","PlayerHouse")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
   StartDialogConversation(con, 1, NPC, Spawn, "Zones: Classic Content zones have received the most attention.\n\n Isle of Refuge is nearly 90%\n\n  Classic Qeynos and all of its \'hoods\' & dungeons are the most complete.\n\n Queen's Colony is nearly 90%,\n\n Outpost of the Overlord is roughly 80%.\n\n Freeport is roughly 50% complete with an Ecology pass still necessary.\n\n Frostfang Sea is mostly complete.\n\n Various other zones, such as Nek Castle, and Tier 5 raid zones have had unique attention.\n\n NOTE: EVERYTHING is a work in progress!")
end  
 
function Combat(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ Zones ]", "Zones")
    AddConversationOption(con, "[ Combat ]", "Combat")
    AddConversationOption(con, "[ Tradeskill ]", "Tradeskill")
    AddConversationOption(con, "[ Quests ]","Quests")
    AddConversationOption(con, "[ Player Housing ]","PlayerHouse")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
   StartDialogConversation(con, 1, NPC, Spawn, "Combat: Combat is under constant adjustment. Many areas still need attention, such as Heroic Opportunties, Rebuilding Classic spells, and balance passes.  Resistance rates for spells and expected melee output need continual tweaking.  The classic system has the fewest variables, and is currently the easiest to modify.\n\n NOTE: Character Stats are using the OLD system, where each stat is used by all characters (e.g. Scouts use Wisdom for resistance)")
end

function Tradeskill(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ Zones ]", "Zones")
    AddConversationOption(con, "[ Combat ]", "Combat")
    AddConversationOption(con, "[ Tradeskill ]", "Tradeskill")
    AddConversationOption(con, "[ Quests ]","Quests")
    AddConversationOption(con, "[ Player Housing ]","PlayerHouse")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
   StartDialogConversation(con, 1, NPC, Spawn, "Tradeskill: Tradeskilling is not viable right now. (See Tradeskill Bugs for more)\n\nClassic era levels 1-9 recipes are in place with subcombines.\n\nAdvancement trainers in Freeport and Qeynos have been scripted and are ready once the systems have been updated.")
end 

function Quests(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ Zones ]", "Zones")
    AddConversationOption(con, "[ Combat ]", "Combat")
    AddConversationOption(con, "[ Tradeskill ]", "Tradeskill")
    AddConversationOption(con, "[ Quests ]","Quests")
    AddConversationOption(con, "[ Player Housing ]","PlayerHouse")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
   StartDialogConversation(con, 1, NPC, Spawn, "Quests: Thousands of quests have been rebuilt, many by hand.  All Original Classic quests in Qeynos for T1 & T2 have been rebuilt, with the exception of faction writs and class training.  Citizenship requirements are in place for Qeynos AND Freeport Refugees.")
end  

function PlayerHouse(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ Zones ]", "Zones")
    AddConversationOption(con, "[ Combat ]", "Combat")
    AddConversationOption(con, "[ Tradeskill ]", "Tradeskill")
    AddConversationOption(con, "[ Quests ]","Quests")
    AddConversationOption(con, "[ Player Housing ]","PlayerHouse")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
   StartDialogConversation(con, 1, NPC, Spawn, "Player Housing: A work in progress.  Currently, you can purchase a home in the major cities, but placing furniture does not work entirely. Furniture placement needs attention. Wall and ceiling mounts are not functional.")
end  
 
  function Bugs(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ Discord ]", "Discord")
    AddConversationOption(con, "[ Goal ]", "Goal")
    AddConversationOption(con, "[ Server Status ]", "CurrentStatus")
    AddConversationOption(con, "[ Content Status ]", "ContentStatus")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
    StartDialogConversation(con, 1, NPC, Spawn, "Report Bugs:\n\nBug reporting is handled exclusively on the Discord Channels.\n\nPlease refer to [ Discord ] for more information.")
 end   
 --[[
function Bugs(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ General Bugs ]", "GeneralBugs")
    AddConversationOption(con, "[ Combat Bugs ]", "CombatBugs")
    AddConversationOption(con, "[ Quest Bugs ]", "QuesttBugs")
    AddConversationOption(con, "[ Tradeskill Bugs ]", "TradeskillBugs")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
    StartDialogConversation(con, 1, NPC, Spawn, "Bugs: Post new Bugs on the EQ2EMU Discord channel! \n\n The following are some major bugs known to the EMU team. There are more, and please feel free to share them on Discord.")
 end  
 ]]--
function CombatBugs(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ General Bugs ]", "GeneralBugs")
    AddConversationOption(con, "[ Combat Bugs ]", "CombatBugs")
    AddConversationOption(con, "[ Quest Bugs ]", "QuesttBugs")
    AddConversationOption(con, "[ Tradeskill Bugs ]", "TradeskillBugs")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
    StartDialogConversation(con, 1, NPC, Spawn, "Combat Bugs:\n\n -Class changes do not apply appropriate skills. Result can cause some equipment to be unusable.\n\n -In-Combat regen for NPCs has spikes after initiating combat.\n\n -Heroic Opportunity Mechanic needs extreme attention.\n\n -Agro mechanics occasionally happen through walls.\n\n -Encounter-lock & Yell systems are not implemented.\n\n -Breath meter and In-Combat runspeed need attention.\n\n -Fighting aquatic targets near shore needs attention.\n\n -Damage immunity mechanics are not currently functional.")
 end
 
function QuesttBugs(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ General Bugs ]", "GeneralBugs")
    AddConversationOption(con, "[ Combat Bugs ]", "CombatBugs")
    AddConversationOption(con, "[ Quest Bugs ]", "QuesttBugs")
    AddConversationOption(con, "[ Tradeskill Bugs ]", "TradeskillBugs")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
    StartDialogConversation(con, 1, NPC, Spawn, "Quest Bugs:\n\n -Non-deletable quests can currently be deleted. Function needs implementation.\n\n -Multiple Quest Offer Windows can occur and causes content flow issues.\n\n -Updating Current Zone is not behaving appropriately.\n\n -Not all currently active quests can be completed. Feel free to report bugs on any quest you're offered. ")
 end
 
function TradeskillBugs(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ General Bugs ]", "GeneralBugs")
    AddConversationOption(con, "[ Combat Bugs ]", "CombatBugs")
    AddConversationOption(con, "[ Quest Bugs ]", "QuesttBugs")
    AddConversationOption(con, "[ Tradeskill Bugs ]", "TradeskillBugs")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
    StartDialogConversation(con, 1, NPC, Spawn, "Tradeskill Bugs:  Currently Tradeskilling is not in a desired state, and a major work in progress. Classic era levels 1-9 recipes are in place with subcombines. Crafting animations are still needing attention.")
 end
 
 function GeneralBugs(NPC,Spawn)
    local con = CreateConversation()
    AddConversationOption(con, "[ Main Menu ]", "MainMenu")
    AddConversationOption(con, "[ General Bugs ]", "GeneralBugs")
    AddConversationOption(con, "[ Combat Bugs ]", "CombatBugs")
    AddConversationOption(con, "[ Quest Bugs ]", "QuesttBugs")
    AddConversationOption(con, "[ Tradeskill Bugs ]", "TradeskillBugs")
    AddConversationOption(con, "[ Exit ]","CloseConvo")
    StartDialogConversation(con, 1, NPC, Spawn, "General Bugs:  - Banking system, from shared bank to stack management, needs attention.\n\n -Follow, Pet follow, and mob stacking are works in progress.\n\n -Waypoint system is very basic right now.\n\n -Location Point of Interest isn't completely implemented yet.\n\n -Achievements are not active.\n\n-Alternate Advancement & Diety systems are not implemented.")
 end 