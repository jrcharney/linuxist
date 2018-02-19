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
  # NOTE: You need to have a Interactive Login shell so that $PATH can be modified.
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
}

test_shell_zsh(){
  # test_shell(_bash) is for bash
  # test_shell_zsh is for zsh
  [[ -o login ]] && echo 'Login shell' || echo 'Not login shell'  
  [[ -o interactive ]] && echo 'Interactive' || echo 'Not interactive' 
}

# TODO: Fix the issue that causes duplicate entries in $PATH when opening TMUX
# TODO: What about zsh?


# Dot files are read in the following order
# .zshenv     # First, but don't edit this one. 
# .zprofile   # if login shell
# .zshrc      # If interactive
# .zlogin     # if login shell
# ...
# .zlogout    # if login shell

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


source ./inc/install_git.sh 
source ./inc/install_github.sh 
source ./inc/install_binaries.sh 

install_binaries 
# install_git     # install_github should run this.
# install_github 

source ./inc/install_zsh.sh 
# install_zsh

  # TODO: what was isag for? Interactive system grapher.

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

install_tex(){
  # Install LaTeX applications separately because THEY TAKE WAY TOO LONG TO INSTALL!
  sudo install texworks texlive texlive-xetex texworks-scripting-lua texworks-scripting-python
}

  # Programs that requre VcXsrv and how to run them
  # texworks &

# TODO: UH OH! Something is missing!
  # This is used to enable VcXsrv
  # TODO: This may be "localhost:10.0" if you are forwarding X11 to SSH.
  # BTW, if you do the X11 forward, don't run startx/startlxde[-pi] or else it will take over your desktop.
  # (Think of it as what happens if you phase two objects into the same space 
  # without transpositioning them into separate locations. #Brundlefly!)
  echo "export DISPLAY=localhost:0.0" >> ~/.bashrc
  echo "export DISPLAY=localhost:0.0" >> ~/.zshrc
# }


create_folder(){
  # Create folders (Windows only)
  # TODO: Put this in a loop
  # ~/bin					# Run your own scripts or softlinks without the `./` prefix. Be sure to chmod u+x first!
  # ~/Documents		# Documents
  # ~/Pictures		# Pictures
  # ~/Music				# Music
  # ~/Videos			# Videos
  # ~/Public 			# Put stuff you want to post online here
  # ~/Sandbox 		# A place to try out stuff
  # ~/Templates 	# Templates
  # ~/Projects 		# Your projects on Github
  # ~/Projects/Repos
  # ~/Software		# Downloaded software from Github
  # ~/Software/Repos

  if [[ -d /mnt/c/Users ]]; then
    WINHOME=/mnt/c/Users/$USER
    NIXHOME=$HOME/WinDirs 

    ln -s $WINHOME $NIXHOME 
    # TODO: Create a directory with softlinks to the windows locations in it.
    mkdir -p $NIXHOME      # A place to put softlinks to window directories.
  
    # Clouds
    # TODO: What about outer services?
    # TODO: What about personal Dropbox?
    for d in Dropbox OneDrive; do
      [[ -d "$WINHOME/$d" ]] && ln -s $WINHOME/$d $NIXHOME/$d 
    done

    for d in bin Documents Pictures Music Videos Public Sandbox Templates Projects Software; do 
      [[ -d "$HOME/$d" ]] && mkdir -p $HOME/$d
    done 

    for d in Projects Software; do 
      [[ -d "$HOME/$d/Repos" ]] && mkdir -p $HOME/$d/Repos
    done
  fi
}

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

install_pipes_sh(){
  # Install pipes.sh because the Internet is a series of tubes.
  cd ~/Software
  mkdir pipeseroni 
  cd pipeseroni
  git clone https://github.com/pipeseroni/pipes.sh 
  cd pipes.sh 
  sudo make install 
  # pipes.sh should now be available?
  cd ~
}


# TODO: Install Vim
# TODO: Install Tmux
# vim ~/.vimrc
# vim ~/.bash_aliases
# vim ~/.tmux.conf ?
source ./inc/install_vundle.sh 
source ./inc/install_tmux_plugins.sh
# install_vundle 
# install_tmux_plugins 

source ./inc/install_python.sh 
# install_python

source ./inc/install_virtualenv.sh 
# install_virtualenv

source ./inc/install_clang.sh 
# install_clang
# TODO: Define which version of clang to install

source ./inc/install_ruby.sh 
# install_ruby
# TODO: define which version of ruby to install

source ./inc/install_go.sh
# install_go
# TODO: GO_VERSION=1.9

source ./inc/install_license.sh 
# install_license     # requires git and go

# Hub requires git, github, ruby, and go
source ./inc/install_hub.sh 
# install_hub

source ./inc/install_postgresql.sh
# install_postgresql

source ./inc/install_mongodb.sh 
# install_mongodb

source ./inc/install_nodejs.sh 
# install_nodejs

source ./inc/install_weechat.sh
# install_weechat

install_youcompleteme(){
  install_vundle 
  install_tmux_plugins 
  install_clang 
  install_python 
  install_nodejs 
  install_go 
  # We recommend installing Vim, Python, Clang, Node.js and Go before installing You Complete Me
  # Install You Complete Me for Vim.
  # TODO: How to install vim.
  cd ~/.vim/bundle/YouCompleteMe 
  ./install.py --clang-completer --js-completer --go-completer 
  # TODO: Find out why Python 3 is not being used.
  # TODO: Also, did YCM include --go-completer?
}

source ./inc/install_r.sh
# install_r

echo "I've given you the tools. You just need to fill in the blanks."
echo "The dotfiles directory contains most of what I use to set up all these programs, but my personal info has been redacted."
echo "Good luck and happy hacking!"
# TODO: We need to create the dot files.

