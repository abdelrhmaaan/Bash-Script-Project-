#!/usr/bin/bash

while true; do
    read -p 'table_name: ' table_name

    if is_exists "$table_name" ; then
        break
    else
        echo "Table does not exist!"
    fi
done

metadata=$(head -n 1 "$table_name")
column_names=$(echo "$metadata" | head -n 1 | sed -E 's/([^:]+)\([^)]+\)/\1/g')
IFS=':' read -r -a column_names_array <<< "$column_names"
echo "${column_names_array[@]}"
sed '1d' $table_name | awk -F ':' '{ for (i=1; i<=NF; i++) printf "%s ", $i; printf "\n" }'
