#!/bin/bash

# go to home directory
if [ -f $HOME/.vimrc ]; then
	echo "Creating backup vimrc file as .vimrc_old"
	cp $HOME/.vimrc $HOME/.vimrc_old
fi

# make empty directory
SCRATCH=$(mktemp -d -t ci-XXXXXXXXX)

# check if necessary files are in this folder
# download repository
echo "Downloading repository..."
git clone https://github.com/benjaminlyons/vim-config.git $SCRATCH &> /dev/null

# move the .vimrc to the home directory
cp $SCRATCH/.vimrc_vundle $HOME/.vimrc

# now download vundle
if [ ! -f $HOME/.vim/bundle/Vundle.vim ]; then
	echo "Downloading vundle..."
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim &> /dev/null
fi

# install vundle
echo "Installing vundle..."
vim +PluginInstall +qall &> /dev/null

# install remaining plugins
cp $SCRATCH/.vimrc $HOME/.vimrc
echo "Installing other plugins..."
vim +PluginInstall +qall &> /dev/null

# cleanup
echo "Cleaning up..."
rm -rf $SCRATCH
