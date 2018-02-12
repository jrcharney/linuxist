#!/bin/bash
# File: dotfiler.sh
# A simple script to make copies of usual dotfiles.
# NOTE: dotfiler does not sanitize personal info from dotfiles...yet.
# TODO: Have sed clean out the personal bits.

# TODO: make sure we are running this program in this downloaded repo
if [[ "$(basename ${PWD})" != "linuxist" ]]; then
  echo "Please don't run dotfiler in the Linuxist repository."
  exit 1
fi


DOTFILES_DIR=${PWD}/dotfiles     # The dot files directory should be this repo's directory

# Creae the dotfile directory if it does not exist
[[ ! -d "${DOTFILES_DIR}" ]] && mkdir ${DOTFILES_DIR}

## cd ${DOTFILES_DIR}
# If they exist, make copies of
# [ ] Bash files
# [[ -f "~/.bash_aliases" ]] && cp ~/.bash_aliases ${DOTFILES_DIR} 
# [ ] Zsh files and Antigen files

# [ ] Antigen
# [ ] Vim files
# [ ] Tmux files
# [ ] Powerlevel9K
# [ ] Git config
# [ ] Others

list=(
.bashrc
.bash_aliases
.antigenrc
.powerlevel9krc
.profile
.tmux.conf
.tmux-status.conf
.vimrc
.zshrc
.zsh_aliases
.zprofile
.gitconfig
)

for file in "${list[@]}"; do
  if [[ -f "${HOME}/${file}" ]]; then
    echo "Copying ${HOME}/${file} to ${DOTFILES_DIR}/${file}"
    cp ${HOME}/${file} ${DOTFILES_DIR}/${file}
  fi
done

# Clean up ~/.gitconfig to avoid positng personal stuff
sed -i -e 's/^\(\tname = \).*$/\1REDACTED/;s/^\(\temail = \).*$/\1REDACTED/;s/^\(\tusername = \).*$/\1REDACTED/' ${DOTFILES_DIR}/.gitconfig

