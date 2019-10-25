#!/bin/bash

git config --global user.name ${GITHUB_USER}
git config --global user.email ${GITHUB_EMAIL}

git remote set-url origin https://${GITHUB_USER}:${GITHUB_PASSWORD}@github.com/cheshirehat/github-actions.git

git branch -a

for remote_branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master | grep -v develop`; do
  echo "$(echo -n "$remote_branch" | cut -d/ -f3-)"
  # b="$(echo -n "$remote_branch" | cut -d/ -f3-)"
  `git checkout "$(echo -n "$remote_branch" | cut -d/ -f3-)"`
  git branch
  git merge origin/master
  git push
done
