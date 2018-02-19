#!/bin/bash
# File: ./inc/install_virtualenv.sh
# Info: Install virtualenv for python environment management.
# Usage: source ./inc/install_virtualenv.sh
# Requires install_python

install_virtualenv(){
	install_python 
  # Install Virtual Environment (for Python)
  # See https://virtualenv.pypa.io/
  # It needs pip to be installed. And we can't store it in a cache directory
  # TODO: Should I have used the --user option? (The instructions for virutalenv suggest that might not be a good idea.)
  # TODO: Do I really need to use pip3?  Would using `python -m pip` be better? (The instructions of virtualenv suggest not to.)
  sudo apt-get install python-pip python3-pip
  sudo pip install --no-cache-dir --upgrade pip 
  sudo pip3 install --no-cache-dir --upgrade pip
  sudo apt-get install python3.6-gdbm               # We need this one or else tmux won't activate session restoration.
  sudo pip install --no-cache-dir virtualenv
  # TODO: virtualenv requires a directory? (Yes.)
}

