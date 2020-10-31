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
[[ -f ~/.dir_colors ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs} ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)

if [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] ; then

	# we have colors :-)

	# Enable colors for ls, etc. Prefer ~/.dir_colors
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;37m\][\[\033[01;31m\]\h'; else echo '\[\033[01;37m\][\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w\[\033[01;37m\]]\[\033[01;34m\]\$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "
fi


#PS1='[\u@\h \W]\$ '
PS2="> "
PS3="> "
PS4="+ "





# Alias
alias ls='ls --color=auto'
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'
alias cat="bat"
alias open="xdg-open"

alias spt="$HOME/Scripts/launchspt"
alias setm="$HOME/Scripts/setup_monitors"

shopt -s cmdhist
shopt -s histappend


neofetch
echo "meow" | lolcat
echo "  \    /\    
   )  ( ')
  (  /  )
    \(__)|"
date | lolcat
