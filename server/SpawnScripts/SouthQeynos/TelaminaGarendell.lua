--[[
    Script Name    : SpawnScripts/SouthQeynos/TelaminaGarendell.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.19 11:09:55
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "ponder")
end

function hailed(NPC, Spawn)
Dialog1(NPC, Spawn)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Magical aptitude is achieved only through rigorous training and testing. One is not granted magical power through talent alone.")
	Dialog.AddVoiceover("tilliana_steamsieve/qey_south/trainer_conjuror001.mp3", 2213433936, 1054777117)
	Dialog.AddOption("I see.")
	Dialog.Start()
end


function respawn(NPC)
	spawn(NPC)
end


--[[	Line 60269: (1131147345)[Fri Nov 04 18:35:45 2005] \aNPC 8057 Telamina Garendell:Telamina Garendell\/a says,"Your aura ... I can see you're ready for aptitude testing, young one."
	Line 60270: (1131147350)[Fri Nov 04 18:35:50 2005] \aNPC 8057 Telamina Garendell:Telamina Garendell\/a says to you,"You've a strong aptitude for the magical arts, do you not?  I can see it in your aura as plainly as I see your face.  Would you like to begin your final test?"
	Line 60271: (1131147353)[Fri Nov 04 18:35:53 2005] You say to Telamina Garendell,"I would like to begin immediately."
	Line 60272: (1131147353)[Fri Nov 04 18:35:53 2005] \aNPC 8057 Telamina Garendell:Telamina Garendell\/a says to you,"First, you must prove to me that you can handle yourself on the battlefield.  I need you to gather several of the shamanistic stones the gnolls carry."
	Line 60273: (1131147355)[Fri Nov 04 18:35:55 2005] You say to Telamina Garendell,"What stones?"
	Line 60277: (1131147355)[Fri Nov 04 18:35:55 2005] \aNPC 8057 Telamina Garendell:Telamina Garendell\/a says to you,"You will find that different gnolls carry different stones that denote their status in the pack.  Bring me back a stone that represents each social standing in the gnoll pack, and we will speak further of your training."
	Line 60278: (1131147356)[Fri Nov 04 18:35:56 2005] You say to Telamina Garendell,"But I haven't had chosen my path yet!"
	Line 60279: (1131147356)[Fri Nov 04 18:35:56 2005] \aNPC 8057 Telamina Garendell:Telamina Garendell\/a says to you,"You must determine your fate before you begin this path. Have you determined whether you wish to be a Wizard or Warlock?"
	Line 60280: (1131147358)[Fri Nov 04 18:35:58 2005] You say to Telamina Garendell,"I was thinking about becoming a Warlock."
	Line 60281: (1131147358)[Fri Nov 04 18:35:58 2005] \aNPC 8057 Telamina Garendell:Telamina Garendell\/a says to you,"With surgical precision, Warlocks topple foes by casting poisonous and disease-ridden spells. Warlocks walk a fine line between using their power for good or falling to the forces of evil. Do you wish to pursue the ways of the Warlock?"
	Line 60282: (1131147363)[Fri Nov 04 18:36:03 2005] You say to Telamina Garendell,"No, I think I'd rather try being a Wizard."
	Line 60283: (1131147363)[Fri Nov 04 18:36:03 2005] \aNPC 8057 Telamina Garendell:Telamina Garendell\/a says to you,"As a Wizard, you will rain fire and ice upon your foes.  Elemental magic will be your strength, and your ability to wield more powerful spells of the arcane variety will only increase as you venture out in the world. Is this the path you want to take?"
	Line 60284: (1131147368)[Fri Nov 04 18:36:08 2005] You say to Telamina Garendell,"Yes. I wish to wield the elemental magics and become a Wizard."
	Line 60286: (1131147368)[Fri Nov 04 18:36:08 2005] \aNPC 8057 Telamina Garendell:Telamina Garendell\/a says to you,"Good! Then go forth and return to me only when you have retrieved the stones of which I speak. Beware, for the gnolls shall guard them with their very lives.  I wish you well in this endeavor and hope to see you soon."
	Line 60287: (1131147370)[Fri Nov 04 18:36:10 2005] You say to Telamina Garendell,"I will return when I have the stones."
	Line 67887: (1131326165)[Sun Nov 06 20:16:05 2005] \aNPC 8057 Telamina Garendell:Telamina Garendell\/a says to you,"So, you return. Did you bring me the stones I requested?"
	Line 67888: (1131326167)[Sun Nov 06 20:16:07 2005] You say to Telamina Garendell,"I have."
	Line 67889: (1131326168)[Sun Nov 06 20:16:08 2005] \aNPC 8057 Telamina Garendell:Telamina Garendell\/a says to you,"Well done, indeed!  Only one who has worked hard to achieve their station could delve as deeply into Blackburrow as you delved.  Are you ready to begin your true trial?"
	Line 67890: (1131326169)[Sun Nov 06 20:16:09 2005] You say to Telamina Garendell,"I am."
	Line 67893: (1131326169)[Sun Nov 06 20:16:09 2005] \aNPC 8057 Telamina Garendell:Telamina Garendell\/a says to you,"Then I will request that the audience chambers are closed while you take your test. I will watch your progress from above.  When the trial begins, use your magic to defeat the enemy before you.  Prepare yourself, young one, and I will start your test."
	Line 67894: (1131326171)[Sun Nov 06 20:16:11 2005] You say to Telamina Garendell,"I am ready."
	Line 68036: (1132408111)[Sat Nov 19 08:48:31 2005] \aNPC 8191 Telamina Garendell:Telamina Garendell\/a says to you,"I'm sorry you failed your trial. Are you ready to try once more?"
	Line 68037: (1132408116)[Sat Nov 19 08:48:36 2005] You say to Telamina Garendell,"Yes, I am."
	Line 68038: (1132408116)[Sat Nov 19 08:48:36 2005] \aNPC 8191 Telamina Garendell:Telamina Garendell\/a says to you,"Then once more, I will clear the tower.  Prepare yourself, mageling!"
	Line 68039: (1132408123)[Sat Nov 19 08:48:43 2005] You say to Telamina Garendell,"I will not fail this time."
	Line 68358: (1132409262)[Sat Nov 19 09:07:42 2005] \aNPC 8191 Telamina Garendell:Telamina Garendell\/a says to you,"I'm sorry you failed your trial. Are you ready to try once more?"
	Line 68359: (1132409266)[Sat Nov 19 09:07:46 2005] You say to Telamina Garendell,"Yes, I am."
	Line 68360: (1132409266)[Sat Nov 19 09:07:46 2005] \aNPC 8191 Telamina Garendell:Telamina Garendell\/a says to you,"Then once more, I will clear the tower.  Prepare yourself, mageling!"
	Line 68361: (1132409268)[Sat Nov 19 09:07:48 2005] You say to Telamina Garendell,"I will not fail this time."
	Line 68705: (1132409977)[Sat Nov 19 09:19:37 2005] \aNPC 8191 Telamina Garendell:Telamina Garendell\/a says to you,"Congratulations on successfully completing your trial!"
	Line 68706: (1132409979)[Sat Nov 19 09:19:39 2005] You say to Telamina Garendell,"Thank you Telamina."
	Line 68712: (1132409979)[Sat Nov 19 09:19:39 2005] \aNPC 8191 Telamina Garendell:Telamina Garendell\/a says to you,"Please take this staff as both a reward for your mastery of the magical arts and for your journey down the path of a true Wizard!"
	Line 68713: (1132409984)[Sat Nov 19 09:19:44 2005] You say to Telamina Garendell,"I am honored, may the Three Towers stand forever."
	Line 68723: (1132511084)[Sun Nov 20 13:24:44 2005] \aNPC 8191 Telamina Garendell:Telamina Garendell\/a says to you,"Magical aptitude is achieved only through rigorous training and testing. One is not granted magical power through talent alone."
	Line 68724: (1132511085)[Sun Nov 20 13:24:45 2005] You say to Telamina Garendell,"I see."
--]]