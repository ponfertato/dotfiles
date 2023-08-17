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

install_or_update_packages() {
	for package in "${packages[@]}"; do
		if rpm -q "$package" >/dev/null; then
				echo "Пакет $package уже установлен, выполняется его обновление..."
				sudo dnf upgrade -y "$package"
		else
				echo "Пакет $package не найден, выполняется его установка..."
				sudo dnf install -y "$package"
		fi
	done
}

while true; do
	execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora"
	read -p "Базовая настройка завершена, нажмите Enter, чтобы продолжить..."

	clear
	echo "Выберите установки (цифры можно перечислить через пробел):"
	echo "1. Установки для Docker"
	echo "2. Установки для Podman"
	echo "3. Установки для редакторов"
	echo "4. Установки для расширений"
	echo "5. Установки для игр"
	echo "6. Установки для ядра Xanmod"
	echo "7. Установки для ядра Fsync"
	echo "8. Установки для оболочки"
	echo "9. Установки для тем"
	echo "0. Только применение конфига fedora.conf"

	read -a choices -p "Введите номера через пробел: "

	selected_options=()

	case $choices in
		*1*)
			selected_options+=("Установки для Docker")
			execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora/containerization/docker"
			;;
		*2*)
			selected_options+=("Установки для Podman")
			execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora/containerization/podman"
			;;
		*3*)
			selected_options+=("Установки для редакторов")
			execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora/editors"
			;;
		*4*)
			selected_options+=("Установки для расширений")
			execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora/extention"
			;;
		*5*)
			selected_options+=("Установки для игр")
			execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora/games"
			;;
		*6*)
			selected_options+=("Установки для ядра Xanmod")
			execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora/kernel/fsync"
			;;
		*7*)
			selected_options+=("Установки для ядра Fsync")
			execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora/kernel/xanmod"
			;;
		*8*)
			selected_options+=("Установки для оболочки")
			execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora/shell/zsh"
			;;
		*9*)
			selected_options+=("Установки для тем")
			execute_scripts_in_folder "${BASEDIR}/scripts/linux/fedora/themes"
			;;
		0)
			echo "Применение конфига fedora.conf"
			break
			;;
		*)
			clear
			echo "Неверный выбор. Пожалуйста, попробуйте еще раз."
			sleep 2
			clear
			continue
			;;
	esac

	if [ ${#selected_options[@]} -gt 0 ]; then
		echo "Выбранные варианты:"
		for option in "${selected_options[@]}"; do
			echo "- $option"
			done
	read -p "Дополнительная настройка завершена, нажмите Enter, чтобы продолжить..."
		break
	fi
done
