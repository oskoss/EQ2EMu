/*
	EQEMu:  Everquest Server Emulator

	Copyright (C) 2001-2014 EQEMu Development Team (http://eqemulator.net)

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; version 2 of the License.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY except by those people which sell it, which
	are required to give you total support for your newly bought product;
	without even the implied warranty of MERCHANTABILITY or FITNESS FOR
	A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

*/

#ifndef ZONE_MAP_H
#define ZONE_MAP_H

#include "../../common/types.h"
#include "../../common/MiscFunctions.h"
#include "../../common/Mutex.h"
#include "position.h"
#include <stdio.h>

#define BEST_Z_INVALID -99999

class Map
{
public:
	Map(string zonename, string filename);
	~Map();

	float FindBestZ(glm::vec3 &start, glm::vec3 *result, uint32 *GridID = 0);
	float FindClosestZ(glm::vec3 &start, glm::vec3 *result);
	bool LineIntersectsZone(glm::vec3 start, glm::vec3 end, float step, glm::vec3 *result);
	bool LineIntersectsZoneNoZLeaps(glm::vec3 start, glm::vec3 end, float step_mag, glm::vec3 *result);
	bool CheckLoS(glm::vec3 myloc, glm::vec3 oloc);
	bool DoCollisionCheck(glm::vec3 myloc, glm::vec3 oloc, glm::vec3 &outnorm, float &distance);

	bool Load(const std::string& filename);

	static Map *LoadMapFile(std::string zonename, std::string file);

	std::string GetFileName() { return m_ZoneFile; }
	void SetMapLoaded(bool val) {
		CheckMapMutex.writelock();
		mapLoaded = val;
		CheckMapMutex.releasewritelock();
	}
	bool IsMapLoaded() {
		bool isMapLoaded = false;
		CheckMapMutex.readlock();
		isMapLoaded = mapLoaded;
		CheckMapMutex.releasereadlock();
		return isMapLoaded;
	}

	void SetMapLoading(bool val) {
		CheckMapMutex.writelock();
		mapLoading = val;
		CheckMapMutex.releasewritelock();
	}
	bool IsMapLoading() {
		bool isMapLoading = false;
		CheckMapMutex.readlock();
		isMapLoading = mapLoading;
		CheckMapMutex.releasereadlock();
		return isMapLoading;
	}
	float GetMinX() { return m_MinX; }
	float GetMaxX() { return m_MaxX; }
	float GetMinZ() { return m_MinZ; }
	float GetMaxZ() { return m_MaxZ; }

	void SetFileName(std::string newfile) { m_FileName = string(newfile); }
private:
	void RotateVertex(glm::vec3 &v, float rx, float ry, float rz);
	void ScaleVertex(glm::vec3 &v, float sx, float sy, float sz);
	void TranslateVertex(glm::vec3 &v, float tx, float ty, float tz);
	bool LoadV2(FILE *f);
	bool LoadV2Deflated(FILE *f);

	string m_FileName;
	string m_ZoneFile;
	string m_ZoneName;
	int32 m_CellSize;

	float m_MinX;
	float m_MinZ;
	float m_MaxX;
	float m_MaxZ;

	struct impl;
	impl *imp;
	bool mapLoaded;
	bool mapLoading;
	Mutex CheckMapMutex;
};

class MapRange {
public:
	MapRange();

	~MapRange();

	void Clear();
	
	void AddVersionRange(std::string zoneName);

	map<VersionRange*, Map*>::iterator FindVersionRange(int32 min_version, int32 max_version);
	map<VersionRange*, Map*>::iterator FindMapByVersion(int32 version);
	map<VersionRange*, Map*>::iterator GetRangeEnd() { return version_map.end(); }
private:
	std::map<VersionRange*, Map*> version_map;
	string name;
};

#endif
