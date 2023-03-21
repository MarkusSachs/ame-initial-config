#!/bin/bash

echo
echo
echo Grundkonfig Oddo Appliance
echo
echo
read -p"Hostname FQDN:  " hostname_fqdn
read -p"IP_Address (x.x.x.x/24): " IP_Address
read -p"GW-IP: " IP_Gateway
read -p"DNS-IP: " IP_DNS_1
read -p"NTP-Server-IP: " NTPServer
ansible-playbook -c local -e hostname_fqdn=$hostname_fqdn -e IP_Address=$IP_Address -e IP_Gateway=$IP_Gateway -e IP_DNS_1=$IP_DNS_1 -e NTPServer=$NTPServer /home/si/initial-setup/local.yml

mv ~/.bash_login ~/.bash_login.done

echo
echo
read -p"Alles erledigt VM rebooten? (j/n)? " response

    if [ "$response" == "j" ]; then
        reboot
    fi