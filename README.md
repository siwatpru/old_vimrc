# My vim setup
Basic .vimrc and .vim folder with various plugins

## Installation
Clone this repo and symlink vim folder and vimrc

```
ln -s ~/myvim/vim ~/.vim
ln -s ~/myvim/vimrc ~/.vimrc
```

Fetch all plugins via Vundle

```
git submodule foreach git pull origin master
vim +PluginInstall +qall
```

Install Youcompleteme (YCM)
https://github.com/Valloric/YouCompleteMe

## Plugins included
- Pathogen
- BufExplorer
- Ctrlp.vim
- NerdTree
- Tmuxline
- Vim-airline
- Vim-fugitive
- delimitMate
- NERDCommenter
