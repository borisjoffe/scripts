#!/bin/bash

# Default args
wifiInterface=$1
ethInterface=$2
if [ -z "$1" ]; then
	wifiInterface="wlan0"
fi
if [ -z "$2" ]; then
	ethInterface="eth1"
fi

###########Start/Restart dnsmasq, modify if required##########
#
#if [ -z "$(ps -e | grep dnsmasq)" ]
#then
# service dnsmasq start
#else
# service dnsmasq restart
#fi
###########

#Initial wifi interface configuration
ifconfig $wifiInterface down
ifconfig $wifiInterface up 10.0.0.1 netmask 255.255.255.0
sleep 5
###########Start DHCP, comment out / add relevant section##########
#Thanks to Panji
#Doesn't try to run dhcpd when already running
#if [ "$(ps -e | grep dhcpd)" == "" ]; then
#	dhcpd $wifiInterface &
#	fi
###########

#Enable NAT
	iptables --flush
	iptables --table nat --flush
	iptables --delete-chain
	iptables --table nat --delete-chain
	iptables --table nat --append POSTROUTING --out-interface $ethInterface -j MASQUERADE
	iptables --append FORWARD --in-interface $wifiInterface -j ACCEPT

#Thanks to lorenzo
#Uncomment the line below if facing problems while sharing PPPoE, see lorenzo's comment for more details
#iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

sysctl -w net.ipv4.ip_forward=1
#start hostapd
hostapd -B /etc/hostapd/hostapd.conf 1>/dev/null
# killall dhcpd
# don't kill dnsmasq since I think it's used for internet
# killall dnsmasq
