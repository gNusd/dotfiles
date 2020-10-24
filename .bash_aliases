#!/bin/bash

alias :q='exit'
alias reload='source $HOME/.bashrc'
alias x='clear'
alias xnvimswap='rm $HOME/.local/share/nvim/swap/*.swp'
alias sysup='sudo apt update && sudo apt upgrade && sudo apt autoremove'
alias vim="nvim"
alias vi="nvim"
alias fwup='sudo fwupd.fwupdmgr update'
alias flatup='sudo flatpak update'

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

# vifm
alias edbin="vifm $HOME/bin/"
alias vifm.="vifm $(pwd)"

# navigation
alias ..='cd ..'
alias ...='cd ../..'

# BEETS & TORRENTS
alias imbeet="beet import $HOME/hämtningar/torrent/imports"
alias imclear="rm -rf $HOME/hämtningar/torrent/imports/*"
alias koski="cd  $HOME/hämtningar/torrent/kowalski && ll"
alias incomp="cd  $HOME/hämtningar/torrent/incomplete && ll"
alias ytflac="youtube-dl --extract-audio --audio-format flac --audio-quality 0"
alias mvim="mv * $HOME/hämtningar/torrent/imports"
alias import="cd $HOME/hämtningar/torrent/imports"
alias mvim="mv $HOME/hämtningar/torrent/kowalski/* $HOME/hämtningar/torrent/imports && cd $HOME/hämtningar/torrent/imports && tree"
alias beim="beet import ."
