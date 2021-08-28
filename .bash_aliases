#!/bin/bash

REPO="$HOME/.local/git"

alias :q='exit'
alias reload='source $HOME/.bashrc'
alias x='clear'
alias vim="nvim"
alias vi="nvim"
alias xnvimswap='rm $HOME/.local/share/nvim/swap/*.swp'
alias sysup='sudo apt update && sudo apt upgrade && sudo apt autoremove'

alias dotfiles='cd $REPO/local/dotfiles && ls -la'
alias config='cd $HOME/.config'
alias repos='cd $REPO'
alias localbin='cd /usr/local/bin'

alias vimrc='$EDITOR $REPO/local/dotfiles/.config/nvim/init.vim'
alias tmuxrc='$EDITOR $REPO/local/dotfiles/.tmux.conf'
alias bashrc='$EDITOR $REPO/local/dotfiles/.bashrc'
alias bashalias='$EDITOR $REPO/local/dotfiles/.bash_aliases'
alias inputrc='$EDITOR $REPO/local/dotfiles/.inputrc'
