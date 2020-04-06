

#include "water_map.h"

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
WaterMap* WaterMap::LoadWaterMapfile(std::string zone_name) {
	return nullptr;
}
