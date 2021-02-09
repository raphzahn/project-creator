#!/bin/sh

USERNAME=
ACCESS_TOKEN=

function create(){
    mkdir $1
    cd $1

    if [ $2 == "--web" ]
    then
        npm init -y
    fi

    npx license MIT
    echo "# $1">>README.md

    curl -u "$USERNAME:$ACCESS_TOKEN" https://api.github.com/user/repos -d '{"name":"'$1'"}'

    git init
    git add *
    git commit -m ":sparkles: inital commit"
    git remote add origin https://github.com/$USERNAME/$1.git
    git push -u origin master
    
}