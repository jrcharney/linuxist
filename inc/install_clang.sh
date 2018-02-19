#!/bin/bash
# File: ./inc/install_clang.sh
# Info: Install the Clang C and C++ compilers.
# Usage: source ./inc/install_clang.sh

install_clang(){
  # Install Clang
	# TODO: Find a way to replace the wget command on the next line with curl.
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
  sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main"
  sudo apt-get update
  sudo apt-get install clang-5.0
  # update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-5.0 1000        # TODO: Do I need this line?
  sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-5.0 1000
  sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-5.0 1000
  sudo update-alternatives --config clang
  sudo update-alternatives --config clang++
}

