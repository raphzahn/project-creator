#!/bin/sh

function create(){
    mkdir $1
    cd $1

    if [ $2 == "--web" ]
    then
        npm init -y
    fi

    npx license MIT
    echo "# $1">>README.md

    git init
    git add *
    git commit -m ":sparkles: inital commit"
    
}