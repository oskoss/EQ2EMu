#include "region_map_v1.h"
#include "../../common/Log.h"

RegionMapV1::RegionMapV1() {

}

RegionMapV1::~RegionMapV1() {
	map<Region_Node*, ZBSP_Node*>::const_iterator itr;
	int region_num = 0;
	for (itr = Regions.begin(); itr != Regions.end();)
	{
		Region_Node* node = itr->first;
		ZBSP_Node* bsp_node = itr->second;
		map<Region_Node*, ZBSP_Node*>::const_iterator deleteItr = itr;
		itr++;
		Regions.erase(deleteItr);
		safe_delete(node);
		safe_delete(bsp_node);
	}

	Regions.clear();
}

WaterRegionType RegionMapV1::ReturnRegionType(const glm::vec3& location, float belowY) const {
	return BSPReturnRegionType(1, glm::vec3(location.y, location.x + 0.5f, location.z));
}

bool RegionMapV1::InWater(const glm::vec3& location, float belowY) const {
	return ReturnRegionType(location, belowY) == RegionTypeWater;
}

bool RegionMapV1::InLava(const glm::vec3& location) const {
	return ReturnRegionType(location) == RegionTypeLava;
}

bool RegionMapV1::InLiquid(const glm::vec3& location) const {
	return InWater(location) || InLava(location);
}

bool RegionMapV1::InPvP(const glm::vec3& location) const {
	return ReturnRegionType(location) == RegionTypePVP;
}

bool RegionMapV1::InZoneLine(const glm::vec3& location) const {
	return ReturnRegionType(location) == RegionTypeZoneLine;
}

bool RegionMapV1::Load(FILE* fp) {
	uint32 region_size;
	if (fread(&region_size, sizeof(region_size), 1, fp) != 1) {
		return false;
	}

	LogWrite(REGION__DEBUG, 0, "RegionMap", "region count = %u", region_size);

	for (int i = 0; i < region_size; i++)
	{
		uint32 region_num;
		if (fread(&region_num, sizeof(region_num), 1, fp) != 1) {
			return false;
		}

		uint32 region_type;
		if (fread(&region_type, sizeof(region_type), 1, fp) != 1) {
			return false;
		}

		float x, y, z, dist;
		if (fread(&x, sizeof(x), 1, fp) != 1) {
			return false;
		}
		if (fread(&y, sizeof(y), 1, fp) != 1) {
			return false;
		}
		if (fread(&z, sizeof(z), 1, fp) != 1) {
			return false;
		}
		if (fread(&dist, sizeof(dist), 1, fp) != 1) {
			return false;
		}

		uint32 bsp_tree_size;
		if (fread(&bsp_tree_size, sizeof(bsp_tree_size), 1, fp) != 1) {
			return false;
		}

		LogWrite(REGION__DEBUG, 0, "RegionMap", "region x,y,z,dist = %f, %f, %f, %f, region bsp tree size: %u", x, y, z, dist, bsp_tree_size);

		ZBSP_Node* BSP_Root = new ZBSP_Node[bsp_tree_size];
		if (fread(BSP_Root, sizeof(ZBSP_Node), bsp_tree_size, fp) != bsp_tree_size) {
			LogWrite(REGION__ERROR, 0, "RegionMap", "Failed to load region.");
			return false;
		}

		Region_Node* tmpNode = new Region_Node;
		tmpNode->x = x;
		tmpNode->y = y;
		tmpNode->z = z;
		tmpNode->dist = dist;
		tmpNode->region_type = region_type;
		Regions.insert(make_pair(tmpNode, BSP_Root));
	}

	fclose(fp);

	LogWrite(REGION__DEBUG, 0, "RegionMap", "completed load!");

	return true;
}

WaterRegionType RegionMapV1::BSPReturnRegionType(int32 node_number, const glm::vec3& location) const {
	map<Region_Node*, ZBSP_Node*>::const_iterator itr;
	int region_num = 0;
	for (itr = Regions.begin(); itr != Regions.end(); itr++)
	{
		Region_Node* node = itr->first;
		ZBSP_Node* BSP_Root = itr->second;

		float x1 = node->x - location.x;
		float y1 = node->y - location.y;
		float z1 = node->z - location.z;
		float dist = sqrt(x1 * x1 + y1 * y1 + z1 * z1);

#ifdef REGIONDEBUG
		printf("Region %i (%i) dist %f / node dist %f.  NodeXYZ: %f %f %f, XYZ: %f %f %f.\n", region_num, node->region_type, dist, node->dist, node->x, node->y, node->z, location.x, location.y, location.z);
#endif

		if (dist <= node->dist)
		{
			ZBSP_Node* BSP_Root = itr->second;
			const ZBSP_Node* current_node = &BSP_Root[node_number - 1];

			WaterRegionType regionType = RegionTypeUntagged;

			if (node->region_type == ClassWaterRegion)
				regionType = BSPReturnRegionWaterRegion(node, BSP_Root, node_number, location, dist);
			else
				regionType = BSPReturnRegionTypeNode(node, BSP_Root, node_number, location, dist);

			if (regionType != RegionTypeNormal)
				return regionType;
		}
		region_num++;
	}

	return(RegionTypeNormal);
}

WaterRegionType RegionMapV1::BSPReturnRegionTypeNode(const Region_Node* region_node, const ZBSP_Node* BSP_Root, int32 node_number, const glm::vec3& location, float distToNode) const {
	const ZBSP_Node* current_node = &BSP_Root[node_number - 1];
	float distance;

#ifdef REGIONDEBUG
	printf("left = %u, right %u\n", current_node->left, current_node->right);
#endif

	if (region_node->region_type == ClassWaterRegion2)
	{
		distance = (location.x * current_node->normal[0]) +
			(location.y * current_node->normal[1]) +
			(location.z * current_node->normal[2]) +
			current_node->splitdistance;
	}
	else {
		distance = (location.x * current_node->normal[0]) +
			(location.y * current_node->normal[1]) +
			(location.z * current_node->normal[2]) -
			current_node->splitdistance;
	}

	float absDistance = distance;
	if (absDistance < 0.0f)
		absDistance *= -1.0f;

	float absSplitDist = current_node->splitdistance;
	if (absSplitDist < 0.0f)
		absSplitDist *= -1.0f;

#ifdef REGIONDEBUG
	printf("distance = %f, normals: %f %f %f, location: %f %f %f, split distance: %f\n", distance, current_node->left, current_node->right, current_node->normal[0], current_node->normal[1], current_node->normal[2],
		location.x, location.y, location.z, current_node->splitdistance);
#endif

	if ((current_node->left == 4294967294) &&
		(current_node->right == 4294967295)) {
		if (region_node->region_type == ClassWaterOcean || region_node->region_type == ClassWaterOcean2)
		{
			return EstablishDistanceAtAngle(region_node, current_node, distance, absDistance, absSplitDist, false);
		}
		else
		{
			if (distance > 0)
				return(RegionTypeWater);
			else
				return RegionTypeNormal;
		}
	}
	else if ((region_node->region_type == ClassWaterOcean || region_node->region_type == ClassWaterOcean2) && current_node->normal[1] != 1.0f && current_node->normal[1] != -1.0f)
	{
		float fraction = abs(current_node->normal[0] * current_node->normal[2]);
		float diff = distToNode / region_node->dist;
		if (distance > 0)
			diff = distance * diff;

#ifdef REGIONDEBUG
		printf("Diff: %f (%f + %f), fraction %f\n", diff, distToNode, distance, fraction);
#endif
		if ((abs(diff) / 2.0f) > (absSplitDist * (1.0f / fraction)) * 2.0f)
			return RegionTypeNormal;
	}

	if (distance == 0.0f) {
		return(RegionTypeNormal);
	}

	if (distance > 0.0f) {

#ifdef REGIONDEBUG
		printf("to left node %i\n", current_node->left);
#endif
		if (current_node->left == 4294967294 && ((region_node->region_type == ClassWaterVolume || region_node->region_type == ClassWaterOcean2) ||
			(region_node->region_type == ClassWaterOcean && current_node->normal[1] == 1.0f)))
			return RegionTypeWater;
		else if (current_node->left == -1 || current_node->left == -2) {
			if (current_node->left == -2 && region_node->region_type == ClassWaterCavern)
				return EstablishDistanceAtAngle(region_node, current_node, distance, absDistance, absSplitDist, true);
			else
				return(RegionTypeNormal);
		}
		return BSPReturnRegionTypeNode(region_node, BSP_Root, current_node->left + 1, location, distToNode);
	}

#ifdef REGIONDEBUG
	printf("to right node %i, sign bit %i\n", current_node->right, signbit(current_node->normal[1]));
#endif
	if (current_node->right == -1) {
		if (region_node->region_type == ClassWaterOcean2 && signbit(current_node->normal[1]) == 0 && absDistance < absSplitDist)
			return RegionTypeWater;
		else if ((region_node->region_type == ClassWaterOcean || region_node->region_type == ClassWaterOcean2) &&
			(current_node->normal[1] > 0.0f && distance < 0.0f && absDistance < absSplitDist))
		{
			return(RegionTypeWater);
		}
		return(RegionTypeNormal);
	}

	return BSPReturnRegionTypeNode(region_node, BSP_Root, current_node->right + 1, location, distToNode);
}


WaterRegionType RegionMapV1::BSPReturnRegionWaterRegion(const Region_Node* region_node, const ZBSP_Node* BSP_Root, int32 node_number, const glm::vec3& location, float distToNode) const {
	const ZBSP_Node* current_node = &BSP_Root[node_number - 1];
	float distance;

#ifdef REGIONDEBUG
	printf("left = %u, right %u\n", current_node->left, current_node->right);
#endif

	distance = (location.x * current_node->normal[0]) +
		(location.y * current_node->normal[1]) +
		(location.z * current_node->normal[2]) -
		current_node->splitdistance;

#ifdef REGIONDEBUG
	printf("distance = %f, normals: %f %f %f, location: %f %f %f, split distance: %f\n", distance, current_node->left, current_node->right, current_node->normal[0], current_node->normal[1], current_node->normal[2],
		location.x, location.y, location.z, current_node->splitdistance);
#endif

	if (distance > 0.0f) {
#ifdef REGIONDEBUG
		printf("to left node %i\n", current_node->left);
#endif
		if (current_node->left == -1) {
			return(RegionTypeNormal);
		}
		else if (current_node->left == 4294967294) {
			return(RegionTypeWater);
		}
		return BSPReturnRegionWaterRegion(region_node, BSP_Root, current_node->left + 1, location, distToNode);
	}

#ifdef REGIONDEBUG
	printf("to right node %i, sign bit %i\n", current_node->right, signbit(current_node->normal[1]));
#endif

	if (current_node->right == -1) {
		return(RegionTypeNormal);
	}

	return BSPReturnRegionWaterRegion(region_node, BSP_Root, current_node->right + 1, location, distToNode);
}

WaterRegionType RegionMapV1::EstablishDistanceAtAngle(const Region_Node* region_node, const ZBSP_Node* current_node, float distance, float absDistance, float absSplitDist, bool checkEdgedAngle) const {
	float fraction = abs(current_node->normal[0] * current_node->normal[2]);
#ifdef REGIONDEBUG
	printf("Distcheck: %f < %f\n", absDistance, absSplitDist);
#endif
	if (absDistance < absSplitDist &&
		(current_node->normal[0] == 1.0f || current_node->normal[0] == -1.0f ||
			(current_node->normal[1] == 1.0f && distance < 0.0f) ||
			(current_node->normal[1] == -1.0f && distance > 0.0f)))
	{
		return RegionTypeWater;
	}
	else if (region_node->region_type == ClassWaterOcean2 || checkEdgedAngle)
	{
		if (current_node->normal[2] == 1.0f || current_node->normal[2] == -1.0f)
			return RegionTypeNormal;
		else if (current_node->normal[1] == 0.0f && (current_node->normal[0] < -0.5f || current_node->normal[0] > 0.5f) &&
			((abs(absDistance * current_node->normal[0]) / 2.0f) < ((abs(absSplitDist * (1.0f / fraction))))))
		{
			return RegionTypeWater;
		}
		else if (current_node->normal[1] == 0.0f && (current_node->normal[2] < -0.5f || current_node->normal[2] > 0.5f) &&
			((abs(absDistance * current_node->normal[2]) / 2.0f) < ((abs(absSplitDist * (1.0f / fraction))))))
		{
			return RegionTypeWater;
		}
	}

	return RegionTypeNormal;
}