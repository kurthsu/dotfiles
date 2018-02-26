# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:$PATH:/usr/local/bin
# export MANPATH="/usr/local/man:$MANPATH"
export OPENGROK_TOMCAT_BASE=/usr/local/Cellar/tomcat/8.5.8/libexec
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="/usr/local/opt/nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion"  ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/.rvm/bin:$GOPATH/bin
# export ANT_HOME=/usr/local/ant
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export PATH=$PATH:$ANT_HOME/bin

export UMLET_HOME="/Users/kurt/software/Umlet"

# Aliases
alias g='git'

alias ga='git add'
alias gaa='git add --all'

alias gb='git branch'

alias gc='git commit -v'
alias gcm='git commit -m'
alias gc!='git commit -v --amend'
alias gca!='git commit -v -a --amend'

alias gco='git checkout'
alias gcb='git checkout -b'

alias gcp='git cherry-pick'

alias gcl='git clone --recursive'

alias gd='git diff'
alias gdc='git diff --cached'

alias gf='git fetch'
alias gfa='git fetch --all --prune'

alias gre='git rebase'
alias grea='git rebase --abort'
alias grec='git rebase --continue'
alias grei='git rebase -i'

alias gpl='git pull'
alias gps='git push'

alias glg='git log --stat --color'
alias glgg='git log --graph --color'

alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'

alias gs='git status'

alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "--wip--"'

alias gls='git log --shortstat --author="Kurt Hsu" | \
  grep -E "fil(e|es) changed" | awk '\''{files+=$1; inserted+=$4; deleted+=$6; delta+=$4-$6; ratio=deleted/inserted} END \
  {printf "Commit stats:\n- Files changed (total)..  %s\
  - Lines added (total)....  %s\
  - Lines deleted (total)..  %s\
  - Total lines (delta)....  %s\
  - Add./Del. ratio (1:n)..  1 : %s\n", files, inserted, deleted, delta, ratio }'\'' - '
