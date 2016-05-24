#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

# vim is my editor, let programs know that
export EDITOR=vim
export VISUAL=$EDITOR

# modestly colored PS1
reset=$(tput sgr0)
cyan=$(tput setaf 14)
blue=$(tput setaf 12)
PS1='[\[$cyan\]\u@\h\[$reset\] \[$blue\]\W\[$reset\]]\$ '

# case-insensitive tab completion
bind "set completion-ignore-case on"

# Keychain is my SSH Agent, I close/open terminals often
eval $(keychain --eval --quiet)

# pipe into/out of the X clipboard
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

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
