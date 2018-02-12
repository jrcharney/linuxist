# File: ~/.bash_aliases
# Info: This file contains a list of aliases that can be used to execute tasks.
#	This is recommended for single line tasks.  Full scripts should go in ~/bin
# See https://akbarahmed.com/2012/06/25/create-a-bash_aliases-file/
# Aliases are not applied until the bash shell is closed and reopened again or the server restarts.

# Stuff I could enable.
# I was considering these, until I realized all I needed to when color doesn't show up is
#	add `CLICOLOR=1` in `~/.bashrc`
# alais ls='ls -G'	# Apply colors to directories like in Linux
# alias ll='ls -lG'	# Do that but as a list this time.
# alias la='ls -aG'	# Shwo the hidden files too.
# alias lla='ls -laG'	# Pretty much everything those last two lines does
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
# Don't make a lls. That is used in SFTP.

alias uu='sudo apt update && sudo apt upgrade'	# Perform an update and an upgrade.
alias retmux='tmux a'	    # Restore a tmux session. I don't think this will workr in Windows.
alias swp_check='find ~ -type f -name "*.sw[op]"'   # Check for vim backup files which could indicate where files were still open when vim probably didn't shut down correctly.

# For Bash for Window, correct the mode for when creating directories.
#alias md='function _mkdir(){ 
#  mkdir -m 755 $@ ; 
#  for 
#  find $@ -type d -exec chmod 755 {} \;; 
#};_mkdir'

# SSH Shells
# TODO: This should probably go in a separate file.

# TODO: Git Repos
# TODO: AWS

# TODO: Node.js/React/Yarn stuff
# TODO: MongoDB stuff
alias start_mongo='sudo service mongodb start'
alias stop_mongo='sudo service mongodb stop'
alias restart_mongo='sudo service mongodb restart'
alias status_mongo='sudo service mongodb status'
# alias run_mongo='mongo --host 127.0.0.1:27017'
# TODO: Angular stuff
# TODO: Reminders about git/npm/nvm/virtualenv/rbenv initalization
# TODO: PostgreSQL (psql) stuff

