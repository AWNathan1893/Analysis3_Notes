#!/bin/bash

echo "Creating _site/"
mkdir _site

echo "Compiling .github/index.md to _site/index.html"
pandoc --katex .github/index.md -s -o _site/index.html

echo "Zipping pdfs to Analysis-3_all_pdfs.zip"
zip -r Analysis-3_all_pdfs.zip pdfs/*

echo "Copying pdfs to _site/pdfs"
cp -r pdfs _site/pdfs

echo "Copying Analysis-3_all_pdfs.zip to _site/Analysis-3_all_pdfs.zip"
cp Analysis-3_all_pdfs.zip _site/Analysis-3_all_pdfs.zip
