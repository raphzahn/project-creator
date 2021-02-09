#!/bin/sh

cwd=$(pwd)
cd $home
if [ ! -d bin ]
then
    mkdir bin
fi
cd bin
cp $cwd/create.sh  ~/bin/
echo 'PATH=$PATH:$HOME/bin  ' >>~/.bash_profile
echo 'source ~/bin/create.sh' >>~/.bash_profile