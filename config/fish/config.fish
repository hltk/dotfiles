function rustc
    rustc --color=never
end

function clang
    clang -fno-color-diagnostics
end

function clang++
    clang -fno-color-diagnostics
end

function l
    ls
end

function gdb
    command gdb -q
end

function dcm
    g++ -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -std=c++17 -g3 -fmax-errors=1 -O2
end

function mkcd
    test -e "$argv[1]" || mkdir "$argv[1]"
    cd "$argv[1]"
end
