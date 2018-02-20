#!/bin/bash
# File: inc/install_youcompleteme.sh
# Info: Installs the word completion program typically used in Vim.
# Usage: source ./inc/install_youcompleteme.sh
# Note: If you are using a Raspberry Pi, you might not want to install this because Python makes YCM resource intensive.

install_youcompleteme(){
  install_vundle 
  install_tmux_plugins 
  install_clang 
  install_python 
  install_nodejs 
  install_go 
  # We recommend installing Vim, Python, Clang, Node.js and Go before installing You Complete Me
  # Install You Complete Me for Vim.
  # TODO: How to install vim.
  cd ~/.vim/bundle/YouCompleteMe 
  ./install.py --clang-completer --js-completer --go-completer 
  # TODO: Find out why Python 3 is not being used.
  # TODO: Also, did YCM include --go-completer?
}

