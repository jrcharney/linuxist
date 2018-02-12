# Info: Set up the prompt
# NOTE: ~/.zprofile will set up zsh if it is a login shell
#       ~/.zshrc sets up zsh as an interactive shell
#       Having both options is good.
# TODO: Find a way to enable login shell for zsh. 

# Set the umask to fix WSL's error of setting directories to 777
umask 022

# Don't renice the background processes (this should fix a WSL issue.)
unsetopt BG_NICE

# Set the terminals.
# TODO: Can we use xterm-256color in tmux instead of screen-256?
export TERM=xterm-256color 
[ -n "$TMUX" ] && export TERM=screen-256color

# Because zsh doesn't use a ~/.profile like Bash, we need to set our paths here.
# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Set exports for Node/NPM/NVM
# NPM recommends using NVM.
# See https://github.com/creationix/nvm
# See https://github.com/lukechilds/zsh-nvm
# export NVM_AUTO_USE=true
export NVM_LAZY_LOAD=true
export NVM_NO_USE=true          # Don't load nvm at startup. 
# Load the Go language.
# NOTE: WSLTTY needs to be a login shell (which it is not) for this to work.
export GOROOT=/usr/lib/go-1.9
export PATH=$PATH:$GOROOT/bin

# rbenv for Ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
# This next line is needed to add the ruby-build
export PATH=$HOME/.rbenv/plugins/ruby-build/bin:$PATH 

# Load alias files if they exists
# Generally, you can just ad new aliases to ~/.bash_aliases.
# ~/.zsh_aliases really isn't used as much.
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# export ADOTDIR=~/.antigen
# export ANTIGEN_BUNDLE=$ADOTDIR/bundles

# Alien Theme properties
# export ALIEN_THEME="blue"   # blue, green, or red
# # export USE_NERD_FONT=1      # Enable Nerd Font. (We don't have to do this with the Hack font.)

# Powerlevel9K theme
# TODO: Let's put all that POWERLEVEL9K stuff into ~/.powerlevel9krc
# POWERLEVEL9K_* variables should be set here. Unless they need to be set eariler.
source ~/.powerlevel9krc 

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
# TODO: Do we need to use this? What's wrong with vi?
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Load Antigen
# Note: We can't move antigen.zsh to ~/bin. It breakes everything.
if [ -f ~/antigen.zsh ]; then
  #if [ ! -n "$TMUX" ]; then     # Don't reload this in tmux
    source ~/antigen.zsh 
    antigen init ~/.antigenrc
  #fi
fi

export DISPLAY=:0         # We need this for vcXsrv
