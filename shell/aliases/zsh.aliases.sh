#!/usr/bin/env bash

# alias dotfiles="cd $DOTFILES"

alias rl='source ~/.zshrc; echo ".zshrc reloaded"'
alias regen='zgenom reset;source ~/.zshrc'
alias .f='cd ~/.dotfiles'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias ~='cd ~/'

alias cp='cp -i'
alias mv='mv -i'

OS=$(uname)
case $OS in
  'Linux')
    alias ls='ls --color=auto -p'

    if type systemctl > /dev/null 2>&1; then
      alias senable='sudo systemctl enable'
      alias srestart='sudo systemctl restart'
      alias sstatus='sudo systemctl status'
      alias sstop='sudo systemctl stop'
      alias sstart='sudo systemctl start'
    fi
    ;;
  'Darwin')
    ;;
  'Windows_NT')
    ;;
  *) ;;
esac

alias t="touch"

alias tr1='rg --files | tree --fromfile -L 1 -C'
alias tr2='rg --files | tree --fromfile -L 2 -C'
alias tr3='rg --files | tree --fromfile -L 3 -C'
alias trall='rg --files | tree --fromfile -C'

alias to_lower="tr '[:upper:]' '[:lower:]'"
alias to_upper="tr '[:lower:]' '[:upper:]'"

if type rg > /dev/null 2>&1; then
  alias rg="rg -i --hidden -g '!.git/'"
  alias rgf="rg --files | rg"
fi