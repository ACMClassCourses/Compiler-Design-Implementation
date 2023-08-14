#!/bin/bash

test_bin() {
    which $1 > /dev/null 2> /dev/null
    if [ $? -ne 0 ]; then
        echo "$1 not found" >&2
        exit 1
    fi
}

print_red_msg() {
    echo -e "\033[31m$1\033[0m" >&2
}
print_green_msg() {
    echo -e "\033[32m$1\033[0m" >&2
}
