#!/bin/bash

[ -z "$1" ] && exit 1
rm file*
git rm file*
echo "asd$1">file$1
git add *
git commit -m "$1"
git tag -d v1.0.$1
git push origin :refs/tags/v1.0.$1
git tag -a v1.0.$1 -m "Release version 1.0.$1"
git push origin v1.0.$1


exit 0

git add/rm 					-> Brise ili dodaje novi file negde?
git commit -m "asd" 				-> Svaki commit predstavlja skup lokalnih izmena. 
git tag -d v1.0.$1 				-> brise tag lokalno. ili "git tag -d $(git tag)" brise sve tagove
git push origin :refs/tags/v1.0.$1 		-> brise tag na remote
git push --delete origin v1.0.6			-> takodje brise tag na remote-u
git tag -a v1.0.$1 -m "Release version 1.0.$1" 	-> dodaje tag lokalno
git push origin v1.0.$1 			-> pusuje taj tag na remote. Ali sad taj tag ne pripada nijednom branch-u?
git push 					-> salje sve pomene na remote
git fetch --prune --tags 			-> Ne znam
git fetch --prune --prune-tags			-> Ne znam
git tag						-> prikazuje sve lokalne tagove
git branch 					-> prikazuje grane?
git symbolic-ref --short HEAD			-> Ne znam
git switch -c v1.0.6				-> Ne znam
git checkout					-> Trebao bi biti kao git pull samo za odredjeni tag ili branch?
git branch --show-current			-> prikazuje trenutni branch na kom se nalazi projekat
git pull --rebase 				-> Ne znam


# izbrise sve tagove lokalno i sync-uje sa repo
git tag -l | xargs git tag -d && git fetch -t