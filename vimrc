" sane settings for backspace key
set backspace=indent,eol,start

" indent settings
set smartindent autoindent

" mouse support
set mouse=a

" line numbering
set number relativenumber

" case insensitive search
set ignorecase

" disable screen flash
set noerrorbells t_vb=

" persistent undo history
set undofile undodir=~/.cache/vim/undo

syntax on
colo default

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" disable viminfo for commit msgs
autocmd FileType gitcommit setlocal nobuflisted

set background=dark

" no not wrap lines :p
set nowrap
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

au BufRead,BufNewFile *.cpp set noexpandtab cindent
au BufRead,BufNewFile *.cc set noexpandtab cindent
au BufRead,BufNewFile *.c set noexpandtab cindent
au BufRead,BufNewFile *.h set noexpandtab cindent
au BufRead,BufNewFile Makefile* set noexpandtab

au BufRead,BufNewFile *.rb set tabstop=2 softtabstop=2 shiftwidth=2
