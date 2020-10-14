

#include "region_map.h"
#include "region_map_v1.h"
#include "../../common/Log.h"

#include <algorithm>
#include <cctype>
#include <stdio.h>
#include <string.h>
#include <fstream>

/**
 * @param name
 * @return
 */
inline bool file_exists(const std::string& name) {
	std::ifstream f(name.c_str());
	return f.good();
}

/**
 * @param zone_name
 * @return
 */
RegionMap* RegionMap::LoadRegionMapfile(std::string zone_name) {
	std::string filename = "Regions/";
	filename += zone_name;
	filename += ".EQ2Region";
	FILE* f = fopen(filename.c_str(), "rb");

	LogWrite(REGION__DEBUG, 7, "Region", "Attempting load of %s", filename.c_str());

	if (!f)
	{
		LogWrite(REGION__ERROR, 7, "Region", "Failed to load of %s", filename.c_str());
		return nullptr;
	}

	// Read the string for the zone file name this was created for
	int8 strSize;
	char name[256];
	fread(&strSize, sizeof(int8), 1, f);
	LogWrite(REGION__DEBUG, 7, "Region", "strSize = %u", strSize);

	size_t len = fread(&name, sizeof(char), strSize, f);
	name[len] = '\0';
	LogWrite(REGION__DEBUG, 7, "Region", "name = %s", name);

	string fileName(name);
	std::size_t found = fileName.find(zone_name);
	// Make sure file contents are for the correct zone
	if (found == std::string::npos) {
		fclose(f);
		LogWrite(REGION__ERROR, 0, "Region", "WaterMap::LoadWaterMapfile() map contents (%s) do not match its name (%s).", &name, zone_name.c_str());
		return nullptr;
	}
	
	int32 regionMapVersion;
	fread(&regionMapVersion, sizeof(int32), 1, f);
	LogWrite(REGION__INFO, 0, "Region", "Loading %s RegionMapVersion = %u", name, regionMapVersion);

	RegionMapV1* regionmap = new RegionMapV1();
	regionmap->Load(f);

	return regionmap;
}
