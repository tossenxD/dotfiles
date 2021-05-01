" Pluggins for vim-plug
call plug#begin('~/local/share/nvim/plugged')

Plug 'lervag/vimtex'
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'

call plug#end()


" Pluggins configs
let g:tex_flavor='latex'

let g:vimtex_view_method='zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'
hi clear Conceal

let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


" Setup
syntax on
filetype indent on

set clipboard=unnamedplus

set number
set relativenumber
set linebreak

set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cindent

" runtime! archlinux.vim
" filetype plugin on
