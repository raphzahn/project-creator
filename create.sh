#!/bin/sh

USERNAME=
ACCESS_TOKEN=

function create(){
    if [ -z "$1" ]
    then
        echo "Please set a name for the Project you want to create"
    else
        if [ -d $1 ]
        then
            echo "The Folder $1 already exists."
        else
            mkdir $1
            cd $1

            if [ $2 == "--web" ]
            then
                npm init -y
            fi

            npx license MIT
            echo "# $1">>README.md

            curl -H "Authorization: token $ACCESS_TOKEN" --data '{"name":"'$1'"}' https://api.github.com/user/repos
            
            git init
            git add *
            git commit -m ":sparkles: inital commit"
            git branch -M main
            git remote add origin https://github.com/$USERNAME/$1.git
            git push -u origin main

            code .
        fi
    fi
   
}