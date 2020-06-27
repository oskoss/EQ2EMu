/*  
	EQ2Emulator:  Everquest II Server Emulator
	Copyright (C) 2007  EQ2EMulator Development Team (http://www.eq2emulator.net)

	This file is part of EQ2Emulator.
*/
#include "../common/debug.h"

#include <iostream>
#include <string.h>
#include <time.h>
#include <signal.h>

#include "../common/queue.h"
#include "../common/timer.h"

#include "../common/seperator.h"

#include "net.h"
#include "client.h"

#include "LoginDatabase.h"
#include "LWorld.h"
#include "../common/packet_functions.h"
#include "../common/EQStreamFactory.h"
#include "../common/MiscFunctions.h"
#include "../common/version.h"

#include "../common/PacketStruct.h"
#include "../common/DataBuffer.h"
#include "../common/ConfigReader.h"
#include "../common/Log.h"

#ifdef WIN32
	#define snprintf	_snprintf
	#define vsnprintf	_vsnprintf
	#define strncasecmp	_strnicmp
	#define strcasecmp  _stricmp
	#include <conio.h>
#else
	#include <stdlib.h>
	#include "../common/unix.h"
#endif
EQStreamFactory eqsf(LoginStream);
map<int16,OpcodeManager*>EQOpcodeManager;
//TCPServer eqns(5999);
NetConnection net;
ClientList client_list;
LWorldList world_list;
LoginDatabase database;
ConfigReader configReader;
map<int16, int16> EQOpcodeVersions;
Timer statTimer(60000);

volatile bool RunLoops = true;
bool ReadLoginConfig();

#ifdef PUBLICLOGIN
char version[200], consoletitle[200];
#endif
#include "../common/timer.h"

#include "../common/CRC16.h"
#include <fstream>

int main(int argc, char** argv){
#ifdef _DEBUG
	_CrtSetDbgFlag( _CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF);
#endif
	if (signal(SIGINT, CatchSignal) == SIG_ERR) {
		cerr << "Could not set signal handler" << endl;
	}

	LogStart();

	LogParseConfigs();
	net.WelcomeHeader();

	srand(time(NULL));

	if(!net.ReadLoginConfig())
		return 1;

	const char* structList[] = { "CommonStructs.xml", "LoginStructs.xml" };

	for (int s = 0; s < sizeof(structList) / sizeof(const char*); s++)
	{
		LogWrite(INIT__INFO, 0, "Init", "Loading Structs File %s..", structList[s]);
		if (configReader.processXML_Elements(structList[s]))
			LogWrite(INIT__INFO, 0, "Init", "Loading Structs File %s completed..", structList[s]);
		else
		{
			LogWrite(INIT__ERROR, 0, "Init", "Loading Structs File %s FAILED!", structList[s]);
			return 1;
		}
	}
	

	LogWrite(INIT__INFO, 0, "Init", "Initialize World List..");
	world_list.Init();
	
	if(eqsf.listen_ip_address)
		LogWrite(INIT__INFO, 0, "Init", "Login server listening on %s port %i", eqsf.listen_ip_address, net.GetPort());
	else
		LogWrite(INIT__INFO, 0, "Init", "Login server listening on port %i", net.GetPort());
	/*}
	else {
		cout << "EQNetworkServer.Open() error" << endl;
		return 1;
	}*/
	if (!eqsf.Open(net.GetPort())) {
		LogWrite(INIT__ERROR, 0, "Init", "Failed to open port %i.", net.GetPort());
		return 1;
	}
	net.UpdateWindowTitle();
	EQStream* eqs;
	Timer* TimeoutTimer = new Timer(5000);
	TimeoutTimer->Start();
	while(RunLoops) {
		Timer::SetCurrentTime();
		while ((eqs = eqsf.Pop())) {
			struct in_addr	in;
			in.s_addr = eqs->GetRemoteIP();

			LogWrite(LOGIN__INFO, 0, "Login", "New client from IP: %s on port %i", inet_ntoa(in), ntohs(eqs->GetRemotePort()));
			Client* client = new Client(eqs);
			eqs->SetClientVersion(0);
			client_list.Add(client);
			net.numclients++;
			net.UpdateWindowTitle();
		}
		if(TimeoutTimer->Check()){
			eqsf.CheckTimeout();
		}
		if(statTimer.Check()){
			world_list.UpdateWorldStats();
			database.RemoveOldWorldServerStats();
			database.FixBugReport();
		}
		client_list.Process();
		world_list.Process();
#ifdef WIN32
		if(kbhit())
		{
			int hitkey = getch();
			net.HitKey(hitkey);
		}
#endif
		Sleep(1);
	}
	//close
	//eqns.Close();
	eqsf.Close();
	world_list.Shutdown();
	return 0;
}
#ifdef WIN32
void NetConnection::HitKey(int keyhit)
{
	switch(keyhit)
	{
	case 'l':
	case 'L': {
		world_list.ListWorldsToConsole();
		break;
	}
	case 'v':
	case 'V':
	{
		printf("========Version Info=========\n");
		printf("%s %s\n", EQ2EMU_MODULE, CURRENT_VERSION);
		printf("Last Compiled on %s %s\n", COMPILE_DATE, COMPILE_TIME);
		printf("=============================\n\n");
		break;
	}
	case 'H':
	case 'h': {
		printf("===========Help=============\n");
		printf("Available Commands:\n");
		printf("l = Listing of World Servers\n");
		printf("v = Login Version\n");
//		printf("0 = Kick all connected world servers\n");
		printf("============================\n\n");
		break;
	}
	default:
		printf("Invalid Command.\n");
		break;
	}
}
#endif
	
void CatchSignal(int sig_num) {
	cout << "Got signal " << sig_num << endl;
	RunLoops = false;
}

bool NetConnection::ReadLoginConfig() {
	char buf[201], type[201];
	int8 items[5] = {0, 0, 0, 0, 0};
	FILE *f;

	char* lsInfoFile = { "LoginServer.ini" };

	if (!(f = fopen (lsInfoFile, "r"))) {
		LogWrite(INIT__ERROR, 0, "Init", "File %s could not be found..", lsInfoFile);
		return false;
	}
	do {
		fgets (buf, 200, f);
		if (feof (f))
		{
			LogWrite(INIT__ERROR, 0, "Init", "[LoginConfig] block from %s missing..", lsInfoFile);
			fclose (f);
			return false;
		}
	}
	while (strncasecmp (buf, "[LoginConfig]\n", 14) != 0 && strncasecmp (buf, "[LoginConfig]\r\n", 15) != 0);

	while (!feof (f))
	{
#ifdef WIN32
		if (fscanf (f, "%[^=]=%[^\n]\r\n", type, buf) == 2)
#else
		if (fscanf (f, "%[^=]=%[^\r\n]\n", type, buf) == 2)
#endif
		{
			items[0] = 1;
			LoginMode = Standalone;
			items[1] = 1;
			items[2] = 1;
			items[3] = 1;
			if (!strncasecmp(type, "[", 1)) {
				// new block after LoginConfig, skip
				break;
			}
			if (!strncasecmp(type, "serverport", 10)) {
				if (Seperator::IsNumber(buf) && atoi(buf) > 0 && atoi(buf) < 0xFFFF) {
					port = atoi(buf);
				}
			}
			if (!strncasecmp(type, "serverip", 8)) {
				eqsf.listen_ip_address = new char[sizeof(buf) + 1];
				strcpy(eqsf.listen_ip_address, buf);
			}
			if (!strncasecmp(type, "accountcreation", 15)) {
				if (Seperator::IsNumber(buf)) {
					allowAccountCreation = atoi(buf);
				}
			}
		}
	}

	fclose (f);
	if (!items[0] || (LoginMode == Slave && !(items[1] && items[2] && items[3])) || (items[4] && !(items[2] && items[3])))
	{
		LogWrite(INIT__ERROR, 0, "Init", "Incomplete %s..", lsInfoFile);
		return false;
	}
	LogWrite(INIT__INFO, 0, "Init", "%s loaded..", lsInfoFile);


	LogWrite(INIT__INFO, 0, "Init", "Database init begin..");
	//remove this when all database calls are using the new database class
	if (!database.Init()) {
		LogWrite(INIT__ERROR, 0, "Init", "Database init FAILED!");
		LogStop();
		return false;
	}

	LogWrite(INIT__INFO, 0, "Init", "Loading opcodes 2.0..");
	EQOpcodeVersions = database.GetVersions();
	map<int16,int16>::iterator version_itr2;
	int16 version1 = 0;
	for (version_itr2 = EQOpcodeVersions.begin(); version_itr2 != EQOpcodeVersions.end(); version_itr2++) {
		version1 = version_itr2->first;
		EQOpcodeManager[version1] = new RegularOpcodeManager();
		map<string, uint16> eq = database.GetOpcodes(version1);
		if(!EQOpcodeManager[version1]->LoadOpcodes(&eq)) {
			LogWrite(INIT__ERROR, 0, "Init", "Loading opcodes failed. Make sure you have sourced the opcodes.sql file!");
			return false;
		}
	}

	return true;
}

void NetConnection::UpdateWindowTitle(char* iNewTitle) {
#ifdef WIN32
	char tmp[500];
	if (iNewTitle) {
		snprintf(tmp, sizeof(tmp), "Login: %s", iNewTitle);
	}
	else {
		snprintf(tmp, sizeof(tmp), "%s, Version: %s: %i Server(s), %i Client(s) Connected", EQ2EMU_MODULE, CURRENT_VERSION, net.numservers, net.numclients);
	}
	SetConsoleTitle(tmp);
#endif
}

void NetConnection::WelcomeHeader()
{
#ifdef _WIN32
	HANDLE console = GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleTextAttribute(console, FOREGROUND_WHITE_BOLD);
#endif
	printf("Module: %s, Version: %s", EQ2EMU_MODULE, CURRENT_VERSION);
#ifdef _WIN32
	SetConsoleTextAttribute(console, FOREGROUND_YELLOW_BOLD);
#endif
	printf("\n\nCopyright (C) 2007-2020 EQ2Emulator. https://www.eq2emu.com \n\n");
	printf("EQ2Emulator is free software: you can redistribute it and/or modify\n");
	printf("it under the terms of the GNU General Public License as published by\n");
	printf("the Free Software Foundation, either version 3 of the License, or\n");
	printf("(at your option) any later version.\n\n");
	printf("EQ2Emulator is distributed in the hope that it will be useful,\n");
	printf("but WITHOUT ANY WARRANTY; without even the implied warranty of\n");
	printf("MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n");
	printf("GNU General Public License for more details.\n\n");
#ifdef _WIN32
	SetConsoleTextAttribute(console, FOREGROUND_GREEN_BOLD);
#endif
	printf(" /$$$$$$$$  /$$$$$$   /$$$$$$  /$$$$$$$$                        \n");
	printf("| $$_____/ /$$__  $$ /$$__  $$| $$_____/                        \n");
	printf("| $$      | $$  \\ $$|__/  \\ $$| $$       /$$$$$$/$$$$  /$$   /$$\n");
	printf("| $$$$$   | $$  | $$  /$$$$$$/| $$$$$   | $$_  $$_  $$| $$  | $$\n");
	printf("| $$__/   | $$  | $$ /$$____/ | $$__/   | $$ \\ $$ \\ $$| $$  | $$\n");
	printf("| $$      | $$/$$ $$| $$      | $$      | $$ | $$ | $$| $$  | $$\n");
	printf("| $$$$$$$$|  $$$$$$/| $$$$$$$$| $$$$$$$$| $$ | $$ | $$|  $$$$$$/\n");
	printf("|________/ \\____ $$$|________/|________/|__/ |__/ |__/ \\______/ \n");
	printf("                \\__/                                            \n\n");
#ifdef _WIN32
	SetConsoleTextAttribute(console, FOREGROUND_MAGENTA_BOLD);
#endif
	printf(" Website     : https://eq2emu.com \n");
	printf(" Wiki        : http://eq2emu.com:3001/ \n");
	printf(" Git         : http://git.eq2emu.com \n");
	printf(" Discord     : https://discord.gg/j92Ay9H \n\n");
#ifdef _WIN32
	SetConsoleTextAttribute(console, FOREGROUND_WHITE_BOLD);
#endif
	printf("For more detailed logging, modify 'Level' param the log_config.xml file.\n\n");
#ifdef _WIN32
	SetConsoleTextAttribute(console, FOREGROUND_WHITE);
#endif

	fflush(stdout);
}
