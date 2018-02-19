#!/bin/bash
# File: ./inc/install_license.sh
# Info: Install license, the license program
# Usage: source ./inc/install_license.sh
# Requires: git, go

install_license(){
  install_git
  install_go 
  # TODO: Why did I put this here?! I needs to go somewhere else, like after Go is installed.
  # Use nishanths's license generating go script to generate licenses for your repositories.
  # If you are using github, I recommend using MIT.
  # You will likely need to restart the terminal before this can go into effect.
  go get -u github.com/nishanths/license
  # cd path/to/my/repo; license -o LICENSE.txt mit
}

