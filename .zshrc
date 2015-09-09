# Path to your oh-my-zsh installation.
export ZSH=/Users/tomasz/.oh-my-zsh

if [[ $(uname) = 'Darwin' ]]; then
    IS_MAC=1
fi

if [[ -x `which brew` ]]; then
    HAS_BREW=1
fi

if [[ -x `which yum` ]]; then
    HAS_YUM=1
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME=pygmalion

#alias zrc="vim ~/.zshrc"
#alias zenv="vim ~/env.sh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=50

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 #COMPLETION_WAITING_DOTS="true"

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

plugins=(colored-man colorize github vagrant virtualenv pip python brew osx zsh-syntax-highlighting)

# User configuration

export PATH="/Users/tomasz/google-cloud-sdk/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/usr/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
#export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi
#export EDITOR=/usr/local/bin/vim
export EDITOR=/usr/bin/vim
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# suffix aliases for quicker files editing
alias -s xml='vim'
alias -s js='vim'
alias -s py='vim'
alias -s html='vim'
alias -s json='vim'
alias -s report='vim'
alias -s conf='vim'
alias -s md='vim'
alias -s less='vim'
alias -s sass='vim'
alias -s css='vim'
alias -s scss='vim'
alias -s tex='vim'
alias -s yml='vim'
alias -s yaml='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###################################################
######################
# TODO SECTION
# start using zsh

#################
# nice ls, with colors
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;37m\]" #change this for letter colors
HII="\[\033[0;31m\]" #change this for letter colors
SI="\[\033[0;33m\]" #this is for the current directory
IN="\[\033[0m\]"

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    eval `dircolors ~/.dir_colors`
fi

#alias ls='ls $LS_OPTIONS -GFAh'
alias ls='ls -GFh'

alias sss="ssh"

###########################
# git hacking
alias gi="git add --interactive"
alias gc="git commit"
#alias gb="git branch"
function gb {
    #git branch "$1";
    if [ -z $1 ]; then
        #echo "var is unset";
        git branch
    else
        #echo "var is set to '$var'"; fi
        git branch "$@"
    fi
}
function gck {
    git checkout "$@"
}
# typo
alias gch="gck"
function gp {
    git push origin $(git rev-parse --abbrev-ref HEAD);
}
function gpf {
    git push -f origin $(git rev-parse --abbrev-ref HEAD);
}
function gdd {
    git diff HEAD~1 "$@"
}

# typo
alias pg="gp"
alias gl="git log"
alias glp="git log --pretty=oneline"
alias gs="git status --untracked-files=no"
alias gsu="git status"
function ga {
    git add "$1" && gs;
}
alias gsn='git status | grep "new file:"'

if [ -f ~/.git-completion.zsh ]; then
  . ~/.git-completion.zsh
fi
alias gd="git difftool"
alias pll="git pull"

alias git_update="git add -u"
function gu {
    git_update "$@" && gs;
}
alias grh_="git reset HEAD"
function grh {
    grh_ "$@" && gs;
}

alias glm="git diff --name-only HEAD HEAD~1"
alias grv="git remote -v"

# curiosities
# gsh shows the number of commits for the current repos for all developers
alias gsh="git shortlog | grep -E '^[ ]+\w+' | wc -l"

# gu shows a list of all developers and the number of commits they've made
alias gun="git shortlog | grep -E '^[^ ]'"

#####################
# general useful aliases, typos etc.
alias grep="grep --color"
alias sl="ls"
alias cd..="cd .."
alias ...="../.."
alias ..='cd ..'
alias ...='cd ../../'
# create parent dir on demand
alias mkdir='mkdir -pv'
alias diff='colordiff'
# Make mount command output pretty and human readable format
alias mount='mount |column -t'
alias h='history'


# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
alias p='ping google.pl'

alias ports='netstat -tulanp'

alias histg="history | grep"
alias top="htop"
alias myip="curl http://ipecho.net/plain; echo"

alias dt='date "+%F %T"'

alias reload='source ~/.zshrc'
alias vrc="vim ~/.vimrc"
alias brc="vim ~/.bash_profile"
alias zrc="vim ~/.zshrc"
alias prc="vim ~/.pentadactylrc"
alias n="vim ~/.notepad"

alias df="df -h"
alias du='du -h -c'         # Calculate total disk usage

# TODO - make sure it works also recursively
alias pycclean='find . -name "*.pyc" -exec rm {} \;'

ips () {
    # determine local IP address
    ifconfig | grep "inet " | awk '{ print $2 }'
}

function lsg() {
    ls -al | grep $@
}

function f() {
    find . -iname $@
}
#function f() { find . -iname "*$1*" ${@:2} }

# ksdiff, Kaleidoscope
function ksd() {
  ksdiff $@
}


alias edit="vim"
alias vi="vim"
# set vim as a default editor
alias svi='sudo vi'
alias edit='vim'
alias vi=vim
alias vis='vim "+set si"'
alias v="vim"
#function v {
    #vim "$@" && ls;
#}

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# allows you to type Bash style comments on your command line
# good 'ol Bash
setopt interactivecomments

# Zsh has a spelling corrector
setopt CORRECT

######################
# current project specific

# Consumer Barometer
alias cb="cd /Users/tomasz/projects/consumer-barometer"

# First-react-fluxible
alias ffr="cd ~/projects/nodejs/first-react-fluxible"

# RARE
alias ra="/Users/tomasz/projects/rare"
alias rec="npm run js && npm run css && npm run cdn && nodemon"
alias nm="npm run cdn && nodemon"
alias njs="npm run js"
alias ncs="npm run css"
alias nim="gulp images"

export LOCAL_DEV=True
alias sds="python manage.py runserver 0.0.0.0:8080"

# -------------------------------------------------------------------
# Python virtualenv
# -------------------------------------------------------------------
alias mkenv='mkvirtualenv'
alias on="workon"
alias off="deactivate"

#################
# sourcing section
# The next line updates PATH for the Google Cloud SDK.
#source '/Users/tomasz/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
#source '/Users/tomasz/google-cloud-sdk/completion.bash.inc'

#[[ -s ~/.bashrc ]] && source ~/.bashrc`

#.bashrc config
########################
# powerline
#function _update_ps1() {
	#export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
#}
#export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

############################
# better grep
function nrp { grep -nrw . -e $@ --color; }
function grp { grep -nrI --include="*.py" --include="*.json" --include="*.js" --include="*.jsx" --include="*.scss" --include="*.sass" --exclude="*public*" --exclude="*vendor*" --exclude="*tests*" --exclude="*node_modules*" -E $@ . --color; }
function grpe { grep -nrI --include="$2" --exclude="*vendor*" --exclude="*tests*" -E "$1" . --color; }
#function r() { grep "$1" ${@:2} -R . }

#####################
# better cd, cd and ls
#function cd {
    #builtin cd "$@" && ls -GFAh;
#}
function mcd {
    mkdir $1 && cd $1;
}

function cp {
    mkdir `dirname $2` && /bin/cp "$1" "$2";
}
#function mkcd() { mkdir -p "$@" && cd "$_"; }

######################
## decompress anything

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

PATH="/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/tomasz/eb/macosx/python2.7/:$PATH"
export USER_NAME="Tomasz"
##################################################

setopt no_beep # don't beep on error

setopt auto_cd # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there

if [[ $IS_MAC -eq 1 ]]; then
    # view man pages in Preview
    pman() { ps=`mktemp -t manpageXXXX`.ps ; man -t $@ > "$ps" ; open "$ps" ; }
fi


# -------------------------------------------------------------------
# (s)ave or (i)nsert a directory.
# -------------------------------------------------------------------
s() { pwd > ~/.save_dir ; }
i() { cd "$(cat ~/.save_dir)" ; }

# HISTORY
HISTSIZE=10000
SAVEHIST=9000
HISTFILE=~/.zsh_history

#preexec() { ODIR="$(pwd)" }
#precmd() { [[ "$(pwd)" != $ODIR ]] && ls -GFh; }

#function chpwd() {
    #ls;
#}

function my_special_chpwd_function() {
    ls
}
chpwd_functions=(${chpwd_functions[@]} "my_special_chpwd_function")

#function my_special_vim_function() {
    #ls
#}
#vim_functions=(${vim_functions[@]} "my_special_vim_function")

alias mk="mkdir -pv"

HISTFILE=~/.bash_history
#set -o history             # enable history

#macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export DISPLAY=:0.0

#postgresql
PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
