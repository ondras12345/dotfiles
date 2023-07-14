# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=~/.config/zsh

# fall back if oh-my-zsh is not installed
if [ ! -f $ZSH/oh-my-zsh.sh ] ; then
    source $ZSH_CUSTOM/zshrc.orig
    return
fi

# load custom autocomplete definitions
fpath[1,0]="$ZSH_CUSTOM/completion"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# criteria:
# - $? [127] (or at least red)
# - clock
# - does not get garbled with timer
# - shows hostname
#ZSH_THEME="robbyrussell"
#ZSH_THEME="amuse"  # needs powerline fonts, does not show hostname, no $?
#ZSH_THEME="gentoo"
#ZSH_THEME="essembeh"  # $? overwritter by timer, no clock, too litle visual separation
#ZSH_THEME="dst"  # does not like timer, weird $? (FAIL)
#ZSH_THEME="daveverwer"  # no clock, no $?
#ZSH_THEME="aussiegeek"  # 12-hour clock, no $?
ZSH_THEME="dracula"
if [ ! -f $ZSH_CUSTOM/themes/dracula/dracula.zsh-theme ] ; then
    ZSH_THEME="robbyrussell"
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    vi-mode
    #git  # too many aliases...
    # TODO tmux
    vim-interaction
    timer
    zsh-autosuggestions
    zsh-history-substring-search
    zsh-syntax-highlighting
)

TIMER_THRESHOLD=1

# vi-mode
VI_MODE_SET_CURSOR=true

bindkey '^ ' autosuggest-accept
#bindkey '^M' autosuggest-execute
bindkey '^f' forward-word

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

source $ZSH/oh-my-zsh.sh

# User configuration

# Longer history
HISTFILE=~/.histfile
# TODO move HISTFILE to a XDG directory ??
# https://wiki.archlinux.org/title/XDG_Base_Directory
# Would require adding an automatic migration to prevent loss of history.
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS

# Reduce KEYTIMEOUT.
# Without this, it would be impossible to quickly <esc>/ to enter search mode.
# This breaks vv (open Vim), but I think it still is worth it.
# TODO https://github.com/ohmyzsh/ohmyzsh/tree/fe4b5659863c388786986d70fa6d1bb66b00afb6/plugins/vi-mode#low-keytimeout
KEYTIMEOUT=1


# Dracula theme config
DRACULA_DISPLAY_TIME=1
DRACULA_TIME_FORMAT="%-H:%M:%S"
DRACULA_DISPLAY_FULL_CWD=1
DRACULA_DISPLAY_CONTEXT=1
DRACULA_DISPLAY_NEW_LINE=1
DRACULA_ARROW_ICON="$ "

# put pipestatus in prompt
PIPESTATUS_PROMPT='$(stat=($PREV_PIPESTATUS); [ ${(j::)stat} -ne 0 ] && echo " %{$fg[red]%}[${(j:|:)stat}]")' #%{$reset_color%}'
PROMPT=${PROMPT//\$DRACULA_GIT_STATUS/\$DRACULA_GIT_STATUS$PIPESTATUS_PROMPT}
prompt_pipestatus() {
    PREV_PIPESTATUS=("${pipestatus[@]}")
}
add-zsh-hook precmd prompt_pipestatus

# override context - always display hostname
dracula_context() {
    if (( DRACULA_DISPLAY_CONTEXT )); then
        echo '%n@%m '
    fi
}

# command_not_found fix
if grep -s -q -- '--no-failure-msg' /etc/zsh_command_not_found ; then
    # cp /etc/zsh_command_not_found ~/.config/zsh/
    # sed -i 's/--no-failure-msg //' ~/.config/zsh/zsh_command_not_found
    if [ -f ~/.config/zsh/zsh_command_not_found ] ; then
        source ~/.config/zsh/zsh_command_not_found
    fi
else
    if [ -f /etc/zsh_command_not_found ] ; then
        source /etc/zsh_command_not_found
    fi
fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Override vi-mode cursor shapes.
# Programs like htop & orpie would default to blinking block.
# This changes it to solid line.
function zle-line-finish() {
    typeset -g VI_KEYMAP=main
    (( ! ${+terminfo[rmkx]} )) || echoti rmkx
    _vi-mode-set-cursor-shape-for-keymap viins  # was "default" (blinking block)
}
zle -N zle-line-finish

if [ -f ~/scripts/aliases.sh ] ; then
    source ~/scripts/aliases.sh
fi

if [ -f "$ZSH_CUSTOM/zshrc-local" ] ; then
   source "$ZSH_CUSTOM/zshrc-local"
fi
