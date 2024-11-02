zmodload zsh/zprof
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

if [[ -r "/home/kobe/.config/zi/init.zsh" ]]; then
  source "/home/kobe/.config/zi/init.zsh" && zzinit
fi

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# Add zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
bindkey '^f' autosuggest-accept
zinit light Aloxaf/fzf-tab

zinit wait lucid for \
    OMZP::git          \
    OMZP::sudo          \
    OMZP::gcloud        \
    OMZP::rust          \
    OMZP::kubectl       \
    OMZP::tmux          \
    OMZP::kitty         \
    OMZP::docker-compose


# Load completions
zstyle ':completion:*' rehash true
autoload -Uz compinit && compinit -i

# Carapace integration for Zsh
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
if command -v carapace &>/dev/null; then
    eval "$(carapace _carapace)"
    source <(carapace _carapace zsh)
fi

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt inc_append_history
setopt hist_reduce_blanks
setopt extended_history

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -all $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa -all $realpath'

# Aliases
alias ls='exa --icons'
alias ll='exa --icons --long'
alias la='exa --icons --long --all'
alias lt='exa --icons --long --all --tree --level=2'
alias c='clear'
alias cat='bat'
alias cd='z'
alias v='nvim'
alias aiderls="find . -type f | git check-ignore --stdin -v -n | grep '^::' | cut -f2- | sed 's|^\./||'"

# Shell integrations
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Environment variables
export EDITOR=nvim

export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Make kitty work better with zsh
export KITTY_SHELL_INTEGRATION="enabled"
autoload -Uz -- /home/kobe/.config/kitty/kitty-integration; kitty-integration; unfunction kitty-integration

# Google Cloud SDK
if [ -f '/home/kobe/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/kobe/Downloads/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/kobe/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/kobe/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PATH=$PATH:/home/kobe/.spicetify

export PATH=$PATH:/home/kobe/.local/bin

zinit cdreplay -q

# Load custom API configurations
[ -f $HOME/.zshrcAPI ] && source $HOME/.zshrcAPI

eval "$(starship init zsh)"
eval "$(gh copilot alias -- zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/kobe/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/kobe/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/kobe/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/kobe/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
