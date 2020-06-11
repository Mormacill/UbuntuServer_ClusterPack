#!/bin/bash

cd /root/
rm /tmp/.X0-lock
export DISPLAY=:0
service rpcbind restart
service nfs-common start
mount $NFSHOSTNAME:/home/$USERNAME /home/$USERNAME
service dbus start
service ssh start
X &
sleep 3
xauth generate :0 . trusted
sleep 5
startxfce4 &
sleep 10
x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /root/passwd.pass -rfbport ${XPT} -shared &
