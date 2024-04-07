--[[
    Script Name    : ItemScripts/MinorSalve.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.10 01:10:07
    Script Purpose : 
                   : 
--]]

--[[ Begin Item Effects

* Applies Minor Salve when Activated.
	* Dispels 18 levels of physical hostile effects on caster

End Item Effects--]]

function used(Item, Player)
    Spell = GetSpell(2550437)
    SetSpellData(Spell, "name", "Minor Salve")
    SetSpellDataIndex(Spell, 0, 18)
    CastCustomSpell(Spell, Player, Player)
end
