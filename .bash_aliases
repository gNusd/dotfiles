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
alias music='cd $HOME/mnt/downloads/music'
alias import='cd $HOME/mnt/downloads/imports'
alias bin='cd $HOME/bin'

<<<<<<< HEAD
alias vimrc='$EDITOR $HOME/repositories/dotfiles/.config/nvim/init.vim'
alias tmuxrc='$EDITOR $HOME/repositories/dotfiles/.tmux.conf'
alias bashrc='$EDITOR $HOME/repositories/dotfiles/.bashrc'
alias bashalias='$EDITOR $HOME/repositories/dotfiles/.bash_aliases'
alias inputrc='$EDITOR $HOME/repositories/dotfiles/.inputrc'

alias imclear="rm -rf $HOME/mnt/downloads/imports/*"
alias mvim="mv $HOME/mnt/downloads/music/* $HOME/mnt/downloads/imports && cd $HOME/mnt/downloads/imports"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

=======
alias vimrc='$EDITOR $REPO/local/dotfiles/.config/nvim/init.vim'
alias tmuxrc='$EDITOR $REPO/local/dotfiles/.tmux.conf'
alias bashrc='$EDITOR $REPO/local/dotfiles/.bashrc'
alias bashalias='$EDITOR $REPO/local/dotfiles/.bash_aliases'
alias inputrc='$EDITOR $REPO/local/dotfiles/.inputrc'
>>>>>>> f7715585a38ca5cb33e9bbd50027a38bc78bf13e
