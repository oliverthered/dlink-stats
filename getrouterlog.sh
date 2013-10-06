#!/bin/bash 
cd Downloads/rrr 2>/dev/null
DATE=$(date +"%y-%m-%d-%H:%M:%S")

wget --user=admin --password=admin 'http://192.168.1.1/statsifcwan.html' -O "$DATE.log" --quiet 2>/dev/null
wget --user=admin --password=admin 'http://192.168.1.1/Summary_Wireless.html' -O "$DATE.summary" --quiet 2>/dev/null


tidy -i -asxml "$DATE.log" 2>/dev/null | sed -e 's/&nbsp;/ /gi' > "$DATE.log.xml"
tidy -i -asxml "$DATE.summary" 2>/dev/null | sed -e 's/&nbsp;/ /gi' > "$DATE.summary.xml"

cat "$DATE.log.xml" | ./starit.sh > "$DATE.log.star.xml"

