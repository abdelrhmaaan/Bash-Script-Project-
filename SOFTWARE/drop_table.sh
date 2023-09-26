#!/usr/bin/bash

source ../../SOFTWARE/is_exists.sh

#storing all the tables name in an array
array=( $( ls ) )
# array=(*/)
echo "======== TB Names========"
echo "${array[*]}"
echo "========================="

while true; do
    read -p "Drop DB name = " table_name

    if is_exists "$table_name" ; then
        read -p "confirm dropping $table_name y or n ?" answer
        if [ "$answer" == "y" ]; then 
            rm -r $table_name
            echo "TB Dropped successfully :)"
                break
        else
            echo "Cancel Dropping *_*"
                break
        fi
        
    else 
        echo "TB Doesn't exits"
    fi
done