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
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'
hi clear Conceal

Plug 'sirver/ultisnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
snippet beg "begin{} / end{}"
\begin{$1}
	$0
\end{$1}
endsnippet

snippet // "Fraction"
\\frac{$1}{$2}$0
endsnippet

snippet '((\d+)|(\d*)(\\)?([A-Za-z]+)((\^|_)(\{\d+\}|\d))*)/' "FractionBig"
\\frac{`!p snip.rv = match.group(1)`}{$1}$0
endsnippet

call plug#end()


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
