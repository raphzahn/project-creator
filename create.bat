@echo off

set ACCESS_TOKEN=

if "%1" == "" (
    echo Please set a name for the Project you want to create
) else (
    if exist %1\ (
        echo The Folder %1 already exists
    ) else (
        mkdir %1
        cd %1

        IF "%2" == "--web" ( npm init -y )

        npx license MIT
        echo # %1>>README.md

        curl -H "Authorization: token %ACCESS_TOKEN%" --data "{\"name\":\"%1\"}" https://api.github.com/user/repos

        git init
        git add *
        git commit -m ":sparkles: inital commit"
        git remote add origin https://github.com/%USERNAME%/%1.git
        git push -u origin master

        code .
    )
)
