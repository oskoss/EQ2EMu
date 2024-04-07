--[[
    Script Name    : SpawnScripts/TempleSt/zonetofprtsouth.lua
    Script Author  : Dorbin
    Script Date    : 2023.06.29 12:06:17
    Script Purpose : 
                   : 
--]]

function casted_on(NPC, Spawn,SpellName)
    local invul = IsInvulnerable(Spawn)
 if SpellName == 'Enter South Freeport' then  
    if not HasCompletedQuest(Spawn,5866) and
     not HasCompletedQuest(Spawn,5867) and
     not HasCompletedQuest(Spawn,5868) and
     not HasCompletedQuest(Spawn,5869) and
     not HasCompletedQuest(Spawn,5870) and 
     not HasCompletedQuest(Spawn,5871) 
     and GetFactionAmount(Spawn,12)<50000 and
     invul == false then
         
    if HasQuest(Spawn,5864) and GetQuestStep(Spawn,5864)==10 then
    SetStepComplete(Spawn,5864,10)
    end  
    
    PlaySound(Spawn,"sounds/ui/ui_warning.wav", GetX(NPC), GetY(NPC), GetZ(NPC))
    SendPopUpMessage(Spawn,"Only Freeport citizens may enter the city.",255,50,50)
    SendMessage(Spawn,"Only Freeport citizens may enter the city.","red")
    
    else
    if invul == true and GetFactionAmount(Spawn,12) < 30000 then
    SendMessage(Spawn,"Your GM invulnerability allows you to bypass citizenship.","white")
    end     
        ZoneRef = GetZone("SouthFreeport")
        Zone(ZoneRef,Spawn,-174.94, -36.63, 325.07, 37.31)        
    end    
end     
end    
