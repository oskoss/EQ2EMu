--[[
    Script Name    : SpawnScripts/SinkingSands/PlumetorDulSadma.lua
    Script Author  : premierio015
    Script Date    : 2023.12.15 03:12:56
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/DialogModule"


function spawn(NPC)

end


function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Greetings, mortal.  It is little wonder you have come to see me.  Now it is time to celebrate, as the Forgotten One is returning to our world once again!")
    Dialog.AddEmote("bow")
	Dialog.AddOption("The Forgotten One?  You must mean Anashti Sul, correct?", "Option1")
	Dialog.AddOption("Well, you seem to be quite pleased, so I'll leave you be.  Farewell.")
	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_3_1011.mp3", 0, 0)
	Dialog.Start()
end

function Option1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Indeed!  After all of these long Ages, she will once again walk among the gods as she once did, and shower her gifts of love and compassion upon the undeserving mortals of Norrath!  These are truly exciting times to be living in!")
	Dialog.AddOption("Pardon me. I do not mean to question you, but I had thought that Anashti Sul was destroyed in her palace in the Void.  That is what has been whispered, in any case.", "Option2")
	Dialog.AddOption("Indeed, but I must be going.  Goodbye for now.")
	Dialog.Start()
end

function Option2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
		Dialog.AddDialog("No, my little feather, she was not destroyed.  Although what happened to her in the Void was not part of her plans, that event will work into the favor of all of us.  You see, the victory of those who fought her in that palace merely snapped her tether to the Void itself, catapulting her back to our world!")
    Dialog.AddEmote("no")
	Dialog.AddOption("Wait, so is Anashti Sul among us again, then?", "Option3")
	Dialog.AddOption("Well, contact me when she has arrived.  I must be going.")
	Dialog.Start()
end

function Option3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Not as of yet.  She is materializing on our world now -- gathering her strength, reestablishing the conduits of power that anchor her to this world.  This is a long and exhausting process, but it is one that even we, as mortals, can assist her with.  Imagine -- we could help a goddess be reborn in her rightful home!")
    Dialog.AddEmote("no")
	Dialog.AddOption("Why would we do that?  Was she not banished for crimes against mortals?", "Option4")
	Dialog.AddOption("That sounds exciting, indeed.  However, I must be going now.")
	Dialog.Start()
end

function Option4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Crimes?  Nay, they were not crimes.  Anashti Sul always worked out of love for the mortals!  She was the goddess of life and health... she felt the pain of every creature as it lay wounded, sick, or dying, and she sought nothing less than to eliminate that horror forever.")
    Dialog.AddEmote("no")
	Dialog.AddOption("So what happened?", "Option5")
	Dialog.AddOption("How compassionate.  I want to hear more of this another time.")
	Dialog.Start()
end

function Option5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The other gods were jealous of her gifts to the mortals.  They realized they could lose all of their followers to Anashti Sul, once the mortals saw how much she loved them, and how much she would sacrifice for them.  Anashti Sul risked her existence for the mortals, and she paid the ultimate price for her love.")
    Dialog.AddEmote("no")
	Dialog.AddOption("So she looked after us, rather than abandoning us as the other gods did in the past?", "Option6")
	Dialog.AddOption("That's unfortunate for them.  Well, I may return another time.")
	Dialog.Start()
end

function Option6(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh, yes.  Anashti Sul would never have agreed to the pact of the gods.  She would not have allowed her followers to suffer.  Imagine a world where death and disease are but a distant memory; where life is eternal and Anashti Sul watches over us.")
    Dialog.AddEmote("agree")
	Dialog.AddOption("I'll have to admit, that does sound quite a bit better than what we're forced to live with now.  What can I do to help?", "Option7")
	Dialog.AddOption("I'll bear that in mind.  Well, best of luck to you!")
	Dialog.Start()
end

function Option7(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("First, we must gather the followers of Anashti Sul, and prepare them for her return.  We will want to begin building the foundation of her canon, so we will want to collect stories of her from the past -- lost tomes in libraries across Norrath that have been overlooked by those that do not understand their significance.  With those, we can create the stories to teach and enlighten those who might not know the truth of Anashti Sul's caring nature.")
	Dialog.AddOption("I would be willing to collect those tomes, if you need me to.", "Option8")
	Dialog.AddOption("You should begin searching, then. Farewell for now.")
	Dialog.Start()
end

function Option8(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I am glad that you see the light of her love.  Your willingness to help may be a beacon to others who do not yet see the truth, or have forgotten it.")
    Dialog.AddEmote("thanks")
	Dialog.AddOption("Forgotten it?  What do you mean?", "Option9")
	Dialog.AddOption("I do, but I have other matters to look into right now.  Farewell.")
	Dialog.Start()
end

function Option9(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("I once belonged to a group of worshipers of Anashti Sul, known as the Fellowship of the Peacock.  Our group was thought to have been killed, down to the last member, but the jealousy of nonbelievers merely scattered us.  Those who were left went into hiding, fearing for their lives.  Most have forgotten the glory of her word, and a few have even strayed from the path altogether, seeking the light of other deities.")
	Dialog.AddOption("True heresy, to be sure.  So you would like me to gather the lost tomes, and the lost members of the Fellowship of the Peacock, then?", "Option10")
	Dialog.AddOption("I'm sure their reasons are their own. Well, I must be going.")
	Dialog.Start()
end



function Option10(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Ah, you are definitely a sharp one, my little feather.  Anashti Sul will be pleased to have followers such as you in her muster.  Now go forth -- find the ancient scripts, and find those who have lost their way.  When you find someone who you think might be a member of the Fellowship, speak these words: \"Can you hear the peacock's call?\" and they will answer, \"Indeed, and the feathers are quite beautiful.\"  They will know it is safe to speak to you.")
	Dialog.AddEmote("scheme")
	Dialog.AddOption("I have changed my mind.  I will think about it and return another time.")
	Dialog.Start()
end










function respawn(NPC)
	spawn(NPC)
end