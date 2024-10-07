#!/usr/bin/bash

cd nmap-did-what/data/

if [ -f nmap-subnet.xml ]; then
	cp nmap-subnet.xml nmap-subnet-compare.xml
fi

nmap -sS -p- --max-rtt-timeout 1000ms --max-retries 1 --scan-delay 100ms --min-hostgroup 96 --script=http-title,ssl-cert -oX nmap-subnet.xml -iL hosts.txt
python3 nmap-to-sqlite.py -c nmap-subnet-compare.xml nmap-subnet.xml
