# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gozilla"

source $ZSH/oh-my-zsh.sh

# Put any proprietary or private functions/values in ~/.private, and this will source them
if [ -f $HOME/.private ]; then
  source $HOME/.private
fi

if [ -f $HOME/.profile ]; then
  source $HOME/.profile  # Read Mac .profile, if present.
fi

# Source FZF
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set Up Python Virtualenv Wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code
source $HOME/.local/bin/virtualenvwrapper.sh

# Vim Alias
alias vim="stty stop '' -ixoff ; vimx"

## Git Aliases
alias gs='git status '
alias ga='git add '
alias gp='git push '
alias gb='git branch '
alias gc='git commit -m'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '

## Tmux Aliases
alias tm='tmux a'
alias tms='tmux new-session -A -s'
alias tmk='tmux kill-session -t'

## Miscellaneous Aliases
alias htop='sudo htop'
eval $(thefuck --alias)
alias imdone='git checkout master; deactivate'
alias ipy='python -c "import IPython; IPython.terminal.ipapp.launch_new_instance()"'
# Shell Functions
# qfind - used to quickly find files that contain a string in a directory
qfind () {
  find . -exec grep -l -s $1 {} \;
  return 0
}

qGit () {
  git add -A
  git commit -m $1
  git push
  return 0
}

qPrune () {
  git fetch -p && 
    for branch in `git branch -vv | grep ': gone]' | gawk '{print $1}'`; 
      do git branch -D $branch; 
    done
}
