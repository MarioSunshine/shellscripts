#!/bin/bash
while read first last;
do
name="$first $last" #Removed space after equal sign.
username="$last${first:0:1}"
n=$(egrep –c "$username" /etc/passwd) #Use the $() for command subsitution
n=$((n+1))
username="$username$n" #Put value in quotes
useradd -m "$username" #Put value in quotes
password=$(tr -cd '[:alpha:]' < /dev/random | head -c8) #Use the $() for command subsitution
echo "$password" | passwd --stdin "$username" #Put values in quotes
echo "$username $password" >> /root/tempPasswords
done
