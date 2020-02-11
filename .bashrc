# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color ) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# LIES, COLOR IS BETTER!
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # Had to put escaped brackets on either side of the actual text that will be shown in the prompt. 
    # As a result, it looks more complicated with all the \[ and \]
    # Start of prompt up to last command check:
    PS1="\[\e[0;31m\]┌──\[[\e[m\]"
    # Check last command, print green check or red cross:
    PS1+="\`if [ \$? = 0 ]; then echo \[\e[32m\]✔ \[\e[0m\]; else echo \[\e[31m\]❌ \[\e[0m\]; fi\`"
    # Finish the bracket for the last command sign, then start user bracket :
    PS1+="\[\e[0;31m\]]──[\[\e[0m\]"
    # If root, red username, else green?
    PS1+="\`if [[ ${EUID} == 0 ]]; then echo \[\e[31m\]\u\[\e[0m\]; else echo \[\e[32m\u\[\e[0m\]; fi\`"
    # Follow with @ sign, yellow
    PS1+="\[\e[01;33m\]@\[\e[m\]"
    # Hostname follows in cyan 
    PS1+="\[\e[0;36m\]\h\[\e[m\]"
    # Finish user bracket, add spacing and start path bracket
    PS1+="\[\e[0;31m\]]─[\[\e[m\]"
    # Path in green(?)
    PS1+="\[\e[0;32m\]\w\[\e[m\]"
    # Finish path bracket, newline, symbol and prompt
    PS1+="\[\e[0;31m\]]\n└──\[\e[m\] \$ "
else
    PS1='┌──[\u@\h]─[\w]\n└── \$ '
fi

# Set 'man' colors
if [ "$color_prompt" = yes ]; then
	man() {
	env \
	LESS_TERMCAP_mb=$'\e[01;31m' \
	LESS_TERMCAP_md=$'\e[01;31m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_se=$'\e[0m' \
	LESS_TERMCAP_so=$'\e[01;44;33m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[01;32m' \
	man "$@"
	}
fi

unset color_prompt force_color_prompt

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Computer spesific aliases, not stored on github for whatever reasons
# Stored locally in .bash_alias, and that is .gitignore'd

if [ -f ~/.bash_alias ]; then
    . ~/.bash_alias
fi

# Environment variables, and function used generally.
if [ -f $HOME/.bash_exports ]; then
    . $HOME/.bash_exports
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

