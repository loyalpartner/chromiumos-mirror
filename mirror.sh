#!/bin/bash

REPO_URL="https://chromium.googlesource.com"

ROOT_DIR_GIT="/external/gerrit/git"

function git_clone_or_pull {
  URL=$1
  DIRECTORY=$2
  name=$(basename $2)
  if [[ -d "$DIRECTORY" ]]; then
    git -C "$DIRECTORY" remote set-url origin "$URL"
    git -C "$DIRECTORY" fetch --force --prune
  else
    git clone --bare "$URL" "$DIRECTORY"
  fi
}

function main {
  while read repo; do
    while true; do
      running=$(jobs -r | wc -l)
      if [ "$running" -lt "${CONCURRENT_JOBS:-5}" ]
      then
        echo "start cloning $repo"
        git_clone_or_pull $REPO_URL/$repo $ROOT_DIR_GIT/$repo.git &
        break
      else
        wait -n
      fi
    done
  done < <(cat projects)
}

main
