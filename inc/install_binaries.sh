#!/bin/bash
# File: ./inc/install_binaries.sh
# Info: Install all the binary software from the Ubuntu repository
# Usage: source ./inc/install_binaries.sh

# TODO: what was isag for? Interactive system grapher.

install_binaries(){
  # A whole bunch of fun stuff to install
  # TODO: Should I alphabetize this list?  Probably should order it by dependency
  # TODO: Break this up into smaller parts.
  # TODO: Find a way to install Java before hand or else it will install OpenJDK (Probably shouldn't do this.)
  # NOTE: DO NOT INSTALL libreadline-gplv2-dev! It will uninstall r-base-dev which R needs.
	#					Install libreadline-dev
  sudo apt install build-essential checkinstall apt-transport-https vim-nox lolcat figlet expect tcl tk tcl-dev tcl8.6-dev tk-dev tk8.6-dev dialog libncurses5 libncurses5-dev libncursesw5-dev libreadline-dev libreadline6-dev htop openssl-blacklist isag fortune pv jq screenfetch cowsay cmatrix tmux mc nmap tig gitk bc exuberant-ctags ninvaders nsnake pacman4console cmake python-pip python3-pip python-dev python3-dev hunspell x11-apps perl-tk xzdec youtube-dl xsel lynx lynx-common ansiweather libssl-dev libgdbm-dev libc6-dev libbz2-dev software-properties-common python-software-properties python-apt python-pycurl libfontconfig1-dev libfreetype6-dev libice-dev libpthread-stubs0-dev libsm-dev libsqlite3-dev libx11-dev libx11-doc libxau-dev libxcb1-dev libxdmcp-dev libxext-dev libxft-dev libxrender-dev libxss-dev libxt-dev x11proto-core-dev x11proto-input-dev x11proto-kb-dev x11proto-render-dev x11proto-scrnsaver-dev x11proto-xext-dev xorg-sgml-doctools xtrans-dev boxes ddate 
}

