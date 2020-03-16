#include "ChestTrap.h"
#include <vector>
#include <algorithm>    // std::random_shuffle

int32 ChestTrapList::Size() {

	MChestTrapList.readlock(__FUNCTION__, __LINE__);
	int32 size = chesttrap_list.size();
	MChestTrapList.releasereadlock(__FUNCTION__, __LINE__);
	return size;
}

void ChestTrapList::AddChestTrap(ChestTrap* trap) {
	if (trap->GetDBID() < 1)
		return;

	MChestTrapList.writelock(__FUNCTION__, __LINE__);
	if (chesttrap_list.count(trap->GetDBID()) > 0)
	{
		ChestTrap* tmpTrap = chesttrap_list[trap->GetDBID()];
		chesttrap_list.erase(trap->GetDBID());
		safe_delete(tmpTrap);
	}

	chesttrap_list[trap->GetDBID()] = trap;
	MChestTrapList.releasewritelock(__FUNCTION__, __LINE__);
}

ChestTrap::ChestTrapInfo ChestTrapList::GetChestTrap(int32 id) {
	ChestTrap* res = 0;
	MChestTrapList.readlock(__FUNCTION__, __LINE__);
	if (chesttrap_list.count(id) > 0)
		res = chesttrap_list[id];

	ChestTrap::ChestTrapInfo cti;
	memset(&cti, 0, sizeof(ChestTrap::ChestTrapInfo));
	if (res)
		memcpy(&cti, &res->GetChestTrapInfo(), sizeof(ChestTrap::ChestTrapInfo));
	MChestTrapList.releasereadlock(__FUNCTION__, __LINE__);

	return cti;
}

ChestTrap::ChestTrapInfo ChestTrapList::GetNextTrap(int32 zoneid, int32 chest_difficulty)
{
	MChestListsInUse.writelock(__FUNCTION__, __LINE__);
	ChestTrapList* zoneTrapList = GetChestListByZone(zoneid);
	ChestTrapList* zoneDifficultyTrapList = zoneTrapList->GetChestListByDifficulty(chest_difficulty);

	ChestTrap::ChestTrapInfo nextTrap = zoneTrapList->GetNextChestTrap();
	MChestListsInUse.releasewritelock(__FUNCTION__, __LINE__);

	return nextTrap;
}

void ChestTrapList::Clear() {
	MChestListsInUse.writelock(__FUNCTION__, __LINE__);
	ClearTraps();
	ClearTrapList();
	MChestListsInUse.releasewritelock(__FUNCTION__, __LINE__);
}

ChestTrap::ChestTrapInfo ChestTrapList::GetNextChestTrap() {
	MChestTrapList.readlock(__FUNCTION__, __LINE__);
	if (cycleItr == chesttrap_list.end())
	{
		MChestTrapList.releasereadlock(__FUNCTION__, __LINE__);
		//re-shuffle the map, we reached the end
		shuffleMap(this);
	}
	else
		MChestTrapList.releasereadlock(__FUNCTION__, __LINE__);

	MChestTrapList.writelock(__FUNCTION__, __LINE__);
	ChestTrap* trap = cycleItr->second;

	ChestTrap::ChestTrapInfo cti;
	memset(&cti, 0, sizeof(ChestTrap::ChestTrapInfo));
	if (trap)
		memcpy(&cti, &trap->GetChestTrapInfo(), sizeof(ChestTrap::ChestTrapInfo));

	cycleItr++;
	MChestTrapList.releasewritelock(__FUNCTION__, __LINE__);

	return cti;
}

ChestTrapList* ChestTrapList::GetChestListByDifficulty(int32 difficulty) {
	ChestTrapList* usedList = GetChestTrapList(ChestTrapBaseList::DIFFICULTY);
	if (usedList && usedList->IsListLoaded())
		return usedList;
	else if (!usedList)
		return NULL;

	MChestTrapList.writelock(__FUNCTION__, __LINE__);
	map<int32, ChestTrap*>::iterator itr;
	for (itr = chesttrap_list.begin(); itr != chesttrap_list.end(); itr++) {
		ChestTrap* curTrap = itr->second;
		if ((curTrap->GetMinChestDifficulty() <= difficulty && difficulty <= curTrap->GetMaxChestDifficulty()) ||
			(curTrap->GetMinChestDifficulty() == 0 && curTrap->GetMaxChestDifficulty() == 0))
			usedList->AddChestTrap(curTrap);
	}

	shuffleMap(usedList);
	usedList->SetListLoaded(true);

	MChestTrapList.releasewritelock(__FUNCTION__, __LINE__);

	return usedList;
}

ChestTrapList* ChestTrapList::GetChestListByZone(int32 zoneid) {
	ChestTrapList* usedList = GetChestTrapList(ChestTrapBaseList::ZONE);
	if (usedList && usedList->IsListLoaded())
		return usedList;
	else if (!usedList)
		return NULL;

	MChestTrapList.writelock(__FUNCTION__, __LINE__);
	map<int32, ChestTrap*>::iterator itr;
	for (itr = chesttrap_list.begin(); itr != chesttrap_list.end(); itr++) {
		ChestTrap* curTrap = itr->second;
		if (curTrap->GetApplicableZoneID() == zoneid || curTrap->GetApplicableZoneID() == -1)
			usedList->AddChestTrap(curTrap);
	}

	shuffleMap(usedList);
	usedList->SetListLoaded(true);

	MChestTrapList.releasewritelock(__FUNCTION__, __LINE__);

	return usedList;
}

map<int32, ChestTrap*>* ChestTrapList::GetAllChestTraps() { return &chesttrap_list; }
bool	ChestTrapList::IsListLoaded() { return ListLoaded; }
void	ChestTrapList::SetListLoaded(bool val) { ListLoaded = val; }

ChestTrapList* ChestTrapList::GetChestTrapList(ChestTrapBaseList listName) {
	ChestTrapList* ctl = 0;
	MChestTrapInnerList.readlock(__FUNCTION__, __LINE__);
	if (chesttrap_innerlist.count(listName) > 0)
		ctl = chesttrap_innerlist[listName];
	MChestTrapInnerList.releasereadlock(__FUNCTION__, __LINE__);

	return ctl;
}

void ChestTrapList::ClearTraps() {
	MChestTrapList.writelock(__FUNCTION__, __LINE__);
	map<int32, ChestTrap*>::iterator itr;
	for (itr = chesttrap_list.begin(); itr != chesttrap_list.end(); itr++)
		safe_delete(itr->second);
	chesttrap_list.clear();
	MChestTrapList.releasewritelock(__FUNCTION__, __LINE__);
}

void ChestTrapList::ClearTrapList() {
	MChestTrapInnerList.writelock(__FUNCTION__, __LINE__);
	map<int32, ChestTrapList*>::iterator itr2;
	for (itr2 = chesttrap_innerlist.begin(); itr2 != chesttrap_innerlist.end(); itr2++)
		safe_delete(itr2->second);
	chesttrap_innerlist.clear();
	MChestTrapInnerList.releasewritelock(__FUNCTION__, __LINE__);

	// reinstantiate the base lists (zone/difficulty/etc)
	InstantiateLists(ChestTrapParent);
}

void ChestTrapList::SetupMutexes()
{
	MChestTrapList.SetName("ChestTrapList");
	MChestTrapInnerList.SetName("MChestTrapInnerList");
	MChestListsInUse.SetName("MChestListsInUse");
}

void ChestTrapList::InstantiateLists(bool parent)
{
	difficultyList = new ChestTrapList(parent);
	zoneList = new ChestTrapList(parent);
	MChestTrapInnerList.writelock(__FUNCTION__, __LINE__);
	chesttrap_innerlist[ChestTrapBaseList::DIFFICULTY] = difficultyList;
	chesttrap_innerlist[ChestTrapBaseList::ZONE] = zoneList;
	MChestTrapInnerList.releasewritelock(__FUNCTION__, __LINE__);
}

void ChestTrapList::shuffleMap(ChestTrapList* list) {
	std::vector<ChestTrap*> tmp_chests;

	map<int32, ChestTrap*>::iterator itr;
	for (itr = chesttrap_list.begin(); itr != chesttrap_list.end(); itr++) {
		ChestTrap* curTrap = itr->second;
		tmp_chests.push_back(curTrap);
	}

	std::random_shuffle(tmp_chests.begin(), tmp_chests.end());

	chesttrap_list.clear();

	int count = 0;

	for (std::vector<ChestTrap*>::iterator it = tmp_chests.begin(); it != tmp_chests.end(); ++it)
	{
		chesttrap_list[count] = *it;
		count++;
	}

	cycleItr = chesttrap_list.begin();
}
