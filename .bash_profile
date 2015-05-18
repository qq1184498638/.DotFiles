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

alias ls='ls $LS_OPTIONS -GF1Ah'

###########################
# git hacking
alias gi="git add --interactive"
alias gc="git commit"
alias gb="git branch"
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

#####################
# general useful aliases, typos etc.
alias sl="ls"
alias cd..="cd .."
alias ...="../.."
alias c="clear"

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
function gp { grep -nrI --include="*.py" --exclude="*vendor*" --exclude="*tests*" -E "$1" . --color; }
function gpe { grep -nrI --include="$2" --exclude="*vendor*" --exclude="*tests*" -E "$1" . --color; }

#####################
# better cd, cd and ls
function cd {
    builtin cd "$@" && ls -GF1Ah;
}
