--[[
	Script Name		:   Ayr'Dal Language Primer
	Script Purpose	:	
	Script Author	:	Neatz09
	Script Date		:	1/19/2019
	Script Notes	:	
--]]

function obtained(Item, Spawn)
if not HasLanguage(Spawn,7) then
	AddLanguage(Spawn, 7)
	SendMessage(Spawn, "Ayr'Dal", "White")
	RemoveItem(Spawn, 901) 
	end
	
	end