""""""""""""
"" Plugins""
""""""""""""
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

Plug 'itchyny/lightline.vim'
call plug#end()

" Plugin config
source $HOME/.config/nvim/plugconfigs/vimtex.vim
source $HOME/.config/nvim/plugconfigs/snippets.vim
source $HOME/.config/nvim/plugconfigs/which-key.vim
source $HOME/.config/nvim/plugconfigs/ranger.vim
source $HOME/.config/nvim/plugconfigs/lightline.vim


""""""""""""""""""
"" Neovim config""
""""""""""""""""""
" settings
syntax on
filetype indent on
set clipboard=unnamedplus
set mouse=a

" terminal
autocmd TermOpen term://* startinsert
tnoremap <Esc> <C-\><C-n>

" navigation
set number
set relativenumber
set linebreak
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cindent

" syntax
au BufNewFile,BufRead *.fo setlocal ft=fasto
au BufNewFile,BufRead *.fs* setlocal ft=fsharp

" keymap
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
