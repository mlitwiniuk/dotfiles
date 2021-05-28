#!/bin/bash

dotfiles=(tmux.conf gemrc gitignore gitconfig agignore)
for item in ${dotfiles[*]}
do
  ln -s `pwd`/$item ~/.$item
done

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)

echo "source `pwd`/zshrc" >> ~/.zshrc

# git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# vim +PluginInstall +qall

