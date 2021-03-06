ssh-add -K
# Path to your oh-my-zsh installation.
export ZSH=/Users/johnfrizzell/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, brew, git-extras, osx)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

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
alias zshconf="vim ~/.zshrc"
alias vimconf="vim ~/.vimrc"
alias edr="cd ~/webUI/edr/app/client"
alias ide="edr && vim"
alias inv="edr && vim -O investigation/process.ejs investigation/controllers/process.js"
alias unit="edr && grunt test"
alias e2e="cd ~/webUI/e2e-testing"
alias bvt="e2e && mv /Applications/Google\ Chrome.app /Applications/tempchrome && cp -r Google\ Chrome.app /Applications && grunt run-e2e; mv -f /Applications/tempchrome /Applications/Google\ Chrome.app"
alias gd="grunt devsetup"
alias trc="cd ~/webUI/trusteer-rest-client"
alias rem="git remote -v"
alias remb="git ls-remote --heads origin"
alias gb="git branch"
alias co="git checkout"
alias cod="git checkout development"
alias cb=clearbranches
alias po="git push origin `git rev-parse --abbrev-ref HEAD`"
alias ca="git commit -a"
alias cam="git commit -am"
alias u="cd .."
alias uu="cd ../.."
alias uuu="u;uu"
alias 4u="uu;uu"
alias solrdir="cd /usr/local/opt/solr@5.5/server/solr"
alias pull="git pull"
alias runwebui=webui
alias sta="git status"
alias procs="top -o cpu"
alias trnt="aria2c --seed-time=0"
alias gitjira=gitjira
alias jcom=jiracommit
alias dns="dig +short"
alias rhelvm="ssh root@9.162.177.42"
alias ubvm="ssh ibmadmin@9.162.177.28"

gitjira(){
  if [ "$1" ]; then
    str="EDR-$1"
    if [ "$2" ]; then
      str="$str/$2"
    fi
    git checkout -b $str
  else
    echo 'Please use the format $ gitjira [issue#] [name (optional)]'
  fi
}

jiracommit(){
  branchname=`git rev-parse --abbrev-ref HEAD`
  jiraissue=$(echo $branchname| cut -d'/' -f 1)
  commitmessage=$jiraissue
  if [ "$1" ]; then
    commitmessage="$jiraissue $1"
    git commit -am "$commitmessage"
  else
    echo "Please use the format $ jcom [commit message]"
  fi
}

webui(){
    cd ~/webUI
    runapps common login edr etl
}

clearbranches(){
    if [ -z "$1" ]; then
        str="bug/*"
    else
        str=$1
    fi

    git branch -D $(git branch | grep -E $str)

    if [ $? -ne 0 ]; then
        echo No bug branches found
    fi
}

alias find="fzf --preview 'head -100 {}'"
alias search=mysearchfunc

mysearchfunc(){
  if [ -z "$2" ]; then
    dir=.
  else
    dir=$2
  fi
  grep -irl $1 $dir
}

alias reload='source ~/.zshrc'

### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export NVM_DIR="$HOME/.nvm"
export ETL_DIR="$HOME/webUI/etl"
. "$(brew --prefix nvm)/nvm.sh"
