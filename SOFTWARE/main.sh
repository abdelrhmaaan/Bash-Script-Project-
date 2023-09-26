#!/usr/bin/bash

select choice  in CREATE_DB LIST_DB CONNECT_DB DROP_DB
do
case $choice in 
CREATE_DB )
            echo 'Creating DB .....'
            source ./create.sh
            ;;
LIST_DB )
            echo 'Listing DB .....'
            source ./List.sh
            ;;
CONNECT_DB )
            echo 'Connecting to DB .....'
            source ./Connect.sh
            ;;
DROP_DB )
            echo 'Droping DB .....'
            source ./Drop.sh
            ;;
* )
            echo 'invalid choice'
            ;;
    esac
done