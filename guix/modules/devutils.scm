(define-module (modules devutils)
  #:export (devutils-environment))

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

(define devutils-services
  '())

(define devutils-environment
  (cons devutils-packages devutils-services))
