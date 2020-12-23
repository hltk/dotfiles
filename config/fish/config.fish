function v
    vim $argv
end

function rustc
    command rustc --color=never $argv
end

function clang
    command clang -fno-color-diagnostics $argv
end

function clang++
    command clang++ -fno-color-diagnostics $argv
end

function l
    ls
end

function gdb
    command gdb -q $argv
end

function dcm
    command g++ -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -std=c++17 -g3 -fmax-errors=1 -O2 $argv
end

function mkcd
    test -e "$argv[1]" || mkdir "$argv[1]"
    cd "$argv[1]"
end

set fish_greeting
