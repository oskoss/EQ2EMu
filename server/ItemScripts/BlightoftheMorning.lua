--[[
    Script Name    : ItemScripts/BlightoftheMorning.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.11 12:10:41
    Script Purpose : 
                   : 
--]]

--[[ Begin Item Effects

* Applies Blight of the Morning when Activated.  Lasts for 12 hours.
	* On a combat hit this spell may cast Poison on target of attack.  Lasts for 24.0 seconds.  Triggers about 5.0 times per minute. 
		* Inflicts 9 poison damage on target
		* Inflicts 11 poison damage on target instantly and every 6 seconds
		* Cannot be modified except by direct means
		* Grants a total of 100 triggers of the spell.

End Item Effects--]]

function examined(Item, Player)

end

function used(Item, Player)
    Spell = GetSpell(2550440)
    CastCustomSpell(Spell, Player, Player)
end


