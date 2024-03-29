#!/usr/bin/env bash

banner (){
  echo $(hostname) \
  | sed -r 's/([[:alpha:]])([[:digit:]])/\1 \2/g' \
  | tr '[:lower:]' '[:upper:]' \
  | figlet -k -t -d ~/.config/motd/ -f peaks-slant \
  | tr '/ \\' '#_#'
}
banner

uname -snrvm

motd_ubuntu (){
  echo -e " System info on......: $(date)"
  echo -e " Hostname............: $(hostname | head -1 | xargs)"
  echo -e " Last login..........: $(last | head -1 | cut -c 1-9 | xargs) at $(last | head -1 | cut -c 40-55 | xargs) from $(last | head -1 | cut -c 23-39 | xargs)"
  echo -e " Uptime..............: $(uptime -p | sed 's/^up.//')"
  echo -e " Load Averages.......: 1 min: $(cat /proc/loadavg | cut -f1 -d' ') 5 mins: $(cat /proc/loadavg | cut -f2 -d' ') 15 mins: $(cat /proc/loadavg | cut -f3 -d' ')"
  echo -e " Disk Usages.........: $(df -h | awk '{if($(NF) == "/") {print $(NF-1); exit;}}') is used on the disk"
  echo -e " Available Updates...: There are $(apt list --upgradeable 2>/dev/null | grep upgradable | wc -l) updates available"
  echo -e " Memory..............: Used: $(free -m | grep Mem: | xargs | cut -f3 -d' ') MB | Free: $(free -m | grep Mem: | xargs | cut -f7 -d' ') MB | Total: $(free -m | grep Mem: | xargs | cut -f2 -d' ') MB"
  echo -e " Network.............: Interface$(ip -4 ad | grep 'state UP' | awk -F ":" '!/^[0-9]*: ?do/ {print $2}'| head -n1) is active with ip address $(hostname -I | awk '{print $1}')"
  echo -e " SSH Logins..........: There are currently $(who | wc -l) users logged in"
  echo -e " Processes...........: There are currently $(ps -ef | wc -l) processes running"
}

motd_alpine (){
  echo -e " System info on......: $(date)"
  echo -e " Hostname............: $(hostname | head -1 | xargs)"
  echo -e " Uptime..............: $(uptime | cut -f 4-5 -d ' ' | tr ',' ' ')"
  echo -e " Load Averages.......: 1 min: $(cat /proc/loadavg | cut -f1 -d' ') 5 mins: $(cat /proc/loadavg | cut -f2 -d' ') 15 mins: $(cat /proc/loadavg | cut -f3 -d' ')"
  echo -e " Disk Usages.........: $(df -h | awk '{if($(NF) == "/") {print $(NF-1); exit;}}') is used on the disk"
  echo -e " Available Updates...: There are $(apk list --upgradeable 2>/dev/null | grep upgradable | wc -l) updates available"
  echo -e " Memory..............: Used: $(free -m | grep Mem: | xargs | cut -f3 -d' ') MB | Free: $(free -m | grep Mem: | xargs | cut -f7 -d' ') MB | Total: $(free -m | grep Mem: | xargs | cut -f2 -d' ') MB"
  echo -e " Network.............: Interface$(ip -4 ad | grep 'state UP' | awk -F ":" '!/^[0-9]*: ?do/ {print $2}' | head -n1) is active with ip address $(hostname -i | awk '{print $1}')"
  echo -e " Processes...........: There are currently $(ps -ef | wc -l) processes running"
}
if [ $(which apt) ]; then
  motd_ubuntu
  else
  motd_alpine
fi