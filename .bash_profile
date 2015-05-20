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

alias ls='ls $LS_OPTIONS -GFAh'

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
function gp {
    git push origin $(git rev-parse --abbrev-ref HEAD);
}
alias gl="git log"
alias gs="git status --untracked-files=no"
function ga {
    git add "$1" && gs;
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
alias gd="git difftool"

#####################
# general useful aliases, typos etc.
alias grep="grep --color"
alias sl="ls"
alias cd..="cd .."
alias ...="../.."
alias c="clear"
alias ..='cd ..'
alias ...='cd ../../'
# create parent dir on demand
alias mkdir='mkdir -pv'
alias diff='colordiff'
# Make mount command output pretty and human readable format
alias mount='mount |column -t'
alias h='history'

# set vim as a default editor
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'

alias ports='netstat -tulanp'

alias histg="history | grep"
alias top="htop"
alias myip="curl http://ipecho.net/plain; echo"

alias dt='date "+%F %T"'

alias reload='source ~/.bash_profile'
alias vrc="vim ~/.vimrc"
alias brc="vim ~/.bash_profile"
alias prc="vim ~/.pentadactylrc"

function lsg() {
    ls -al | grep $@
}

function f() {
    find . -iname $@
}

######################
# current project specific

alias cb="cd /Users/tomasz/projects/consumer-barometer"

#################
# sourcing section
# The next line updates PATH for the Google Cloud SDK.
source '/Users/tomasz/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/tomasz/google-cloud-sdk/completion.bash.inc'

#[[ -s ~/.bashrc ]] && source ~/.bashrc`

#.bashrc config
########################
# powerline
function _update_ps1() {
	export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}
export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

############################
# better grep
function nrp { grep -nrw . -e $@ --color; }
function grp { grep -nrI --include="*.py" --exclude="*vendor*" --exclude="*tests*" -E "$1" . --color; }
function grpe { grep -nrI --include="$2" --exclude="*vendor*" --exclude="*tests*" -E "$1" . --color; }

#####################
# better cd, cd and ls
function cd {
    builtin cd "$@" && ls -GFAh;
}

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
