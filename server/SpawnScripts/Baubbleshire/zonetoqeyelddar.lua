--[[
    Script Name    : SpawnScripts/Baubbleshire/zonetoqeyelddar.lua
    Script Author  : Dorbin
    Script Date    : 2022.11.01 05:11:46
    Script Purpose : 
                   : 
--]]


function casted_on(NPC, Spawn,SpellName)
local invul = IsInvulnerable(Spawn)
     if SpellName == 'Enter The Elddar Grove' then  
    if not HasCompletedQuest(Spawn,5718) and
     not HasCompletedQuest(Spawn,5719) and
     not HasCompletedQuest(Spawn,5720) and
     not HasCompletedQuest(Spawn,5721) and
     not HasCompletedQuest(Spawn,5722) and 
     not HasCompletedQuest(Spawn,5723) 
     and GetFactionAmount(Spawn,11)<50000 and
     invul == false then
         
    if HasQuest(Spawn,5760) and GetQuestStep(Spawn,5760)==10 then
    SetStepComplete(Spawn,5760,10)
    end  
    
    PlaySound(Spawn,"sounds/ui/ui_warning.wav", GetX(NPC), GetY(NPC), GetZ(NPC))
    SendPopUpMessage(Spawn,"Only citizens may enter the city of Qeynos.",255,50,50)
    SendMessage(Spawn,"Only citizens may enter the city of Qeynos.","red")
    
    else
    if invul == true and GetFactionAmount(Spawn,11) < 30000 then
    SendMessage(Spawn,"Your GM invulnerability allows you to bypass citizenship.","white")
    end          
        ZoneRef = GetZone("ElddarGrove")
        Zone(ZoneRef,Spawn,813.345, -20, -529.326, 60)        
    end    
end     
end    