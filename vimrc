" color scheme settings
syntax on
colo default
set background=dark

" cursorline only visible in line number bar, FROM github.com/ollpu/.vim
set cursorline
highlight CursorLine ctermbg=none cterm=none

" line numbering
set number relativenumber

" disable screen flash
set noerrorbells t_vb=

" no not wrap lines :p
set nowrap

" sane settings for backspace key
set backspace=indent,eol,start

" enable mouse support
set mouse=a

" terminal title
set title

" persistent undo history
set undofile undodir=~/.cache/vim/undo

" indent settings
set smartindent
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Jump to the last position when reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" disable viminfo for commit msgs
autocmd FileType gitcommit setlocal nobuflisted

" use tabs for c++/c
autocmd BufRead,BufNewFile *.cpp set noexpandtab cindent
autocmd BufRead,BufNewFile *.cc set noexpandtab cindent
autocmd BufRead,BufNewFile *.hpp set noexpandtab cindent
autocmd BufRead,BufNewFile *.hh set noexpandtab cindent
autocmd BufRead,BufNewFile *.c set noexpandtab cindent
autocmd BufRead,BufNewFile *.h set noexpandtab cindent
autocmd BufRead,BufNewFile Makefile* set noexpandtab

" use 2 spaces for ruby
autocmd BufRead,BufNewFile *.rb set tabstop=2 softtabstop=2 shiftwidth=2
