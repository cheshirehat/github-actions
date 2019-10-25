#!/bin/bash

git config --global user.name "cheshirehat"
git config --global user.email "cheshireinhatter@gmail.com"

git remote set-url origin https://cheshirehat:${GITHUB_TOKEN}@github.com/cheshirehat/branch-test.git

git branch -a

for remote_branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master | grep -v develop`; do
  # echo "$(echo -n "$remote_branch" | cut -d/ -f3-)"
  b="$(echo -n "$remote_branch" | cut -d/ -f3-)"
  `git checkout "$(echo -n "$remote_branch" | cut -d/ -f3)"`
  git branch
  git merge origin/master
  git push
done
