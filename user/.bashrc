#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias e='exit'
alias c='clear'

alias ls='ls --color=auto --group-directories-first --literal -v'
alias ssh='TERM=xterm-256color ssh'
alias grep='grep --color=auto'
alias clear='clear && printf "\e[3J"'

alias qemu-base='qemu-system-x86_64 -enable-kvm -smp 8 -m 8G -device usb-tablet -usb'
alias qemu-run='qemu-base -vga virtio'
alias qemu-vm='qemu-base -audiodev pipewire,id=snd -device AC97,audiodev=snd -device virtio-vga-gl -display gtk,gl=on'

PS1='\e[0m'
if (( EUID == 0 )); then
    PS1+='\n╭──╴(\e[91m\u@\h\e[0m) [\e[93m\w\e[0m]'
    PS1+='\n╰╴# '
else
    PS1+='\n╭──╴(\e[94m\u@\h\e[0m) [\e[93m\w\e[0m]'
    PS1+='\n╰╴$ '
fi
alias sudo='sudo '

bind 'set completion-ignore-case on'
