#include "map.h"
#include "raycast_mesh.h"
#include "../../common/Log.h"

#ifdef WIN32
#include <WinSock2.h>
#include <windows.h>
#endif

#include <algorithm>
#include <map>
#include <memory>
#include <tuple>
#include <vector>
#include <fstream>

struct Map::impl
{
	RaycastMesh *rm;
};


ThreadReturnType LoadMapAsync(void* mapToLoad)
{
	Map* map = (Map*)mapToLoad;
	map->SetMapLoaded(false);

	std::string filename = "Maps/";
	filename += map->GetFileName();
	filename += ".EQ2Map";

	if (map->Load(filename))
		map->SetMapLoaded(true);

	map->SetMapLoading(false);
	THREAD_RETURN(NULL);
}

Map::Map(string file, SPGrid* grid) {
	CheckMapMutex.SetName(file + "MapMutex");
	SetMapLoaded(false);
	m_ZoneFile = file;
	imp = nullptr;
	mGrid = grid;
	m_CellSize = CELLSIZEDEFAULT;
}

Map::~Map() {
	SetMapLoaded(false);
	if(imp) {
		imp->rm->release();
		safe_delete(imp);
	}
}

float Map::FindBestZ(glm::vec3 &start, glm::vec3 *result)
{
	if (!IsMapLoaded())
		return BEST_Z_INVALID;
	if (!imp)
		return BEST_Z_INVALID;

	glm::vec3 tmp;
	if(!result)
		result = &tmp;

	start.z += 1.0f;//RuleI(Map, FindBestZHeightAdjust);
	glm::vec3 from(start.x, start.y, start.z);
	glm::vec3 to(start.x, start.y, BEST_Z_INVALID);
	float hit_distance;
	bool hit = false;

	hit = imp->rm->raycast((const RmReal*)&from, (const RmReal*)&to, (RmReal*)result, nullptr, &hit_distance);
	if(hit) {
		return result->z;
	}
	
	// Find nearest Z above us
	
	to.z = -BEST_Z_INVALID;
	hit = imp->rm->raycast((const RmReal*)&from, (const RmReal*)&to, (RmReal*)result, nullptr, &hit_distance);
	if (hit)
	{
		return result->z;
	}
	
	return BEST_Z_INVALID;
}

float Map::FindClosestZ(glm::vec3 &start, glm::vec3 *result) {
	if (!IsMapLoaded())
		return false;
	// Unlike FindBestZ, this method finds the closest Z value above or below the specified point.
	//
	if (!imp)
		return false;
	
	float ClosestZ = BEST_Z_INVALID;
	
	glm::vec3 tmp;
	if (!result)
		result = &tmp;
	
	glm::vec3 from(start.x, start.y, start.z);
	glm::vec3 to(start.x, start.y, BEST_Z_INVALID);
	float hit_distance;
	bool hit = false;
	
	// first check is below us
	hit = imp->rm->raycast((const RmReal*)&from, (const RmReal*)&to, (RmReal*)result, nullptr, &hit_distance);
	if (hit) {
		ClosestZ = result->z;
		
	}
	
	// Find nearest Z above us
	to.z = -BEST_Z_INVALID;
	hit = imp->rm->raycast((const RmReal*)&from, (const RmReal*)&to, (RmReal*)result, nullptr, &hit_distance);
	if (hit) {
		if (std::abs(from.z - result->z) < std::abs(ClosestZ - from.z))
			return result->z;
	}

	return ClosestZ;
}

bool Map::LineIntersectsZone(glm::vec3 start, glm::vec3 end, float step, glm::vec3 *result) {
	if (!IsMapLoaded())
		return false;
	if(!imp)
		return false;
	return imp->rm->raycast((const RmReal*)&start, (const RmReal*)&end, (RmReal*)result, nullptr, nullptr);
}

bool Map::LineIntersectsZoneNoZLeaps(glm::vec3 start, glm::vec3 end, float step_mag, glm::vec3 *result) {
	if (!IsMapLoaded())
		return false;
	if (!imp)
		return false;
	
	float z = BEST_Z_INVALID;
	glm::vec3 step;
	glm::vec3 cur;
	cur.x = start.x;
	cur.y = start.y;
	cur.z = start.z;

	step.x = end.x - start.x;
	step.y = end.y - start.y;
	step.z = end.z - start.z;
	float factor = step_mag / sqrt(step.x*step.x + step.y*step.y + step.z*step.z);

	step.x *= factor;
	step.y *= factor;
	step.z *= factor;

	int steps = 0;

	if (step.x > 0 && step.x < 0.001f)
		step.x = 0.001f;
	if (step.y > 0 && step.y < 0.001f)
		step.y = 0.001f;
	if (step.z > 0 && step.z < 0.001f)
		step.z = 0.001f;
	if (step.x < 0 && step.x > -0.001f)
		step.x = -0.001f;
	if (step.y < 0 && step.y > -0.001f)
		step.y = -0.001f;
	if (step.z < 0 && step.z > -0.001f)
		step.z = -0.001f;

	//while we are not past end
	//always do this once, even if start == end.
	while(cur.x != end.x || cur.y != end.y || cur.z != end.z)
	{
		steps++;
		glm::vec3 me;
		me.x = cur.x;
		me.y = cur.y;
		me.z = cur.z;
		glm::vec3 hit;

		float best_z = FindBestZ(me, &hit);
		float diff = best_z - z;
		diff = diff < 0 ? -diff : diff;

		if (z <= BEST_Z_INVALID || best_z <= BEST_Z_INVALID || diff < 12.0)
			z = best_z;
		else
			return true;

		//look at current location
		if(LineIntersectsZone(start, end, step_mag, result))
		{
			return true;
		}

		//move 1 step
		if (cur.x != end.x)
			cur.x += step.x;
		if (cur.y != end.y)
			cur.y += step.y;
		if (cur.z != end.z)
			cur.z += step.z;

		//watch for end conditions
		if ( (cur.x > end.x && end.x >= start.x) || (cur.x < end.x && end.x <= start.x) || (step.x == 0) ) {
			cur.x = end.x;
		}
		if ( (cur.y > end.y && end.y >= start.y) || (cur.y < end.y && end.y <= start.y) || (step.y == 0) ) {
			cur.y = end.y;
		}
		if ( (cur.z > end.z && end.z >= start.z) || (cur.z < end.z && end.z < start.z) || (step.z == 0) ) {
			cur.z = end.z;
		}
	}

	//walked entire line and didnt run into anything...
	return false;
}

bool Map::CheckLoS(glm::vec3 myloc, glm::vec3 oloc)
{
	if (!IsMapLoaded())
		return false;
	if(!imp)
		return false;

	return !imp->rm->raycast((const RmReal*)&myloc, (const RmReal*)&oloc, nullptr, nullptr, nullptr);
}

// returns true if a collision happens
bool Map::DoCollisionCheck(glm::vec3 myloc, glm::vec3 oloc, glm::vec3 &outnorm, float &distance) {
	if (!IsMapLoaded())
		return false;
	if(!imp)
		return false;

	return imp->rm->raycast((const RmReal*)&myloc, (const RmReal*)&oloc, nullptr, (RmReal *)&outnorm, (RmReal *)&distance);
}

inline bool file_exists(const std::string& name) {
	std::ifstream f(name.c_str());
	return f.good();
}

Map *Map::LoadMapFile(std::string file, SPGrid* grid) {

	std::string filename = "Maps/";
	filename += file;
	filename += ".EQ2Map";

	LogWrite(MAP__INFO, 7, "Map", "Attempting to load Map File [{%s}]", filename.c_str());

	auto m = new Map(file, grid);
	m->SetMapLoading(true);
#ifdef WIN32
	_beginthread(LoadMapAsync, 0, (void*)m);
#else
	pthread_t t1;
	pthread_create(&t1, NULL, LoadMapAsync, (void*)m);
	pthread_detach(t1);
#endif

	return m;
}

/**
 * @param filename
 * @return
 */
bool Map::Load(const std::string &filename)
{
	FILE *map_file = fopen(filename.c_str(), "rb");
	if (map_file) {
		LogWrite(MAP__INFO, 7, "Map", "Loading Map File [{%s}]", filename.c_str());
		bool loaded_map_file = LoadV2(map_file);
		fclose(map_file);

			if (loaded_map_file) {
				LogWrite(MAP__INFO, 7, "Map", "Loaded Map File [{%s}]", filename.c_str());
			}
			else {
				LogWrite(MAP__ERROR, 7, "Map", "FAILED Loading Map File [{%s}]", filename.c_str());
			}
			return loaded_map_file;
		}
	else {
		return false;
	}

	return false;
}

struct ModelEntry
{
	struct Poly
	{
		uint32 v1, v2, v3;
		uint8 vis;
	};
	std::vector<glm::vec3> verts;
	std::vector<Poly> polys;
};

bool Map::LoadV2(FILE* f) {

	// Read the string for the zone file name this was created for
	int8 strSize;
	char name[256];
	fread(&strSize, sizeof(int8), 1, f);
	LogWrite(MAP__DEBUG, 0, "Map", "strSize = %u", strSize);

	size_t len = fread(&name, sizeof(char), strSize, f);
	name[len] = '\0';
	LogWrite(MAP__DEBUG, 0, "Map", "name = %s", name);

	string fileName(name);
	std::size_t found = fileName.find(m_ZoneFile);
	// Make sure file contents are for the correct zone
	if (found == std::string::npos) {
		fclose(f);
		LogWrite(MAP__ERROR, 0, "Map", "Map::LoadV2() map contents (%s) do not match its name (%s).", &name, m_ZoneFile.c_str());
		return false;
	}
	// Read the min bounds
	fread(&m_MinX, sizeof(float), 1, f);
	fread(&m_MinZ, sizeof(float), 1, f);

	// Read the max bounds
	fread(&m_MaxX, sizeof(float), 1, f);
	fread(&m_MaxZ, sizeof(float), 1, f);

	// Calculate how many cells we need
	// in both the X and Z direction
	float width = m_MaxX - m_MinX;
	float height = m_MaxZ - m_MinZ;
	m_NumCellsX = ceil(width / m_CellSize);
	m_NumCellsZ = ceil(height / m_CellSize);

	if (mGrid != nullptr)
		mGrid->InitValues(m_MinX, m_MaxX, m_MinZ, m_MaxZ, m_NumCellsX, m_NumCellsZ);

	// Read the number of grids
	int32 NumGrids;
	fread(&NumGrids, sizeof(int32), 1, f);

	std::vector<glm::vec3> verts;
	std::vector<uint32> indices;

	uint32 face_count = 0;
	// Loop through the grids loading the face list
	for (int32 i = 0; i < NumGrids; i++) {
		// Read the grid id
		int32 GridID;
		fread(&GridID, sizeof(int32), 1, f);

		// Read the number of vertices
		int32 NumFaces;
		fread(&NumFaces, sizeof(int32), 1, f);

		face_count += NumFaces;
		// Loop through the vertices list reading
		// 3 at a time to creat a triangle (face)
		for (int32 y = 0; y < NumFaces; ) {
			// Each vertex need an x,y,z coordinate and 
// we will be reading 3 to create the face
			float x1, x2, x3;
			float y1, y2, y3;
			float z1, z2, z3;

			// Read the first vertex
			fread(&x1, sizeof(float), 1, f);
			fread(&y1, sizeof(float), 1, f);
			fread(&z1, sizeof(float), 1, f);
			y++;

			// Read the second vertex
			fread(&x2, sizeof(float), 1, f);
			fread(&y2, sizeof(float), 1, f);
			fread(&z2, sizeof(float), 1, f);
			y++;

			// Read the third (final) vertex
			fread(&x3, sizeof(float), 1, f);
			fread(&y3, sizeof(float), 1, f);
			fread(&z3, sizeof(float), 1, f);
			y++;

			glm::vec3 a(x1, z1, y1);
			glm::vec3 b(x2, z2, y2);
			glm::vec3 c(x3, z3, y3);

			size_t sz = verts.size();
			verts.push_back(a);
			indices.push_back((uint32)sz);

			verts.push_back(b);
			indices.push_back((uint32)sz + 1);

			verts.push_back(c);
			indices.push_back((uint32)sz + 2);

			if (mGrid != nullptr)
			{
				Face* face = new Face;
				face->Vertex1[0] = x1;
				face->Vertex1[1] = y1;
				face->Vertex1[2] = z1;

				face->Vertex2[0] = x2;
				face->Vertex2[1] = y2;
				face->Vertex2[2] = z2;

				face->Vertex3[0] = x3;
				face->Vertex3[1] = y3;
				face->Vertex3[2] = z3;

				mGrid->AddFace(face, GridID);
			}
		}
	}
	face_count = face_count / 3;

	if (imp) {
		imp->rm->release();
		imp->rm = nullptr;
	}
	else {
		imp = new impl;
	}

	imp->rm = createRaycastMesh((RmUint32)verts.size(), (const RmReal*)&verts[0], face_count, &indices[0]);

	if (!imp->rm) {
		delete imp;
		imp = nullptr;
		return false;
	}

	return true;
}


void Map::RotateVertex(glm::vec3 &v, float rx, float ry, float rz) {
	glm::vec3 nv = v;

	nv.y = (std::cos(rx) * v.y) - (std::sin(rx) * v.z);
	nv.z = (std::sin(rx) * v.y) + (std::cos(rx) * v.z);

	v = nv;

	nv.x = (std::cos(ry) * v.x) + (std::sin(ry) * v.z);
	nv.z = -(std::sin(ry) * v.x) + (std::cos(ry) * v.z);

	v = nv;

	nv.x = (std::cos(rz) * v.x) - (std::sin(rz) * v.y);
	nv.y = (std::sin(rz) * v.x) + (std::cos(rz) * v.y);

	v = nv;
}

void Map::ScaleVertex(glm::vec3 &v, float sx, float sy, float sz) {
	v.x = v.x * sx;
	v.y = v.y * sy;
	v.z = v.z * sz;
}

void Map::TranslateVertex(glm::vec3 &v, float tx, float ty, float tz) {
	v.x = v.x + tx;
	v.y = v.y + ty;
	v.z = v.z + tz;
}