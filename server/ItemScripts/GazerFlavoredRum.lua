--[[
	Script Name		:	ItemScripts/OverthereAle.lua
	Script Purpose	:	
	Script Author	:	Neatz09
	Script Date		:	1/31/2021
	Script Notes	:	
--]]

function cast(Item, Player)
	Spell = GetSpell(5463, 3, "Spells/Commoner/HomemadeDrinkGenericMaxHpPwr.lua")
	Regenz = 135.0
	Stat = 90.0
	newDuration = 181800
	SetSpellData(Spell, "duration1", newDuration)
	SetSpellData(Spell, "duration2", newDuration)
	SetSpellDataIndex(Spell, 0, Regenz)
	SetSpellDataIndex(Spell, 1, Stat)
	SetSpellDisplayEffect(Spell, 0, "description", "Increases Max Health of target by " .. Stat)
	SetSpellDisplayEffect(Spell, 1, "description", "Increases Max Power of target by " .. Stat)
	SetSpellDisplayEffect(Spell, 2, "description", "Increases Out-of-Combat Power Regeneration of target by " .. Regenz)
	CastCustomSpell(Spell, Player, Player)
end