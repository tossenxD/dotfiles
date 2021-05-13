" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Pluggins for vim-plug
call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'lervag/vimtex'

Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'

Plug 'liuchengxu/vim-which-key'
Plug 'preservim/nerdtree'

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
call plug#end()





" Pluggin setup
" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'
hi clear Conceal

" snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" vim-which-key
source $HOME/.config/nvim/plugconfigs/which-key.vim

" ranger
let g:ranger_map_keys=0
let g:bclose_no_plugin_maps=1




" Settings
syntax on
filetype indent on

set clipboard=unnamedplus
set mouse=a

set number
set relativenumber
set linebreak

set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cindent

au BufNewFile,BufRead *.fo setlocal ft=fasto
au BufNewFile,BufRead *.fs* setlocal ft=fsharp

