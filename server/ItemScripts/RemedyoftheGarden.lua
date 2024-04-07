--[[
    Script Name    : ItemScripts/RemedyoftheGarden.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.03 05:10:15
    Script Purpose : 
                   : 
--]]

--[[ Begin Item Effects

* Applies Remedy of the Garden when Activated.
	* Heals caster for 8

End Item Effects--]]

function examined(Item, Player)

end

function used (Item, Player)
    Spell = GetSpell(2550435)
    SetSpellData(Spell, "name", "Remedy of the Garden")
    SetSpellDataIndex(Spell, 0, 8)
    SetSpellDataIndex(Spell, 1, 8)
    CastCustomSpell(Spell, Player, Player)
    
end