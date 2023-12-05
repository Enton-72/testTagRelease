#!/bin/bash

[ -z "$1" ] && exit 1
rm file*
git rm file*
echo asd>file$1
git add *
git commit -m "$1"
git tag -d v1.0.$1
git push origin :refs/tags/v1.0.$1
git tag -a v1.0.$1 -m "Release version 1.0.$1"
git push --tags
