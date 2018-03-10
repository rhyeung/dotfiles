# Manages my dotfiles

## Short URL for init script
http://bit.do/cfg-init-sh

```
#!/usr/bin/bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config config --local core.sparsecheckout true
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```
## Add commit ignore files
Add lines to .gitignore
```
#Patterns to ignore
.vim/bundle/*
.vim/bundle/Vundle.vim/.git
README.md

#Patterns not ignored
!.vim/bundle/Vundle.vim
```
## Short URL for install script
http://bit.do/cfg-install-sh

```
#!/usr/bin/env bash

GIT=`which git`
$GIT clone --bare git@github.com:rhyeung/dotfiles.git $HOME/.cfg
function config {
   $GIT --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config --local status.showUntrackedFiles no
config config --local core.sparsecheckout true
```

## Add pull ignore files
Add lines to .cfg/info/sparse-checkout
```
/*
!README.md
```


