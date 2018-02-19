#!/bin/bash
# File: ./inc/install_vundle.sh
# Info: Install Vundle for installing Vim Plugins.
# Usage: source ./inc/install_vundle.sh
# TODO: Integrate this with a script that installs vim

# TODO: Add a list of vim plugins?

install_vundle(){
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
  vim +PluginInstall +qall 
}
