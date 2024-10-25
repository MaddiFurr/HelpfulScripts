#!/bin/zsh
if [ $# -ne 2 ]; then
  echo "Exactly two arguments are required."
  exit 1
fi
echo "Please validate the following information:"
echo "Device: $1"
echo "ISO: $2"
echo -n "Is this information correct? [y/n] "
read -r REPLY
echo    

if [[ $REPLY =~ ^[Yy]$ ]]; then
  sudo dd bs=4M if=$2 of=$1 status=progress oflag=sync
  echo "Done!"
else
  echo "Operation aborted."
fi