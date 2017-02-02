#!/bin/bash

ln -s ~/$(pwd)/vim ~/.vim
ln -s ~$(pwd)/vimrc ~/.vimrc
git submodule init
git submodule update
vim +PluginInstall +qall
