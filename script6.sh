#!/bin/bash
while read first last;
do
name= "$first $last"
username="$last${first:0:1}"
n=`egrep –c $username /etc/passwd`
n=$((n+1))
username=$username$n
useradd -m $username
password=`tr -cd '[:alpha:]' < /dev/random | head -c8`
# notice difference between the ` and ‘ characters in the line above
echo $password | passwd --stdin $username
echo "$username $password" >> /root/tempPasswords
done
