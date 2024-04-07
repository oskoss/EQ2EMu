-- crystalcavern note: not so sure about this one, its underworld at an area that seems to have terrain above it.. but it is a pit.. so this is here in case?

function EnterRegion(Zone, Spawn, RegionType)
    -- RegionType 2 is 'lava' or 'death' regions, RegionType 1 is water

    local invul = IsInvulnerable(Spawn)
    if invul == true then
        return 0
    end

    if RegionType == 2 then
		    KillSpawn(Spawn, null, 1)
	    end
end
