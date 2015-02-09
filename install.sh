#!/bin/bash

dotfiles=(tmux.conf vimrc gemrc gitignore gitconfig gvimrc)
for item in ${dotfiles[*]}
do
  ln -s `pwd`$item ~/.$item
done

# wget --no-check-certificate http://install.ohmyz.sh -O - | sh

echo "source `pwd`/zshrc" >> ~/.zshrc

# git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

