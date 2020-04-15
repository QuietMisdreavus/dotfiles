#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ `which exa` ]; then
    alias ls=exa
    alias tree="exa --tree"
else
    alias ls="ls -G"
fi

# prompt customization
reset=$(tput sgr0)
cyan=$(tput setaf 14)
blue=$(tput setaf 12)
red=$(tput setaf 9)

function nonzero_return() {
    RETVAL=$?
    [ $RETVAL -ne 0 ] && echo " - $red$RETVAL$reset"
}

# use git's own PS1 utilities instead of rolling our own
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM='auto'
export GIT_PS1_STATESEPARATOR=" "
source ~/bin/git-prompt.sh

export PS1="\n\[$cyan\]\d \T\[$reset\] - \[$blue\]\W\[$reset\]\$(__git_ps1 ' - %s')\`nonzero_return\`\n[\[$cyan\]\u@\h\[$reset\]]\\$ "

# case-insensitive tab completion
bind "set completion-ignore-case on"

# if you've used pushd to create a dir stack, this command cycles from the bottom
alias rotd='pushd -0'

export VISUAL=vim
export EDITOR=$VISUAL

# color highlighting for man pages; from ArchWiki "man page"
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

export PATH="$HOME/.cargo/bin:$HOME/bin:$PATH"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && source "/usr/local/etc/profile.d/bash_completion.sh"
