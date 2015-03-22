#!/bin/bash

#################################################################################
# EVALUATE COLOR CODES
#################################################################################
BLACK='\e[0;30m'            # Black
RED='\e[0;31m'              # Red
GREEN='\e[0;32m'            # Green
YELLOW='\e[0;33m'           # Yellow
BLUE='\e[0;34m'             # Blue
MAGENTA='\e[0;35m'          # Magenta
CYAN='\e[0;36m'             # Cyancd 
WHITE='\e[0;97m'            # White

BLDBLACK='\e[1;30m'         # Black - Bold
BLDRED='\e[1;31m'           # Red - Bold
BLDGREEN='\e[1;32m'         # Green - Bold


BLDYELLOW='\e[1;33m'        # Yellow - Bold
BLDBLUE='\e[1;34m'          # Blue - Bold
BLDMAGENTA='\e[1;35m'       # Magenta - Bold
BLDCYAN='\e[1;36m'          # Cyan - Bold
BLDWHITE='\e[1;97m'         # White - Bold

BOLD='\e[1m'                # BOLD
RESET='\e[0m'               # Text Reset
UNDLINE='\e[4m'             # UNDERLINE

# Tells you what server you are on.
echo -e "${GREEN}You are in:${RESET}"
hostname -f

# Tells you everyone connected via SSH
echo -e "\n${GREEN}Everyone in the club:${RESET}" 
w

# Lets you know who has a screen and what its running
echo -e "\n${GREEN}Tell me who's watching:${RESET}"
screen -ls
 
# Tells you the number of CPUs on the server
echo -e "\n${GREEN}CPUs${RESET}"  
grep -c proc /proc/cpuinfo

# Gives you free memory in megabytes  
echo -e "\n${GREEN}Free Memory, Not Free Bird:${RESET}" 
free -m

# The following gives you CPU usage, Load Averages (every 5/10/15 mins), Memory Usage, I/O wait% and more in depth I/O stats.

echo -e "\n${GREEN}CPU Usage:${RESET}"
sar | head -3 
sar | tail -5 
echo -e "\n${GREEN}Load:${RESET}"
sar -q | head -3 
sar -q | tail -5 
echo -e "\n${GREEN}Memory:${RESET}"
sar -r | head -3 
sar -r | tail -5
echo -e "\n${GREEN}I/O Wait:${RESET}"
sar -d | head -3 
sar -d | tail -5
echo
 
# Check if this runs before actually running it.
# This is only available on cpanel servers.
if [ -a /usr/local/cpanel/bin/dcpumonview ]; then
    /usr/local/cpanel/bin/dcpumonview
fi

echo -e "\n${GREEN}Active Connections:${RESET}"
# Are we root? The netstat -p option requires root
if [ $EUID -ne 0 ]; then
    netstat -tuna
else
    netstat -ptuna
fi