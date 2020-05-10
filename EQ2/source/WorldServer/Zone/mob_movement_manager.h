#pragma once
#include <memory>
#include "../Entity.h"
#include "../../common/Mutex.h"
class Mob;
class Client;

struct RotateCommand;
struct MovementCommand;
struct MobMovementEntry;
struct PlayerPositionUpdateServer_Struct;

enum ClientRange : int
{
	ClientRangeNone = 0,
	ClientRangeClose = 1,
	ClientRangeMedium = 2,
	ClientRangeCloseMedium = 3,
	ClientRangeLong = 4,
	ClientRangeCloseLong = 5,
	ClientRangeMediumLong = 6,
	ClientRangeAny = 7
};

enum MobMovementMode : int
{
	MovementWalking = 0,
	MovementRunning = 1
};

enum MobStuckBehavior : int
{
	RunToTarget,
	WarpToTarget,
	TakeNoAction,
	EvadeCombat,
	MaxStuckBehavior
};

class MobMovementManager
{
public:
	~MobMovementManager();
	void Process();
	void AddMob(Spawn *mob);
	void RemoveMob(Spawn*mob);
	void AddClient(Client *client);
	void RemoveClient(Client *client);

	void RotateTo(Spawn *who, float to, MobMovementMode mob_movement_mode = MovementRunning);
	void Teleport(Spawn *who, float x, float y, float z, float heading);
	void NavigateTo(Spawn *who, float x, float y, float z, MobMovementMode mode = MovementRunning, bool overrideDistance=false);
	void StopNavigation(Spawn *who);
	void DisruptNavigation(Spawn *who);
	/*
	void SendCommandToClients(
		Entity *mob,
		float delta_x,
		float delta_y,
		float delta_z,
		float delta_heading,
		int anim,
		ClientRange range,
		Client* single_client = nullptr,
		Client* ignore_client = nullptr
	);*/

	float FixHeading(float in);
	void ClearStats();

	static MobMovementManager &Get() {
		static MobMovementManager inst;
		return inst;
	}

	MobMovementManager();
	bool IsRunningCommandProcess() {
		bool isRunning = false;
		MobListMutex.readlock();
		isRunning = RunningCommandProcess;
		MobListMutex.releasereadlock();
		return isRunning;
	}

	bool SetCommandProcess(bool status) {
		MobListMutex.writelock();
		RunningCommandProcess = status;
		MobListMutex.releasewritelock();
	}
private:
	MobMovementManager(const MobMovementManager&);
	MobMovementManager& operator=(const MobMovementManager&);

	void UpdatePath(Spawn *who, float x, float y, float z, MobMovementMode mob_movement_mode);
	void UpdatePathGround(Spawn *who, float x, float y, float z, MobMovementMode mode);
	void UpdatePathUnderwater(Spawn *who, float x, float y, float z, MobMovementMode movement_mode);
	void UpdatePathBoat(Spawn *who, float x, float y, float z, MobMovementMode mode);
	void PushTeleportTo(MobMovementEntry &ent, float x, float y, float z, float heading);
	void PushMoveTo(MobMovementEntry &ent, float x, float y, float z, MobMovementMode mob_movement_mode);
	void PushSwimTo(MobMovementEntry &ent, float x, float y, float z, MobMovementMode mob_movement_mode);
	void PushRotateTo(MobMovementEntry &ent, Spawn *who, float to, MobMovementMode mob_movement_mode);
	void PushStopMoving(MobMovementEntry &mob_movement_entry);
	void PushEvadeCombat(MobMovementEntry &mob_movement_entry);
	void HandleStuckBehavior(Spawn *who, float x, float y, float z, MobMovementMode mob_movement_mode);

	struct Implementation;
	std::unique_ptr<Implementation> _impl;
	Mutex MobListMutex;
	bool RunningCommandProcess;
};
