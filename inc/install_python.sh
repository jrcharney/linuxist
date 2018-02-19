#!/bin/bash
# File: ./inc/install_python.sh
# Info: Install Python
# Usage: source ./inc/install_python.sh
# Required for virtualenv, vim, tmux, and youcompleteme

install_python(){
	# Install python.
	# "Wait, isn't python already installed?" Yes it is. Is it the latest version
	# that is used in book like Learning Python 3 the hard way? NO!
	# See https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa
  sudo add-apt-repository ppa:deadsnakes/ppa
  sudo apt-get update
  sudo apt-get install python3.6
	# You will need to call this version of python with `python3.6`
	# `python3` will likely use python 3.5
	# `python` (which is Python 2) will likely use 2.7.12 or 2.7.14
	# DO NOT UNINSTALL PYTHON 3.5. Stuff will break if you do.
	# Set python 3.6 as default python 3
	# See http://ubuntuhandbook.org/index.php/2017/07/install-python-3-6-1-in-ubuntu-16-04-lts/
	sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1
	sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2
	sudo update-alternatives --config python3
	# It should be noted that with python3.6 installed, pip should also be upgraded.
	# We will want to install Flake8 (http://flake8.pycqa.org/) for style guide enforcement
	# When we use Vim to program Python 3.
	# sudo pip install --no-cache-dir flake8
	# The ~/.vimrc file should have the line for enabling Flake8.
	# Better yet, install pylint (https://www.pylint.org/), it has a UML editor.
	sudo apt-get install pylint 
  # Install Scipy and Numpy for all that cool math stuff.
  # We need to use --no-cache-dir since we can't cache our stuff.
  # We need to use --user to put all our stuff in ~/.local
  # see https://scipy.org and http://numpy.org 
  # For alist of Python modules to install using pip, visit https://pypi.org 
  python -m pip install --no-cache-dir --user numpy scipy matplotlib ipython jupyter pandas sympy nose
} 

