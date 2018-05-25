# General aliases
## dotfiles alias
GIT=`which git`
alias config='$GIT --git-dir=$HOME/.cfg/ --work-tree=$HOME'

## tmux
alias tmux='tmux -2'

## Fix terminal if messed up
alias fix='reset; stty sane; tput rs1; clear; echo -e "\033c"'

## Fix sudo root path
alias sudo='sudo env "PATH=$PATH"'
