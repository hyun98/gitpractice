#!/bin/bash

git switch dev

echo "Enter new branch name: "
read newbranch

git checkout --orphan $newbranch
git rm --cached -r .

rm -ri *

echo "Delete unnecessary function files ..."

git add .
git commit -m "init"
git push origin $newbranch

git switch dev
git merge $newbranch --allow-unrelated-histories
git push origin dev

git switch $newbranch
