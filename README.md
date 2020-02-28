# EQ2Emulator Project

Based on https://www.eq2emulator.net/ visit https://www.eqpvp.com/ or https://www.zeklabs.com/ for more details

## Getting Started (Client)

1. Install Game: Install AoM client available on Steam: https://store.steampowered.com/app/201230/EverQuest_II/

2. Update Login Server: Navigate to EverQuest install directory, eg. C:\Steam\steamapps\common\EverQuest 2

   a. Open eq2_default.ini with your Notepad or other flavor editor

   b. Replace first line with 'cl_ls_address a.b.c.d' - where a.b.c.d is one or many IPv4 addresses
      eg. cl_ls_address 192.168.0.2

   c. Save Changes

   d. Always Open EverQuest2.exe to start the game, **DO NOT USE EQ2.EXE**

   e. Splash login account / name is one provided by Login Server or otherwise created in 'Getting Started (Server)' Step 4 below.

## Getting Started (Server)

Note: These instructions for now will be primarily based in Windows, but any Linux savvy individual should be able to translate the steps

1. Software Requirement: MariaDB (MySQL DB, etc.) to allow EQ2Emulator LoginServer / WorldServer to interface

  Obtain Latest Install (be sure to select OS on the right hand side as default will be a linux distro): https://mariadb.com/downloads/

  Installation Instructions for MariaDB can be found here: https://mariadb.com/kb/en/installing-mariadb-msi-packages-on-windows/

  Note: Be sure to remember the user and password defined in the installation!!  Used in later steps.

2. Open MySQL Client: Login using the password (assigned to root or other default user) setup in the MariaDB installation.

3. Source in Databases: Issue the following commands to setup EQ2Emulator's databases for login (eq2ls) and world (eq2emu).

   a. You must first go into source C:\[YOUREQ2EMUGITSRC]\DB\ and extract world_db.zip 'Here' into the same \DB\ directory.

   b. Run the following commands in the MySQL Client prompt:

  create database eq2ls;
  create database eq2emu;
  \u eq2ls
  source C:\[YOUREQ2EMUGITSRC]\DB\ls_db.sql
  \u eq2emu
  source C:\[YOUREQ2EMUGITSRC]\DB\world_db.sql


4. Add Game Account / World Account: Using the same MySQL Client, continue on creating your accounts

Game Login Account:

insert into account set name='test',passwd=md5('test');

World Login Account (LoginServer.ini):

insert into login_worldservers set name='TestLabs',account='testlabs',description='TestLabs',password=md5('testpass'),login_version='0.7.3-dev';


5. Open the C:\[YOUREQ2EMUGITSRC]\server\LoginServer.ini file (Notepad or other flavor editor)

   Note: Steps to find your LAN IP (command prompt, ipconfig, IPv4 address): https://www.lifewire.com/ip-config-818377

   Find your WAN (Internet) IP: https://www.google.com/search?q=what+is+my+ip

   a. Modify the [LoginServer] section:
      loginserver - LAN/WAN IP of your login server to use the login_worldservers account against
	  worldname - World Name that matches the 'name' column defined in login_worldservers (eg. TestLabs)
	  worldaddress - LAN/WAN IP of your world server
	  internalworldaddress - LAN IP of your world server
	  account - Column 'account' defined in login_worldservers (eg. testlabs)
	  password - Column 'password' in login_worldservers (eg. testpass)
   b. Save Changes
   
6. Open the C:\[YOUREQ2EMUGITSRC]\server\login_db.ini file (Notepad or other flavor editor)
   a. Modify the [Database] section:
      host - Should remain localhost unless you have your MariaDB server reside on another host IP
	  user - When installing MariaDB the user defined (default is 'root') should be set here
	  password - When installing MariaDB use the password defined along with the default user.
	  database - This field should remain eq2ls unless changed by the user to use a custom database name.

7. Open the C:\[YOUREQ2EMUGITSRC]\server\world_db.ini file (Notepad or other flavor editor)
   a. Modify the [Database] section:
      host - Should remain localhost or 127.0.0.1 unless you have your MariaDB server reside on another host IP
	  user - When installing MariaDB the user defined (default is 'root') should be set here
	  password - When installing MariaDB use the password defined along with the default user.
	  database - This field should remain eq2emu unless changed by the user to use a custom database name.

8. Start the Login Server: C:\[YOUREQ2EMUGITSRC]\server\EQ2Login__Debug.exe

9. Start the World Server: C:\[YOUREQ2EMUGITSRC]\server\EQ2World__Debug.exe

### Building/Compiling

TBD

## Authors

Authors reside at https://www.zeklabs.com/ and https://www.eqpvp.com/

## License

This project is licensed under the GNU General Public License - see the [LICENSE.md](LICENSE.md) file for details