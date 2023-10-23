#!/bin/bash

# Cleanup from past vnc session that may hav been running in the container.
# This clean-up is not done when the container is stopped (not deleted).
rm /tmp/.X11-unix/X1 2> /dev/null
rm /tmp/.X1-lock 2> /dev/null

# Launch the VNC server
vncserver \
  -localhost no \
  -geometry 1024x768 -depth 16 \
  -SecurityTypes None --I-KNOW-THIS-IS-INSECURE

# Launch the noVNC server.
/usr/share/novnc/utils/launch.sh --vnc localhost:5901 --listen 6901 &

# Check if the .contconf/launch.bash script exists and if it does
# then run it here.  This allows images that use this as a base
# to insert a script that will run on startup.
if [ -f /home/$USERNAME/.contconf/launch.bash ];
then
  echo "Running launch.bash"
  source /home/$USERNAME/.contconf/launch.bash
fi

sleep infinity
