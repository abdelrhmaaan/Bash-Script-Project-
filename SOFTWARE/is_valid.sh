#!/bin/bash

#function to validate the DB name 
is_valid(){
    local name="$1"
    if [[ "$name" =~ ^[a-zA-Z_]{2,}$ ]]; 
    then
        return 0 # a valid name
    else
        return 1 # Not valid name 
    fi
}


