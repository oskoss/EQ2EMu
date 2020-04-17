### ***Included Software and Versions***
Included Software and Versions
MariaDB(mysql) 	   -- 10.4.12 (https://downloads.mariadb.org/)
Unrar         	   -- 5.90    (https://www.rarlab.com/)
Wget(windows)	   -- 1.20.3  (https://eternallybored.org/misc/wget/)
Zeklabs.com EQ2emu -- Git Live (http://cutpon.com:3000/devn00b/EQ2EMu)

The default password for MYSQL root user is blank (Localhost only).
The user/password for Login and Mysql is eq2emu/eq2emu.

** Please note that this version of the EQ2Emulator CAN NOT connect to the main EQ2EMu login server. This is due to our updated encryption method
EQ2EMu currently uses MD5 (Weak) and we use SHA512 (Quite Strong). We are working to bring the main EQ2EMu project uptodate in this regard.**

###Configuration Options.

### 	***Server Update Options***:
	In file launch.bat you will find the following options (All Default 1): 
	SQLUPDATE  - Update the database (1 on 0 off). *** THIS WILL ERASE ALL CHARACTERS ***
	EXEUPDATE  - Update the Loginserver/Worldserver to the most recent build (1 on 0 off).
        LUAUPDATE  - Update the LUA Scripts (1 on 0 off).
	MAPUPDATE  - Update the 3d Maps/Navmesh (1 on 0 off).

### 	***Server Options***:
	In LoginServer.ini You can set your server name Worldname=<Your Server Name>. Default Login Server Username/Password is eq2emu/eq2emu.

### 	***Mysql Options (Optional)***:
	In file my-large.ini(mariadb\bin\ directory), Set thread_concurrency =  to number of cpu's * 2. So if you have 8cores set it to 16. The
	default is thread_concurrency = 2 (4 cores).

###Options File.
	
	Inside the server directory (Default C:\EQ2EMu-Zeklabs) there is a file called options running it will give you the following choices

	1) Update SQL.  (SAME AS SQLUPDATE=1)
	2) Update LUA.  (SAME AS LUAUPDATE=1
	3) Update EXEs. (SAME AS EXEUPDATE=1)
	4) Update MAPs. (SAME AS MAPUPDATE=1)
	5) Update Startup Script. (This will update LAUNCH EQ2EMU.bat)
	6) Full Rebuild (update DB/LUA/SQL/MAPS after delete. This will take a long time).











MariaDB(mysql) -- 10.4.12 (https://downloads.mariadb.org/)

Unrar          -- 5.90    (https://www.rarlab.com/rar/unrarw32.exe)

Wget(windows)  -- 1.20.3  (https://eternallybored.org/misc/wget/)

Zeklabs EQ2emu -- Git Live (http://cutpon.com:3000/devn00b/EQ2EMu)

The default password for MYSQL root user is blank (Localhost only).
The user/password for Login and Mysql is eq2emu/eq2emu.


    In file launch.bat If you want to update (You will lose all data) leave SET SQLUDATE=1.
    If you DO NOT want to download the most recent db set SET UDATE=0.
	If you do not wish to update your EXE at launch Set SET EXEUDATE=0. Default is to update at launch (SET EXEUDATE=1).


	In LoginServer.ini You can set your server name Worldname=<Your Server Name>.Default Login Server Username/Password is eq2emu/eq2emu.


	In file my-large.ini(mariadb\bin\ directory), Set thread_concurrency =  to number of cpu's * 2. So if you have 8cores set it to 16.
    The	default is thread_concurrency = 2 (4 cores).

	

