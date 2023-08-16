#!/usr/bin/env bash

var1="Только Fedora"
var2="Fedora + Docker"
var3="Fedora + Podman"

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

echo "Выберите переменную: 1 - $var1, 2 - $var2, 3 - $var3"
read choice
if [ $choice -eq 1 ]; then
	execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora"
elif [ $choice -eq 2 ]; then
	execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora"
	execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora/docker"
elif [ $choice -eq 3 ]; then
	execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora"
	execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora/podman"
else
	echo "Вы ввели некорректный выбор, выполнение скриптов не возможно"
fi


