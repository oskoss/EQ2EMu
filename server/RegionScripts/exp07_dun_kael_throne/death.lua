-- kaelthrone note: this represents the region in outer kael, however they have it behind the door wall... so it exists sort of?

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
