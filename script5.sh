#!/bin/bash
input="./names.txt" #Removed space after input,
while IFS=, read -r first last; do
    name="$first $last"
    username="${first:0:1}$last"
    n=$(egrep -c "$username" /etc/passwd) #Used $() for command substitution instead of backticks in the n=$(egrep -c "$username" /etc/passwd) line.
    n=$((n+1))
    username="$username$n" #Added quotes to be read as variable.
    useradd -m "$username" -s /bin/bash #added quotes to recogine variable.
done < "$input"
tail /etc/passwd
