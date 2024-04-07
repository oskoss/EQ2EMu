--[[
    Script Name    : ItemScripts/SacredSustenanceWater.lua
    Script Author  : dorbin
    Script Date    : 2024.03.22 11:03:54
    Script Purpose : 
                   : 
--]]

--[[ Begin Item Effects

* Increases Out-of-Combat Power Regeneration of target by 3.0

End Item Effects--]]

function cast(Item, Player)
	Spell = GetSpell(5463)
	Regenz = 3.0
	newDuration = 18000
	SetSpellData(Spell, "duration1", newDuration)
	SetSpellData(Spell, "duration2", newDuration)
	SetSpellDataIndex(Spell, 0, Regenz)
	SetSpellDisplayEffect(Spell, 0, "description", "Increases Out-of-Combat Power Regeneration of target by " .. Regenz)
	CastCustomSpell(Spell, Player, Player)
end
