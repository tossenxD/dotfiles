#!/bin/bash
for tex in *.tex; do
  printf "Now compiling: $tex\n"
  pdflatex -shell-escape $tex | grep '^!.*' -A1 --color=always
done

rm *.aux *.log
