#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# modestly colored PS1
reset=$(tput sgr0)
cyan=$(tput setaf 14)
blue=$(tput setaf 12)
PS1='[\[$cyan\]\u@\h\[$reset\] \[$blue\]\W\[$reset\]]\$ '

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

export PATH="$HOME/.cargo/bin:$HOME/.gem/ruby/2.5.0/bin:$HOME/bin:$PATH"

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

_sticky() {
    local arg;
    arg=${COMP_WORDS[$COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(ls ${XDG_DATA_HOME:-$HOME/.local/share}/sticky)" -- $arg) )
}
complete -F _sticky sticky visticky

# these environment variables allow me to build old rust-openssl packages, if i install openssl-1.0
export OPENSSL_LIB_DIR=/usr/lib/openssl-1.0 OPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0
