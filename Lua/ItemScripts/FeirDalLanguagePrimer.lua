--[[
	Script Name		:	Feir'Dal Language Primer
	Script Purpose	:	
	Script Author	:	Neatz09
	Script Date		:	1/19/2019
	Script Notes	:	
--]]

function obtained(Item, Spawn)
if not HasLanguage(Spawn,16) then
	AddLanguage(Spawn, 16)
	SendMessage(Spawn, "Feir'Dal", "White")
	RemoveItem(Spawn, 902) 
end

end