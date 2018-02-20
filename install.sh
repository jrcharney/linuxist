#!/bin/bash
# File: Linuxist/install.sh
# Info: Install various Linux software to do cool stuff.
# TODO: Go to nerdfonts.com and download the nerdfonts. I suggest getting the Hack font and setting your terminal font to NF Hack.
# TODO: Create a dialog interface for installing stuff, sort of like how raspbian does it.
# TODO: Split this script into smaller scripts.
# Useful commands:
#   sudo apt-get install PACKAGE_NAME       # Install a package
#   apt-cache PACKAGE_NAME                  # search for a package
#   dpkg-query -l ['REGEX'] | less -eFMXR   # List the installed packages
# There are other commands I use in this script that are useful.
#     You can also take a look at https://wiki.debian.org/ListInstalledPackages

# Things we won't be installing:
# * Docker (Sadly, the computer I have runs Windows 10 Home. Docker wants Windows 10 Pro claming something about Hyper-V. So much for doing some scrimshaw. Besides, I want to set this up so that EVERYBODY can use this project.)


echo "This script is NOT meant to be run. It just includes the steps for creating a kickass environment."
echo "It was created on Vim in Zsh on Bash for Ubuntu for Windows."
exit 0

if [[ $(whoami) != root ]]; then
    echo "You can't run this script. You need to be root."
    exit 0
fi 

# Safety
echo "Sorry, you can't run this script...yet."
echo "Try running what is in it."
exit 0

# REMINDER: If you are using Windows, be sure to install
#   * Ubuntu for Windows from the Microsoft Store
#   * Mintty's WSLTTY from Github
#   * VcXsrv from Sourceforge
# See the Windowsist repository for details.

test_shell(){
  if [ $SHELL = /bin/bash ]; then 
    # NOTE: You need to have a Interactive Login shell so that $PATH can be modified.
    echo "We are using Bash."
    shopt -q login_shell && echo "Login shell" || echo "Not login shell"
    [[ $- == *i* ]] && echo "Interactive" || echo "Not interactive"
    # If the two tests did not return "Interactive" and "Login shell", 
    # Go Language and anything else you want to add to ~/.profile WILL NOT LOAD!
    # ~/.profile will only work if you are using an interactive login shell.
    # Generally, this is a problem if you are using the Ubuntu Terminal on Windows, but there is a simple fix.
    # Change the Target in the Ubuntu Terminal shortcut from this
    #   %LOCALAPPDATA%\wsltty\bin\mintty.exe --WSL="Ubuntu" --configdir="%APPDATA%\wsltty" -~ 
    # to this
    #   %LOCALAPPDATA%\wsltty\bin\mintty.exe --WSL="Ubuntu" --configdir="%APPDATA%\wsltty" -~ /bin/bash -l
    # You MUST put The `-~` before `/bin/bash -l` or else the Ubuntu Terminal will crash.
  elif [ $SHELL = /bin/zsh ]; then  
    # test_shell(_bash) is for bash
    # test_shell_zsh is for zsh
    echo "We are using Zsh."
    [[ -o login ]] && echo 'Login shell' || echo 'Not login shell'  
    [[ -o interactive ]] && echo 'Interactive' || echo 'Not interactive'
    # TODO: There were two other aliases I made for opening in zsh. I should probably explain what.

    # TODO: Fix the issue that causes duplicate entries in $PATH when opening TMUX
    # TODO: What about zsh?

    # Dot files are read in the following order
    # .zshenv     # First, but don't edit this one. 
    # .zprofile   # if login shell
    # .zshrc      # If interactive
    # .zlogin     # if login shell
    # ...
    # .zlogout    # if login shell
  else
    echo "Sorry, I can't do anything with the $SHELL shell."
    exit 1
  fi 
}

test_shell      # Let's see what kind of shell we are using.

# Update and upgrade
# TODO: Add this to ~/.bash_aliases
sudo apt update && sudo apt upgrade
# alias uu="sudo apt update && sudo apt upgrade"

# cd Projects
# mkdir $PROJECT
# cd $PROJECT
# git init
# git add .
# git commit -m "First commit"

# See https://github.com/Microsoft/WSL/issues/1801#issuecomment-358086050 which is very important
# TODO: Windows users, change the umask on ALL the directories! They should NOT be executable.
# `umask 022` should be enabled in ~/.profile and added to ~/.zshrc
# The rest of the structure needs this command run on it.
sudo find / -type d -exec chmod 755 {} \;   # TODO: What about hidden directories?
cat 'umask 022' >> ~/.profile               # TODO: needs to be uncommented
cat 'umask 022' >> ~/.zshrc                 # TODO: It's best if this is on top 

source ./inc/create_folders.sh
source ./inc/install_git.sh 
source ./inc/install_github.sh 
source ./inc/install_binaries.sh 

create_folders
install_binaries 
# install_git     # install_github should run this.
# install_github 

# TODO: Where should I put this in the sequence?
source ./inc/install_zsh.sh 
install_zsh

# TODO: Install Vim  (it is installed during install_binaries.sh under vim-nox)
# TODO: Install Tmux (it is installed during install_binaries.sh)
# vim ~/.vimrc
# vim ~/.bash_aliases
# vim ~/.tmux.conf ?
source ./inc/install_vundle.sh 
source ./inc/install_tmux_plugins.sh
# install_vundle 
# install_tmux_plugins 

# TODO: Define which version of python to use (specifically for Python 2 and Python 3)
source ./inc/install_python.sh 
source ./inc/install_virtualenv.sh 
# install_python
# install_virtualenv

# TODO: Define which version of clang to install
source ./inc/install_clang.sh 
# install_clang

# TODO: define which version of ruby to install
source ./inc/install_ruby.sh 
# install_ruby

# TODO: define which version of Go to install
source ./inc/install_go.sh
# install_go
# TODO: GO_VERSION=1.9

source ./inc/install_license.sh 
# install_license     # requires git and go

# Hub requires git, github, ruby, and go
source ./inc/install_hub.sh 
# install_hub

# I couldn't decide which Database software to use. I want to move away from MySQL
# and more toward PostgreSQL and MongoDB.

source ./inc/install_postgresql.sh
# install_postgresql

source ./inc/install_mongodb.sh 
# install_mongodb

source ./inc/install_nodejs.sh 
# install_nodejs

# TODO: What does weechat require?
source ./inc/install_weechat.sh
install_weechat

# TODO: Group with install_vundle.sh and install_tmux_plugins.sh
# You complete me requres vundle, tmux_plugins, clang, python, nodejs, go
source ./inc/install_youcompleteme.sh 
# install_youcompleteme

# Math Pack  (I recommend installing these, especially if you are taking a machine learning class.)
# They are optional though.
source ./inc/install_r.sh
source ./inc/install_octave.sh 
source ./inc/install_tex.sh 
install_r
install_octave
install_tex

# Programs that requre VcXsrv and how to run them
# texworks &

# TODO: UH OH! Something is missing!
  # This is used to enable VcXsrv for Windows and to a greater extend anything that will let us do graphical stuff.
  # TODO: This may be "localhost:10.0" if you are forwarding X11 to SSH.
  # BTW, if you do the X11 forward, don't run startx/startlxde[-pi] or else it will take over your desktop.
  # (Think of it as what happens if you phase two objects into the same space 
  # without transpositioning them into separate locations. #Brundlefly!)
  # TODO: Can I combo this next line with a tee command?
  echo "export DISPLAY=localhost:0.0" >> ~/.bashrc
  echo "export DISPLAY=localhost:0.0" >> ~/.zshrc
# }

source ./inc/install_scripts.sh 
source ./inc/install_pipes_sh.sh 
install_scripts 
install_pipes_sh 

echo "I've given you the tools. You just need to fill in the blanks."
echo "The dotfiles directory contains most of what I use to set up all these programs, but my personal info has been redacted."
echo "Good luck and happy hacking!"
# TODO: We need to create the dot files.

