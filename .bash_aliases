## Neat aliases

# Typo aliases:
alias dc='cd'
alias gti='git'
alias tmux='tmux -2'

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

# Open file
alias open='xdg-open'

# Time wasters:
alias tron='ssh sshtron.zachlatta.com'
alias nethack='ssh nethack@nethack.alt.org'

***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***


***REMOVED***
***REMOVED***

# Other shortcuts
alias ssll='ssh-add -L'
