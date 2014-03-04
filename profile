#!/bin/bash
export PATH=~/bin:/usr/local/bin:$PATH
export EDITOR='subl -w -n'
alias edit='$EDITOR'
alias ls='ls -G -h'
export PS1='\[\033]0;$MSYSTEM:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[31m\]\[\033[0m\]\n$ '
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
. `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi
if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
    . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
	export PS1='\[\033]0;$MSYSTEM:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[31m\]$(__git_ps1)\[\033[0m\]\n$ '
fi
