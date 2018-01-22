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
  [[ $- == *i* ]] && echo "Interactive" || echo "Not interactive"
  shopt -q login_shell && echo "Login shell" || echo "Not login shell"
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

# TODO: Fix the issue that causes duplicate entries in $PATH when opening TMUX
# TODO: What about zsh?


# Update and upgrade
# TODO: Add this to ~/.bash_aliases
sudo apt update && sudo apt upgrade
# alias uu="sudo apt update && sudo apt upgrade"

install_git(){
  # Install Git from the Git Repo (optional but recommended)
  sudo add-apt-repository ppa:git-core/ppa
  sudo apt-get update
  sudo apt-get install git
}

install_software(){
  # A whole bunch of fun stuff to install
  # TODO: Should I alphabetize this list?  Probably should order it by dependency
  # TODO: Break this up into smaller parts.
  sudo apt install build-essentials apt-transport-https vim-nox lolcat figlet expect tcl tk dialog libncurses5 libncurses5-dev htop openssl-blacklist isag fortune pv jq screenfetch cowsay cmatrix tmux mc nmap tig gitk bc exuberant-ctags ninvaders nsnake pacman4console cmakepython-pip python3-pip python-dev python3-dev texworks texlive textworks-scripting-lua texworks-scripting-python textlive-xetex hunspell octave x11-apps perl-tk xzdec youtube-dl xsel lynx lynx-common asciiweather libssl-dev 

  # TODO: what was isag for? Interactive system grapher.

  # Programs that requre VcXsrv and how to run them
  # texworks &

  # This is used to enable VcXsrv
  echo "export DISPLAY=localhost:0.0" >> ~/.bashrc
  echo "export DISPLAY=localhost:0.0" >> ~/.zshrc
}


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

install_vundle_and_tmux_stuff(){
  # vim ~/.vimrc
  # vim ~/.bash_aliases
  # vim ~/.tmux.conf ?
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
  vim +PluginInstall +qall
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  mkdir ~/.tmux/resurrect 
}

install_github(){
  # Set up GitHub
  # TODO: Aks for first name and last name
  # TODO: Ask for git username 
  # TODO: Ask for email address
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
  # See https://github.com/jrcharney/githubist for how to create repos
}

# cd Projects
# mkdir $PROJECT
# cd $PROJECT
# git init
# git add .
# git commit -m "First commit"
#

install_clang(){
  # Install Clang
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

install_ruby(){
  # Install Ruby under rbenv.
  # Ubuntu does come with Ruby, but like everything that comes from their repo it is OLD!
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  # Optionally, try to compile dynamic bash extension to speed up rbenv.  If it fails, rbenv will be OK to use.
  cd ~/.rbenv && src/configure && make -C src && cd ~ 
  # Add ~/.rbenv/bin to $PATH
  # Ubuntu Desktop will need to make these changes in ~/.bashrc instead of ~/.bash_profile
  echo "export PATH=\$HOME/.rbenv/bin:\$PATH" >> ~/.bashrc
  # Zsh users will need to modify ~/.zshrc instead of ~/.bash_profile
  echo "export PATH=\$HOME/.rbenv/bin:\$PATH" >> ~/.zshrc
  # For all other Linux users, edit ~/.bash_profile
  # echo "export PATH=$HOME:/.rbenv/bin:$PATH" >> ~/.bash_profile
  # Run rbenv init.
  ~/.rbenv/bin/rbenv init
  # Add this line below the previous export line you added.
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.zshrc
  # echo "eval \"\$(rbenv init -)\"" >> ~/.bash_profile
  # Close this terminal and reopen it so the changes to $PATH take effect
  # Upon opening a new terminal, install the rbenv-doctor script to make sure everyting installed properly
  # Even if you use Zsh, you'll still want to run it with Bash.
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash 
  # Optionally, Insttall ruby-build which provides ruby-build install to simplify installing new ruby versions
  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build 
  # There is one more line to add to .bashrc/.zshrc if ruby-build is successful.
  echo "export PATH=\$HOME/.rbenv/plugins/ruby-build/bin:\$PATH" >> ~/.bashrc
  echo "export PATH=\$HOME/.rbenv/plugins/ruby-build/bin:\$PATH" >> ~/.zshrc
  # To see all the available versions of ruby, run this next line.
  # rbenv install -l
  # To see what is going on under the hood, run this next line and mind the hyphen!
  # rbenv init -
  # Install the version of ruby most current.  There is no verbose way of telling how long it will take,
  #   so go do something 
  rbenv install -v 2.5.0
  rbenv global 2.5.0
  rbenv rehash      # REHASH EVERYTIME YOU INSTALL SOME BINARY FOR RUBY!
  # We need to install the bundler gem (https://bundler.io)
  gem install bundler
  rbenv rehash
  gem install lolcat              # Trust me. You will want this one. TODO: Set the requirements.
  # To upgrade rbenv, run this next line
  # cd ~/.rbenv && git pull
  # To upgrade ruby build, run this next line
  # cd "$(rbenv root)"/plugins/ruby-build && git pull
}

install_go(){
  # Install Go Language
  # TODO: GO_VERSION=1.9
  sudo add-apt-repository ppa:gophers/archive
  sudo apt update && sudo apt install golang-1.9-go
  # Bash users add this to your profile
  echo "export GOROOT=/usr/lib/go-1.9" >> ~/.profile
  echo "export PATH=\$PATH:\$GOROOT/bin" >> ~/.profile
  # Zsh users need to add those lines to ~/.zshrc 
  echo "export GOROOT=/usr/lib/go-1.9" >> ~/.zshrc
  echo "export PATH=\$PATH:\$GOROOT/bin" >> ~/.zshrc
}

install_hub(){
  # Hub requires a few things
  install_git
  install_github
  install_ruby
  install_go
  # Install Hub. Hub helps us do more stuff with git.
  # Hub requires installing make, git, ruby, and go.
  # It probably would be wise to install git, ruby, and go with the three sets of commands
  # Previously used in this script.
  # Fortunately, we can use Go to install Hub.
  go get github.com/github/hub
  # There is also some stuff for code completion
  # See it at https://github.com/github/hub/tree/master/etc for how to install it.
}

install_posgresql(){
  # Install PostgreSQL
  sudo vim /etc/apt/sources.list.d/pgdg.list    # TODO: Figure out how to do this in command line Look at Weechat or Yarn
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
  sudo apt update && sudo apt install postgresql-9.6
}

install_virtualenv(){
  # Install Virtual Environment (for Python)
  # It needs pip to be installed. And we can't store it in a cache directory
  sudo apt-get install python-pip python3-pip
  sudo pip install --no-cache-dir --upgrade pip 
  sudo pip3 install --no-cache-dir --upgrade pip
  sudo pip install --no-cache-dir virtualenv
  # TODO: virtualenv requires a directory?
}

install_nodejs(){
  # Install NodeJS and Yarn
  # TODO: -sL or -sS?
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  sudo apt update && sudo apt install nodejs
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update && sudo apt-get install yarn
  sudo npm install -g typescript
  # sudo npm install -g
  install_virtualenv                        # nodeenv is dependent on virtualenv
  sudo pip install --no-cache-dir nodeenv   # TODO: Does this install node 9.4.0?
  nodeenv env                               # TODO: Is this right?
}

install_weechat(){
  # Install Weechat IRC
  # TODO: This is the best example
  # TODO: What is weechat depdent on?
  sudo apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
  sudo bash -c "echo 'deb https://weechat.org/ubuntu xenial main' >/etc/apt/sources.list.d/weechat.list"
  sudo apt update && sudo apt install weechat-curses weechat-plugins
}

install_youcompleteme(){
  install_vundle_and_tmux_stuff 
  # Install You Complete Me for Vim.
  # TODO: How to install vim.
  cd ~/.vim/bundle/YouCompleteMe 
  ./install.py --clang-completer --js-completer --go-completer 
  # TODO: Find out why Python 3 is not being used.
  # TODO: Also, did YCM include --go-completer?
}

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

install_zsh(){
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
}

echo "I've given you the tools. You just need to fill in the blanks."
echo "The dotfiles directory contains most of what I use to set up all these programs, but my personal info has been redacted."
echo "Good luck and happy hacking!"
# TODO: We need to create the dot files.

