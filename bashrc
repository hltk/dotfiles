[[ $PS1 && -f $HOME/.profile ]] && . $HOME/.profile

PS1='\h \w % '

mkcd() {
	test -e "$1" || mkdir "$1"
	cd "$1"
}

dcm() {
	a="${1%%.cpp}"
	g++ $1 -o $a -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -std=c++17 -g3 -fmax-errors=1 -O2
}

# don't put duplicate lines or lines starting with a space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
HISTIGNORE=
HISTSIZE=100000
HISTFILESIZE=10000000

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
[[ $PS1 && -f /usr/share/z/z.sh ]] && . /usr/share/z/z.sh
