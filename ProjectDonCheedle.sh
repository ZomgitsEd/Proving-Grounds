#!/bin/bash

#################################################################################
# EVALUATE COLOR CODES
#################################################################################
BLACK='\e[0;30m' 			# Black
RED='\e[0;31m' 				# Red
GREEN='\e[0;32m' 			# Green
YELLOW='\e[0;33m' 			# Yellow
BLUE='\e[0;34m' 			# Blue
MAGENTA='\e[0;35m' 			# Magenta
CYAN='\e[0;36m' 			# Cyancd 
WHITE='\e[0;97m' 			# White

BLDBLACK='\e[1;30m' 		# Black - Bold
BLDRED='\e[1;31m' 			# Red - Bold
BLDGREEN='\e[1;32m' 		# Green - Bold


BLDYELLOW='\e[1;33m'		# Yellow - Bold
BLDBLUE='\e[1;34m' 			# Blue - Bold
BLDMAGENTA='\e[1;35m' 		# Magenta - Bold
BLDCYAN='\e[1;36m' 			# Cyan - Bold
BLDWHITE='\e[1;97m' 		# White - Bold

BOLD='\e[1m'				# BOLD
RESET='\e[0m'    			# Text Reset
UNDLINE='\e[4m'				# UNDERLINE

#
echo -e "${GREEN}You are in:${RESET}\n"
hostname -f

echo -e "\n${GREEN}Everyone in the club:${RESET}\n" 
w
 
echo -e "\n${GREEN}Tell me who's watching:${RESET}\n"
screen -ls
 
echo -e "\n${GREEN}CPUs${RESET}\n"  
grep -c proc /proc/cpuinfo
 
echo -e "\n${GREEN}Free Memory, Not Free Bird:${RESET}\n" 
free -m

echo -e "\n${GREEN}I/O Wait:${RESET}\n"
sar | head -3 
sar | tail -5 
sar -q | head -3 
sar -q | tail -5 
sar -r |head -3 
sar -r | tail -5
echo
 
echo -e "\n/usr/local/cpanel/bin/dcpumonview\n"
echo -e "\n Active Connections: \n"
netstat -pltuna