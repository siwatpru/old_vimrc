#!/bin/bash

ln -s ~/vimrc/vim ~/.vim
ln -s ~/vimrc/vimrc ~/.vimrc
git submodule init
git submodule update
vim +PluginInstall +qall
