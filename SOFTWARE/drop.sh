#!/usr/bin/bash
#  dropping the DB 
source is_exists.sh

cd ../DATA

#storing all the DBes name in an array
array=( $(ls -d */ | tr -d /) )
# array=(*/)
echo "======== DB Names========"
echo "${array[*]}"
echo "========================="

while true; do
    read -p "Drop DB name = " db_name

    if is_exists "$db_name" ; then
        read -p "confirm dropping $db_name y or n ?" answer
        if [ "$answer" == "y" ]; then 
            rm -r $db_name
            echo "DB Dropped successfully :)"
                break
        else
            echo "Cancel Dropping *_*"
                break
        fi
        
    else 
        echo "DB Doesn't exits"
    fi
done

cd -  &>> ~/output.txt

