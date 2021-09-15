##/**************************************************************/
#/*                            _               _               */
#/*   __ _ _ __  _   _ ___    | |__   __ _ ___| |__  _ __ ___  */
#/*  / _` | '_ \| | | / __|   | '_ \ / _` / __| '_ \| '__/ __| */
#/* | (_| | | | | |_| \__ \  _| |_) | (_| \__ \ | | | | | (__  */
#/*  \__, |_| |_|\__,_|___/ (_)_.__/ \__,_|___/_| |_|_|  \___| */
#/*  |___/                                                     */
#/**************************************************************/

# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

##
## TMUX auto attach
##
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then      # if this is an SSH session
    if which tmux >/dev/null 2>&1; then                 # check if tmux is installed
            if [[ -z "$TMUX" ]] ;then                   # do not allow "tmux in tmux"
                    ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )"    # get the id of a deattached session
                    if [[ -z "$ID" ]] ;then                                 # if not available create a new one
                            tmux new-session
                    else
                            tmux attach-session -t "$ID"                    # if available, attach to it
                    fi
            fi
    fi
fi

# color man-pages
export PAGER='less'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; history -a; history -c; history -r}"

#  check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

source $HOME/.local/git/local/scripts/git-promt_bash.sh

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

<<<<<<< HEAD
if [ -f $HOME/.local/git/local/dotfiles/.bash_aliases ]; then
    . $HOME/.local/git/local/dotfiles/.bash_aliases
=======
if [ -f $HOME/repositories/dotfiles/.bash_aliases ]; then
    . $HOME/repositories/dotfiles/.bash_aliases
>>>>>>> e6d334818396378d0e17a5883bfd6577c6424c70
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export EDITOR=nvim
export VISUAL=nvim
export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
<<<<<<< HEAD
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:/snap/bin:$PATH"

source $HOME/.local/git/local/dotfiles/.ssh/alias.ssh
. "$HOME/.cargo/env"
=======
export PATH="$HOME/bin:$HOME/.cargo/bin:/snap/bin:$PATH"

[ -f $HOME/repositories/.ssh/alias.ssh ] && source ~$HOME/repositories/.ssh/alias.ssh
>>>>>>> e6d334818396378d0e17a5883bfd6577c6424c70
