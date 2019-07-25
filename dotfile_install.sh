#!/bin/bash

if [ ! -e $HOME/tmp ]
then
		mkdir $HOME/tmp
fi

if [ -f $HOME/.bashrc ]
then
		mv $HOME/.bashrc $HOME/tmp
fi
ln -s .bashrc $HOME/

if [ -f $HOME/.bash_aliases ]
then
		mv $HOME/.bash_aliases
fi
ln -s .bash_aliases $HOME/

