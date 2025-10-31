#!/bin/bash
mysql_ready() {
        mysqladmin ping --host=mysql-db --user=root --password=toor --skip-ssl > /dev/null 2>&1
}
sp="/-\|"
printf "Waiting MySQL Server..."
while !(mysql_ready)
do
    sleep 0.5
    printf "\b${sp:i++%${#sp}:1}"
done
echo -en "\r";
