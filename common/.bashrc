# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

# Exports
export EDITOR=nvim
export PAGER=less
export LS_COLORS='di=01;37'

# Shopt
shopt -s cmdhist
shopt -s histappend
shopt -s cdspell
shopt -s checkwinsize

# Terminal line
PS1="\[\e[1;37m\][\[\e[1;33m\]\u\[\e[1;35m\]@\[\$(([[ \$? != 0 ]] && echo '\e[1;31m') || echo '\e[1;32m')\]\h \[\e[1;34m\]\w\[\e[1;37m\]]\[\e[1;34m\]$\[\e[00m\] "
PS2="> "

# Alias
alias ls='ls --color=auto -F'
alias la='ls --color=auto -F -a'
alias ll='ls --color=auto -a -l -F -h'
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'
alias storage="du -h --max-depth=1"

alias open="xdg-open"
alias nviminit="$EDITOR $HOME/.config/nvim/init.vim"
alias bashrc="$EDITOR $HOME/.bashrc"
alias syspy="$HOME/.scripts/setpy.sh"
alias weathercow="$HOME/.scripts/weathercow.sh"
alias untar="tar xvzf"
alias ntar="tar -cvzf"

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  alias cpf="wl-copy <"
else
  alias cpf="xsel --clipboard <"
fi
