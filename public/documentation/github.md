### First time push to a newly created branch
```bash
    git push --set-upstream origin uat
```
### to marge from uat to main : 
```bash
    git pull origin main 
    git merge uat 
    git push origin main 
```

### to pull latest code from github to local machine:

```bash
    git commit -m "commit message"
    git push
    git pull origin <branch_name>
```


# return from git log:
```bash
    git log
    git log --pretty=oneline
    :q
```
### create a new branch with inheriting all the code from main:
```bash
    git checkout -b <branch_name>
```


### to check remote repositories and add a new remote:
```bash
    git remote -v
    git remote add <remote-name> <repo-path>

```
### Untrack a file

```bash
    git rm --cached <file-name>
    git rm -r --cached <folder-name> // removing from a folder
```