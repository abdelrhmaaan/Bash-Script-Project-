#!/bin/bash

# Function to check if the database exists
is_exists() {
    local db_name="$1"
    if [ -e "$db_name" ]; then
        return 0
    else
        return 1
    fi
}
