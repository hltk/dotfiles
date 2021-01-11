export XDG_CACHE_HOME="$HOME"/.cache
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share

alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"
alias startx="startx $XDG_CONFIG_HOME/x11/xinitrc"

export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_HOME="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CRAWL_DIR="$XDG_CONFIG_HOME"/crawl
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export HISTFILE="$XDG_DATA_HOME"/bash/history
export INPUTRC="$XDG_CONFIG_HOME"/inputrc
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export IRBRC="$XDG_CONFIG_HOME"/irb/irbrc
export LESSHISTFILE="$XDG_CACHE_HOME"/lesshistory
export PSQLRC="$XDG_CONFIG_HOME"/psqlrc
export PSQL_HISTORY="$XDG_CACHE_HOME"/psql_history
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
export VIMINIT='let $VIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $VIMRC'
export XAUTHORITY="$XDG_CONFIG_HOME"/x11/authority
export XCOMPOSEFILE="$XDG_CONFIG_HOME"/x11/compose
export XINITRC="$XDG_CONFIG_HOME"/x11/xinitrc
export _Z_DATA="$XDG_DATA_HOME/z"

export LANG=en_US.UTF-8
export PATH="$HOME"/dotfiles/bin:$PATH
export EDITOR=vim
export PYTHONDONTWRITEBYTECODE=1
