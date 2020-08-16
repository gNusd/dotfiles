#!/bin/bash

alias :q='exit'
alias reload='source $HOME/.bashrc'
alias x='clear'
alias xnvimswap='rm $HOME/.local/share/nvim/swap/*.swp'
alias pkupdate='sudo apt refresh -p && sudo apt update -p && sudo apt autoremove'
alias vim="nvim"
alias vi="nvim"

alias dotfiles='cd $HOME/repositories/dotfiles && ls -la'
alias config='cd $HOME/.config'
alias repos='cd $HOME/repositories'
alias localbin='cd /usr/local/bin'
alias bin="cd $HOME/bin"

alias vimrc='$EDITOR $HOME/repositories/dotfiles/.config/nvim/init.vim'
alias tmuxrc='$EDITOR $HOME/repositories/dotfiles/.tmux.conf'
alias bashrc='$EDITOR $HOME/repositories/dotfiles/.bashrc'
alias bashalias='$EDITOR $HOME/repositories/dotfiles/.bash_aliases'
alias inputrc='$EDITOR $HOME/repositories/dotfiles/.inputrc'


# BEETS & TORRENTS
alias imbeet="beet import $HOME/hämtningar/torrent/complete/imports"
alias imclear="rm -rf $HOME/hämtningar/torrent/complete/imports/*"
alias comp="cd  $HOME/hämtningar/torrent/complete && ll"
alias incomp="cd  $HOME/hämtningar/torrent/incomplete && ll"

