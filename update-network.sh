#!/bin/bash

ifconfig eth1 up 2&>/dev/null
eth1up=$?

if [ ! -f /etc/sysconfig/network-scripts/ifcfg-eth1 ] && [ $eth1up -eq 0 ]; then

ifconfig eth1 up && eth1=`ifconfig | grep eth1 | sed 's/.*HWaddr //g'` && cat /etc/sysconfig/network-scripts/ifcfg-eth0 | sed "s/HWADDR.*/HWADDR=$eth1/" | sed "s/eth0/eth1/g" > /etc/sysconfig/network-scripts/ifcfg-eth1 && rm /etc/sysconfig/network-scripts/ifcfg-eth0 && service network restart

fi
