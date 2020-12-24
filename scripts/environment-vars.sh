# Source this file from .profile
# test -f ~/scripts/environment-vars.sh && . ~/scripts/environment-vars.sh

export VISUAL="vim"
export EDITOR="$VISUAL"
export LESS="-i -R -W"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

export TIME_STYLE=long-iso
