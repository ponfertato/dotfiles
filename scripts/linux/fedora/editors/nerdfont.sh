#!/usr/bin/env bash

print_block "Fedora - Editors/Nerd Font"

FONT_DIR="$HOME/.local/share/fonts"
NERDFONT_NAME="JetBrainsMono"
NERDFONT_ZIP="$NERDFONT_NAME.zip"

if ! fc-list | grep -i "$NERDFONT_NAME"; then
	mkdir -p "$FONT_DIR"
	wget -O "$NERDFONT_ZIP" "$(curl -s "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest" | grep "browser_download_url.*$NERDFONT_NAME.zip" | cut -d '"' -f 4)"
	unzip "$NERDFONT_ZIP" -d "$FONT_DIR"
	echo "Шрифт $NERDFONT_NAME успешно установлен."
	rm "$NERDFONT_ZIP"
else
	echo "Шрифт $NERDFONT_NAME уже установлен."
fi
