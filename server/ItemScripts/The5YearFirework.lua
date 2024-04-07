--[[
    Script Name    : ItemScripts/The5YearFirework.lua
    Script Author  : Premierio015
    Script Date    : 2023.12.09 10:12:59
    Script Purpose : 
                   : 
--]]

--[[ Begin Item Effects

* Applies 5-Year Firework when Activated.  Lasts for 3.0 seconds.
	* Launches a firework when used.

End Item Effects--]]

function examined(Item, Player)

end

function used(Item, Player)
CastSpell(Player, 5289, 1)
end
