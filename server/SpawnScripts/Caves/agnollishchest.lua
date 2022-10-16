--[[
    Script Name    : SpawnScripts/Caves/agnollishchest.lua
    Script Author  : Dorbin
    Script Date    : 2022.10.10 06:10:17
    Script Purpose : 
                   : 
--]]

function spawn(NPC)

end

function casted_on(NPC, Spawn, Message)
    if Message == "smash" then
    SetAccessToEntityCommand(Spawn,NPC,"smash", 0)
    SpawnSet(NPC, "show_command_icon", 0)
    SpawnSet(NPC, "display_hand_icon", 0)    
    if IsStealthed(Spawn)  then
--    RemoveStealth(NPC,Spawn)
    end
    if  IsInvis(Spawn) then
--    RemoveInvis(NPC,Spawn)
    end
    PlayFlavor(Spawn,"","","kick",0,0)
    SpawnSet(NPC,"visual_state",4164)

    local choice = MakeRandomInt(1,100)
    if choice <= 40 then
    SendMessage(Spawn,"You've found something inside the chest!")
    local LootChoice = MakeRandomInt(1,5)
    if LootChoice == 1 then
    SummonItem(Spawn,1667,1) --Finely crafted mask
    elseif  LootChoice == 2 then
    SummonItem(Spawn,164540,1) --miner's ring
    elseif  LootChoice == 3 then
    SummonItem(Spawn,179206,1) -- silt wrought sandals
    elseif  LootChoice == 4 then
    SummonItem(Spawn,4963,1) -- Gnoll language threat totem
    elseif  LootChoice == 5 then
    SummonItem(Spawn,138927,1) --circlet of hardened sand


    end
else
    SendMessage(Spawn,"The chest smashes into tiny pieces, but there is nothing inside.")
    end

    AddTimer(NPC,500,"Collapse")    
    AddTimer(NPC,2000,"Despawning")    
    end
end

function Collapse(NPC)
SpawnSet(NPC,"model_type",2501)
PlaySound(NPC,"sounds/widgets/chests/chest_smash001.wav", GetX(NPC), GetY(NPC), GetZ(NPC))

end

function Despawning(NPC,Spawn)
    SpawnSet(NPC,"visual_state",0)
    Despawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end