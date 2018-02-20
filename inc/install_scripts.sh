#!/bin/bash
# File: ./inc/install_scripts.sh
# Info: Install some usefull scripts from inte internet.
# Usage: source ./inc/install_scripts.sh
# TODO: Find that pallet script which is useful for setting Powerlevel9k prompt colors.

install_scripts(){
  # Install some scripts into the local bin directory
  cd ~/bin 
  curl ix.io/client > ix														# paste code clips on ix.io
  curl -sLO http://scie.nti.st/dist/256colors2.pl		# Download to test if you need to change color settings to your terminal.
  # TODO: Find that numbered palette script
  chmod +x ix
  chmod +x 256colors2.pl 
  cd ~
}

