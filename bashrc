[[ $- != *i* ]] && return

export PS1="λ "

# disable colors
alias ls="ls --color=never"
alias grep="grep --color=never"
export GCC_COLORS=
alias rustc='rustc --color=never'
alias clang='clang -fno-color-diagnostics'
alias clang++='clang -fno-color-diagnostics'

alias ls="ls -F"
alias l='ls'
alias v="vim"
alias gdb='gdb -q'
alias dcm='g++ -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -std=c++17 -g3 -fmax-errors=1 -O2'

mkcd() {
    test -e "$1" || mkdir "$1"
    cd "$1"
}
