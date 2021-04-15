<?php

$cfg['blowfish_secret'] = '01234567890123456789012345678912';

$i = 1;


$cfg['Servers'][$i]['auth_type'] = 'cookie';

$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['host'] = 'mysql';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;

 $cfg['Servers'][$i]['user'] = 'admin';
 $cfg['Servers'][$i]['password'] = 'admin';

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';