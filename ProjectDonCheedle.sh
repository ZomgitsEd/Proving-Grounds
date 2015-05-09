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
 
#Service Status Checker Section:
echo -e "\n${BLDYELLOW}HOW YOU DOING?!${RESET}"
 
echo -e "\n${BLDYELLOW}Named${RESET}"
service named status

echo -e "\n${BLDYELLOW}Apache${RESET}"
service httpd status
 
echo -e "\n${BLDYELLOW}MySQL${RESET}"
service mysql status
 
echo -e "\n${BLDYELLOW}cPanel${RESET}"
service cpanel status
 
echo -e "\n${BLDYELLOW}Dovecot or Courier${RESET}"
service dovecot status
 
echo -e "\n${BLDYELLOW}Exim${RESET}"
service exim status 

echo -e "\n${BLDYELLOW}Exim Queue${RESET}"
 exim -bpc
 
echo -e "\n${BLDYELLOW}Pure or Pro FTP${RESET}"
ftpserver=$(/scripts/setupftpserver --current | awk {'print $5'});
if [[$ftpserver == "pure-ftpd" ]]; then
    /etc/init.d/pure-ftpd status
fi
	
if	
	[[$ftpserver == "proftpd" ]]; then
    /etc/init.d/proftpd status 
fi


# Tells you the number of CPUs on the server
echo -e "\n${GREEN}CPUs${RESET}"  
grep -c proc /proc/cpuinfo

# Gives you free memory in megabytes  
echo -e "\n${GREEN}Free Memory, Not Free Bird:${RESET}" 
free -m

# The following gives you CPU usage, Load Averages (every 5/10/15 mins), Memory Usage, wait% and more in depth I/O stats.

echo -e "\n${GREEN}CPU Usage and I/O Wait:${RESET}"
sar | head -3 
sar | tail -5 
echo -e "\n${GREEN}Load:${RESET}"
sar -q | head -3 
sar -q | tail -5 
echo -e "\n${GREEN}Memory:${RESET}"
sar -r | head -3 
sar -r | tail -5


echo -e "\n${CYAN}Version Check on DECK!${RESET}"

echo -e "\n${CYAN}MySQL Version${RESET}"
mysql -V | awk '{print $1,$2,$3,$4,$5}'| cut -d "," -f 1

echo -e "\n${CYAN}PHP version, Loader, Engine${RESET}"
php -v 

echo -e "\n${CYAN}Apache and Easy Apache Versions${RESET}"
http -v  | head -1 | awk '{print $3,$4}'
httpd -v | tail -1 | awk '{print $1,$2}'

echo -e "\n${CYAN}cPanel Version${RESET}"
/usr/local/cpanel/cpanel -V

echo -e "\n${CYAN}Linux OS Version${RESET}"
cat /etc/redhat-release

# Check if this runs before actually running it.
# This is only available on cpanel servers.
if [ -a /usr/local/cpanel/bin/dcpumonview ]; then
    echo -e "\n${MAGENTA}Do we require additional pylons?${RESET}" 
	/usr/local/cpanel/bin/dcpumonview
fi
