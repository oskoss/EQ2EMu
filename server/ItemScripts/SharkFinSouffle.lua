--[[
    Script Name    : ItemScripts/SharkFinSouffle.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.27 03:10:44
    Script Purpose : 
                   : 
--]]

--[[ Begin Item Effects

* Increases Out-of-Combat Health Regeneration of target by 10.0
* This effect suspends during combat

End Item Effects--]]

function cast(Item, Player)
	Spell = GetSpell(5462)
	Regenz = 10.0
	newDuration = 18000
	SetSpellData(Spell, "duration1", newDuration)
	SetSpellData(Spell, "duration2", newDuration)
	SetSpellDataIndex(Spell, 0, Regenz)
	SetSpellDisplayEffect(Spell, 0, "description", "Increases Out-of-Combat Health Regeneration of target by " .. Regenz)
	CastCustomSpell(Spell, Player, Player)
end
