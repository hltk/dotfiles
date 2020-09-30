[[ $- != *i* ]] && return

if [[ -n $SSH_CLIENT ]]; then
	export PS1="\u@\h:\w % "
else
	export PS1="\[\033[45;01m\]\u\[\033[00m\] \w "
fi

alias ls='ls -F'
alias l='ls'
alias wn="worknotes.sh"
alias dcm='g++ -Wall -Wextra -pedantic -O1 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -std=c++17 -g3 -fmax-errors=1'

mkcd() {
	test -e "$1" || mkdir "$1"
	cd "$1"
}

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
HISTIGNORE=
HISTSIZE=100000
HISTFILESIZE=10000000

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	. /usr/share/bash-completion/bash_completion

[[ -r "$HOME/dotfiles/bin/z.sh" ]] && source $HOME/dotfiles/bin/z.sh
