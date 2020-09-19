" sane settings for backspace key
set backspace=indent,eol,start

" indent settings
set cindent smartindent autoindent

" mouse support
set mouse=a

" line numbering
set number relativenumber

" case insensitive search
set ignorecase

" disable screen flash
set noerrorbells t_vb=

" persistent undo history
set undofile undodir=~/codes/undodir

syntax on
colo default

" Jump to the last position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" disable viminfo for commit msgs
autocmd FileType gitcommit setlocal nobuflisted

set background=light
