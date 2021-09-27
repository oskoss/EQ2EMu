/*
EQ2Emulator:  Everquest II Server Emulator
Copyright (C) 2007  EQ2EMulator Development Team (http://www.eq2emulator.net)

This file is part of EQ2Emulator.
EQ2Emulator is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

EQ2Emulator is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with EQ2Emulator.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once

#include <vector>
#include <map>
#include "../../common/types.h"
#include <cmath>

class Spawn;

#define CELLSIZEDEFAULT 30
#define FACECELLSIZEDEFAULT 15

struct Face {
	float Vertex1[3];
	float Vertex2[3];
	float Vertex3[3];
	int32 grid_id;
};

/*struct GridBounds {
	int32 Grid;
	float MinBounds[3];
	float MaxBounds[3];
};*/

struct Cell {
	std::vector<Spawn*> SpawnList;
	//std::map<int32, vector<Face*> > FaceList;
	//std::map<int32, GridBounds*> GridBounds;
};

struct FaceCell {
	std::map<int32, vector<Face*> > FaceList;
};

class SPGrid {
public:
	SPGrid(string file, int32 cellSize);
	~SPGrid();

	// Sets up the spacial partioning grid
	bool Init();

	// Adds a face to the cells it needs to be in and sets its GridID
	void AddFace(Face* face, int32 grid);

	// Checks the faces below the given spawn to determine the GridID
	int32 GetGridID(Spawn* spawn);
	int32 GetGridIDByLocation(float x, float y, float z);

	// Get cell based on cell coordinates
	FaceCell* GetFaceCell(int32 x, int32 z);

	// Get cell based on world coordinates
	FaceCell* GetFaceCell(float x, float z);

	float GetBestY(float x, float y, float z);
	Face* GetClosestFace(float x, float y, float z);
	Face* FindPath(float x, float y, float z, float targX, float targY, float targZ, bool forceEndCell=false);

	void InitValues(float minX, float maxX, float minZ, float maxZ, int32 numCellsX, int32 numCellsZ)
	{
		m_MinX = minX;
		m_MaxX = maxX;
		m_MinZ = minZ;
		m_MaxZ = maxZ;
		m_NumCellsX = numCellsX;
		m_NumCellsZ = numCellsZ;

		float width = m_MaxX - m_MinX;
		float height = m_MaxZ - m_MinZ;

		m_NumFaceCellsX = ceil(width / CELLSIZEDEFAULT);
		m_NumFaceCellsZ = ceil(height / CELLSIZEDEFAULT);
		m_FaceCells.resize(m_NumFaceCellsX * m_NumFaceCellsZ);
	}
private:
	std::vector<FaceCell> m_FaceCells;

	string m_ZoneFile;

	float m_MinX;
	float m_MinZ;
	float m_MaxX;
	float m_MaxZ;

	int32 m_NumCellsX;
	int32 m_NumCellsZ;

	int32 m_NumFaceCellsX;
	int32 m_NumFaceCellsZ;
};