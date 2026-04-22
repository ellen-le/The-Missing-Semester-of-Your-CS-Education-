#! /bin/bash

if [ -z "$1" ]; then
        echo "error: no name"
        exit 1
fi

if [ -f "$1" ]; then
        echo  "$1  exist."
else
        echo  "$1  doesn't  exist."
fi
