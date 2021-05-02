#
# .bashrc
#
# https://wiki.archlinux.org/index.php/Color_Bash_Prompt
#

# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

case ${TERM} in
	xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
		;;
	screen)
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
		;;
esac

# sanitize TERM:
safe_term=${TERM//[^[:alnum:]]/?}
match_lhs=""





# Terminal line
[[ -f ~/.colors/.urxvt_colors ]] && match_lhs="${match_lhs}$(<~/.colors/.urxvt_colors)"
[[ -z ${match_lhs} ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)

if [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] ; then

	# we have colors :-)

	# Enable colors for ls, etc. Prefer ~/.dir_colors
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.colors/.urxvt_colors ]] ; then
			eval $(dircolors -b ~/.colors/.urxvt_colors)
		fi
	fi

	PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;37m\][\[\033[01;31m\]\h'; else echo '\[\033[01;37m\][\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w\[\033[01;37m\]]\[\033[01;34m\]\$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "
fi
PS2="> "
PS3="> "
PS4="+ "


export PATH=$PATH:/home/tb/.local/bin


# Alias
alias ls='ls --color=auto -F'
alias ll='ls --color=auto -a -l -F -h'
alias la='ls --color=auto -F -a'
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'
alias open="xdg-open"
alias pdf="~/scripts/compilelatex.sh"
alias pdfrm="~/scripts/removepdf.sh"

shopt -s cmdhist
shopt -s histappend

#neofetch
#echo "meow" | lolcat
#echo "  \    /\    
#   )  ( ')
#  (  /  )
#    \(__)|"
#date | lolcat
