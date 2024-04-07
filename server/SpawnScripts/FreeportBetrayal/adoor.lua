--[[
    Script Name    : SpawnScripts/FreeportBetrayal/adoor.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.25 12:09:32
    Script Purpose : 
                   : 
--]]

function spawn(NPC,Spawn)
local zone = GetZone(NPC)
if GetSpawnLocationID(NPC) == 133786891 then
AddTimer(NPC,6000,"SpawnCheck",1)
SetTempVariable(NPC,"ClickCheck",nil)
end
end


function respawn(NPC)
	spawn(NPC)
end

function SpawnCheck(NPC,Spawn)
    local Guard1 = GetSpawn(NPC,8450023)
    local Guard2 = GetSpawn(NPC,8450024)
    local Guard3 = GetSpawn(NPC,8450022)
    
if Guard1 == nil or not IsAlive(Guard1) then
    if Guard2 == nil or not IsAlive(Guard2) then
        if Guard3 == nil or not IsAlive(Guard3) then
        Unlock(NPC,Spawn)
        else
        AddTimer(NPC,5000,"SpawnCheck",1)
         end
    else
    AddTimer(NPC,5000,"SpawnCheck",1)
    end
else
 AddTimer(NPC,5000,"SpawnCheck",1)
 end
 end

function Unlock(NPC,Spawn)
    local Rug = GetSpawn(NPC,8450007)
    PlaySound(NPC,"sounds/widgets/object_interaction/obj_unlock001.wav",GetX(NPC), GetY(NPC), GetZ(NPC))
    PlaySound(Rug,"sounds/widgets/object_interaction/obj_unlock001.wav",GetX(Rug), GetY(Rug), GetZ(Rug))
    SpawnSet(NPC,"show_command_icon",1)
    SpawnSet(NPC,"display_hand_icon",1)
    AddPrimaryEntityCommand(Spawn,NPC,"Open",10000,"Open")
    SendUpdateDefaultCommand(NPC,10000,"Open")
end

function casted_on(NPC, Spawn, Message)
    local zone = GetZone(NPC)
    if Message == "Open" and GetTempVariable(NPC,"ClickCheck")== nil then
        SpawnSet(NPC,"show_command_icon",0)
        SpawnSet(NPC,"display_hand_icon",0)
        if GetDistance(NPC,Spawn) <= 5 then
            SetTempVariable(NPC,"ClickCheck",1)
            AddTimer(NPC,1100,"Porting1",1,Spawn)
            AddTimer(NPC,2100,"Porting2",1,Spawn)
            PlaySound(NPC,"sounds/widgets/doors/door_genericwood_open001.wav",GetX(NPC), GetY(NPC), GetZ(NPC))
            else
            SendMessage(Spawn,"You need to be closer to open the door.")
            SendPopUpMessage(Spawn,"You need to be closer to open the door.",250,50,50)
        end
        end            
end

function Porting1(NPC,Spawn)
local Tayil = GetSpawn(NPC,8450001)
    ApplySpellVisual(Spawn,18)
    CastSpell(Spawn,2550422,1,1,Tayil)
    if GetQuestStep(Spawn,5890)==1 then
        SetStepComplete(Spawn,5890,1)
    end
end

function Porting2(NPC,Spawn)
local Lucan = GetSpawn(NPC,8450000)
    SetPosition(Spawn,-1.11, -1.21, -31.39,355)
    SetTarget(Lucan,Spawn)
    PlayFlavor(Spawn,"","","result_teleport_appear",0,0)
    AddTimer(NPC,500,"Chains1",1,Spawn)
    AddTimer(NPC,4000,"Lucan",1,Spawn)
    AddTimer(NPC,16000,"Kenjedeau",1,Spawn)
    AddTimer(NPC,24500,"Stilus",1,Spawn)
    AddTimer(Lucan,31000,"SpeechCheck",1,Spawn)
    AddTimer(Lucan,32000,"Speech1",1,Spawn)
end

function Chains1 (NPC,Spawn)
local Tayil = GetSpawn(NPC,8450001)
    PlayFlavor(Tayil,"","","cast_enthralling_fetters_circling_ghostly",0,0)
    SetTarget(Tayil,Spawn)
    if GetQuestStep(Target,5890)==1 then
        SetStepComplete(Target,5890,1)
    end
end



function Lucan(NPC,Spawn)
local Lucan = GetSpawn(NPC,8450000)
    PlayFlavor(Lucan,"voiceover/english/overlord_lucan_d_lere/fprt_ph_3r03/quest_betrayal_f_lucan_betrayal_callout1_5002277b.mp3","Excellent!  The entertainment has arrived.  I can't remember the last time someone managed to get this far.  I congratulate you on picking this one, Kenjedeau.","",365186407,3843156497)

local Tayil = GetSpawn(NPC,8450001)
local Lucan = GetSpawn(NPC,8450000)
    PlayFlavor(Tayil,"","","kill_cast_enthralling_fetters_circling_ghostly",0,0)
    SetTarget(Spawn,Lucan)
end

function Kenjedeau(NPC,Spawn)
local Ken = GetSpawn(NPC,8450028)
    PlayFlavor(Ken,"","Thank you, Overlord.  But I cannot take all the credit.  Stilus did most of the work. I just endured this one's pathetic exclamations of goodwill and virtue.","nod",0,0)
    SetTarget(NPC,Spawn)
end

function Stilus(NPC,Spawn)
local Stilus = GetSpawn(NPC,8450027)
    PlayFlavor(Stilus,"","Didn't I tell you that nobility comes from personal sacrifice?  You sacrificed your life for the Overlord's entertainment.  What could be more noble?","chuckle",0,0)
    SetTarget(NPC,Spawn)
end

function StartSpeech(NPC,Spawn)
local Lucan = GetSpawn(NPC,8450000)
    Speech1(Lucan,Spawn)
end


