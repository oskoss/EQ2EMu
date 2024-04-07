function TakeLavaDamage(Spawn)
    local invul = IsInvulnerable(Spawn)
    if invul == true then
        return 0
    end

	local hp = GetHP(Spawn)
    local level = GetLevel(Spawn)
    local damageToTake = level * 25
	-- if we don't have enough HP make them die to pain and suffering not self
	if hp <= damageToTake then
		KillSpawn(Spawn, null, 1)
	else
		DamageSpawn(Spawn, Spawn, 192, 3, damageToTake, damageToTake, "Lava Burn", 0, 0, 1, 1)
	end
end

function EnterRegion(Zone, Spawn, RegionType)
	-- initial tick for hitting the lava
	TakeLavaDamage(Spawn)

	-- 5 second Tick
	return 5000
end

function Tick(Zone, Spawn, RegionType)

	TakeLavaDamage(Spawn)
	
    -- returning 1 would stop the Tick process until Spawn leaves/re-enters region
	return 0
end
