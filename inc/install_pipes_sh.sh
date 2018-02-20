#!/bin/bash
# File: ./inc/install_pipes.sh
# Info: Install the Pipes.sh script, because the Internet is a series of tubes. :-D
#         Actually this script is optional.
# Usage: source ./inc/install_pipes_sh.sh
# TODO: Consider putting this into a script called install_toys.sh

install_pipes_sh(){
  # Install pipes.sh because the Internet is a series of tubes.
  cd ~/Software
  mkdir pipeseroni 
  cd pipeseroni
  git clone https://github.com/pipeseroni/pipes.sh 
  cd pipes.sh 
  sudo make install 
  # pipes.sh should now be available?
  cd ~
}

