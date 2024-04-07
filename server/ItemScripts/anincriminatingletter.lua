--[[
    Script Name    : ItemScripts/anincriminatingletter.lua
    Script Author  : cynnar
    Script Date    : 2023.11.21 03:11:06
    Script Purpose : 
                   : 
--]]

local EliminateGeraufl = 5929

function examined(Item, Player)
	conversation = CreateConversation()

	if not HasQuest(Player, EliminateGeraufl) then
	    OfferQuest(nil, Player, EliminateGeraufl)
	    AddConversationOption(conversation, "continue reading", "nextpage")
	    StartDialogConversation(conversation, 2, Item, Player, "Kath -\nWe'er on our way. The frogloks here in Qeynos are pleased with our attempts to rescue their brethren over on your side of the world. We cannot allow Lucan's tyranny to encompass an entire race, and dominate their destiny.")
	end

end

function nextpage(Item, Player)
    conversation = CreateConversation()
    
    AddConversationOption(conversation, "put the note away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "Your efforts on that front will soon be bolstered by another group of our best. Once they break out Geraufl we will be able to concentrate on the larger task at hand: freeing their kind form their pens in Cazic-Thule, a task which will no doubt be much harder than the one we currently face. - M.")
end