#!/bin/bash
rd=$(pwd)

# ROOT
tmp=$HOME/tmp/backup
if [ ! -e $tmp ]
then
		mkdir -p $tmp
fi

if [ -f $HOME/.bashrc ]
then
		mv $HOME/.bashrc $tmp
fi
ln -s $rd/.bashrc $HOME/

if [ -f $HOME/.bash_aliases ]
then
		mv $HOME/.bash_aliases $tmp
fi
ln -s $rd/.bash_aliases $HOME/

if [ -f $HOME/.inputrc ]
then
		mv $HOME/.inputrc $tmp
fi
ln -s $rd/.inputrc $HOME/

if [ -f $HOME/.profile ]
then
		mv $HOME/.profile $tmp
fi
ln -s $rd/.profile $HOME/

if [ -f $HOME/.tmux.conf ]
then
		mv $HOME/.tmux.conf $tmp
fi
ln -s $rd/.tmux.conf $HOME/


# .config

conf=$HOME/.config

if [ ! -e $conf ]
then
		mkdir $conf
fi

if [ -f $conf/katerc ]
then
		mv $conf/katerc $tmp
fi

if [ -f $conf/katevirc ]
then
		mv $conf/katevirc $tmp
fi

if [ -e $conf/qutebrowser ]
then
		rm -rf $conf/qutebrowser
fi

if [ -e $conf/tridactyl ]
then
		rm -rf $conf/tridactyl
fi

if [ -e $conf/zathura ]
then
		rm -rf $conf/zathura
fi
ln -s $rd/.config/* $conf/

# mozilla
if [ ! -e $HOME/.mozilla ]
then
		mkdir -p $HOME/.mozilla/firefox/current/
fi
if [ ! -e  $HOME/.mozilla/firefox/current/ ]
then
		mkdir -p $HOME/.mozilla/firefox/current/
fi
ln -s $rd/.mozilla/firefox/current/* $HOME/.mozilla/firefox/current/

#.ssh
if [ ! -e $HOME/.ssh ]
then
		mkdir $HOME/.ssh
fi
ln -s $rd/.ssh/ssh_alias $HOME/.ssh/
