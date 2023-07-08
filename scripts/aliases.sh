# Source this file from .bashrc
# test -f ~/scripts/aliases.sh && . ~/scripts/aliases.sh

alias dotfiles='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'
alias dotfilesvim='GIT_DIR=$HOME/.dotfiles-repo vim +G +only'
alias dfg='dotfiles'
alias dfv='dotfilesvim'
alias ll='ls -lFah'
alias la='ls -A'
alias t='todo-txt'
alias ts='TODO_SCHOOL=true todo-txt'
#alias fscp='pscp -sftp' # does not seem to use .ssh/config

alias bat='batcat'

# Prevent credentials from leaking trough vim swap and backup files
alias pass='EDITOR=ed pass'

# ask for confirmation before overwriting stuff
alias mv='mv -i'
alias cp='cp -i'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '
alias watch='watch '

# Colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'


# Functions
# Github
clone () {
    git clone "https://github.com/$1"
}

clonemy() {
    clone "ondras12345/$1"
}

ssh-add() {
    if [[ -z $1 ]] ; then
        command ssh-add -t 1h
    else
        command ssh-add "$@"
    fi
}

test -f ~/scripts/aliases-local.sh && . ~/scripts/aliases-local.sh
