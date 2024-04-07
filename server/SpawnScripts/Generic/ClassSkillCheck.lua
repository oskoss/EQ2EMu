--[[
    Script Name    : SpawnScripts/Generic/ClassSkillCheck.lua
    Script Author  : Dorbin
    Script Date    : 2023.05.23 12:05:54
    Script Purpose : 
                   : 
--]]

local FIGHTER = 1
local WARRIOR =2
local GUARDIAN= 3 
local BERSERKER = 4 
local BRAWLER = 5 
local MONK = 6 
local BRUISER= 7 
local CRUSADER = 8 
local SHADOWKNIGHT = 9 
local PALADIN = 10 

local PRIEST = 11 
local CLERIC = 12 
local TEMPLAR = 13 
local INQUISITOR = 14 
local DRUID = 15 
local WARDEN = 16 
local FURY = 17 
local SHAMAN = 18 
local MYSTIC = 19 
local DEFILER = 20 

local MAGE = 21 
local SORCERER = 22 
local WIZARD = 23 
local WARLOCK = 24 
local ENCHANTER = 25 
local ILLUSIONIST = 26 
local COERCER = 27 
local SUMMONER = 28 
local CONJUROR = 29 
local NECROMANCER = 30 

local SCOUT = 31 
local ROGUE = 32 
local SWASHBUCKLER = 33 
local BRIGAND = 34 
local BARD = 35 
local TROUBADOR = 36 
local DIRGE = 37 
local PREDATOR = 38 
local RANGER = 39 
local ASSASSIN = 40 
local ANIMALIST = 41 
local BEASTLORD = 42 
local SHAPER = 43 
local CHANNELER = 44 

function SkillCheck(NPC, Spawn)
        GeneralSkills(NPC,Spawn)
        AddTimer(NPC,500,"CastingSkills",1,Spawn)    
        AddTimer(NPC,1000,"GearSkills",1,Spawn)    
        AddTimer(NPC,1500,"ClassSkills",1,Spawn)    
end


                        -- GENERAL SKILLS --

function GeneralSkills(NPC, Spawn)
   local level = GetLevel(Spawn)*5

--Defense
if not HasSkill(Spawn, 609880714) then -- Defense
    AddSkill(Spawn, 609880714,30,level)
    SendMessage(Spawn, "You have learned the Defense skill")
end

--Magic Affinity
if not HasSkill(Spawn, 2072844078) then -- Magic Affinity
    AddSkill(Spawn, 2072844078,1,level)
    SendMessage(Spawn, "You have learned the Magic Affinity skill")
end

--Spell Avoidance
if not HasSkill(Spawn, 2383540775) then -- Spell Avoidance
    AddSkill(Spawn, 2383540775,30,level)
    SendMessage(Spawn, "You have learned the Spell Avoidance skill")
end

--Very Light Armor
if not HasSkill(Spawn, 3539032716) then -- Very Light Armor
    AddSkill(Spawn, 3539032716,1,level)
    SendMessage(Spawn, "You are now more proficient with Very Light Armor")
end

-- Alcohol Tolerance
if not HasSkill(Spawn, 4250045746) and not GetClass(Spawn) == 0 then -- Alcohol Tolerance
    AddSkill(Spawn, 4250045746,1,level)
    SendMessage(Spawn, "You have learned the Alcohol Tolerance skill")
    elseif HasSkill(Spawn,4250045746) then-- Alcohol Tolerance
    RemoveSkill(Spawn, 4250045746)
end

-- Swimming
if not HasSkill(Spawn, 2037831821) and not GetClass(Spawn) == 0 then -- Swimming
    AddSkill(Spawn, 2037831821,1,level)
    SendMessage(Spawn, "You have learned the Swimming skill")
    elseif HasSkill(Spawn,2037831821) then-- Swimming
    RemoveSkill(Spawn, 2037831821)
end

--Focus
if not HasSkill(Spawn, 2638198038) and not GetClass(Spawn) == 0 then -- Focus
    AddSkill(Spawn, 2638198038,1,level)
    SendMessage(Spawn, "You have learned the Focus skill")
    elseif HasSkill(Spawn,2638198038) then-- Focus
    RemoveSkill(Spawn, 2638198038)
end

-- Parry
if not HasSkill(Spawn, 540022425)  then -- Parry
    AddSkill(Spawn, 540022425,1,level)
    SendMessage(Spawn, "You have learned the Parry skill")
end

--Safe Fall (Warrior, Brawler, Scouts Only)
if GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER or

GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then

if not HasSkill(Spawn, 2638198038)then -- Safe Fall
    AddSkill(Spawn, 2638198038,1,level)
    SendMessage(Spawn, "You have learned the Safe Fall skill")
    elseif HasSkill(Spawn,2638198038) then-- Safe Fall
    RemoveSkill(Spawn, 2638198038)
end
end

--Deflection (Brawlers Only)
if GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER then

if not HasSkill(Spawn, 3850377186)then -- Deflection
    AddSkill(Spawn, 3850377186,1,level)
    SendMessage(Spawn, "You have learned the Deflection skill")
    elseif HasSkill(Spawn,3850377186) then-- Deflection
    RemoveSkill(Spawn, 3850377186)
end
end

--Disarm Traps (Scouts Only)
if GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then

if not HasSkill(Spawn, 2200201799)then -- Disarm Traps
    AddSkill(Spawn, 2200201799,1,level)
    SendMessage(Spawn, "You have learned the Disarm Traps skill")
    elseif HasSkill(Spawn,2200201799) then-- Disarm Traps
    RemoveSkill(Spawn, 2200201799)
end
end

                    -- HARVESTING SKILLS --
                    
  local  level = GetLevel(Spawn)*5
if  HasSkill(Spawn, 1970131346) then -- Transmuting
    RemoveSkill(Spawn, 1970131346)
end
if not HasSkill(Spawn, 3659699625) and GetClass(Spawn)~=0 then -- Mining
    AddSkill(Spawn, 3659699625,1,level)
end
if not HasSkill(Spawn, 688591146) and GetClass(Spawn)~=0 then -- Foresting
    AddSkill(Spawn, 688591146,1,level)
end
if not HasSkill(Spawn, 1048513601) and GetClass(Spawn)~=0 then -- Gathering
    AddSkill(Spawn, 1048513601,1,level)
end
if not HasSkill(Spawn, 4158365743) and GetClass(Spawn)~=0 then -- Trapping
    AddSkill(Spawn, 4158365743,1,level)
end
if not HasSkill(Spawn, 2319450178) and GetClass(Spawn)~=0 then -- Fishing
    AddSkill(Spawn, 2319450178,1,level)
end 



end
      
                    
function CastingSkills(NPC, Spawn)
   local level = GetLevel(Spawn)*5
    
                    -- CASTING SKILLS --

if GetClass(Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PRIEST or
GetClass (Spawn) == CLERIC or
GetClass (Spawn) == TEMPLAR or
GetClass (Spawn) == INQUISITOR or
GetClass (Spawn) == DRUID or
GetClass (Spawn) == WARDEN or
GetClass (Spawn) == FURY or
GetClass (Spawn) == SHAMAN or
GetClass (Spawn) == MYSTIC or
GetClass (Spawn) == DEFILER or
GetClass (Spawn) == MAGE or
GetClass (Spawn) == SORCERER or
GetClass (Spawn) == WIZARD or
GetClass (Spawn) == WARLOCK or
GetClass (Spawn) == ENCHANTER or
GetClass (Spawn) == ILLUSIONIST or
GetClass (Spawn) == COERCER or
GetClass (Spawn) == SUMMONER or
GetClass (Spawn) == CONJUROR or
GetClass (Spawn) == NECROMANCER then 
    
    if not HasSkill(Spawn, 613995491) then -- Disruption
    AddSkill(Spawn, 613995491,1,level)
    SendMessage(Spawn, "You have learned the Disruption skill")
    end
    if not HasSkill(Spawn, 366253016) then -- Ministration
    AddSkill(Spawn, 366253016,1,level)
    SendMessage(Spawn, "You have learned the Ministration skill")
    end
    if not HasSkill(Spawn, 3587918036) then -- Ordination
    AddSkill(Spawn, 3587918036,1,level)
    SendMessage(Spawn, "You have learned the Ordination skill")
    end
    if not HasSkill(Spawn, 882983852) then -- Subjugation
    AddSkill(Spawn, 882983852,1,level)
    SendMessage(Spawn, "You have learned the Subjugation skill")
    end
else   
    
    if HasSkill(Spawn, 613995491) then-- Disruption
    RemoveSkill(Spawn, 613995491)
    end
    if HasSkill(Spawn,366253016) then-- Ministration
    RemoveSkill(Spawn, 366253016)
    end
    if HasSkill(Spawn,3587918036) then-- Ordination
    RemoveSkill(Spawn, 3587918036)
    end
    if HasSkill(Spawn,882983852) then-- Subjugation
    RemoveSkill(Spawn, 882983852)
    end
end



                    -- DAMAGE STYLE PROFICIENCY SKILLS --

--CRUSHING
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER or
GetClass (Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT or

GetClass (Spawn) == PRIEST or
GetClass (Spawn) == CLERIC or
GetClass (Spawn) == TEMPLAR or
GetClass (Spawn) == INQUISITOR or
GetClass (Spawn) == DRUID or
GetClass (Spawn) == WARDEN or
GetClass (Spawn) == FURY or
GetClass (Spawn) == SHAMAN or
GetClass (Spawn) == MYSTIC or
GetClass (Spawn) == DEFILER or

GetClass (Spawn) == MAGE or
GetClass (Spawn) == SORCERER or
GetClass (Spawn) == WIZARD or
GetClass (Spawn) == WARLOCK or
GetClass (Spawn) == ENCHANTER or
GetClass (Spawn) == ILLUSIONIST or
GetClass (Spawn) == COERCER or
GetClass (Spawn) == SUMMONER or
GetClass (Spawn) == CONJUROR or
GetClass (Spawn) == NECROMANCER then 
    if not HasSkill(Spawn, 3421494576) then -- CRUSHING
    AddSkill(Spawn, 3421494576,1,level)
    SendMessage(Spawn, "You have learned the Crushing skill")
    end
elseif HasSkill(Spawn, 3421494576) then -- CRUSHING
    RemoveSkill(Spawn, 2638198038)
end

--SLASHING
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER or
GetClass (Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT or

GetClass (Spawn) == DRUID or
GetClass (Spawn) == WARDEN or
GetClass (Spawn) == FURY or

GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then 
    if not HasSkill(Spawn, 418532101) then -- SLASHING
    AddSkill(Spawn, 418532101,1,level)
    SendMessage(Spawn, "You have learned the Slashing skill")
    end
elseif HasSkill(Spawn, 418532101) then -- CRUSHING
    RemoveSkill(Spawn, 418532101)
end

--PIERCING
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER or

GetClass (Spawn) == SHAMAN or
GetClass (Spawn) == MYSTIC or
GetClass (Spawn) == DEFILER or

GetClass (Spawn) == MAGE or
GetClass (Spawn) == SORCERER or
GetClass (Spawn) == WIZARD or
GetClass (Spawn) == WARLOCK or
GetClass (Spawn) == ENCHANTER or
GetClass (Spawn) == ILLUSIONIST or
GetClass (Spawn) == COERCER or
GetClass (Spawn) == SUMMONER or
GetClass (Spawn) == CONJUROR or
GetClass (Spawn) == NECROMANCER or

GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then
    if not HasSkill(Spawn, 3048574950) then  -- Piercing
    AddSkill(Spawn, 3048574950,1,level)
    SendMessage(Spawn, "You have learned the Piercing skill")
    end
elseif HasSkill(Spawn, 3048574950) then -- Piercing
    RemoveSkill(Spawn, 3048574950)
    end

--RANGED
if GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER or
GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then
    if not HasSkill(Spawn, 1756482397) then -- Ranged
    AddSkill(Spawn, 1756482397,1,level)
    SendMessage(Spawn, "You have learned the Ranged skill")
    end
elseif HasSkill(Spawn, 1756482397) then -- Ranged
    RemoveSkill(Spawn, 1756482397)
    end
    
end


function GearSkills(NPC,Spawn)
    local level = GetLevel(Spawn)*5
   
                    -- DEFENSE TYPE SKILLS --
                    
--Light Armor
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER or
GetClass (Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT or

GetClass (Spawn) == PRIEST or
GetClass (Spawn) == CLERIC or
GetClass (Spawn) == TEMPLAR or
GetClass (Spawn) == INQUISITOR or
GetClass (Spawn) == DRUID or
GetClass (Spawn) == WARDEN or
GetClass (Spawn) == FURY or
GetClass (Spawn) == SHAMAN or
GetClass (Spawn) == MYSTIC or
GetClass (Spawn) == DEFILER or

GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then

    if not HasSkill(Spawn, 2897193374) then -- Light Armor
    AddSkill(Spawn, 2897193374,1,level)
    SendMessage(Spawn, "You are now more proficient with Light Armor")
    end
elseif HasSkill(Spawn, 2897193374) then -- Light Armor
    RemoveSkill(Spawn, 2897193374)
    end
    
--Medium Armor
if GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT or

GetClass (Spawn) == TEMPLAR or
GetClass (Spawn) == INQUISITOR or
GetClass (Spawn) == MYSTIC or
GetClass (Spawn) == DEFILER or

GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then

    if not HasSkill(Spawn, 2246237129) then -- Medium Armor
    AddSkill(Spawn, 2246237129,1,level)
    SendMessage(Spawn, "You are now more proficient with Medium Armor")
    end
elseif HasSkill(Spawn, 2246237129) then -- Medium Armor
    RemoveSkill(Spawn, 2246237129)
    end

--Heavy Armor
if GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT or

GetClass (Spawn) == TEMPLAR or
GetClass (Spawn) == INQUISITOR then

    if not HasSkill(Spawn, 241174330) then -- Heavy Armor
    AddSkill(Spawn, 241174330,1,level)
    SendMessage(Spawn, "You are now more proficient with Heavy Armor")
    end
elseif HasSkill(Spawn, 241174330) then -- Heavy Armor
    RemoveSkill(Spawn, 241174330)
    end
    
    
                    -- SHIELDS --

--Buckler (small)
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER or
GetClass (Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT or

GetClass (Spawn) == PRIEST or
GetClass (Spawn) == CLERIC or
GetClass (Spawn) == TEMPLAR or
GetClass (Spawn) == INQUISITOR or
GetClass (Spawn) == DRUID or
GetClass (Spawn) == WARDEN or
GetClass (Spawn) == FURY or
GetClass (Spawn) == SHAMAN or
GetClass (Spawn) == MYSTIC or
GetClass (Spawn) == DEFILER or

GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then

    if not HasSkill(Spawn, 4037812502) then -- Buckler
    AddSkill(Spawn, 4037812502,1,level)
    SendMessage(Spawn, "You are now more proficient with Bucklers")
    end
elseif HasSkill(Spawn, 4037812502) then -- Buckler
    RemoveSkill(Spawn, 4037812502)
end

--Round Shield (medium)
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT or

GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then

    if not HasSkill(Spawn, 3173504370) then -- Round Shield
    AddSkill(Spawn, 3173504370,1,level)
    SendMessage(Spawn, "You are now more proficient with Round Shields")
    end
elseif HasSkill(Spawn, 3173504370) then -- Round Shield
    RemoveSkill(Spawn, 3173504370)
    end

--Kite Shield (large)
if GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT then

    if not HasSkill(Spawn, 570458645) then -- Kite Shield
    AddSkill(Spawn, 570458645,1,level)
    SendMessage(Spawn, "You are now more proficient with Kite Shields")
    end
elseif HasSkill(Spawn, 570458645) then -- Kite Shield
    RemoveSkill(Spawn, 570458645)
end

--Tower Shield (very large)
if GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER then

    if not HasSkill(Spawn, 570458645) then -- Tower Shield
    AddSkill(Spawn, 570458645,1,level)
    SendMessage(Spawn, "You are now more proficient with Tower Shields")
    end
elseif HasSkill(Spawn, 570458645) then -- Tower Shield
    RemoveSkill(Spawn, 570458645)
end
    
--Symbols
if GetClass (Spawn) == PRIEST or
GetClass (Spawn) == CLERIC or
GetClass (Spawn) == TEMPLAR or
GetClass (Spawn) == INQUISITOR or
GetClass (Spawn) == DRUID or
GetClass (Spawn) == WARDEN or
GetClass (Spawn) == FURY or
GetClass (Spawn) == SHAMAN or
GetClass (Spawn) == MYSTIC or
GetClass (Spawn) == DEFILER or

GetClass (Spawn) == MAGE or
GetClass (Spawn) == SORCERER or
GetClass (Spawn) == WIZARD or
GetClass (Spawn) == WARLOCK or
GetClass (Spawn) == ENCHANTER or
GetClass (Spawn) == ILLUSIONIST or
GetClass (Spawn) == COERCER or
GetClass (Spawn) == SUMMONER or
GetClass (Spawn) == CONJUROR or
GetClass (Spawn) == NECROMANCER then

    if not HasSkill(Spawn, 545043066) then -- Symbols
    AddSkill(Spawn, 545043066,1,level)
    SendMessage(Spawn, "You are now more proficient with Symbols")
    end
elseif HasSkill(Spawn, 545043066) then -- Symbols
    RemoveSkill(Spawn, 545043066)
end

                     --  WEAPON SKILLS  --

-- Axe (1-H axes)
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == GUARDIAN or

GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then

    if not HasSkill(Spawn, 545043066) then -- Axe
    AddSkill(Spawn, 2476073427,1,level)
    SendMessage(Spawn, "You are now more proficient with Axes")
    end
elseif HasSkill(Spawn, 2476073427) then -- Axe
    RemoveSkill(Spawn, 2476073427)
end
 
-- Great Axe (2-H axes)
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == GUARDIAN then

    if not HasSkill(Spawn, 2954459351) then -- Great Axe
    AddSkill(Spawn, 2954459351,1,level)
    SendMessage(Spawn, "You are now more proficient with Great Axes")
    end
elseif HasSkill(Spawn, 2954459351) then -- Great Axe
    RemoveSkill(Spawn, 2954459351)
end

-- Bow (short & long bows)
if GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == GUARDIAN or

GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then

    if not HasSkill(Spawn, 1743366740) then -- Bow
    AddSkill(Spawn, 1743366740,1,level)
    SendMessage(Spawn, "You are now more proficient with Bows")
    end
elseif HasSkill(Spawn, 1743366740) then -- Bow
    RemoveSkill(Spawn, 1743366740)
end

-- Dagger
if GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == GUARDIAN or

GetClass (Spawn) == MAGE or
GetClass (Spawn) == SORCERER or
GetClass (Spawn) == WIZARD or
GetClass (Spawn) == WARLOCK or
GetClass (Spawn) == ENCHANTER or
GetClass (Spawn) == ILLUSIONIST or
GetClass (Spawn) == COERCER or
GetClass (Spawn) == SUMMONER or
GetClass (Spawn) == CONJUROR or
GetClass (Spawn) == NECROMANCER or

GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then

    if not HasSkill(Spawn, 887279616) then -- Dagger
    AddSkill(Spawn, 887279616,1,level)
    SendMessage(Spawn, "You are now more proficient with Daggers")
    end
elseif HasSkill(Spawn, 887279616) then -- Dagger
    RemoveSkill(Spawn, 887279616)
end

-- Fists
if GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER then

    if not HasSkill(Spawn, 3177806075) then -- Fists
    AddSkill(Spawn, 3177806075,1,level)
    SendMessage(Spawn, "You are now more proficient with your Fists")
    end
elseif HasSkill(Spawn, 3177806075) then -- Fists
    RemoveSkill(Spawn, 3177806075)
end

-- Hammer (1-H hammers)
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER or
GetClass (Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT or

GetClass (Spawn) == PRIEST or
GetClass (Spawn) == CLERIC or
GetClass (Spawn) == TEMPLAR or
GetClass (Spawn) == INQUISITOR or
GetClass (Spawn) == DRUID or
GetClass (Spawn) == WARDEN or
GetClass (Spawn) == FURY or
GetClass (Spawn) == SHAMAN or
GetClass (Spawn) == MYSTIC or
GetClass (Spawn) == DEFILER then

    if not HasSkill(Spawn, 554333641) then -- Hammer
    AddSkill(Spawn, 554333641,1,level)
    SendMessage(Spawn, "You are now more proficient with Hammers")
    end
elseif HasSkill(Spawn, 554333641) then -- Hammer
    RemoveSkill(Spawn, 554333641)
end

-- Great Hammer (2-H hammers)
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER or
GetClass (Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT or

GetClass (Spawn) == PRIEST or
GetClass (Spawn) == CLERIC or
GetClass (Spawn) == TEMPLAR or
GetClass (Spawn) == INQUISITOR or
GetClass (Spawn) == DRUID or
GetClass (Spawn) == WARDEN or
GetClass (Spawn) == FURY or
GetClass (Spawn) == SHAMAN or
GetClass (Spawn) == MYSTIC or
GetClass (Spawn) == DEFILER then

    if not HasSkill(Spawn, 1653482350) then -- Great Hammer
    AddSkill(Spawn, 1653482350,1,level)
    SendMessage(Spawn, "You are now more proficient with Great Hammers")
    end
elseif HasSkill(Spawn, 1653482350) then -- Great Hammer
    RemoveSkill(Spawn, 1653482350)
end

-- Mace
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER or
GetClass (Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT or

GetClass (Spawn) == PRIEST or
GetClass (Spawn) == CLERIC or
GetClass (Spawn) == TEMPLAR or
GetClass (Spawn) == INQUISITOR or
GetClass (Spawn) == DRUID or
GetClass (Spawn) == WARDEN or
GetClass (Spawn) == FURY or
GetClass (Spawn) == SHAMAN or
GetClass (Spawn) == MYSTIC or
GetClass (Spawn) == DEFILER then

    if not HasSkill(Spawn, 770311065) then -- Mace
    AddSkill(Spawn, 770311065,1,level)
    SendMessage(Spawn, "You are now more proficient with Maces")
    end
elseif HasSkill(Spawn, 770311065) then -- Mace
    RemoveSkill(Spawn, 770311065)
end

-- Rapier
if GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == GUARDIAN or

GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then

    if not HasSkill(Spawn, 641561514) then -- Rapier
    AddSkill(Spawn, 641561514,1,level)
    SendMessage(Spawn, "You are now more proficient with Rapiers")
    end
elseif HasSkill(Spawn, 641561514) then -- Rapier
    RemoveSkill(Spawn, 641561514)
end

-- Spear
if GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == GUARDIAN or

GetClass (Spawn) == SHAMAN or
GetClass (Spawn) == MYSTIC or
GetClass (Spawn) == DEFILER or

GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then

    if not HasSkill(Spawn, 1616998748) then -- Spear
    AddSkill(Spawn, 1616998748,1,level)
    SendMessage(Spawn, "You are now more proficient with Spears")
    end
elseif HasSkill(Spawn, 1616998748) then -- Spear
    RemoveSkill(Spawn, 1616998748)
end

-- Great Spear (large polearms)
if GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == GUARDIAN then

    if not HasSkill(Spawn, 2380184628) then -- Great Spear
    AddSkill(Spawn, 2380184628,1,level)
    SendMessage(Spawn, "You are now more proficient with Great Spears")
    end
elseif HasSkill(Spawn, 2380184628) then -- Great Spear
    RemoveSkill(Spawn, 2380184628)
end

-- Staff (2-H staves)
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER or

GetClass (Spawn) == PRIEST or
GetClass (Spawn) == CLERIC or
GetClass (Spawn) == TEMPLAR or
GetClass (Spawn) == INQUISITOR or
GetClass (Spawn) == DRUID or
GetClass (Spawn) == WARDEN or
GetClass (Spawn) == FURY or
GetClass (Spawn) == SHAMAN or
GetClass (Spawn) == MYSTIC or
GetClass (Spawn) == DEFILER or

GetClass (Spawn) == MAGE or
GetClass (Spawn) == SORCERER or
GetClass (Spawn) == WIZARD or
GetClass (Spawn) == WARLOCK or
GetClass (Spawn) == ENCHANTER or
GetClass (Spawn) == ILLUSIONIST or
GetClass (Spawn) == COERCER or
GetClass (Spawn) == SUMMONER or
GetClass (Spawn) == CONJUROR or
GetClass (Spawn) == NECROMANCER then

    if not HasSkill(Spawn, 3180399725) then -- Staff
    AddSkill(Spawn, 3180399725,1,level)
    SendMessage(Spawn, "You are now more proficient with a Staff")
    end
elseif HasSkill(Spawn, 3180399725) then -- Staff
    RemoveSkill(Spawn, 3180399725)
end

-- Sword (1-H swords)
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT or

GetClass (Spawn) == DRUID or
GetClass (Spawn) == WARDEN or
GetClass (Spawn) == FURY or

GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then

    if not HasSkill(Spawn, 1696217328) then -- Sword
    AddSkill(Spawn, 1696217328,1,level)
    SendMessage(Spawn, "You are now more proficient with Swords")
    end
elseif HasSkill(Spawn, 1696217328) then -- Sword
    RemoveSkill(Spawn, 1696217328)
end

-- Great Sword (2-H swords)
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT then

    if not HasSkill(Spawn, 2292577688) then -- Great Sword
    AddSkill(Spawn, 2292577688,1,level)
    SendMessage(Spawn, "You are now more proficient with Great Swords")
    end
elseif HasSkill(Spawn, 2292577688) then -- Great Sword
    RemoveSkill(Spawn, 2292577688)
end

-- Thrown Weapon (knives & shuriken)
if GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER or

GetClass (Spawn) == SCOUT or 
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then

    if not HasSkill(Spawn, 2650425026) then -- Thrown Weapon
    AddSkill(Spawn, 2650425026,1,level)
    SendMessage(Spawn, "You are now more proficient with Thrown Weapons")
    end
elseif HasSkill(Spawn, 2650425026) then -- Thrown Weapon
    RemoveSkill(Spawn, 2650425026)
end

end


function ClassSkills(NPC, Spawn)
   local level = GetLevel(Spawn)*5

                    --  FIGHTER SKILLS  --

-- Martial/Fighter
if GetClass (Spawn) == FIGHTER or
GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER or
GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER or
GetClass (Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT then 
if not HasSkill(Spawn, 1408356869) then -- Martial skill
    AddSkill(Spawn, 1408356869,1,level)
    SendMessage(Spawn, "You have learned the Martial skill")
elseif HasSkill(Spawn,1408356869) then
    RemoveSkill(Spawn, 1408356869)
end
end


 -- Tactics/Warrior
if GetClass (Spawn) == WARRIOR or
GetClass (Spawn) == GUARDIAN or
GetClass (Spawn) == BERZERKER then 
if not HasSkill(Spawn, 1124719197) then -- Martial skill
    AddSkill(Spawn, 1124719197,1,level)
    SendMessage(Spawn, "You have learned the Tactics skill")
elseif HasSkill(Spawn,1124719197) then
    RemoveSkill(Spawn, 1124719197)
end
end

-- Berserk/Berserker
if GetClass (Spawn) == BERZERKER then 
if not HasSkill(Spawn, 433335062) then -- Berserk skill
    AddSkill(Spawn, 433335062,1,level)
    SendMessage(Spawn, "You have learned the Berserk skill")
elseif HasSkill(Spawn,433335062) then
    RemoveSkill(Spawn, 433335062)
end
end

-- Protection/Guardian
if GetClass (Spawn) == BERZERKER then 
if not HasSkill(Spawn, 1209716810) then -- Protection skill
    AddSkill(Spawn, 1209716810,1,level)
    SendMessage(Spawn, "You have learned the Protection skill")
elseif HasSkill(Spawn,1209716810) then
    RemoveSkill(Spawn, 1209716810)
end
end

-- Brawl/Brawling
if GetClass (Spawn) == BRAWLER or
GetClass (Spawn) == MONK or
GetClass (Spawn) == BRUISER then 
if not HasSkill(Spawn, 3856706740) then -- Brawl skill
    AddSkill(Spawn, 3856706740,1,level)
    SendMessage(Spawn, "You have learned the Brawl skill")
elseif HasSkill(Spawn,3856706740) then
    RemoveSkill(Spawn, 3856706740)
end
end

-- Tranquility/Monk
if GetClass (Spawn) == MONK then 
if not HasSkill(Spawn, 2011726342) then -- Tranquility skill
    AddSkill(Spawn, 2011726342,1,level)
    SendMessage(Spawn, "You have learned the Tranquility skill")
elseif HasSkill(Spawn,2011726342) then
    RemoveSkill(Spawn, 2011726342)
end
end

-- Physicality/Bruiser
if GetClass (Spawn) == BRUISER then 
if not HasSkill(Spawn, 3067436248) then -- Physicality skill
    AddSkill(Spawn, 3067436248,1,level)
    SendMessage(Spawn, "You have learned the Physicality skill")
elseif HasSkill(Spawn,3067436248) then
    RemoveSkill(Spawn, 3067436248)
end
end

-- Faith/Crusader
if GetClass (Spawn) == CRUSADER or
GetClass (Spawn) == PALADIN or
GetClass (Spawn) == SHADOWKNIGHT then 
if not HasSkill(Spawn, 3809066846) then -- Faith skill
    AddSkill(Spawn, 3809066846,1,level)
    SendMessage(Spawn, "You have learned the Faith skill")
elseif HasSkill(Spawn,3809066846) then
    RemoveSkill(Spawn, 3809066846)
end
end

-- Determined Faith/Paladin
if GetClass (Spawn) == PALADIN then 
if not HasSkill(Spawn, 90523872) then -- Determined Faith skill
    AddSkill(Spawn, 90523872,1,level)
    SendMessage(Spawn, "You have learned the Determined Faith skill")
elseif HasSkill(Spawn,90523872) then
    RemoveSkill(Spawn, 90523872)
end
end

-- Determined Zeal/Shadowknight
if GetClass (Spawn) == SHADOWKNIGHT then 
if not HasSkill(Spawn, 2741805322) then -- Determined Zeal skill
    AddSkill(Spawn, 2741805322,1,level)
    SendMessage(Spawn, "You have learned the Determined Zeal skill")
elseif HasSkill(Spawn,2741805322) then
    RemoveSkill(Spawn, 2741805322)
end
end

                    -- SCOUT SKILLS --

--Reconnaissance/Scout
if GetClass (Spawn) == SCOUT or
GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND or
GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE or
GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then 
if not HasSkill(Spawn, 1921433074) then -- Reconnaissance skill
    AddSkill(Spawn, 1921433074,1,level)
    SendMessage(Spawn, "You have learned the Reconnaissance skill")
elseif HasSkill(Spawn,1921433074) then
    RemoveSkill(Spawn, 1921433074)
end
end

 -- Melodies/Bard
if GetClass (Spawn) == BARD or
GetClass (Spawn) == TROUBADOR or
GetClass (Spawn) == DIRGE then 
if not HasSkill(Spawn, 1311635100) then -- Melodies skill
    AddSkill(Spawn, 1311635100,1,level)
    SendMessage(Spawn, "You have learned the Melodies skill")
elseif HasSkill(Spawn,1311635100) then
    RemoveSkill(Spawn, 1311635100)
end
end

-- Ballads/Troubador
if GetClass (Spawn) == TROUBADOR then 
if not HasSkill(Spawn, 296246391) then -- Ballads skill
    AddSkill(Spawn, 296246391,1,level)
    SendMessage(Spawn, "You have learned the Ballads skill")
elseif HasSkill(Spawn,296246391) then
    RemoveSkill(Spawn, 296246391)
end
end

-- Dirges/Dirge
if GetClass (Spawn) == DIRGE then 
if not HasSkill(Spawn, 340921594) then -- Dirges skill
    AddSkill(Spawn, 340921594,1,level)
    SendMessage(Spawn, "You have learned the Dirges skill")
elseif HasSkill(Spawn,340921594) then
    RemoveSkill(Spawn, 340921594)
end
end

-- Skulldugery/Rogue
if GetClass (Spawn) == ROGUE or
GetClass (Spawn) == SWASHBUCKLER or
GetClass (Spawn) == BRIGAND then 
if not HasSkill(Spawn, 1514256692) then -- Skulldugery skill
    AddSkill(Spawn, 1514256692,1,level)
    SendMessage(Spawn, "You have learned the Skulldugery skill")
elseif HasSkill(Spawn,1514256692) then
    RemoveSkill(Spawn, 1514256692)
end
end

-- Swashbuckling/Swashbuckler
if GetClass (Spawn) == SWASHBUCKLER then 
if not HasSkill(Spawn, 2663054519) then -- Swashbuckling skill
    AddSkill(Spawn, 2663054519,1,level)
    SendMessage(Spawn, "You have learned the Swashbuckling skill")
elseif HasSkill(Spawn,2663054519) then
    RemoveSkill(Spawn, 2663054519)
end
end

-- Banditry/Brigand
if GetClass (Spawn) == BRIGAND then 
if not HasSkill(Spawn, 1519965519) then -- Banditry skill
    AddSkill(Spawn, 1519965519,1,level)
    SendMessage(Spawn, "You have learned the Banditry skill")
elseif HasSkill(Spawn,1519965519) then
    RemoveSkill(Spawn, 1519965519)
end
end

-- Stalking/Predator
if GetClass (Spawn) == PREDATOR or
GetClass (Spawn) == RANGER or
GetClass (Spawn) == ASSASSIN then 
if not HasSkill(Spawn, 3167106577) then -- Stalking skill
    AddSkill(Spawn, 3167106577,1,level)
    SendMessage(Spawn, "You have learned the Stalking skill")
elseif HasSkill(Spawn,3167106577) then
    RemoveSkill(Spawn, 3167106577)
end
end

-- Archery/Ranger
if GetClass (Spawn) == RANGER then 
if not HasSkill(Spawn, 1400160844) then -- Archery skill
    AddSkill(Spawn, 1400160844,1,level)
    SendMessage(Spawn, "You have learned the Archery skill")
elseif HasSkill(Spawn,1400160844) then
    RemoveSkill(Spawn, 1400160844)
end
end

-- Assassination Zeal/Assassin
if GetClass (Spawn) == ASSASSIN then 
if not HasSkill(Spawn, 2711101135) then -- Assassination skill
    AddSkill(Spawn, 2711101135,1,level)
    SendMessage(Spawn, "You have learned the Assassination skill")
elseif HasSkill(Spawn,2711101135) then
    RemoveSkill(Spawn, 2711101135)
end
end

                    -- MAGE SKILLS --

-- Evocations/Mage
if GetClass (Spawn) == MAGE or
GetClass (Spawn) == SORCERER or
GetClass (Spawn) == WIZARD or
GetClass (Spawn) == WARLOCK or
GetClass (Spawn) == ENCHANTER or
GetClass (Spawn) == ILLUSIONIST or
GetClass (Spawn) == COERCER or
GetClass (Spawn) == SUMMONER or
GetClass (Spawn) == CONJUROR or
GetClass (Spawn) == NECROMANCER then 
if not HasSkill(Spawn, 3820670534) then -- Evocations skill
    AddSkill(Spawn, 3820670534,1,level)
    SendMessage(Spawn, "You have learned the Evocations skill")
elseif HasSkill(Spawn,3820670534) then
    RemoveSkill(Spawn, 3820670534)
end
end


 -- Sorcery/Sorcerer
if GetClass (Spawn) == SORCERER or
GetClass (Spawn) == WIZARD or
GetClass (Spawn) == WARLOCK then 
if not HasSkill(Spawn, 2533124061) then -- Sorcery skill
    AddSkill(Spawn, 2533124061,1,level)
    SendMessage(Spawn, "You have learned the Sorcery skill")
elseif HasSkill(Spawn,2533124061) then
    RemoveSkill(Spawn, 2533124061)
end
end

--  Elemental Mastery/Wizard
if GetClass (Spawn) == WIZARD then 
if not HasSkill(Spawn, 2662430630) then -- Elemental Mastery skill
    AddSkill(Spawn, 2662430630,1,level)
    SendMessage(Spawn, "You have learned the Elemental Mastery skill")
elseif HasSkill(Spawn,2662430630) then
    RemoveSkill(Spawn, 2662430630)
end
end

-- Noctivagance/Warlock
if GetClass (Spawn) == WARLOCK then 
if not HasSkill(Spawn, 193411854) then -- Noctivagance skill
    AddSkill(Spawn, 193411854,1,level)
    SendMessage(Spawn, "You have learned the Noctivagance skill")
elseif HasSkill(Spawn,193411854) then
    RemoveSkill(Spawn, 193411854)
end
end


-- Enchantments/Enchanter
if GetClass (Spawn) == ENCHANTER or
GetClass (Spawn) == ILLUSIONIST or
GetClass (Spawn) == COERCER then 
if not HasSkill(Spawn, 287643040) then -- Enchantments skill
    AddSkill(Spawn, 287643040,1,level)
    SendMessage(Spawn, "You have learned the Enchantments skill")
elseif HasSkill(Spawn,287643040) then
    RemoveSkill(Spawn, 287643040)
end
end

-- Hallucinations/Illusionist
if GetClass (Spawn) == ILLUSIONIST then 
if not HasSkill(Spawn, 2898101972) then -- Hallucinations skill
    AddSkill(Spawn, 2898101972,1,level)
    SendMessage(Spawn, "You have learned the Hallucinations skill")
elseif HasSkill(Spawn,2898101972) then
    RemoveSkill(Spawn, 2898101972)
end
end

-- Protean/Coecerer
if GetClass (Spawn) == COERCER then 
if not HasSkill(Spawn, 3067436248) then -- Protean skill
    AddSkill(Spawn, 3067436248,1,level)
    SendMessage(Spawn, "You have learned the Protean skill")
elseif HasSkill(Spawn,3067436248) then
    RemoveSkill(Spawn, 3067436248)
end
end

-- Legerdemain/Summoner
if GetClass (Spawn) == SUMMONER or
GetClass (Spawn) == CONJUROR or
GetClass (Spawn) == NECROMANCER then 
if not HasSkill(Spawn, 2120065377) then -- Legerdemain skill
    AddSkill(Spawn, 2120065377,1,level)
    SendMessage(Spawn, "You have learned the Legerdemain skill")
elseif HasSkill(Spawn,2120065377) then
    RemoveSkill(Spawn, 2120065377)
end
end

-- Conjurations/Conjuror
if GetClass (Spawn) == CONJUROR then 
if not HasSkill(Spawn, 2042842194) then -- Conjurations skill
    AddSkill(Spawn, 2042842194,1,level)
    SendMessage(Spawn, "You have learned the Conjurations skill")
elseif HasSkill(Spawn,2042842194) then
    RemoveSkill(Spawn, 2042842194)
end
end

-- Sepulchers/Necromancer
if GetClass (Spawn) == NECROMANCER then 
if not HasSkill(Spawn, 289471519) then -- Sepulchers skill
    AddSkill(Spawn, 289471519,1,level)
    SendMessage(Spawn, "You have learned the Sepulchers skill")
elseif HasSkill(Spawn,289471519) then
    RemoveSkill(Spawn, 289471519)
end
end

                    -- PRIEST SKILLS --

-- Inspirations/Priest
if GetClass (Spawn) == PRIEST or
GetClass (Spawn) == CLERIC or
GetClass (Spawn) == TEMPLAR or
GetClass (Spawn) == INQUISITOR or
GetClass (Spawn) == DRUID or
GetClass (Spawn) == WARDEN or
GetClass (Spawn) == FURY or
GetClass (Spawn) == SHAMAN or
GetClass (Spawn) == MYSTIC or
GetClass (Spawn) == DEFILER then 
if not HasSkill(Spawn, 2463145248) then -- Inspirations skill
    AddSkill(Spawn, 2463145248,1,level)
    SendMessage(Spawn, "You have learned the Inspirations skill")
elseif HasSkill(Spawn,2463145248) then
    RemoveSkill(Spawn, 2463145248)
end
end


 -- Theurgy/Cleric
if GetClass (Spawn) == CLERIC or
GetClass (Spawn) == TEMPLAR or
GetClass (Spawn) == INQUISITOR then 
if not HasSkill(Spawn, 2533124061) then -- Theurgy skill
    AddSkill(Spawn, 2533124061,1,level)
    SendMessage(Spawn, "You have learned the Theurgy skill")
elseif HasSkill(Spawn,2533124061) then
    RemoveSkill(Spawn, 2533124061)
end
end

--  Regimens/Templar
if GetClass (Spawn) == TEMPLAR then 
if not HasSkill(Spawn, 2581053277) then -- Regimens skill
    AddSkill(Spawn, 2581053277,1,level)
    SendMessage(Spawn, "You have learned the Regimens skill")
elseif HasSkill(Spawn,2581053277) then
    RemoveSkill(Spawn, 2581053277)
end
end

-- Inquisitions/Inquisitor
if GetClass (Spawn) == INQUISITOR then 
if not HasSkill(Spawn, 1829443087) then -- Inquisitions skill
    AddSkill(Spawn, 1829443087,1,level)
    SendMessage(Spawn, "You have learned the Inquisitions skill")
elseif HasSkill(Spawn,1829443087) then
    RemoveSkill(Spawn, 1829443087)
end
end


-- Archegenesis/Druid
if GetClass (Spawn) == DRUID or
GetClass (Spawn) == WARDEN or
GetClass (Spawn) == FURY then 
if not HasSkill(Spawn, 3282420779) then -- Archegenesis skill
    AddSkill(Spawn, 3282420779,1,level)
    SendMessage(Spawn, "You have learned the Archegenesis skill")
elseif HasSkill(Spawn,3282420779) then
    RemoveSkill(Spawn, 3282420779)
end
end

-- Nature's Refuge/Warden
if GetClass (Spawn) == WARDEN then 
if not HasSkill(Spawn, 1040683335) then -- Nature's Refuge skill
    AddSkill(Spawn, 1040683335,1,level)
    SendMessage(Spawn, "You have learned the Nature's Refuge skill")
elseif HasSkill(Spawn,1040683335) then
    RemoveSkill(Spawn, 1040683335)
end
end

-- Nature's Reckoning/Fury
if GetClass (Spawn) == FURY then 
if not HasSkill(Spawn, 1624274802) then -- Nature's Reckoning skill
    AddSkill(Spawn, 1624274802,1,level)
    SendMessage(Spawn, "You have learned the Nature's Reckoning skill")
elseif HasSkill(Spawn,1624274802) then
    RemoveSkill(Spawn, 1624274802)
end
end

-- Talismans/Shaman
if GetClass (Spawn) == SHAMAN or
GetClass (Spawn) == MYSTIC or
GetClass (Spawn) == DEFILER then 
if not HasSkill(Spawn, 2120065377) then -- Talismans skill
    AddSkill(Spawn, 2120065377,1,level)
    SendMessage(Spawn, "You have learned the Talismans skill")
elseif HasSkill(Spawn,2120065377) then
    RemoveSkill(Spawn, 2120065377)
end
end

-- Fetichisms/Mystic
if GetClass (Spawn) == MYSTIC then 
if not HasSkill(Spawn, 3467160477) then -- Fetichisms skill
    AddSkill(Spawn, 3467160477,1,level)
    SendMessage(Spawn, "You have learned the Fetichisms skill")
elseif HasSkill(Spawn,3467160477) then
    RemoveSkill(Spawn, 3467160477)
end
end

-- Vehemence/Defiler
if GetClass (Spawn) == DEFILER then 
if not HasSkill(Spawn, 3191839982) then -- Vehemence skill
    AddSkill(Spawn, 3191839982,1,level)
    SendMessage(Spawn, "You have learned the Vehemence skill")
elseif HasSkill(Spawn,3191839982) then
    RemoveSkill(Spawn, 3191839982)
end
end

end


--[[
if not HasSkill(Spawn, 1852383242) then -- Dual Wield
    AddSkill(Spawn, 1852383242,1,level)
    SendMessage(Spawn, "You have learned the Dual Wield skill")
end]]--

