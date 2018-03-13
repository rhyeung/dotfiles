# To manage and sync my dotfiles

## Using spf13 for vim
https://github.com/spf13/spf13-vim

Run either:
```
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
```
or
```
sh <(curl https://j.mp/spf13-vim3 -L)
```

## Short URL for init script
http://bit.ly/cfg-init-sh

```
#!/usr/bin/env bash

GIT=`which git`
$GIT init --bare $HOME/.cfg
alias config='$GIT --git-dir=$HOME/.cfg/ --work-tree=$HOME'
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
http://bit.ly/cfg-install-sh

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
