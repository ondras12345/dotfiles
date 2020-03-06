# Source this file from .bashrc
# test -f ~/scripts/aliases.sh && . ~/scripts/aliases.sh


alias dotfiles='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'
alias ll='ls -la'

# https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

# Colors
#alias grep='grep --color=auto'


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
