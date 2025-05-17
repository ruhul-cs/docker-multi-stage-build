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
