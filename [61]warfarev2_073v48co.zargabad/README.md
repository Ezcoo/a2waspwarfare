# ZARGABAD MAP RELATED RESOURCES
```
Here You will find resources for zargabad map
```
## Bundling of missions
```
1) Create a mission folder f.e. "[55-2hc]warfarev2_073v47co.zargabad"
2) Create "Master" folder;
3) clone master branch in "Master" folder.  
4) Create a fodler for mission related resource. F.e. call it "zarga"
5) clone mission related resources from zarga branch
6) Put all files from "Master" and "zarga" folders in "[55-2hc]warfarev2_073v47co.zargabad"
```
## GIT WORKFLOW EXAMPLE: Basic Git clone, modify, commit, and push.
```
git clone https://github.com/WASP-Warfare-Missions/ARMA2_warfare.git
cd ARMA2_warfare
git BRANCH -a | grep TEST-1
git checkout -b TEST-1
git status
vim README.md
git status
git add README.md
git status
git commit -m 'TEST-1 exercising git'
git push

make a pull request in the Web UI
post the pull request for peer review
merge the pull request
```
## GIT WORKFLOW EXAMPLE: Keeping up with the master on your branch.
```
you have a branch checked out, and with to update it with changes made on
the master branch.

cd ARMA2_warfare
git status
git pull
git checkout master
git pull
git checkout TEST-1
git merge master
git status
```
## ADDITIONAL TOOLS
```
Poseidon IDE - http://www.armaholic.com/page.php?id=22139
BIS tools	 - https://community.bistudio.com/wiki/BI_Tools_2.5
```
```
## USEFULL LINKS
```
WASP community
http://wasp-team.org/forum