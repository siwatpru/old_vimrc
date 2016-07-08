#!/bin/bash

ln -s ~/.myvim/vim ~/.vim
ln -s ~/.myvim/vimrc ~/.vimrc
git submodule init
git submodule update
vim +PluginInstall +qall
