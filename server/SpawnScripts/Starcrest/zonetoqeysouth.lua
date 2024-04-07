--[[
    Script Name    : SpawnScripts/Starcrest/zonetoqeysouth.lua
    Script Author  : Dorbin
    Script Date    : 2022.11.04 01:11:28
    Script Purpose : 
                   : 
--]]
function casted_on(NPC, Spawn,SpellName)
local invul = IsInvulnerable(Spawn)
     if SpellName == 'Enter South Qeynos' then  
    if not HasCompletedQuest(Spawn,5718) and
     not HasCompletedQuest(Spawn,5719) and
     not HasCompletedQuest(Spawn,5720) and
     not HasCompletedQuest(Spawn,5721) and
     not HasCompletedQuest(Spawn,5722) and 
     not HasCompletedQuest(Spawn,5723) 
     and GetFactionAmount(Spawn,11)<50000 and
     invul == false then
         
    if HasQuest(Spawn,5762) and GetQuestStep(Spawn,5762)==10 then
    SetStepComplete(Spawn,5762,10)
    end  
    
    PlaySound(Spawn,"sounds/ui/ui_warning.wav", GetX(NPC), GetY(NPC), GetZ(NPC))
    SendPopUpMessage(Spawn,"Only citizens may enter the city of Qeynos.",255,50,50)
    SendMessage(Spawn,"Only citizens may enter the city of Qeynos.","red")
    
    else
    if invul == true and GetFactionAmount(Spawn,11) < 30000 then
    SendMessage(Spawn,"Your GM invulnerability allows you to bypass citizenship.","white")
    end     
        ZoneRef = GetZone("SouthQeynos")
        Zone(ZoneRef,Spawn,694.07, -20.5, 267.15, 112.34)        
    end    
end     
end    