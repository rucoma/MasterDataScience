## First session of the Master in Data Science (GIT)

### Some resources:
* For beginners: [https://try.github.io/levels/1/challenges/1]
* A little more advanced: [https://learngitbranching.js.org/]
* [Using SSH keys with GitHub and Atom](https://technologyand.me/2016/08/29/git-with-atom/#addkeys)

### This could be the workflow:
####  TO LOCAL
`git pull`  
`git add` (filename)  
`git commit`  

#### TO REMOTE
`git push`  

#### SOME OTHER GIT COMMANDS
`pull` / `push` to syncro repos  
`merge` to synchro branches  
`checkout` to change branch  

#### FORKS
`fork` to get another user repo (in GitHub). Clone to a local directory.  
`git remote show origin` #Copy the origin URL for convenience  
`git remote add upstream URL_CON_NOMBRE_USUARIO_ORIGINAL` (user from who I fork) [https://github.com/SandraReal/Data-Science-code.git]
From here, the same flow:  
`git checkout master`  
`git fetch upstream`  
`git merge upstream/master`  
`git push origin/branch_name`  
`git checkout -b branch_name`  
`git pull request`
