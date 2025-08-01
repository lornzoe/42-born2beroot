arc=$(uname -a)
pcpu=$(grep "physical id" /proc/cpuinfo | uniq | wc -l)
vcpu=$(grep "processor" /proc/cpuinfo | uniq | wc -l)
memu=$(free -m | awk '"Mem:"==$1 {print $3}')
memt=$(free -m | awk '"Mem:"==$1 {print $2}')
memp=$(free | awk '"Mem:"==$1 {printf "%.2f%%", ($3/$2*100)}')
disku=$(df -Bm | grep "^/dev" | grep -v "/boot$" | awk '{u += $2} END {printf u}')
diskt=$(df -Bg | grep "^/dev" | grep -v "/boot$" | awk '{f += $3} END {printf f}')
diskp=$(df | grep "^/dev" | grep -v "/boot$" | awk '{f += $3} {u += $2} END {printf "%.0f%%", f/u*100}')
cpuu=$(top -b -n2 | grep '^%Cpu'| tail -1 | awk '{printf "%.1f%%", $2+$4}')
lboot=$(who -b | awk '{printf $3" "$4}')
lvmtest=$(lsblk | grep "lvm" | wc -l)
lvmcheck=$(if [ $lvmtest -eq 0 ]; then echo no; else echo yes; fi)
etcp=$(ss -s | grep "^TCP:" | awk '{print $4}' | tr -d ',')
ulog=$(users | wc -w)
ip=$(hostname -I)
mac=$(ip link show | awk '$1=="link/ether" {print $2}')
sudos=$(grep "COMMAND" /var/log/sudo/sudo_logs | wc -l)

echo \
"#Architecture: $arc
#CPU physical : $pcpu
#vCPU : $vcpu
#Memory Usage: $memu/${memt}MB ($memp)
#Disk Usage: $disku/${diskt}Gb ($diskp)
#CPU load: $cpuu
#Last boot: $lboot
#LVM use: $lvmcheck
#Connections TCP : $etcp ESTABLISHED
#User log: $ulog
#Network: IP $ip ($mac)
#Sudo : $sudos cmd"
