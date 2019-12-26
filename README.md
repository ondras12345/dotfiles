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

echo "\
alias dotfiles='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'" \
>> $HOME/.bashrc

dotfiles config --local status.showUntrackedFiles no

# commit, add remote, push
```

## Cloning
```
alias dotfiles='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'

echo "\
alias dotfiles='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'" \
>> $HOME/.bashrc

echo ".dotfiles-repo" >> .gitignore

git clone --bare <git-repo-url> $HOME/.dotfiles-repo

dotfiles config --local status.showUntrackedFiles no

dotfiles checkout
```

## Adding files
```
dotfiles add .virmc
dotfiles commit
dotfiles push
```
**WARNING**: Do not do things such as `dotfiles add .`. I haven't tested it,
but I think it would start adding the whole ~ (home) directory recursively.
