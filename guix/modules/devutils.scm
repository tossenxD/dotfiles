(define-module (modules devutils)
  #:export (devutils-packages))

(define devutils-packages
  '("gcc-toolchain"
    "gdb"
    "nasm"
    "valgrind"

    "ghc"

    "nix"

    "cmark"

    "python"
    "python-pip"

    "texlive-collection-latex"
    "texlive-collection-latexrecommended"
    "texlive-collection-latexextra"))
