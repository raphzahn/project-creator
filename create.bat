@echo off

set USERNAME=
set ACCESS_TOKEN=

if exist %1\ (
    echo The Folder %1 already exists
) else (
    mkdir %1
    cd %1

    IF "%2" == "--web" ( npm init -y )

    npx license MIT
    echo # %1>>README.md

    curl -u "%USERNAME%:%ACCESS_TOKEN%" https://api.github.com/user/repos -d "{\"name\":\"%1\"}"

    git init
    git add *
    git commit -m ":sparkles: inital commit"
    git remote add origin https://github.com/%USERNAME%/%1.git
    git push -u origin master
)