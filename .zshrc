eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/tokyo.json)"

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
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::gcloud
zinit snippet OMZP::command-not-found
zinit snippet OMZP::ansible
zinit snippet OMZP::rust
zinit snippet OMZP::thefuck
zinit snippet OMZP::dotnet

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

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
alias vim='nvim'
alias c='clear'
alias df='duf'
alias du='dust'
alias cat='bat'
alias cd='z'
alias v='nvim'

# Shell integrations
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Environment variables
export EDITOR=nvim

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/kobe/google-cloud-sdk/path.zsh.inc' ]; then . '/home/kobe/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/kobe/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/kobe/google-cloud-sdk/completion.zsh.inc'; fi
