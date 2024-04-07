--[[
    Script Name    : ItemScripts/MinorEnigmaticFormula.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.10 02:10:07
    Script Purpose : 
                   : 
--]]

--[[ Begin Item Effects

* Applies Minor Enigmatic Formula when Activated.
	* Dispels 18 levels of arcane hostile effects on caster

End Item Effects--]]

function used(Item, Player)
    Spell = GetSpell(2550439)
    SetSpellData(Spell, "name", "Minor Enigmatic Formula")
    SetSpellDataIndex(Spell, 0, 18)
    CastCustomSpell(Spell, Player, Player)
end
