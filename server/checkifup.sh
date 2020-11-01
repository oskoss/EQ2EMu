#!/usr/bin/env bash
#FUCKIT=$(ps -C "gdb ./login" -o pid=)
## This pulls the 1st result Not needed now, but just in case
#FUCKME=${FUCK%%[[:space:]]*}

####### LOGINSERVER CHECK ########
CURR=$(date +"Date : %m/%d/%Y Time : %I:%M:%S")
FUCKIT=$(pgrep -f "SCREEN -Sdm EQ2Login gdb -ex run ./login")
FUCKME=$(pgrep -f "SCREEN -Sdm EQ2World gdb -ex run ./eq2world")
SERVER=127.0.0.1
PORT=9100
SERVDIR=/home/eq2emu
</dev/tcp/$SERVER/$PORT > /dev/null
if [ "$?" -ne 0 ]; then
  echo "[Login] Connection to $SERVER on port $PORT failed"
  echo "Killing login server process and restarting. PID of Login was ${FUCKIT}"
  kill -9 ${FUCKIT}
  cd $SERVDIR
  screen -Sdm EQ2Login gdb -ex run ./login
  BOOM=$(pgrep -f "SCREEN -Sdm EQ2Login gdb -ex run ./login")
  echo "Killed and restarted login, new PID (of Screen Session) is ${BOOM}"
## Send the date/time this occured to a log
echo "[ $CURR ] We restarted login. Could not connect." >> /var/log/eq2emurestart.log
 # exit 1
#fi

#if [ "$?" -eq 1 ]; then
else
  echo "[Login] Connection to $SERVER on port $PORT succeeded Nothing to do - Existing PID: ${FUCKIT}"
#test code here
#echo "Your PID For LOGIN is $FUCKIT"
 # exit 0
fi

########## WORLDSERVER CHECK
PORT=9001
#</dev/udp/$SERVER/$PORT > /dev/null
nc -z -u $SERVER $PORT
if [ "$?" -ne 0 ]; then
  echo "[World] Connection to $SERVER on port $PORT failed"
  echo "Killing world server process and restarting. PID of World was ${FUCKME}"
  kill -9 ${FUCKME}
  cd $SERVDIR
  screen -Sdm EQ2World gdb -ex run ./eq2world
  BOOMER=$(pgrep -f "SCREEN -Sdm EQ2World gdb -ex run ./eq2world")
  echo "Killed and restarted world, new PID (of Screen Session) is ${BOOMER}"
  echo "[ $CURR ] We restarted world. Could not connect." >> /var/log/eq2emurestart.log
  exit 1
else
  echo "[World] Connection to $SERVER on port $PORT succeeded Nothing to do - Existing PID: ${FUCKME}"
#test code here
#echo "Your PID For LOGIN is $FUCKME"
  exit 0
fi
