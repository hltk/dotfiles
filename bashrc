[[ $- != *i* ]] && return


fg_green=$'%{\e[1;32m%}'
fg_no_colour=$'%{\e[0m%}'
PS1="%K{cyan}%F{black}%m%k%f ${fg_green}%~${fg_no_colour} %% "

# enable colors
alias ls="ls --color=always"
alias grep="grep --color=always"

alias ls="ls -F"
alias l='ls'
alias v="vim"
alias gdb='gdb -q'
alias dcm='g++ -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -std=c++17 -g3 -fmax-errors=1 -O2'

mkcd() {
    test -e "$1" || mkdir "$1"
    cd "$1"
}

grepe() {
    rg -n --color=never "$@" . > /tmp/vimgrep.list
    vim -q /tmp/vimgrep.list
}
