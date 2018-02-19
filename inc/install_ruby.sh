#!/bin/bash
# File: ./inc/install_ruby.sh
# Info: Install Ruby under rbenv
# Usage: source ./inc/install_ruby.sh

# TODO: Add a variable to define which version of ruby to install.
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

