#ifndef EQ2EMU_REGION_MAP_V1_H
#define EQ2EMU_REGION_MAP_V1_H

#include "region_map.h"
#include <map>

#pragma pack(1)
typedef struct ZBSP_Node {
	int32 node_number;
	float normal[3], splitdistance;
	int32 region;
	int32 special;
	int32 left, right;
} ZBSP_Node;

typedef struct Region_Node {
	int32 region_type;
	float x;
	float y;
	float z;
	float dist;
} Region_Node;
#pragma pack()

class RegionMapV1 : public RegionMap
{
public:
	RegionMapV1();
	~RegionMapV1();
	
	virtual WaterRegionType ReturnRegionType(const glm::vec3& location, float belowY = -999999.0f) const;
	virtual bool InWater(const glm::vec3& location, float belowY = -999999.0f) const;
	virtual bool InLava(const glm::vec3& location) const;
	virtual bool InLiquid(const glm::vec3& location) const;
	virtual bool InPvP(const glm::vec3& location) const;
	virtual bool InZoneLine(const glm::vec3& location) const;
	
protected:
	virtual bool Load(FILE *fp);

private:
	WaterRegionType BSPReturnRegionType(int32 node_number, const glm::vec3& location) const;
	WaterRegionType BSPReturnRegionTypeNode(const Region_Node* node, const ZBSP_Node* BSP_Root, int32 node_number, const glm::vec3& location, float distToNode=0.0f) const;

	WaterRegionType BSPReturnRegionWaterRegion(const Region_Node* node, const ZBSP_Node* BSP_Root, int32 node_number, const glm::vec3& location, float distToNode=0.0f) const;
	map<Region_Node*, ZBSP_Node*> Regions;

	WaterRegionType EstablishDistanceAtAngle(const Region_Node* region_node, const ZBSP_Node* current_node, float distance, float absDistance, float absSplitDist, bool checkEdgedAngle=false) const;
	friend class RegionMap;
};

#endif
