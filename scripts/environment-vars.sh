# Source this file from .profile
# test -f ~/scripts/environment-vars.sh && . ~/scripts/environment-vars.sh

export VISUAL="vim"
export EDITOR="$VISUAL"
export LESS="-i -R -W"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

# already set in .profile, but does not work when connecting via SSH:
export PATH="$HOME/bin:$PATH"

# set in /etc/locale.conf
# but it does not seem to work
export TIME_STYLE=long-iso
