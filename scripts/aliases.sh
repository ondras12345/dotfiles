# Source this file from .bashrc
# test -f ~/scripts/aliases.sh && . ~/scripts/aliases.sh


alias dotfiles='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'
alias ll='ls -la'

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
