#!/bin/bash

# go to home directory
if [ -f ~/.vimrc ]; then
	echo "Creating backup vimrc file as .vimrc_old"
	cp ~/.vimrc ~/.vimrc_old
fi

# make empty directory
SCRATCH=$(mktemp -d -t ci-XXXXXXXXX)

# download repository
echo "Downloading repository..."
git clone https://github.com/benjaminlyons/vim-config.git $SCRATCH &> /dev/null

# move the .vimrc to the home directory
cp $SCRATCH/.vimrc_vundle ~/.vimrc

# now download vundle
if [ ! -f ~/.vim/bundle/Vundle.vim ]; then
	echo "Downloading vundle..."
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &> /dev/null
fi

# install vundle
echo "Installing vundle..."
vim +PluginInstall +qall &> /dev/null

# install remaining plugins
cp $SCRATCH/.vimrc ~/.vimrc
echo "Installing other plugins..."
vim +PluginInstall +qall &> /dev/null

# cleanup
echo "Cleaning up..."
rm -rf $SCRATCH
