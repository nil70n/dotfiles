#
# ~/.zshrc
#

# Typewritten
fpath=($fpath "/home/nilton/.zfunctions")

# Set typewritten ZSH as a prompt
autoload -U promptinit; promptinit
prompt typewritten

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/nvm/init-nvm.sh
source ~/.aliases
source ~/.paths
source ~/.commands

eval "$(zoxide init zsh)"
