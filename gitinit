#!/bin/bash
git status
git init
git add -A
echo "Enter commit: "
read mycommit
git commit -m "${mycommit}"
echo "Enter repositoy link"
read link
git remote add origin "${link}"
git checkout -b main
git push -f origin main

