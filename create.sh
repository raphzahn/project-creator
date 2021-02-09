#!/bin/sh

function create(){
    echo $2
    mkdir $1
    cd $1
    git init
    if [ $2 == "--web" ]
    then
        npm init -y
        npx license MIT
    fi
}