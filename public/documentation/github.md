git push --set-upstream origin uat

to marge from uat to main : 
git pull origin main 
git merge uat 
git push origin main 


to pull latest code from github to local machine:
git commit -m "commit message"
git push
git pull origin <branch_name>



return from git log:
git log
:q

create a new branch with inheriting all the code from main:
git checkout -b <branch_name>