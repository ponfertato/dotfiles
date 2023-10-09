#!/usr/bin/env bash

execute_scripts_in_folder() {
    folder="$1"
    for script in "$folder"/*.sh; do
        if [ -f "$script" ]; then
            print_block() {
                local message=$1
                local length=${#message}
                local line=""

                for (( i=0; i<$length+4; i++ )); do
                    line="$line="
                done

                echo ""
                echo "$line"
                echo "| $message |"
                echo "$line"
                echo ""
            }
            # echo "Выполнение скрипта: $script"
            . "$script"
        fi
    done
}
