#!/bin/bash
# File: ./inc/install_tex.sh
# Info: Install TeX (pronounced TECH) for typescripting in LaTeX.
# Usage: source ./inc/install_tex.sh

install_tex(){
  # Install LaTeX applications separately because THEY TAKE WAY TOO LONG TO INSTALL!
  sudo install texworks texlive texlive-xetex texworks-scripting-lua texworks-scripting-python
}

