--[[
    Script Name    : Spells/Commoner/TheOverlordsWill.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.26 03:09:36
    Script Purpose : 
                   : 
--]]

--[[ Info from spell_display_effects (remove from script when done)


--]]


function cast(Caster, Target)
    if GetQuestStep(Target,5890)>=1 then
        SetStepComplete(Target,5890,1)
local Alignment = GetAlignment(Target)
if Alignment == 0 then
    SetAlignment(Target,2)
end    
     RemoveSpellBookEntry(Target, 2550019)
local Freeport = GetFactionAmount(Target, 12)
if Freeport >0 then 
    ChangeFaction(Target, 12, -100000)
end
end


local hp = GetHP(Target)
local damage = GetMaxHP(Target) *1.5
local damageToTake = damage * 1
-- if we don't have enough HP make them die to pain and suffering not self... 
if hp <= damageToTake then
KillSpawn(Target, null, 1)
else
DamageSpawn(Target, Target, 192, 3, damageToTake, damageToTake, "the Overlord's Banishment!", 0, 0, 1, 1)
end
end

