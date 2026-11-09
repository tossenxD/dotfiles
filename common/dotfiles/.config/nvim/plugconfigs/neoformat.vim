""Auto-format on ':w'; disable in buffer 'autogroup!'
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

"""""""""""""
""Formaters""
"""""""""""""
""Elm
"npm install -g elm-format

""Latex
"sudo pacman -Syu perl
"sudo cpan -i App::cpanminus
"sudo cpanm YAML::Tiny
"sudo cpanm File::HomeDir
"sudo cpanm Unicode::GCString
"sudo cpanm Log::Log4perl
"sudo cpanm Log::Dispatch::File

""Haskell
"sudo pacman -S stylish-haskell

""Python
"pip3 install black

""Shell
"sudo pacman -S shfmt

""Lua
"sudo pacman -S stylua
