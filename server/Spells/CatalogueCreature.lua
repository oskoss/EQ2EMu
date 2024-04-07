--[[
    Script Name    : Spells/CatalogueCreature.lua
    Script Author  : neatz09
    Script Date    : 2021.05.29 09:05:48
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target)
    Name = GetName(Target)
    PlayFlavor(Caster,"","","peer",0,0)
    SendMessage(Caster, "Currently attempting to catalogue " .. Name .. "...", "white")
end
