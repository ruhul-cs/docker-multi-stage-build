# Git and Github
## First time git push on a new branch
```sh
git push --set-upstream origin uat
```
## to marge from uat to main : 
```sh
git pull origin main 
git merge uat 
git push origin main 
```

## to pull latest code from github to local machine:
```sh
git commit -m "commit message"
git push
git pull origin <branch_name>
```


## return from git log:
git log
:q

## create a new branch with inheriting all the code from main:
```sh
git checkout -b <branch_name>

```
## Fetching All the branchs from github

```sh
git fetch --all
git branch -r
git checkout -b <branch-name> origin/<branch-name>

```

## How to clone a private repository
- We should use SSH sothat we don't have to authienticate the user twise. Using https we have to go through auth.   

## to get latest code from a branch
- git checkout <your-branch>
- git fetch origin main
- git rebase origin/main


## see the different log between two branch
- git log uat..ruhul
- git log ruhul..uat