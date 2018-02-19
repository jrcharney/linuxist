#!/bin/bash
# File: ./inc/install_hub.sh
# Info: Install hub, a program that helps with github uploads
# Usage: source ./inc/install_hub.sh
# Requires: git, github, ruby, and go.

install_hub(){
  # Hub requires a few things
  install_git
  install_github
  install_ruby
  install_go
  # Install Hub. Hub helps us do more stuff with git.
  # Hub requires installing make, git, ruby, and go.
  # It probably would be wise to install git, ruby, and go with the three sets of commands
  # Previously used in this script.
  # Fortunately, we can use Go to install Hub.
  go get github.com/github/hub
  # There is also some stuff for code completion
  # See it at https://github.com/github/hub/tree/master/etc for how to install it.
}

