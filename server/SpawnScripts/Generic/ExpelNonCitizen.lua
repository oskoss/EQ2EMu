--[[
    Script Name    : SpawnScripts/Generic/ExpelNonCitizen.lua
    Script Author  : Dorbin
    Script Date    : 2022.11.03 01:11:17
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/AdvancementGaze.lua")

function NonCitizen(NPC,Spawn)
 if GetFactionAmount(Spawn,11)>=5000 then
    if GetLevel(Spawn) ==8 or GetLevel(Spawn)==9 then--CLASS ADVANCEMENT QUEST CHECK
    ClassCheck(NPC,Spawn)
    end
end

	Qfaction = GetFactionAmount(Spawn,11)
	FPfaction = GetFactionAmount(Spawn,12)
    local invul = IsInvulnerable(Spawn)

    local zone = GetZone(NPC)
	if GetZoneID(zone) >= 220 and GetZoneID(zone) <= 238 then                -- clarifies which zone is designated EVIL or GOOD
	    GOOD = true
	elseif GetZoneID(zone) == 207 then
	    GOOD = true
	elseif GetZoneID(zone) >= 195 and GetZoneID(zone) <= 198 then
	    GOOD = true
	elseif GetZoneID(zone) == 589 or GetZoneID(zone) == 660 then
	    GOOD = true
	elseif GetZoneID(zone) == 470 then
	    GOOD = true
	elseif GetZoneID(zone) == 45 then
	    NEUTRAL = true
	elseif GetZoneID(zone) >= 124 and GetZoneID(zone) <= 128 then
	    EVIL = true
	elseif GetZoneID(zone) >= 134 and GetZoneID(zone)<= 168 then
	    EVIL = true
	end

	if GOOD and GetFactionAmount(Spawn,11) >0 and invul == false then
	    if not HasCompletedQuest(Spawn,5718) and
	    not HasCompletedQuest(Spawn,5719) and  --CITIZENSHIP TRIALS
	    not HasCompletedQuest(Spawn,5720) and
	    not HasCompletedQuest(Spawn,5721) and
	    not HasCompletedQuest(Spawn,5722) and
	    not HasCompletedQuest(Spawn,5723) then
        if GetClass(Spawn) ==1 or GetClass(Spawn)==11 or GetClass(Spawn)==21 or GetClass(Spawn)==31 then --CLASS(Archetype) CHECK. THESE ARE POSSIBLE REFUGEES.
 
        SetInfoStructUInt(NPC, "override_primary_weapon", 1)        -- Enables override of server autoattack damage. Set to 0 to  allow server to set damage.
        SetInfoStructUInt(NPC, "primary_weapon_damage_low", 0) 
        SetInfoStructUInt(NPC, "primary_weapon_damage_high", 0)
       
        Attack(NPC,Spawn)
        AddTimer(NPC,500,"Expel",1,Spawn)
        SendMessage(Spawn,"A guard has spotted you!","red")
        PlaySound(Spawn,"sounds/ui/ui_warning.wav", GetX(NPC), GetY(NPC), GetZ(NPC))
        end
        end
        elseif GOOD and GetFactionAmount(Spawn,11)<1000 and invul == false then  --NON CITIZENS
        SetInfoStructUInt(NPC, "override_primary_weapon", 0)        -- Enables override of server autoattack damage. Set to 0 to  allow server to set damage.
        Attack(NPC,Spawn)
        AddTimer(NPC,500,"ExpelOtherFaction",1,Spawn)
        SendPopUpMessage(Spawn,"A guard has spotted you!",250,0,0)
        SendMessage(Spawn,"A guard has spotted you!","red")
        PlaySound(Spawn,"sounds/ui/ui_warning.wav", GetX(NPC), GetY(NPC), GetZ(NPC))       
    end
end


function Expel(NPC,Spawn)
    local invul = IsInvulnerable(Spawn)
    if IsInCombat(NPC) then
    AddTimer(NPC,500,"Expel",1,Spawn)
    if invul == false and GetDistance(Spawn,NPC) <=4 then
        CastSpell(NPC,1225)
        PlayAnimation(Spawn,11764)
        ExpeltoHood(NPC,Spawn)
        SetInvulnerable(Spawn)
        SendPopUpMessage(Spawn,"Refugee! You are not allowed inside the walls of Qeynos!",250,0,0)
        SendMessage(Spawn,"Refugee! You are not allowed inside the walls of Qeynos!","red")
        PlaySound(Spawn,"sounds/ui/ui_duel_defeat.wav", GetX(NPC), GetY(NPC), GetZ(NPC))
        End (NPC,Spawn)
--      SetHP(Spawn,SetMaxHP(Spawn))
    end
end
end

function End (NPC,Spawn)
        ClearHate(NPC, Spawn)
        SetInCombat(Spawn, false)
        SetInCombat(NPC, false)
        ClearEncounter(NPC)
        SetTarget(Spawn,nil)
        SetInfoStructUInt(NPC, "override_primary_weapon", 0)        -- Enables override of server autoattack damage. Set to 0 to  allow server to set damage.
end   


function ExpelOtherFaction(NPC,Spawn)
    local invul = IsInvulnerable(Spawn)
    if IsInCombat(NPC) then
    if invul == false and GetDistance(Spawn,NPC) <=5 then
        CastSpell(NPC,1225)
        PlayAnimation(Spawn,11764)
        ExpeltoOutofCity(NPC,Spawn)
        SetInvulnerable(Spawn)
        SendPopUpMessage(Spawn,"You are not allowed inside the walls of Qeynos!",250,0,0)
        SendMessage(Spawn,"You are not allowed inside the walls of Qeynos!","red")
        PlaySound(Spawn,"sounds/ui/ui_duel_defeat.wav", GetX(NPC), GetY(NPC), GetZ(NPC))
        SetHP(Spawn,SetMaxHP(Spawn))
        End (NPC,Spawn)
    end
end
end

function ExpeltoOutofCity(NPC,Spawn)
        ZoneRef = GetZone("Antonica")
        Zone(ZoneRef,Spawn,-130.85, -15.10, -77.62, 137.28)
end


function ExpeltoHood(NPC,Spawn)
   local Race = GetRace(Spawn)
    
    --  Kerra
    if Race == 11 or Race == 9 then
        ZoneRef = GetZone("Nettleville")
        Zone(ZoneRef,Spawn)

    -- Erudite
    elseif Race == 3 or Race == 20 then
        ZoneRef = GetZone("Starcrest")
        Zone(ZoneRef,Spawn)


    -- Barbarian / Dwarf
    elseif Race == 0 or Race == 2 then
        ZoneRef = GetZone("Graystone")
        Zone(ZoneRef,Spawn)

    -- Froglok / High Elf 
    elseif Race == 4 or Race == 8 then
        ZoneRef = GetZone("Castleview")
        Zone(ZoneRef,Spawn)

    -- Half Elf / Wood Elf
    elseif Race == 6 or Race == 15 then
        ZoneRef = GetZone("Willowwood")
        Zone(ZoneRef,Spawn)

    -- Gnome / Halfling
    elseif Race == 5 or Race == 7 then
        ZoneRef = GetZone("Baubbleshire")
        Zone(ZoneRef,Spawn)

    else
        ZoneRef = GetZone("Nettleville")
        Zone(ZoneRef,Spawn)    
    end
end
