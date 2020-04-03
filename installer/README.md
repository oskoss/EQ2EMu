### ***Included Software and Versions***
MariaDB(mysql) -- 10.4.12 (https://downloads.mariadb.org/)
Unrar          -- 5.90    (https://www.rarlab.com/rar/unrarw32.exe)
Wget(windows)  -- 1.20.3  (https://eternallybored.org/misc/wget/)
Zeklabs EQ2emu -- Git Live (http://cutpon.com:3000/devn00b/EQ2EMu)

The default password for MYSQL root user is blank (Localhost only).
The user/password for Login and Mysql is eq2emu/eq2emu.

### ***Configuration Options.***

### 	***Server Update Options***:
    In file launch.bat If you want to update (You will lose all data) leave SET SQLUDATE=1. If you DO NOT want to     download the most recent db set SET UDATE=0.

	If you do not wish to update your EXE at launch Set SET EXEUDATE=0. Default is to update at launch (SET EXEUDATE=1).

### 	***Server Options***:
	In LoginServer.ini You can set your server name Worldname=<Your Server Name>. Default Login Server Username/Password is eq2emu/eq2emu.

### 	***Mysql Options (Optional)***:
	In file my-large.ini(mariadb\bin\ directory), Set thread_concurrency =  to number of cpu's * 2. So if you have 8cores set it to 16. The
	default is thread_concurrency = 2 (4 cores).

	

