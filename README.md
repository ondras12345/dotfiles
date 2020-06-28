# dotfiles
This is my personal dotfiles repo.

https://www.atlassian.com/git/tutorials/dotfiles

## Setup
This is how I should be able to recreate the repo. (I was creating it while
reinstalling Windows, so I did it a bit different in order to not have to
boot the old system.)

```
git init --bare $HOME/.dotfiles-repo

alias dotfiles='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'

dotfiles config --local status.showUntrackedFiles no


echo "test -f ~/scripts/aliases.sh && . ~/scripts/aliases.sh" >> $HOME/.bashrc

echo "test -f ~/scripts/environment-vars.sh && .  ~/scripts/environment-vars.sh" >> $HOME/.profile

echo "test -f ~/scripts/bash-config.sh && . ~/scripts/bash-config.sh" >> $HOME/.bashrc

############################
# Only run this on Windows #
############################
echo "test -f ~/scripts/git-bash-agent.sh && . ~/scripts/git-bash-agent.sh" >> $HOME/.bashrc


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

git clone --bare <git-repo-url> $HOME/.dotfiles-repo

dotfiles config --local status.showUntrackedFiles no

# Prevents 'files would be overwritten' error
rm .gitignore

dotfiles checkout


echo "test -f ~/scripts/aliases.sh && . ~/scripts/aliases.sh" >> $HOME/.bashrc

echo "test -f ~/scripts/environment-vars.sh && .  ~/scripts/environment-vars.sh" >> $HOME/.profile

echo "test -f ~/scripts/bash-config.sh && . ~/scripts/bash-config.sh" >> $HOME/.bashrc

############################
# Only run this on Windows #
############################
echo "test -f ~/scripts/git-bash-agent.sh && . ~/scripts/git-bash-agent.sh" >> $HOME/.bashrc


########################
# Only run this on WSL #
########################
echo "test -f ~/scripts/WSL-agent.sh && . ~/scripts/WSL-agent.sh" >> $HOME/.bashrc
```

## Adding files
```
dotfiles add --force virmc
dotfiles commit
dotfiles push
```
.gitignore is set to ignore everything. This is to prevent things such as
`dotfiles add .`. It would start adding the whole ~ (home) directory
recursively. To add a file, use `git add --force file`.

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
