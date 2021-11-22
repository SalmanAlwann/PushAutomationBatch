@echo off

:GetInput
Set "ProjectDir="
Rem Request input from the user. 
Set /P "ProjectDir=Please enter the location of your Project directory: "
set /p url=Enter URL: 
Rem If input is not a directory ask again
For %%G In ("%ProjectDir%") Do If "%%~aG" Lss "d" If "%%~aG" GEq "-" (
    GoTo GetInput) Else GoTo GetInput
Rem Make the Zibo directory the current directory
CD /D "%ProjectDir%"
timeout /t 1
git init
git add .
git commit -m "first commit"
git remote add origin %url%
git push -f origin HEAD:main