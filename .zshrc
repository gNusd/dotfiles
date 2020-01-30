
# Enable colors and change prompt:
# autoload -U colors && colors

# PS1="%B%{$fg[green]%}%n%{$fg[blue]%}@%{$fg[green]%}%M %{$fg[blue]%}%~%{$reset_color%} $%b

[ -f "$HOME/repositories/dotfiles/zsh_promt.conf" ] && source "$HOME/repositories/dotfiles/zsh_promt.conf"
[ -f "$HOME/repositories/dotfiles/zsh_complete.conf" ] && source "$HOME/repositories/dotfiles/zsh_complete.conf"
# [ -f "$HOME/repositories/dotfiles/zsh_color.conf" ] && source "$HOME/repositories/dotfiles/zsh_color.conf"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/repositories/dotfiles/.zsh_alias" ] && source "$HOME/repositories/dotfiles/.zsh_alias"
[ -f "$HOME/repositories/dotfiles/.ssh/ssh_alias" ] && source "$HOME/repositories/dotfiles/.ssh/ssh_alias"

setopt LIST_PACKED             # make completion lists more densely packed
setopt MENU_COMPLETE           # auto-insert first possible ambiguous completion
setopt AUTO_PARAM_SLASH        # tab completing directory appends a slash

export EDITOR=nvim
export VISUAL=nvim
export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
export PATH="$HOME/bin:$HOME/.cargo/bin:/snap/bin:$PATH"

# Load zsh-syntax-highlighting; should be last.
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
