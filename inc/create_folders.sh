#!/bin/bash
# File: ./inc/bin/bash
# Info: Create the typical folders that would be in the Linux Home Directory.
#       If you are using Windows, a directory to access your Windows home will be added to access from bash.
#       We recommend doing this as Microsoft Windows does not use the same permission configuration system as Linux does.
# Usage: source ./inc/create_folders.sh

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

  if [[ $(uname -r) =~ Microsoft ]]; then 
    if [[ -d /mnt/c/Users ]]; then
      # umask 022           # TODO: Should I enable this line to avoid making my directories executable?  (Hey, Microsoft, fix this!)
      WINHOME=/mnt/c/Users/$USER
      NIXHOME=$HOME/WinDirs 
    
      ln -s $WINHOME $NIXHOME 
      # TODO: Create a directory with softlinks to the windows locations in it.
      mkdir -p $NIXHOME      # A place to put softlinks to window directories.
    
      # Clouds
      # TODO: What about outer services?
      # TODO: What about personal Dropbox?
      # TODO: What about these services for Linux?
      for d in Dropbox OneDrive; do
        [[ -d "$WINHOME/$d" ]] && ln -s $WINHOME/$d $NIXHOME/$d 
      done
    fi 
  fi

  # Create these folders if they do not exist.
  # The bin directory should be where you put your own soft links or scripts.
  for d in bin Documents Pictures Music Videos Public Sandbox Templates Projects Software; do 
    [[ ! -d "$HOME/$d" ]] && mkdir -p $HOME/$d
  done 

  # Projects should be where you put your own code.
  # Software should be where you put the code that belongs to others.
  # TODO: Would putting Software in Download and creating a softlink to it be a good idea?
  for d in Projects Software; do 
    [[ ! -d "$HOME/$d/Repos" ]] && mkdir -p $HOME/$d/Repos
  done 
}

