#!/bin/bash
input =“./names.txt” #This line sets the variable input to hold the path to the "names.txt" file.
while IFS=, read -r first last; #This line starts a while loop that reads each line from the "names.txt" file. It uses, as the IFS to split the first and last names on each line.
do #Loop body starts here.
name="$first $last" #This line concatenates the first and last names with a space in between and stores the result in the name variable.
username="${first:0:1}$last" #This line creates the username by taking first letter of first name and appending the last name. It uses Bash's substring expansion ${first:0:1} to extract the first letter.
useradd -m $username -s /bin/bash #Creates a new user with the name stored in the username variable.
done < "$input" #This line closes the while loop and specifies that the input for the loop should come from the "names.txt" file.
tail -8 /etc/passwd #This line displays the last 8 lines of the "/etc/passwd" file
