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
Plug 'BeneCollyridam/futhark-vim'
Plug 'mhinz/vim-signify'
" Plug 'sbdchd/neoformat'
Plug 'godlygeek/tabular'
Plug 'vim-erlang/vim-erlang-runtime'
call plug#end()

" Plugin config
source $HOME/.config/nvim/plugconfigs/vimtex.vim
source $HOME/.config/nvim/plugconfigs/snippets.vim
source $HOME/.config/nvim/plugconfigs/which-key.vim
source $HOME/.config/nvim/plugconfigs/ranger.vim
source $HOME/.config/nvim/plugconfigs/lightline.vim
source $HOME/.config/nvim/plugconfigs/signify.vim
" source $HOME/.config/nvim/plugconfigs/neoformat.vim
source $HOME/.config/nvim/plugconfigs/tabular.vim


""""""""""""""""""
"" Neovim config""
""""""""""""""""""
" settings
syntax on
filetype indent on
set clipboard=unnamedplus
set mouse=a
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175

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
au BufNewFile,BufRead *.fo  setlocal ft=fasto
au BufNewFile,BufRead *.fs* setlocal ft=fsharp

" keymap
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
