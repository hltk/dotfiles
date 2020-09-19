[[ $- != *i* ]] && return

if [[ -n $SSH_CLIENT ]]; then
	export PS1="\u@\h:\w % "
else
	export PS1="\[\033[47;01m\]\u\[\033[00m\] \w "
fi

export EDITOR=vim
export GCC_COLORS=

alias ls='ls -F'
alias l='ls'

alias debug_compile='g++ -Wall -Wextra -pedantic -O1 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -std=c++17 -g3'
alias format='clang-format -style="{BasedOnStyle: LLVM, IndentWidth: 8, UseTab: ForContinuationAndIndentation, AllowShortIfStatementsOnASingleLine: WithoutElse, AccessModifierOffset: -8, AllowShortFunctionsOnASingleLine: All, AllowShortLoopsOnASingleLine: true, ColumnLimit: 0}" -i'

mkcd() {
	test -e "$1" || mkdir "$1"
	cd "$1"
}

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
# append and reload the history after each command
PROMPT_COMMAND="history -a; history -n"

# ignore certain commands from the history
HISTIGNORE="ls:ll:cd:pwd:bg:fg:history"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=10000000

alias wn="worknotes.sh"

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	. /usr/share/bash-completion/bash_completion

[[ -r "$HOME/dotfiles/bin/z.sh" ]] && source $HOME/dotfiles/bin/z.sh
