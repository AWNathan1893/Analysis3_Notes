#!/bin/bash

cd ..

if [ ! -d pgfplot_figures ]; then
  echo "Creating pgfplot_figures/"
  mkdir pgfplot_figures
fi

cd pgfplots/ || exit
pgfplot_files=$(find . -iname "*.tex")

for file in $pgfplot_files; do
  if [ ! -s "$file" ]; then
    echo "$file is empty"
  else
    echo "Copying ${file%.*}.pdf"
    cp "./${file%.*}.pdf" "../pgfplot_figures/${file%.*}.pdf"
  fi
done
