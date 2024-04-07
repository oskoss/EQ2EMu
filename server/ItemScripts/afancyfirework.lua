--[[
    Script Name    : ItemScripts/afancyfirework.lua
    Script Author  : Premierio015
    Script Date    : 2023.12.09 10:12:51
    Script Purpose : 
                   : 
--]]

--[[ Begin Item Effects

* Applies Fancy Firework when Activated.  Lasts for 3.0 seconds.
	* Launches a firework when used.

End Item Effects--]]

function examined(Item, Player)

end

function used(Item, Player)
CastSpell(Player, 2550447, 1) 

end
