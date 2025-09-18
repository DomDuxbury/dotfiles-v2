# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gozilla"

source $ZSH/oh-my-zsh.sh

# Put any proprietary or private functions/values in ~/.private, and this will source them
if [ -f $HOME/.private ]; then
  source $HOME/.private
fi

if [ -f $HOME/.profile ]; then
  source $HOME/.profile  
fi

# Source FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias vimf='vim $(fzf -m)'

# Set Up Python Virtualenv Wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code
source /usr/bin/virtualenvwrapper.sh

# Vim Alias
alias vim="stty stop '' -ixoff ; vim"

## Git Aliases
alias gs='git status '
alias ga='git add '
alias gp='git push '
alias gb='git branch '
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

# Pacman Aliases
alias browse='pacman -Ss '
alias install='sudo pacman -S '

## Miscellaneous Aliases
alias ll='ls -a'
alias top='btop'
alias cat='bat'

# Shell Functions
# qfind - used to quickly find files that contain a string in a directory
qfind() {
  find . -exec grep -l -s $1 {} \;
  return 0
}

gre () { 
  rg $1 --json | delta
  return 0
}

qGit() {
  git add -A
  gitmoji -c --title="${1}."
  git push
  return 0
}

gc() {
  gitmoji -c --title="${1}."
  return 0
}

rgv() {
  vim -q <(rg --vimgrep ${1})
}

qPrune() {
  git fetch -p && 
    for branch in `git branch -vv | grep ': gone]' | gawk '{print $1}'`; 
      do git branch -D $branch; 
    done
}

cleanDocker() {
  docker rm $(docker ps -q -a)
  docker rmi $(docker images | grep "none" | awk '/ / { print $3 }')
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/dom/Programs/google-cloud-sdk/path.zsh.inc' ]; then . '/home/dom/Programs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/dom/Programs/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/dom/Programs/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /usr/share/nvm/init-nvm.sh
