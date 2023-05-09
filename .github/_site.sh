#!/bin/bash

echo "Creating _site/"
mkdir _site

echo "Compiling .github/index.md to _site/index.html"
pandoc --katex .github/index.md -s -o _site/index.html

echo "Copying pdfs to _site/pdfs"
cp -r pdfs _site/pdfs
