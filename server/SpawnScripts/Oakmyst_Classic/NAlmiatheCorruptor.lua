--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/NAlmiatheCorruptor.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.11 02:09:27
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(5 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(15 + dmgMod))

end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function Garbled(NPC,Player)
  	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/darkelf_base_2/ft/darkelf/darkelf_base_2_1_garbled_gf_36e875b.mp3", "Atzeen   fahrseh", "", 761026681, 962675039, Spawn, 2)
	    elseif choice == 2 then
	    PlayFlavor(NPC, "voiceover/english/optional3/darkelf_base_2/ft/darkelf/darkelf_base_2_1_garbled_gf_fab027b8.mp3", "Hach bahr neh jadh osh agh", "", 3272896968, 3465123316, Spawn, 2)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/optional3/darkelf_base_2/ft/darkelf/darkelf_base_2_1_garbled_gf_810a3ce3.mp3", "Dark in body and soul! Hah!", "", 1604363761, 647045676, Spawn, 2)
     end     
end

 function aggro(NPC,Player)   
    AddTimer(NPC,math.random(15000,30000),"FifteenCall",1,Player)
    SetTempVariable(NPC, "CalloutTimer", "false")
if  GetTempVariable(NPC, "CalloutTimer")== "false" and math.random(0,100) <=100 and IsPlayer(Player) then
    SetTempVariable(NPC, "CalloutTimer", "true")
    AddTimer(NPC,10000,"ResetTimer")
    if not HasLanguage(Player,20 )then
    Garbled(NPC,Player)
    else
 	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/darkelf_base_2/ft/darkelf/darkelf_base_2_1_aggro_gf_fb890c79.mp3", "I have no time for meddlers.  Destroy them!", "", 1947039155, 2094447273, Spawn, 2)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/darkelf_base_2/ft/darkelf/darkelf_base_2_1_aggro_gf_8e7390a8.mp3", "Welcome to torment and destruction!", "", 3770648926, 2897017212, Spawn, 2)
        end
end   
end
end