#!/bin/bash

cd pgfplots/ || exit
pgfplot_files=$(find . -iname "*.tex")

for file in $pgfplot_files; do
  if [ ! -s "$file" ]; then
    echo "$file is empty"
  else
    echo "Moving ${file%.*}.pdf"
    mv "../pgfplot_figures/${file%.*}.pdf" "./${file%.*}.pdf"
  fi
done
