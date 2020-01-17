## Neat aliases

# Typo aliases:
alias dc='cd'
alias gti='git'
alias tmux='tmux -2'

# VPN
alias sshome='sudo openvpn --config /etc/openvpn/client/sshome.ovpn'
alias sscap='sudo openvpn --config /etc/openvpn/client/capital.ovpn'

# source bashfile
alias rc='source ~/.bashrc'

# Ansible yams alias
alias yams='find . -type f -name "*.yml*" -exec yamllint -f parsable {} \; | sed "s|\./||g" | egrep -v "(\.kitchen/|\[warning\])"'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias cm='git commit -m'
alias glog='git log --oneline --graph --color --all --decorate'

# "Putty"
alias putty='sudo screen /dev/ttyUSB0 9600'

# Open file
alias open='xdg-open'

# Time wasters:
alias tron='ssh sshtron.zachlatta.com'
alias nethack='ssh nethack@nethack.alt.org'

# Other shortcuts
alias ssll='ssh-add -L'

# Ubuntu update and clean
alias update='sudo apt update && sudo apt upgrade'
alias clean='sudo apt autoremove && sudo apt autoclean'

