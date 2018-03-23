#!/bin/bash
# File: ./inc/install_github.sh
# Info: Define github settings
# Usage: source ./inc/install_github.sh
# Note: install_github should install git (if not, try running install_git.sh)
# install_git.sh installs the Git SCM
# install_github.sh establishes the settings that should be defined for git.
# TODO: Make sure SSH software is installed first. Typically it is OpenSSH unless there is something else.
# See https://www.ssh.com/ssh/config/
# See https://medium.com/@trionkidnapper/ssh-keys-with-multiple-github-accounts-c67db56f191e
# See https://help.github.com/articles/using-ssh-over-the-https-port/

# TODO: Create a dialog interface for filling out the fields below
# TODO: Why isn't this working?!
install_github(){
  install_git 
  # Set up GitHub
  # TODO: Aks for first name and last name
  # TODO: Ask for git username 
  # TODO: Ask for email address
  ssh-keygen -f ~/.ssh/id_rsa_github -t rsa -b 4096 -C "Github $EMAIL"
  ssh-add ~/.ssh/id_rsa_github
  # Configure our SSH file.
  cat << EOF >> ~/.ssh/config 
# Github
Host github.com
  Hostname ssh.github.com 
  Port 443
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_rsa_github 

EOF
  # Ask as an array such that if there is only one argument, don't put a space between
  # These setting will be stored at ~/.gitconfig
  git config --global user.name "$FIRST_NAME $LAST_NAME"
  git config --global user.username "$GIT_USERNAME"
  git config --global user.email "$EMAIL"
  git config --global credential.helper 'cache --timeout=3600'
  git config --global color.ui "auto"
  git config --global web.browser "google-chrome"
  git config --global core.autocrlf "input"
  git config --global push.default simple       # When pushing, only push the current branch. "matching" pushes all branches.
  # ssh -vT -p 443 git@ssh.github.com 
  ssh -i ~/.ssh/id_rsa_github -vT -p 443 git@ssh.github.com
  # See https://github.com/jrcharney/githubist for how to create repos
}

