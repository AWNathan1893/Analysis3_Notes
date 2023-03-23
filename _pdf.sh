#!/bin/bash

if [ -d pdfs ]; then
  echo "Deleting pdfs"
  rm pdfs -r
fi

echo "Creating pdfs/ and _site/"
mkdir pdfs
mkdir _site

echo "Moving Analysis-3.pdf"
mv Analysis-3.pdf pdfs/Analysis-3.pdf

cd lectures/ || exit
tex_files=$(find . -iname "*.tex")

for file in $tex_files; do
  if [ ! -s "$file" ]; then
    echo "$file is empty"
  else
    echo "Moving ${file%.*}.pdf"
    mv "${file%.*}.pdf" "../pdfs/${file%.*}.pdf"
  fi
done

cd ..

echo "Compiling .github/index.md to _site/index.html"
pandoc --katex .github/index.md -s -o _site/index.html

echo "Copying pdfs to _site/pdfs"
cp -r pdfs _site/pdfs
