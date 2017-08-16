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
alias vim="stty stop '' -ixoff ; vim"

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/joe/google-cloud-sdk/path.zsh.inc' ]; then source '/home/joe/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/joe/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/joe/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
