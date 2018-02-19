#!/bin/bash
# File: ./inc/install_go.sh
# Info: Install Go Language
# Usage: source ./inc/install_go.sh
# Requirements: run install_git.sh first.

# TODO: add an argument to define which version of go to use.
# TODO: Use tee to write the export variables to multiple files.
# TODO: Use cat to write multple lines
install_go(){
  # Install Go Language
  # TODO: GO_VERSION=1.9
  sudo add-apt-repository ppa:gophers/archive
  sudo apt update && sudo apt install golang-1.9-go
  # Bash users add this to your profile
  echo "export GOROOT=/usr/lib/go-1.9" >> ~/.profile
  echo "export PATH=\$PATH:\$GOROOT/bin" >> ~/.profile
  # Zsh users need to add those lines to ~/.zshrc 
  echo "export GOROOT=/usr/lib/go-1.9" >> ~/.zshrc
  echo "export PATH=\$PATH:\$GOROOT/bin" >> ~/.zshrc 
}

