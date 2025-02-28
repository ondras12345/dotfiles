# Source this file from .profile
# test -f ~/scripts/environment-vars.sh && . ~/scripts/environment-vars.sh

export VISUAL="vim"
export EDITOR="$VISUAL"
export LESS="-i -R -W"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"  # needed for lesshst
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export JUPYTER_PLATFORM_DIRS="1"
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite_history"
export OCTAVE_HISTFILE="$XDG_STATE_HOME/octave_hist"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export MPLAYER_HOME="$XDG_CONFIG_HOME/mplayer"

# mv ~/.ipython ~/.config/ipython
# Ipython checks if $XDG_CONFIG_HOME/ipython (or ~/.config/ipython if XDG_CONFIG_HOME is unset) exists, otherwise it uses ~/.ipython

# ~/bin is already set in .profile, but does not work when connecting via SSH.
# ~/.local/bin is needed for pipx.
export PATH="$HOME/bin:/home/ondra/.local/bin:$PATH"

# set in /etc/locale.conf
# but it does not seem to work
export TIME_STYLE=long-iso


test -f ~/scripts/environment-vars-local.sh && . ~/scripts/environment-vars-local.sh
