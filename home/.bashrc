#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1=''
PS1+='\n╭──╴($(tput setaf 33)\u@\h$(tput sgr0)) [$(tput setaf 208)\w$(tput sgr0)]'
PS1+='\n╰╴$ '
