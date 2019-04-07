#!/bin/bash

alias :q='exit'
alias reload='source $HOME/.bashrc'
alias x='clear'
alias xnvimswap=' rm * $HOME/.local/share/nvim/swap/'

alias dotfiles='cd $HOME/repositories/dotfiles && ls -la'
alias config='cd $HOME/.config'
alias repos='cd $HOME/repositories'
alias localbin='cd /usr/local/bin'
alias py='cd $HOME/projects/python'
alias rs='cd $HOME/projects/rust'
alias go='cd $HOME/projects/go'
alias mat='cd $HOME/projects/matsedel'
alias next='cd $HOME/nextcloud'
alias doc='cd $HOME/nextcloud/dokument'
alias notes='cd $HOME/nextcloud/notes'

alias vimrc='$EDITOR $HOME/repositories/dotfiles/.config/nvim/init.vim'
alias tmuxrc='$EDITOR $HOME/repositories/dotfiles/.tmux.conf'
alias bashrc='$EDITOR $HOME/repositories/dotfiles/.bashrc'
alias bashalias='$EDITOR $HOME/repositories/dotfiles/.bash_aliases'
