#!/bin/bash
# File: Linuxist/install.sh
# Info: Install various Linux software to do cool stuff.
# TODO: Go to nerdfonts.com and download the nerdfonts. I suggest getting the Hack font and setting your terminal font to NF Hack.
# TODO: Create a dialog interface for installing stuff, sort of like how raspbian does it.
# TODO: Split this script into smaller scripts.

echo "This script is NOT meant to be run. It just includes the steps for creating a kickass environment."
echo "It was created on Vim in Zsh on Bash for Ubuntu for Windows."
exit 0

if [[ $(whoami) != root ]]; then
    echo "You can't run this script. You need to be root."
    exit 0
fi 

# Safety
echo "Sorry, you can't run this script yet."
exit 0

# REMINDER: If you are using Windows, be sure to install
#   * Ubuntu for Windows from the Microsoft Store
#   * Mintty's WSLTTY from Github
#   * VcXsrv from Sourceforge
# See the Windowsist repository for details.

# NOTE: You need to have a Interactive Login shell so that $PATH can be modified.
[[ $- == *i* ]] && echo 'Interactive' || echo 'Not interactive'
shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'
# If the two tests did not return "Interactive" and "Login shell", 
# Go Language and anything else you want to add to ~/.profile WILL NOT LOAD!
# ~/.profile will only work if you are using an interactive login shell.
# Generally, this is a problem if you are using the Ubuntu Terminal on Windows, but there is a simple fix.
# Change the Target in the Ubuntu Terminal shortcut from this
#   %LOCALAPPDATA%\wsltty\bin\mintty.exe --WSL="Ubuntu" --configdir="%APPDATA%\wsltty" -~ 
# to this
#   %LOCALAPPDATA%\wsltty\bin\mintty.exe --WSL="Ubuntu" --configdir="%APPDATA%\wsltty" -~ /bin/bash -l
# You MUST put The `-~` before `/bin/bash -l` or else the Ubuntu Terminal will crash.


# TODO: Fix the issue that causes duplicate entries in $PATH when opening TMUX
# TODO: What about zsh?


# Update and upgrade
# TODO: Add this to ~/.bash_aliases
sudo apt update && sudo apt upgrade
# alias uu="sudo apt update && sudo apt upgrade"

# A whole bunch of fun stuff to install
# TODO: Should I alphabetize this list?
sudo apt install build-essentials apt-transport-https vim-nox lolcat figlet expect tcl tk dialog libncurses5 libncurses5-dev htop openssl-blacklist isag fortune pv jq screenfetch cowsay cmatrix tmux mc nmap tig gitk bc exuberant-ctags ninvaders nsnake pacman4console cmakepython-pip python3-pip python-dev python3-dev texworks texlive textworks-scripting-lua texworks-scripting-python textlive-xetex hunspell octave x11-apps perl-tk xzdec youtube-dl xsel lynx lynx-common asciiweather

# TODO: what was isag for? Interactive system grapher.

# Programs that requre VcXsrv and how to run them
# texworks &

# TODO: Should this be in ~/.profile?
echo "export DISPLAY=localhost:0.0" >> ~/.bashrc

# Create folders
ln -s /mnt/c/Users/$USER ~/WinHome
# TODO: Create a directory with softlinks to the windows locations in it.
mkdir ~/WinDirs      # A place to put softlinks to window directories.

# Clouds
# TODO: Put this in a loop
# TODO: What about other services?
[[ -d /mnt/c/Users/$USER/Dropbox ]] && ln -s /mnt/c/Users/$USER/Dropbox ~/WinDirs/Dropbox
# What about Personal Dropbox?
[[ -d /mnt/c/Users/$USER/OneDrive ]] && ln -s /mnt/c/Users/$USER/OneDrive ~/WinDirs/OneDrive 

# TODO: Put this in a loop
mkdir ~/bin					# Run your own scripts or softlinks without the `./` prefix. Be sure to chmod u+x first!
mkdir ~/Documents		# Documents
mkdir ~/Pictures		# Pictures
mkdir ~/Music				# Music
mkdir ~/Videos			# Videos
mkdir ~/Public 			# Put stuff you want to post online here
mkdir ~/Sandbox 		# A place to try out stuff
mkdir ~/Templates 	# Templates
mkdir ~/Projects 		# Your projects on Github
mkdir ~/Projects/Repos
mkdir ~/Software		# Downloaded software from Github
mkdir ~/Software/Repos

# Install some scripts into the local bin directory
cd ~/bin 
curl ix.io/client > ix														# paste code clips on ix.io
curl -sLO http://scie.nti.st/dist/256colors2.pl		# Download to test if you need to change color settings to your terminal.
chmod +x ix
chmod +x 256colors2.pl 
cd ~

# Install pipes.sh
cd ~/Software
mkdir pipeseroni 
cd pipeseroni
git clone https://github.com/pipeseroni/pipes.sh 
cd pipes.sh 
sudo make install 
# pipes.sh should now be available?
cd ~

# vim ~/.vimrc
# vim ~/.bash_aliases
# vim ~/.tmux.conf ?
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
vim +PluginInstall +qall
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir ~/.tmux/resurrect 

# Set up GitHub
# TODO: Aks for first name and last name
# TODO: Ask for git username 
# TODO: Ask for email adress
ssh-keygen -f ~/.ssh/id_rsa_github -t rsa -b 4096 -C "$EMAIL"
ssh-add ~/.ssh/id_rsa_github 
# Ask as an array such that if there is only one argument, don't put a space between
git config --global user.name "$FIRST_NAME $LAST_NAME"
git config --global user.username "$GIT_USERNAME"
git config --global user.email "$EMAIL"
git config --global credential.helper 'cache --timeout=3600'
git config --global color.ui "auto"
git config --global web.browser "google-chrome"
git config --global core.autocrlf "input"
git config --global push.default simple       # When pushing, only push the current branch. "matching" pushes all branches.
# These setting will be stored at ~/.gitconfig
ssh -vT -p 443 git@ssh.github.com

# cd Projects
# mkdir $PROJECT
# cd $PROJECT
# git init
# git add .
# git commit -m "First commit"
#

# Install Clang
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main"
sudo apt-get update
sudo apt-get install clang-5.0
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-5.0 1000
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-5.0 1000
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-5.0 1000
sudo update-alternatives --config clang
sudo update-alternatives --config clang++

# Install Go Language
sudo add-apt-repository ppa:gophers/archive
sudo apt update && sudo apt install golang-1.9-go
echo "export GOROOT=/usr/lib/go-1.9" >> ~/.profile
echo "export PATH=\$PATH:\$GOROOT/bin" >> ~/.profile

# Install PostgreSQL
sudo vim /etc/apt/sources.list.d/pgdg.list    # TODO: Figure out how to do this in command line Look at Weechat or Yarn
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update && sudo apt install postgresql-9.6

# Install Virtual Environment (for Python)
# It needs pip to be installed. And we can't store it in a cache directory
sudo apt-get install python-pip python3-pip
sudo pip install --no-cache-dir --upgrade pip 
sudo pip3 install --no-cache-dir --upgrade pip
sudo pip install --no-cache-dir virtualenv
# TODO: virtualenv requires a directory?

# Install NodeJS and Yarn
# TODO: -sL or -sS?
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt update && sudo apt install nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
sudo npm install -g typescript
# sudo npm install -g 
sudo pip install --no-cache-dir nodeenv   # TODO: Does this install node 9.4.0?
nodeenv env                               # TODO: Is this right?

# Install Weechat IRC
# TODO: This is the best example
sudo apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
sudo bash -c "echo 'deb https://weechat.org/ubuntu xenial main' >/etc/apt/sources.list.d/weechat.list"
sudo apt update && sudo apt install weechat-curses weechat-plugins

# Install You Complete Me for Vim.
cd ~/.vim/bundle/YouCompleteMe 
./install.py --clang-completer --js-completer --go-completer 
# TODO: Find out why Python 3 is not being used.
# TODO: Also, did YCM include --go-completer?

# Install R
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo bash -c "echo 'deb http://cran.wustl.edu/bin/linux/ubuntu xenial/' >/etc/apt/sources.list.d/cran.list"
sudo apt update
sudo apt install r-base r-base-dev r-cran-rcmdr r-cran-rcmdr-misc
# To run R graphically, you will need VcXsrv
# sudo R      # Running R must be doen by root
# Rcmdr       # Rcmdr is a graphical user interface

# Install Zsh, Antigen, Oh My Zsh, and Powerlevel9k
# We want to do this separately in case you're more into bash than zsh
# Windows Linuxists may want to make a copy of their Ubuntu Termnal shortcut 
# so that they can change the default terminal from bash to zsh.
sudo apt-get install fish fish-common     # Just for the heck of it, let's install the fish shell.
sudo apt-get install zsh                  # Install zsh
sudo chmod -R 755 /usr/local/share/zsh		# Zsh requires directories to have 755 permission. (I would suggest using this everywhere on BUW, except in directories with special permissions (i.e. temp directories). Use this wisely
curl -L git.io/antigen > antigen.zsh			# Install antigen
# TODO: How did I instruct fixing ~/.antigen's directories?
# ~/.zshrc	 will be where we set our zsh settings.
# ~/.antigenrc will be where we put the antigen settings
# ~/.powerlevel9krc will be where we put the powerlevel9k settings
# TODO: Copy Bash's ~/.bash_aliases to ~/.zsh_aliases

echo "I've given you the tools. You just need to fill in the blanks."
echo "The dotfiles directory contains most of what I use to set up all these programs, but my personal info has been redacted."
echo "Good luck and happy hacking!"
# TODO: We need to create the dot files.

