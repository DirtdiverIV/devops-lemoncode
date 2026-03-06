#!/bin/bash
texto="$1"

if [ -z "$texto" ]; then
  texto='Que me gusta la bash!!!!'
fi
mkdir -p foo/dummy foo/empty
echo "$texto" > foo/dummy/file1.txt


> foo/dummy/file2.txt
cat foo/dummy/file1.txt > foo/dummy/file2.txt
mv foo/dummy/file2.txt foo/empty/

