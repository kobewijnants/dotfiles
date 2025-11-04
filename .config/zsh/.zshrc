#zmodload zsh/zprof
###########
# GENERAL #
###########
export ZDOTDIR="${ZDOTDIR:-$HOME/.config/zsh}"
export KEYTIMEOUT=1
setopt autocd nomatch interactive_comments

#########
# ZINIT #
#########
source "${ZDOTDIR}/zinit/bin/zinit.zsh"

# Core plugins — fast and async loading
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' zsh-users/zsh-completions

zinit wait lucid for \
  Aloxaf/fzf-tab \
  hlissner/zsh-autopair \
  jeffreytse/zsh-vi-mode

##############
# COMPLETIONS #
##############
autoload -U compinit && compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
_comp_options+=(globdots)
source "${ZDOTDIR}/completions.sh"
# cache completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.config/zsh/cache
# show description in completion menu
zstyle ':completion:*:descriptions' format '%B%d%b'
# better sorting
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# enable preview in fzf-tab
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:complete:*' fzf-preview 'less ${(Q)realpath}'

###########
# KEYBINDS #
###########
bindkey '^F' end-of-line
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Vi-style navigation for completions
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Quick edit command line with vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

##############
# HIST & MISC #
##############
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_EXPIRE_DUPS_FIRST HIST_VERIFY APPEND_HISTORY NO_BEEP

##########
# GCLOUD #
##########
source /home/kobe/Documents/google-cloud-sdk/path.zsh.inc 2>/dev/null || true

##########
# ZOXIDE #
##########
eval "$(zoxide init zsh)"

##########
# STARSHIP #
##########
eval "$(starship init zsh)"

##########
# ALIASES #
##########
[[ -f $ZDOTDIR/aliases ]] && source $ZDOTDIR/aliases

##########
# FZF #
##########
# Adds fzf fuzzy completion and keybindings if installed
if command -v fzf >/dev/null; then
  [[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
fi
