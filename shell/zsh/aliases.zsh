#!/usr/bin/env bash

# alias dotfiles="cd $DOTFILES"

alias rl='source ~/.zshrc; echo ".zshrc reloaded"'
alias regen='zgenom reset;source ~/.zshrc'

alias .f='cd ~/.dotfiles'
alias .....='cd ../../../..'
alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
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
alias to_lower="tr '[:upper:]' '[:lower:]'"
alias to_upper="tr '[:lower:]' '[:upper:]'"
alias tr1='rg --files | tree --fromfile -L 1 -C'
alias tr2='rg --files | tree --fromfile -L 2 -C'
alias tr3='rg --files | tree --fromfile -L 3 -C'
alias trall='rg --files | tree --fromfile -C'

if type rg > /dev/null 2>&1; then
  alias rg="rg -i --hidden -g '!.git/'"
  alias rgf="rg --files | rg"
fi

##git
alias gau="git add -u"
alias gbd="git branch -D"
alias gbm="git branch --merged"
alias gbmv="git branch -m"
alias gbnm="git branch --no-merged"
alias gbu="git branch -u"
alias gbv="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias gbvv="git branch -vv"
alias gcane="git commit --amend --no-edit"
alias gcof="git checkout -f"
alias gct="git checkout -t"
alias gdc="git diff --cached"
alias gdlast="git diff HEAD~1..HEAD"
alias gh="git hist"
alias gl="git l3"
alias glast="git log -1 HEAD"
alias gpdel="git push --delete"
alias gpl="git pull"
alias gshno="git show --name-only"
alias gst="git status"
alias gstl="git stash list --pretty=format:'%C(blue)%gd%C(reset): %<(100,trunc)%s %C(green)(%cr)%C(reset)'"
alias gstu="git status -uno"
alias gswm='git switch $(git_main_branch)'
alias gundo="git reset HEAD~1"
alias guns="git reset HEAD --"
