#!/bin/bash

add_bin_to_path() {
    for dir in "$@";
    do
        if [ -n "$dir" ] && [ -d "$dir/bin" ];
        then export PATH="$PATH:$dir/bin";
        fi;
    done;

    unset dir
}

