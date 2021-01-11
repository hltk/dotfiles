[[ $PS1 && -f $HOME/.profile ]] && . $HOME/.profile

PS1='\[\e[0;30;48;5;81m\]\h\[\e[m\] \[\e[0;38;5;40m\]\w\[\e[m\] \[\e[0m\]%\[\e0 ' 

# enable colors
alias grep="grep --color=auto"

alias ls="ls -F --color=auto"
alias l='ls'
alias v="vim"
alias gdb='gdb -q -nh -x "$XDG_CONFIG_HOME"/gdb/init'
alias dcm='g++ -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -std=c++17 -g3 -fmax-errors=1 -O2'

mkcd() {
    test -e "$1" || mkdir "$1"
    cd "$1"
}

grepe() {
    rg -n --color=never "$@" . > /tmp/vimgrep.list
    vim -q /tmp/vimgrep.list
}

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
[[ $PS1 && -f /usr/share/z/z.sh ]] && . /usr/share/z/z.sh
