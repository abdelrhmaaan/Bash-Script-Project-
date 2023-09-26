#!/usr/bin/bash

source ../../SOFTWARE/is_valid.sh
source ../../SOFTWARE/is_exists.sh

# prombt the user to write the table (file) name
# validate the name of the table 
# check if the tabel is already exits :
# touch the table (file) 
# ask how many columns 
# ask the type of the column 

while true; do
    read -p 'table_name: ' table_name
    if is_valid "$table_name"; then  
        # Check if the directory was created successfully
        if is_exists "$table_name" ; then
            echo "table exists "
        else
            touch $table_name
            echo "table Created successfully :)"
                break
        fi
    else
        echo 'Not a valid name'
    fi
done

# ask the user how many fields wanna enter
# check user input mataches this regex : ^[1-9]$|^10$

while true; do
    read -p 'columns_num: ' columns_num
    if [[ $columns_num =~ ^[1-9]$|^10$ ]]; then
            break
    else
        echo "Not a valid number!"
    fi
done

# make a for loop to prombt the user to enter the columns names
# and the datatype of each column 
# and save this metadata in the table (file)

# Create an array to store column metadata
declare -a columns_metadata

# Loop to prompt the user for column names and data types
for ((i = 1; i <= columns_num; i++)); do
    while true;
    do
        read -p "Enter name for column $i: " column_name
        if is_valid "$column_name"; then  
            read -p "data type for column $i: " column_type
            if [[ "$column_type" == "int" || "$column_type" == "str" ]]; then
                # Append column metadata to the array
                columns_metadata+=("$column_name($column_type):")
                    break
            else
                echo "Invalid data type. Please enter 'int' or 'str'."
            fi
            
        else
            echo 'Not a valid column name.'
        fi
    done
    
done

# Save column metadata to the table (file)
echo "${columns_metadata[@]}" > "$table_name"
echo "Column metadata saved to $table_name."
