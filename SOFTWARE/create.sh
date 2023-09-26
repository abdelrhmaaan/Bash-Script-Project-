#!/usr/bin/bash

source ./is_valid.sh
source ./is_exists.sh

cd ../DATA

while true; do
  read -p 'DB_name: ' db_name
    if is_valid "$db_name"; then  
      # Check if the directory was created successfully
        if is_exists "$db_name" ; then
          echo "DB exists "
        else
          echo "DB Created successfully :)"
          break
        fi
    else
      echo 'Not a valid name'
    fi
done




mkdir $db_name &> ~/error

cd -  &>> ~/output.txt
