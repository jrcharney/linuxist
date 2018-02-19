#!/bin/bash
# File: install_zsh.sh
# Info: Install the Z Shell, Fish, Oh My Zsh, Antigen, and Powerlevel9k

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
  # TODO: Add lines that add ~/.bash_aliases and ~/.zsh_aliases to ~/.zshrc even if they don't exists.
  #         Decide where to put the lines. Before or after path exports.
}

