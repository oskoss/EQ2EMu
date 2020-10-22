#ifndef EQ2EMU_REGION_MAP_H
#define EQ2EMU_REGION_MAP_H

#include "../../common/types.h"
#include "position.h"
#include <string>

enum WaterRegionType : int {
	RegionTypeUnsupported = -2,
	RegionTypeUntagged = -1,
	RegionTypeNormal = 0,
	RegionTypeWater = 1,
	RegionTypeLava = 2,
	RegionTypeZoneLine = 3,
	RegionTypePVP = 4,
	RegionTypeSlime = 5,
	RegionTypeIce = 6,
	RegionTypeVWater = 7
};

enum WaterRegionClass : int32 {
	ClassWaterVolume = 0, // matching .region file type by name "watervol"
	ClassWaterRegion = 1, // matching .region file type by name "waterregion"
	ClassWaterRegion2 = 2, // represents .region file name "water_region" potentially defunct and just a WaterVolume (0)
	ClassWaterOcean = 3, // represents .region file with "ocean" and a select node as a parent
	ClassWaterCavern = 4, // represents .region file with matches on name "ocean" and "water"
	ClassWaterOcean2 = 5 // represents .region file with matches on name "ocean" without previous matches (no select node parent and no water string match)
};

class RegionMap
{
public:
	RegionMap() { }
	virtual ~RegionMap() { }

	static RegionMap* LoadRegionMapfile(std::string zone_name);
	virtual WaterRegionType ReturnRegionType(const glm::vec3& location, float belowY = -999999.0f) const = 0;
	virtual bool InWater(const glm::vec3& location, float belowY = -999999.0f) const = 0;
	virtual bool InLava(const glm::vec3& location) const = 0;
	virtual bool InLiquid(const glm::vec3& location) const = 0;
	virtual bool InPvP(const glm::vec3& location) const = 0;
	virtual bool InZoneLine(const glm::vec3& location) const = 0;

protected:
	virtual bool Load(FILE *fp) { return false; }
};

#endif
