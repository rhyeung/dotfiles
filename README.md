# To manage and sync my dotfiles

## Use dwiw vim distro
https://github.com/mkropat/vim-dwiw2015

```
curl -sS https://raw.githubusercontent.com/mkropat/vim-dwiw2015/master/bootstrap.sh | sh
```

Install silversearcher-ag
```
sudo apt-get install silversearcher-ag
```

## Use spf13 to manage vim
https://github.com/spf13/spf13-vim

Run either:
```
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
```
or
```
sh <(curl https://j.mp/spf13-vim3 -L)
```
## Use tmux git for tmux config
https://github.com/gpakosz/.tmux

```
$ cd
$ git clone https://github.com/gpakosz/.tmux.git
$ ln -s -f .tmux/.tmux.conf
$ cp .tmux/.tmux.conf.local .
```

## Install oh-my-zsh
#### via curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

#### via wget

```shell
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

## Short URL for init script
curl -L http://cli.re/L4wM3p | bash -x

```
#!/usr/bin/env bash

GIT=`which git`
$GIT init --bare $HOME/.cfg
alias config='$GIT --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config config --local core.sparsecheckout false
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
curl -L http://cli.re/6VqMNv | bash -x

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
config config --local core.sparsecheckout false
```
