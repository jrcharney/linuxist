#!/bin/bash
# File: inc/install_tmux_plugins.sh
# Info: Install tmux pluings including tmux-resurrect
# Usage: source ./inc/install_tmux_plugins.sh
# TODO: Integrate into a script that installs tmux 

install_tmux_plugins(){
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  mkdir ~/.tmux/resurrect 
}
