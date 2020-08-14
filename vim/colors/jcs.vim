" vim:sw=8:ts=8
" modified from https://github.com/jcs/dotfiles

" colors: https://jonasjacek.github.io/colors/

" act like t_Co=0 but use (256) color on just a few things
"

set background=dark

hi clear

let colors_name = "jcs"

hi Comment		cterm=NONE		ctermfg=240
hi Constant		cterm=NONE		ctermfg=247
hi CursorLineNr		cterm=bold		ctermfg=247
hi DiffAdd		cterm=bold		ctermfg=NONE
hi DiffChange		cterm=bold		ctermfg=NONE
hi DiffDelete		cterm=bold		ctermfg=NONE
hi DiffText		cterm=reverse		ctermfg=NONE
hi Directory		cterm=bold		ctermfg=NONE
hi Error		cterm=reverse		ctermfg=9	ctermbg=15
hi ErrorMsg		cterm=reverse		ctermfg=9	ctermbg=15
hi FoldColumn		cterm=standout		ctermfg=NONE
hi Folded		cterm=standout		ctermfg=NONE
hi Identifier		cterm=NONE		ctermfg=247
hi Ignore		cterm=bold		ctermfg=NONE
hi IncSearch		cterm=reverse		ctermfg=NONE
hi LineNr		cterm=NONE		ctermfg=247
hi MatchParen		cterm=bold		ctermfg=none	ctermbg=185
hi ModeMsg		cterm=bold		ctermfg=NONE
hi MoreMsg		cterm=bold		ctermfg=NONE
hi NonText		cterm=bold		ctermfg=NONE
hi PreProc		cterm=NONE		ctermfg=247
hi Question		cterm=standout		ctermfg=NONE
hi Search		cterm=reverse		ctermfg=NONE
hi Special		cterm=bold		ctermfg=NONE
hi SpecialKey		cterm=bold		ctermfg=NONE
hi Statement		cterm=bold		ctermfg=NONE
hi StatusLine		cterm=bold,reverse	ctermfg=NONE
hi StatusLineNC		cterm=reverse		ctermfg=NONE
hi TabLine		cterm=reverse		ctermfg=NONE
hi Title		cterm=bold		ctermfg=NONE
hi Todo			cterm=bold,standout	ctermfg=185	ctermbg=0
hi Type			cterm=bold		ctermfg=NONE
hi Underlined		cterm=underline		ctermfg=NONE
hi VertSplit		cterm=reverse		ctermfg=NONE
hi Visual		cterm=reverse		ctermfg=NONE
hi VisualNOS		cterm=bold		ctermfg=NONE
hi WarningMsg		cterm=standout		ctermfg=NONE
hi WildMenu		cterm=standout		ctermfg=NONE

hi ColorColumn		cterm=NONE		ctermfg=NONE	ctermbg=247
