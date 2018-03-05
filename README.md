# Manages my dotfiles

## Short URL
http://bit.do/cfg-init-sh

```
#!/usr/bin/bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config config --local core.sparsecheckout true
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

## Add pull ignore files
Add lines to .cfg/info/sparse-checkout
```
/*
!README.md
```

```
git clone --bare git@github.com:rhyeung/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
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
