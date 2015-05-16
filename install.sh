#!/bin/bash
git clone git://github.com/vrybas/dotvim.git ~/.vim
echo "runtime! rc.vim" > ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
brew install ack
brew install ctags
gem install gem-ctags
gem ctags
