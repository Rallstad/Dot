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

# Sone shortcuts
alias sone1='ssh adm_perbu1@h1-d-linmgm1.statnett1.no -A'
alias soneo='ssh adm_perbu1@h1-odmz-linmgm1 -A'
alias sss4.test='ssh 10.148.201.201 -A'
alias ess4='ssh h1-t-linmgm1.es.s4.test -A'


alias sssatellite='ssh h1-o-rhss6p1.statnett.no -A'
alias sstower='ssh h1-o-rhat1.statnett.no -A'

# Other shortcuts
alias ssll='ssh-add -L'

# Ubuntu update and clean
alias update='sudo apt update && sudo apt upgrade'
alias clean='sudo apt autoremove && sudo apt autoclean'

