[[ $- != *i* ]] && return

export PS1="\u@\h$ "

alias rustc='rustc --color=never'
alias clang='clang -fno-color-diagnostics'
alias clang++='clang -fno-color-diagnostics'

alias ls='ls -F'
alias l='ls'
alias gdb='gdb -q'
alias dcm='g++ -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -std=c++17 -g3 -fmax-errors=1 -O2'

mkcd() {
    test -e "$1" || mkdir "$1"
    cd "$1"
}

# don't put duplicate lines or lines starting with a space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
HISTIGNORE=
HISTSIZE=100000
HISTFILESIZE=10000000

# [[ -r "$HOME/dotfiles/bin/z.sh" ]] && source $HOME/dotfiles/bin/z.sh

if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]]
then
	exec fish
fi
