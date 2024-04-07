--[[
    Script Name    : ItemScripts/MinorElementalOintment.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.10 01:10:30
    Script Purpose : 
                   : 
--]]

--[[ Begin Item Effects

* Applies Elemental Ointment when Activated.
	* Dispels 18 levels of elemental hostile effects on caster

End Item Effects--]]

function examined(Item, Player)

end

function used(Item, Player)
    Spell = GetSpell(2550436)
    SetSpellData(Spell, "name", "Minor Elemental Ointment")
    SetSpellDataIndex(Spell, 0, 18)
    CastCustomSpell(Spell, Player, Player)
end

