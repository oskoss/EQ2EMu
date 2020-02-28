--[[
	Script Name		:	<script-name>
	Script Purpose	:	<purpose>
	Script Author	:	<author-name>
	Script Date		:	1/1/2019
	Script Notes	:	<special-instructions>
--]]

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end
function hailed(NPC, Spawn)

end

function respec(Player)
    skill = GetSkill(Player, "Parry")
    if skill ~= nil then
        SetSkillValue(skill, 200)
	end
end
