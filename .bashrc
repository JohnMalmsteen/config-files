# prints remote url
alias rem="git remote -v"

# general shorcut aliases
alias gb="git branch"
alias co="git checkout"
alias cod="git checkout development"

# clears branches with a regex term
# eg if you have a branches called my-new-feature and my-other-feature and you want to remove them both you can just use:
# $ cb my-
# and both will be deleted
alias cb=clearbranches

# pushes to the current branch head
alias po="git push origin `git rev-parse --abbrev-ref HEAD`"

# commit shortcuts
alias ca="git commit -a"
alias cam="git commit -am"

# navigation shortcuts because I'm super lazy
alias u="cd .."
alias uu="cd ../.."
alias uuu="u;uu"
alias 4u="uu;uu"

alias pull="git pull"

# this one is dependant on you keeping your built apps in the ~/webUI directory but you can change that in the webui() function below
alias runwebui=webui

# more shortcuts
alias sta="git status"

# I prefer this to the mac activity monitor
alias procs="top -o cpu"

# ummmm... look into it if you're on a mac
alias trnt="aria2c --seed-time=0"

# makes the process of tying a branch to a jira issue a little easier
# USAGE
# $ gitjira [issue number] [some-string-that-describes-issue (optional)]
alias gitjira=gitjira

# like commit with message but adds the jira issue number if you're on a branch created with gitjira
alias jcom=jiracommit

# dns lookup: eg:
# $ dns google.ie
# > 216.58.207.131
alias dns="dig +short"

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

# awesome fuzzy search function that gives a preview of the first 100 lines of files
alias search="fzf --preview 'head -100 {}'"

# reload this file after you change it so you don't have to reopen the terminal
# mine is actually .zshrc so I take no liability for anything in here that doesn't work :D
alias reload='source ~/.bashrc'
