#!/bin/bash
# File: ./inc/install_git.sh
# Info: Install Git from the Git Repository rather than Ubuntu's repository.
# Usage: source ./inc/install_git.sh
# Note: install_github.sh is different from install_git.sh
#   install_git.sh installs the SCM
#   install_github.sh applies settings for using git with github.com provided you have an account.

install_git(){
  # Install Git from the Git Repo (optional but recommended)
  # NOTE: I highly recommend installing go before git so that you can install nishanths' license script.
  sudo add-apt-repository ppa:git-core/ppa
  sudo apt-get update
  sudo apt-get install git 
}

