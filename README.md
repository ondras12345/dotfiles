# dotfiles
This is my personal dotfiles repo. I only made this repo public to make it
easier for me to clone it on other computers. It is not really intended to be
used by other people, therefore there is no license file. But feel free to use
it if you want. The other reason for not having a license file is that it
would have to be located in the root of my home directory. Also, I'm not sure
if I can license configuration files and what license they should be licensed
under.

The `linux` branch is the new default branch. `master` is the old Windows
stuff and will most likely not be updated at all.

https://www.atlassian.com/git/tutorials/dotfiles


## Setup
This is how I should be able to recreate the repo. (I was creating it while
reinstalling Windows, so I did it a bit different in order to not have to
boot the old system.)

```
git init --bare $HOME/.dotfiles-repo

alias dotfiles='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'

dotfiles config --local status.showUntrackedFiles no

# You will need to update .gitignore to successfuly add a submodule
#dotfiles submodule add whatever .config/whatever
# Do NOT use this:
#dotfiles submodule add whatever ~/.config/whatever  # incorrect
# or you'll have to manually edit .gitmodules and change the absolute path
# to a relative one.

echo "test -f ~/scripts/aliases.sh && . ~/scripts/aliases.sh" >> $HOME/.bashrc

echo "test -f ~/scripts/environment-vars.sh && .  ~/scripts/environment-vars.sh" >> $HOME/.profile

echo "test -f ~/scripts/bash-config.sh && . ~/scripts/bash-config.sh" >> $HOME/.bashrc


########################
# Only run this on WSL #
########################
echo "test -f ~/scripts/WSL-agent.sh && . ~/scripts/WSL-agent.sh" >> $HOME/.bashrc


# commit, add remote, push
```


## Cloning
```
alias dotfiles='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'

echo ".dotfiles-repo" >> .gitignore

git clone --bare https://github.com/ondras12345/dotfiles.git $HOME/.dotfiles-repo

dotfiles config --local status.showUntrackedFiles no

# Prevents 'files would be overwritten' error
rm .gitignore

dotfiles checkout linux

dotfiles submodule update --init --recursive

echo "test -f ~/scripts/aliases.sh && . ~/scripts/aliases.sh" >> $HOME/.bashrc

echo "test -f ~/scripts/environment-vars.sh && .  ~/scripts/environment-vars.sh" >> $HOME/.profile

echo "test -f ~/scripts/bash-config.sh && . ~/scripts/bash-config.sh" >> $HOME/.bashrc


########################
# Only run this on WSL #
########################
echo "test -f ~/scripts/WSL-agent.sh && . ~/scripts/WSL-agent.sh" >> $HOME/.bashrc
```


## Updating
```
dotfiles pull
dotfiles submodule update --init --recursive
```


## Adding files
```
dotfiles add --force virmc
dotfiles commit
dotfiles push
```
.gitignore is set to ignore everything. This is to prevent things such as
`dotfiles add .`. It would start adding the whole ~ (home) directory
recursively. To add a file, use `doftiles add --force file`.

## Operating systems
I use different branches for different operating systems (and devices):
```
master - Windows (Git bash)
linux - Linux
```
Some files (like .tmux.conf) are only present in the `linux` branch, since the
software isn't part of Git bash on Windows.


## Branching
Rebase is probably not a good idea because it would require me to force push
after changing something. Merge and/or cherry-pick should be better.


## Use with fugitive-vim
```
dotfiles config --local core.worktree $HOME
dotfiles config --local core.bare false
GIT_DIR=$HOME/.dotfiles-repo vim +G +only
```

## MISC notes
TODO document this
```
fetch = +refs/heads/*:refs/remotes/origin/*
```
