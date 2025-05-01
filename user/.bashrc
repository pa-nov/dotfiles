#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ls='LC_ALL=C ls --color=auto --group-directories-first'
alias ssh='TERM=xterm-256color ssh'
alias grep='grep --color=auto'

alias qemu-base='qemu-system-x86_64 -enable-kvm -smp 8 -m 8G -usb -device usb-tablet'
alias qemu-run='qemu-base -vga virtio'
alias qemu-vm='qemu-base -audiodev pipewire,id=snd -device AC97,audiodev=snd -device virtio-vga-gl -display gtk,gl=on'

alias clear='clear && printf "\e[3J"'
alias sudo='sudo '
alias c='clear'
alias e='exit'

PS1='\e[0m'
if [[ "$EUID" == "0" ]]; then
    PS1+='\n╭──╴(\e[91m\u@\h\e[0m) [\e[93m\w\e[0m]'
    PS1+='\n╰╴# '
else
    PS1+='\n╭──╴(\e[94m\u@\h\e[0m) [\e[93m\w\e[0m]'
    PS1+='\n╰╴$ '
fi
