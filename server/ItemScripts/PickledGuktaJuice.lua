--[[
    Script Name    : ItemScripts/PickledGuktaJuice.lua
    Script Author  : neatz09
    Script Date    : 2023.12.12 03:12:39
    Script Purpose : 
                   : 
--]]

function cast(Item, Player)
	Spell = GetSpell(5463)
	Regenz = 24.0
	newDuration = 18000
	SetSpellData(Spell, "duration1", newDuration)
	SetSpellData(Spell, "duration2", newDuration)
	SetSpellDataIndex(Spell, 0, Regenz)
	SetSpellDisplayEffect(Spell, 0, "description", "Increases Out-of-Combat Power Regeneration of target by " .. Regenz)
	CastCustomSpell(Spell, Player, Player)
end