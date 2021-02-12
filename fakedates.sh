#!/bin/sh
set -e

commit=$(git rev-parse HEAD)
while read -r date
do commit=$(GIT_COMMITTER_DATE=$date GIT_AUTHOR_DATE=$date git commit-tree -p "$commit" "$@")
done
printf '%s\n' "$commit"
