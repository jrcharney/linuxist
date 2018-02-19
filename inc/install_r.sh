#!/bin/bash
# File: inc/install_r.sh
# Info: This script is for installing the R programming language.
# Usage: source inc/install_r.sh

install_r(){
  # Install R
  # TODO: R depdends on graphical software! Find its dependencies.
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
  sudo bash -c "echo 'deb http://cran.wustl.edu/bin/linux/ubuntu xenial/' >/etc/apt/sources.list.d/cran.list"
  sudo apt update
  sudo apt install r-base r-base-dev r-cran-rcmdr r-cran-rcmdr-misc
  # To run R graphically, you will need VcXsrv
  # sudo R      # Running R must be doen by root
  # Rcmdr       # Rcmdr is a graphical user interface
}

