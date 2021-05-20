#!/bin/bash
for tex in *.tex
do
  printf "Now compiling: $tex\n"
  pdflatex $tex | grep '^!.*' -A1 --color=always
done

rm *.aux *.log
