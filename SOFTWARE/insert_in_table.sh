#!/usr/bin/bash


while true; do
    read -p 'table_name: ' table_name

    if is_exists "$table_name" ; then
        echo "table exists "
        break
    else
        echo "Table does not exist!"
    fi
done


# Get the first line of $table_name as metadata

metadata=$(head -n 1 "$table_name")




# Extract the column names using string manipulation
column_names=$(echo "$metadata" | head -n 1 | sed -E 's/([^:]+)\([^)]+\)/\1/g')

IFS=':' read -r -a column_names_array <<< "$column_names"

# Prompt the user to enter values for each column
declare -a column_values

for column_name in "${column_names_array[@]}"; do
    read -p "Enter value for $column_name: " column_value
    column_values+=("$column_value:")
done

# Save the entered values in the table
echo "${column_values[@]}" >> "$table_name"

echo "Values saved to $table_name."