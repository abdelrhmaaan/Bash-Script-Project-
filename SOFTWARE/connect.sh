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
    read -p "Connect to => DB name = " db_name

    if is_exists "$db_name" ; then

        cd $db_name
        echo
        echo ".... you are connected to $db_name DB ....."
        echo
            break
    else 
        echo "DB Doesn't exits"
    fi
done

#  After connecting to DB .....
# create_table list_tables select_from_table drop_table insert_in_table
# delete_from_table update_in_table

select choice  in create_table list_tables select_from_table drop_table insert_in_table   disconnect_DB
do
case $choice in 

create_table ) 
            echo "creating table"
            source ../../SOFTWARE/create_table.sh
        ;;
list_tables ) 
            echo "list table"
            source ../../SOFTWARE/list_tables.sh
        ;;
select_from_table ) 
            echo "select table"
            source ../../SOFTWARE/select_from_table.sh
        ;;
drop_table ) 
            echo "drop table"
            source ../../SOFTWARE/drop_table.sh
        ;;
insert_in_table ) 
            echo "insert table"
            source ../../SOFTWARE/insert_in_table.sh
        ;;
disconnect_DB )
            echo "disconnecting from $db_name"
            break
            ;;
* )
            echo "Invalid Choice!!!"
    esac
done



cd ../../SOFTWARE








# delete_from_table ) 
#             echo "delete table"
#             source ../../SOFTWARE/delete_from_table.sh
#         ;;
# update_in_table ) 
#             echo "update table"
#             source ../../SOFTWARE/update_in_table.sh
#         ;;