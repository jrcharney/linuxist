#!/bin/bash
# File: install_octave.sh
# Info: Install Octave
# Usage: source ./inc/install_octave.sh

# This script is optional. I like it because you can do math stuff.
# If you are taking a course on Machine Learning, I highly suggest using this along with install_tex.sh and install_r.sh

# NOTE: We can't install Oracle JDK, we have to do the OpenJDK stuff. (I know, I'm not happy about that either.
#       If anyone knows how to do that, report it as an issue.
# If there is an issue installing ca-certificates-java, you may need to reinstall open-jdk
# You can do this by running these three settings
# sudo apt-get purge openjdk-8-jre-headless
# sudo apt-get install openjdk-8-jre-headless
# sudo apt-get install openjdk=8-jre

# TODO: Move install_octave and install_tex to another place in this script in future version
install_octave(){
  # I think Octave depends on default-jre-headless
  sudo install octave
}
# Note: you can use octave-cli in the command line instead of octave 


