#zmodload zsh/zprof
###########
# ALIASES #
###########
source $ZDOTDIR/aliases

##############
# COMPLETION #
##############
#autoload -Uz compinit; compinit -C
autoload -Uz zrecompile
autoload -Uz compinit
dump=$ZSH_COMPDUMP

if [[ -s $dump(#qN.mh+24) && (! -s "$dump.zwc" || "$dump" -nt "$dump.zwc") ]]; then
    compinit -i d $ZSH_COMPDUMP
    zrecompile $ZSH_COMPDUMP
fi
compinit -C

_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/completion.zsh

fpath=($ZDOTDIR/plugins/zsh-completions/src $fpath)

# History based completion
setopt HIST_EXPIRE_DUPS_FIRST
# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
setopt NO_BEEP

# Auto-suggestions
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^F' end-of-line

# autopair
source $ZDOTDIR/plugins/zsh-autopair/autopair.zsh
autopair-init

# zowe completion
source $ZDOTDIR/plugins/custom-completion/zowe.bash

# carapace completion
source <(carapace _carapace zsh)

# Angular completion
source <(ng completion script)

compdef _gnu_generic fzf

#######
# VIM #
#######

# Use vi keybindings
#bindkey -v
export KEYTIMEOUT=1

# Use vi mode to scroll through completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Use vim keys in command line
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Text objects
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# Surrounding
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround

##########
# gcloud #
##########

source /home/kobe/Documents/google-cloud-sdk/path.zsh.inc

##########
# ZOXIDE #
##########
eval "$(zoxide init zsh)"

#######################
# SYNTAX HIGHLIGHTING #
#######################
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#############
# FUNCTIONS #
#############
source $ZDOTDIR/functions.zsh

############
# STARSHIP #
############
eval "$(starship init zsh)"
