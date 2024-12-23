#!/bin/bash
wget -c http://ftp.apnic.net/stats/apnic/delegated-apnic-latest -P /root/lzj/cn_ip/

cat /root/lzj/cn_ip/delegated-apnic-latest | awk -F '|' '/CN/&&/ipv4/ {print $4 "/" 32-log($5)/log(2)}' | cat > /root/lzj/cn_ip/ipv4_cn.txt

cat /root/lzj/cn_ip/delegated-apnic-latest | awk -F '|' '/TW/&&/ipv4/ {print $4 "/" 32-log($5)/log(2)}' | cat > /root/lzj/cn_ip/ipv4_tw.txt

cat /root/lzj/cn_ip/delegated-apnic-latest | awk -F '|' '/MO/&&/ipv4/ {print $4 "/" 32-log($5)/log(2)}' | cat > /root/lzj/cn_ip/ipv4_mo.txt

cat /root/lzj/cn_ip/delegated-apnic-latest | awk -F '|' '/HK/&&/ipv4/ {print $4 "/" 32-log($5)/log(2)}' | cat > /root/lzj/cn_ip/ipv4_hk.txt

cat /root/lzj/cn_ip/ipv4_cn.txt /root/lzj/cn_ip/ipv4_tw.txt /root/lzj/cn_ip/ipv4_mo.txt /root/lzj/cn_ip/ipv4_hk.txt > /root/lzj/cn_ip/ipv4_cidr.txt
# cidr -to- ip
cat /root/lzj/cn_ip/ipv4_cidr.txt | while read line; do echo "$(ipcalc -n $line | cut -d= -f2)-$(ipcalc -b $line | cut -d= -f2)"; done > /root/lzj/cn_ip/ipv4.txt



