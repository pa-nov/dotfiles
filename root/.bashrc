#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias e='exit'
alias r='reset'
alias c='clear'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ssh='export TERM=xterm-256color; ssh'
alias qemu-vm='qemu-system-x86_64 -enable-kvm -smp 8 -m 8G -vga virtio -usb -device usb-tablet'

PS1=''
PS1+='\n╭──╴($(tput setaf 9)\u@\h$(tput sgr0)) [$(tput setaf 208)\w$(tput sgr0)]'
PS1+='\n╰╴# '
