#!/bin/bash
input =“./names.txt”
while IFS=, read -r first last; # notice the comma after the equal sign
do
name="$first $last"
username="${first:0:1}$last"
useradd -m $username -s /bin/bash
done < "$input"
tail -8 /etc/passwd
