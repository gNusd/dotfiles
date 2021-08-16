#!/bin/bash

alias :q='exit'
alias reload='source $HOME/.bashrc'
alias x='clear'
alias xnvimswap='rm $HOME/.local/share/nvim/swap/*.swp'
alias sysup='sudo apt update && sudo apt upgrade && sudo apt autoremove'

alias dotfiles='cd $HOME/repositories/dotfiles && ls -la'
alias config='cd $HOME/.config'
alias repos='cd $HOME/repositories'
alias localbin='cd /usr/local/bin'

alias vimrc='$EDITOR $HOME/repositories/dotfiles/.config/nvim/init.vim'
alias tmuxrc='$EDITOR $HOME/repositories/dotfiles/.tmux.conf'
alias bashrc='$EDITOR $HOME/repositories/dotfiles/.bashrc'
alias bashalias='$EDITOR $HOME/repositories/dotfiles/.bash_aliases'
alias inputrc='$EDITOR $HOME/repositories/dotfiles/.inputrc'
