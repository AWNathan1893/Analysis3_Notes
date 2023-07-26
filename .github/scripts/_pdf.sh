#!/bin/bash

if [ -d pdfs ]; then
  echo "Deleting pdfs"
  rm pdfs -r
fi

echo "Creating pdfs/"
mkdir pdfs

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
