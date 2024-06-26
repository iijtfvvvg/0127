#!/bin/bash

# Define FTP server addresses and credentials
ftp_servers=(
    "ftp://ftp-baidu.alwaysdata.net/www/"
    "ftp://ftp-ttthjjerster3.alwaysdata.net/www/"
    "ftp://ftp-hyiopybby12558.alwaysdata.net/www/"
    "ftp://ftp-gertanyioptty.alwaysdata.net/www/"
    "ftp://ftp-cnzj1688.alwaysdata.net/www/"
)
ftp_users=(
    "baidu"
    "ttthjjerster3"
    "hyiopybby12558"
    "gertanyioptty"
    "cnzj1688"
)
ftp_passwords=(
    "123123123aA@@@"
    "tttuuuu2555T125"
    "ggghhh6666A##{"
    "gtyy6677Aa##%"
    "123123123aA@@@"
)

# Define directories to create and download into
directories=("baidu" "amer" "add" "show" "cnzj")

# Download files from FTP servers
for ((i=0; i<${#ftp_servers[@]}; i++)); do
    mkdir -p www/${directories[i]}
    wget -nH -m --ftp-user=${ftp_users[i]} --ftp-password=${ftp_passwords[i]} ${ftp_servers[i]}* -P www/${directories[i]}
done

# Upload contents of www directory to Google Drive
/usr/local/bin/DriveUploader -c auth.json -s "www"

# Remove www directory
rm -rf www
