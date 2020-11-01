--[[
	Script Name		:	QeynosianCivilService.lua
	Script Purpose	:	Handles the quest, "Qeynosian Civil Service"
	Script Author	:	geordie0511
	Script Date		:	13.03.2019
	Script Notes	:	

	Zone			:	Antonica
	Quest Giver		:	Knight-Lieutenant Alesso
	Preceded by		:	None
	Followed by		:	None
--]]


function Init(Quest)
	SetQuestFeatherColor(Quest, 3)
	SetQuestRepeatable(Quest)
	AddQuestStepKill(Quest, 1, "I need to kill ten rats.", 10, 100, "I need to head out into Antonica and kill the vermin that infest the land; rats, snakes and beetles. Knight-Lieutenant Alesso said I should kill about ten of each.", 99, 120066, 121224)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've killed ten rats.")

	AddQuestStepKill(Quest, 2, "I need to kill ten snakes.", 10, 100, "I need to head out into Antonica and kill the vermin that infest the land; rats, snakes and beetles. Knight-Lieutenant Alesso said I should kill about ten of each.", 1908, 120068, 121226, 121347)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have killed ten snakes.")

	AddQuestStepKill(Quest, 3, "I need to kill ten beetles.", 10, 100, "I need to head out into Antonica and kill the vermin that infest the land; rats, snakes and beetles. Knight-Lieutenant Alesso said I should kill about ten of each.", 162, 120067, 121225, 120253, 120373, 120367, 121443, 120371, 121369)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I have killed ten beetles.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've killed the vermin that Sir Alesso tasked me with.")

	AddQuestStepChat(Quest, 4, "I need to speak with Knight-Lieutenant Alesso.", 1, "I've killed a great many vermin that once infested Antonica.  I should return to Knight-Lieutenant Alesso.", 11, 120083)
	AddQuestStepCompleteAction(Quest, 4, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 4, "I've spoken with Knight-Lieutenant Alesso.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've spoken with Knight-Lieutenant Alesso.")

	UpdateQuestDescription(Quest, "I've lowered the vermin population quite a bit out in Antonica. Knight-Lieutenant Alesso was pleased with my efforts and paid me for my service to Qeynos.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		Step2Complete(Quest, QuestGiver, Player)
	elseif Step == 3 then
		Step3Complete(Quest, QuestGiver, Player)
	elseif Step == 4 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end

function Accepted(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is accepted
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end