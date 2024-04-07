--[[
    Script Name    : SpawnScripts/DoF_design_path_script/AnimationSpeedScroll.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.18 06:07:48
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local Busy = false
local Move = false

function spawn(NPC)

end

function hailed(NPC, Spawn)
Dialog1(NPC,Spawn)
end

function Dialog1(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    if Busy == false then
	Dialog.AddDialog("This scroll will demonstrate the effects on model animations based on movement speed and spawn size. What would you like to do?")
	Dialog.AddOption("Setup the Spawns","Setup")
	Dialog.AddOption("Nevermind")
    elseif Move == false then
	Dialog.AddDialog("What would you like to do?")
	    Dialog.AddOption("Begin Movement","Movement")
	    Dialog.AddOption("Change Spawn Type","SpawnType1")
	    Dialog.AddOption("Change Spawn Size","Size1")
	    Dialog.AddOption("Reset the Spawns","Reset")
	    Dialog.AddOption("Nevermind")
    else	    
    	Dialog.AddDialog("What would you like to do?")
	    Dialog.AddOption("Change Spawn Type","SpawnType1")
	    Dialog.AddOption("Change Spawn Size","Size1")
	    Dialog.AddOption("Reset the Spawns","Reset")
 	    Dialog.AddOption("Nevermind")
   end
	Dialog.Start()
end

function Movement(NPC,Spawn)
    Move = true
    Say(NPC,"Movement Initiated in...")
    AddTimer(NPC,1000,"Say3")
    AddTimer(NPC,2000,"Say2")
    AddTimer(NPC,3000,"Say1")
    AddTimer(NPC,4000,"Waypoints")
end

function Say3(NPC,Spawn)
    Say(NPC,"3")
end

function Say2(NPC,Spawn)
    Say(NPC,"2")

end

function Say1(NPC,Spawn)
    Say(NPC,"1")
end

function Setup(NPC,Spawn)
    local zone = GetZone(NPC)
    local Flag1 = GetSpawnByLocationID(zone, 133785993)
    local Flag2 = GetSpawnByLocationID(zone, 133785994)
    local Speed1 = GetSpawnByLocationID(zone, 133785989)
    local Speed2 = GetSpawnByLocationID(zone, 133785990)
    local Speed4 = GetSpawnByLocationID(zone, 133785991)
    local Speed6 = GetSpawnByLocationID(zone, 133785992)
    Busy = true    
    
    if Flag1 ==nil then
        SpawnByLocationID(zone, 133785993)
    end
    if Flag2 ==nil then
        SpawnByLocationID(zone, 133785994)
    end
    if Speed1 ==nil then
        SpawnByLocationID(zone, 133785989)
    end    
    if Speed2 ==nil then
        SpawnByLocationID(zone, 133785990)
    end  
    if Speed4 ==nil then
        SpawnByLocationID(zone, 133785991)
    end  
    if Speed6 ==nil then
        SpawnByLocationID(zone, 133785992)
    end  
end

function Reset(NPC,Spawn)
    local zone = GetZone(NPC)
    local Flag1 = GetSpawnByLocationID(zone, 133785993)
    local Flag2 = GetSpawnByLocationID(zone, 133785994)
    local Speed1 = GetSpawnByLocationID(zone, 133785989)
    local Speed2 = GetSpawnByLocationID(zone, 133785990)
    local Speed4 = GetSpawnByLocationID(zone, 133785991)
    local Speed6 = GetSpawnByLocationID(zone, 133785992)
    Busy = false    
    Move = false    
    
    if Flag1 ~=nil then
        Despawn(Flag1)
    end
    if Flag2 ~=nil then
        Despawn(Flag2)
    end
    if Speed1 ~=nil then
        KillSpawn(Speed1)
    end    
    if Speed2 ~=nil then
        KillSpawn(Speed2)
    end  
    if Speed4 ~=nil then
        KillSpawn(Speed4)
    end  
    if Speed6 ~=nil then
        KillSpawn(Speed6)
    end  
end


function Waypoints(NPC,Spawn)
    local zone = GetZone(NPC)
    local Speed1 = GetSpawnByLocationID(zone, 133785989)
    local Speed2 = GetSpawnByLocationID(zone, 133785990)
    local Speed4 = GetSpawnByLocationID(zone, 133785991)
    local Speed6 = GetSpawnByLocationID(zone, 133785992)
    if Speed1 ~=nil then
    MovementLoopAddLocation(Speed1,-20, 0, -10,1)
    MovementLoopAddLocation(Speed1,-20, 0, -40,1)
    end    
    if Speed2 ~=nil then
    MovementLoopAddLocation(Speed2,-16.667, 0, -10,2)
    MovementLoopAddLocation(Speed2,-16.667, 0, -40,2)
    end  
    if Speed4 ~=nil then
    MovementLoopAddLocation(Speed4,-13.333, 0, -10,4)
    MovementLoopAddLocation(Speed4,-13.333, 0, -40,4)
    end  
    if Speed6 ~=nil then
    MovementLoopAddLocation(Speed6,-10, 0, -10,6)
    MovementLoopAddLocation(Speed6,-10, 0, -40,6)
    end  
end

function SpawnType1(NPC,Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Controls are limited to 7 Options")
	    Dialog.AddOption("Small Cat","Cat")
	    Dialog.AddOption("Normal Goblin","Goblin")
	    Dialog.AddOption("Large Troglodyte","Ape")
	    Dialog.AddOption("A Froglok","Frog")
	    Dialog.AddOption("Shadowy Fiend","Shadow")
	    Dialog.AddOption("Lucan Dlere","Lucan")
	    Dialog.AddOption("Magestic Unicorn","Unicorn")
	    Dialog.AddOption("Reset the Spawns","Reset")
	    Dialog.AddOption("Nevermind")
	    Dialog.Start()
    end

function Size1(NPC,Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Controls are limited to 3 Options")
	    Dialog.AddOption("Smallest Size (16)","Small")
	    Dialog.AddOption("Normal Size (32)","Normal")
	    Dialog.AddOption("Largest Size (50)","Large")
	    Dialog.AddOption("Reset the Spawns","Reset")
	    Dialog.AddOption("Nevermind")
	    Dialog.Start()
    end
    
function Small(NPC,Spawn)
    local zone = GetZone(NPC)
    local Speed1 = GetSpawnByLocationID(zone, 133785989)
    local Speed2 = GetSpawnByLocationID(zone, 133785990)
    local Speed4 = GetSpawnByLocationID(zone, 133785991)
    local Speed6 = GetSpawnByLocationID(zone, 133785992)
    if Speed1 ~=nil then
    SpawnSet(Speed1,"size",16)
    end    
    if Speed2 ~=nil then
    SpawnSet(Speed2,"size",16)
    end  
    if Speed4 ~=nil then
    SpawnSet(Speed4,"size",16)
    end  
    if Speed6 ~=nil then
    SpawnSet(Speed6,"size",16)
    end  
end

function Normal(NPC,Spawn)
    local zone = GetZone(NPC)
    local Speed1 = GetSpawnByLocationID(zone, 133785989)
    local Speed2 = GetSpawnByLocationID(zone, 133785990)
    local Speed4 = GetSpawnByLocationID(zone, 133785991)
    local Speed6 = GetSpawnByLocationID(zone, 133785992)
    if Speed1 ~=nil then
    SpawnSet(Speed1,"size",32)
    end    
    if Speed2 ~=nil then
    SpawnSet(Speed2,"size",32)
    end  
    if Speed4 ~=nil then
    SpawnSet(Speed4,"size",32)
    end  
    if Speed6 ~=nil then
    SpawnSet(Speed6,"size",32)
    end  
end

function Large(NPC,Spawn)
    local zone = GetZone(NPC)
    local Speed1 = GetSpawnByLocationID(zone, 133785989)
    local Speed2 = GetSpawnByLocationID(zone, 133785990)
    local Speed4 = GetSpawnByLocationID(zone, 133785991)
    local Speed6 = GetSpawnByLocationID(zone, 133785992)
    if Speed1 ~=nil then
    SpawnSet(Speed1,"size",50)
    end    
    if Speed2 ~=nil then
    SpawnSet(Speed2,"size",50)
    end  
    if Speed4 ~=nil then
    SpawnSet(Speed4,"size",50)
    end  
    if Speed6 ~=nil then
    SpawnSet(Speed6,"size",50)
    end  
end

function Cat(NPC,Spawn)
    local zone = GetZone(NPC)
    local Speed1 = GetSpawnByLocationID(zone, 133785989)
    local Speed2 = GetSpawnByLocationID(zone, 133785990)
    local Speed4 = GetSpawnByLocationID(zone, 133785991)
    local Speed6 = GetSpawnByLocationID(zone, 133785992)
    if Speed1 ~=nil then
    SpawnSet(Speed1,"model_type",305)
    end    
    if Speed2 ~=nil then
    SpawnSet(Speed2,"model_type",305)
    end  
    if Speed4 ~=nil then
    SpawnSet(Speed4,"model_type",305)
    end  
    if Speed6 ~=nil then
    SpawnSet(Speed6,"model_type",305)
    end  
end

function Goblin(NPC,Spawn)
    local zone = GetZone(NPC)
    local Speed1 = GetSpawnByLocationID(zone, 133785989)
    local Speed2 = GetSpawnByLocationID(zone, 133785990)
    local Speed4 = GetSpawnByLocationID(zone, 133785991)
    local Speed6 = GetSpawnByLocationID(zone, 133785992)
    if Speed1 ~=nil then
    SpawnSet(Speed1,"model_type",145)
    end    
    if Speed2 ~=nil then
    SpawnSet(Speed2,"model_type",145)
    end  
    if Speed4 ~=nil then
    SpawnSet(Speed4,"model_type",145)
    end  
    if Speed6 ~=nil then
    SpawnSet(Speed6,"model_type",145)
    end  
end

function Ape(NPC,Spawn)
    local zone = GetZone(NPC)
    local Speed1 = GetSpawnByLocationID(zone, 133785989)
    local Speed2 = GetSpawnByLocationID(zone, 133785990)
    local Speed4 = GetSpawnByLocationID(zone, 133785991)
    local Speed6 = GetSpawnByLocationID(zone, 133785992)
    if Speed1 ~=nil then
    SpawnSet(Speed1,"model_type",151)
    end    
    if Speed2 ~=nil then
    SpawnSet(Speed2,"model_type",151)
    end  
    if Speed4 ~=nil then
    SpawnSet(Speed4,"model_type",151)
    end  
    if Speed6 ~=nil then
    SpawnSet(Speed6,"model_type",151)
    end  
end

function Frog(NPC,Spawn)
    local zone = GetZone(NPC)
    local Speed1 = GetSpawnByLocationID(zone, 133785989)
    local Speed2 = GetSpawnByLocationID(zone, 133785990)
    local Speed4 = GetSpawnByLocationID(zone, 133785991)
    local Speed6 = GetSpawnByLocationID(zone, 133785992)
    if Speed1 ~=nil then
    SpawnSet(Speed1,"model_type",77)
    end    
    if Speed2 ~=nil then
    SpawnSet(Speed2,"model_type",77)
    end  
    if Speed4 ~=nil then
    SpawnSet(Speed4,"model_type",77)
    end  
    if Speed6 ~=nil then
    SpawnSet(Speed6,"model_type",77)
    end  
end

function Shadow(NPC,Spawn)
    local zone = GetZone(NPC)
    local Speed1 = GetSpawnByLocationID(zone, 133785989)
    local Speed2 = GetSpawnByLocationID(zone, 133785990)
    local Speed4 = GetSpawnByLocationID(zone, 133785991)
    local Speed6 = GetSpawnByLocationID(zone, 133785992)
    if Speed1 ~=nil then
    SpawnSet(Speed1,"model_type",240)
    end    
    if Speed2 ~=nil then
    SpawnSet(Speed2,"model_type",240)
    end  
    if Speed4 ~=nil then
    SpawnSet(Speed4,"model_type",240)
    end  
    if Speed6 ~=nil then
    SpawnSet(Speed6,"model_type",240)
    end  
end

function Lucan(NPC,Spawn)
    local zone = GetZone(NPC)
    local Speed1 = GetSpawnByLocationID(zone, 133785989)
    local Speed2 = GetSpawnByLocationID(zone, 133785990)
    local Speed4 = GetSpawnByLocationID(zone, 133785991)
    local Speed6 = GetSpawnByLocationID(zone, 133785992)
    if Speed1 ~=nil then
    SpawnSet(Speed1,"model_type",4112)
    end    
    if Speed2 ~=nil then
    SpawnSet(Speed2,"model_type",4112)
    end  
    if Speed4 ~=nil then
    SpawnSet(Speed4,"model_type",4112)
    end  
    if Speed6 ~=nil then
    SpawnSet(Speed6,"model_type",4112)
    end  
end


function Unicorn(NPC,Spawn)
    local zone = GetZone(NPC)
    local Speed1 = GetSpawnByLocationID(zone, 133785989)
    local Speed2 = GetSpawnByLocationID(zone, 133785990)
    local Speed4 = GetSpawnByLocationID(zone, 133785991)
    local Speed6 = GetSpawnByLocationID(zone, 133785992)
    if Speed1 ~=nil then
    SpawnSet(Speed1,"model_type",268)
    end    
    if Speed2 ~=nil then
    SpawnSet(Speed2,"model_type",268)
    end  
    if Speed4 ~=nil then
    SpawnSet(Speed4,"model_type",268)
    end  
    if Speed6 ~=nil then
    SpawnSet(Speed6,"model_type",268)
    end  
end

function respawn(NPC)
	spawn(NPC)
end