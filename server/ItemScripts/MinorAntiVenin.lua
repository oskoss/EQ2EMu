--[[
    Script Name    : ItemScripts/MinorAntiVenin.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.10 02:10:24
    Script Purpose : 
                   : 
--]]

--[[ Begin Item Effects

* Applies Minor Anti-Venin when Activated.
	* Dispels 18 levels of noxious hostile effects on caster

End Item Effects--]]

function examined(Item, Player)

end

function used(Item, Player)
    Spell = GetSpell(2550438)
    SetSpellData(Spell, "name", "Minor Anti-Venin")
    SetSpellDataIndex(Spell, 0, 18)
    CastCustomSpell(Spell, Player, Player)
end


