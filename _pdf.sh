#!/bin/bash

if [ -d _pdf ]; then
  echo "Deleting _pdf"
  rm _pdf -r
fi

echo "Creating _pdf/"
mkdir _pdf

echo "Moving Analysis-3.pdf"
mv Analysis-3.pdf _pdf/Analysis-3.pdf

cd lectures/ || exit
tex_files=$(find . -iname "*.tex")

for file in $tex_files; do
  if [ ! -s "$file" ]; then
    echo "$file is empty"
  else
    echo "Moving ${file%.}.pdf"
    mv "${file%.*}.pdf" "../_pdf/${file%.*}.pdf"
  fi
done

cd ..

echo "Compiling .github/index.md to _pdf/index.html"
pandoc --katex .github/index.md -s -o _pdf/index.html
