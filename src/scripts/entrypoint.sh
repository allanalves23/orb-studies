#!/bin/bash

## Install dependencies
sudo apt install lftp -y

## LFTP Execution
lftp "${FTP_HOST}" -u "${FTP_USER}","${FTP_PASS}" -e "set ftp:ssl-force ${FTP_FORCESSL}; set ssl:verify-certificate false; mirror ${FTP_OPTIONS} --reverse --continue --dereference -x ^\.git/$ ${FTP_LOCALDIR} ${FTP_REMOTEDIR}; quit"
