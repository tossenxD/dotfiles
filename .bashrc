# https://wiki.archlinux.org/index.php/Color_Bash_Prompt

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
PS1="\[\e[1;37m\][\[\e[1;33m\]\h\[\e[1;35m\]@\[\$(([[ \$? != 0 ]] && echo '\e[1;31m') || echo '\e[1;32m')\]\u \[\e[1;34m\]\w\[\e[1;37m\]]\[\e[1;34m\]$\[\e[00m\] "
PS2="> "

# Alias
alias ls='ls --color=auto -F'
alias la='ls --color=auto -F -a'
alias ll='ls --color=auto -a -l -F -h'
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'
alias storage="du -h --max-depth=1"

alias fsharpc='mono /bin/FSharp.Compiler.Tools/tools/fsc.exe'
alias fsharpi='mono /bin/FSharp.Compiler.Tools/tools/fsi.exe'
alias ghci='stack exec ghci -- -W'

alias open="xdg-open"
alias nviminit="$EDITOR $HOME/.config/nvim/init.vim"
alias bashrc="$EDITOR $HOME/.bashrc"
alias pdf="$HOME/.scripts/compilelatex.sh"
alias pdfrm="$HOME/.scripts/removepdf.sh"
alias systheme="$HOME/.scripts/changesystemtheme.sh"
alias sysgaps="$HOME/.scripts/set_windows_gap.sh"
alias sysmon="$HOME/.scripts/monitorsetup.sh"
alias syspy="$HOME/.scripts/setpy.sh"
alias weathercow="$HOME/.scripts/weathercow.sh"
alias sysup="sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman -Su --noconfirm"
alias cpf="xsel --clipboard <"
alias untar="tar xvzf"
alias ntar="tar -cvzf"

alias pkgsize="LANG=C pacman -Qi | sed -n '/^Name[^:]*: \(.*\)/{s//\1 /;x};/^Installed[^:]*: \(.*\)/{s//\1/;H;x;s/\n//;p}' | sort -nk2 | grep MiB"

alias wmjava="wmname LG3D"
alias antl="ant; ant -Dlocaltest=true test"
alias ants="ant; ant -Dlocaltest=false test"

alias bs="~/BattleScribe/BattleScribe_2.03.21_Linux/RosterEditor.sh"
