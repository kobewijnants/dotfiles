export DOTFILES="$HOME/dotfiles"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"

# Editor
export EDITOR="nvim"
export DIFFPROG="nvim -d"
export VISUAL="nvim"

# Zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_COMPDUMP="${ZDOTDIR}/.zcompdump"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# Man pages
export MANPAGER='nvim +Man!'

# PATH
export PATH="$PATH:$HOME/.npm-global/bin"
