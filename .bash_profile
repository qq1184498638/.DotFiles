alias gi="git add --interactive"
alias ga="git add"
alias gc="git commit"
alias gb="git branch"
alias gs="git status"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/tomasz/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/tomasz/google-cloud-sdk/completion.bash.inc'

#[[ -s ~/.bashrc ]] && source ~/.bashrc`

#.bashrc config
function _update_ps1() {
	export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
