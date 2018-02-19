#!/bin/bash
# File: ./inc/install_nodejs.sh
# Info: Install Node.js with Yarn, NVM, and Gulp.
# Usage: source ./inc/install_nodejs.sh
# Requires: install_mongodb.sh

install_nodejs(){
  # Install NodeJS and Yarn
  
  # TODO: Next time around, isntall node using nvm.
  #       Right now, doing so will break stuff.
  #       And Yarn isn't 100% compatible with nvm yet.
  #       So for now these tow commands are bentched
  # curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash 
  # curl -o- -L https://yarnpkg.com/install.sh | bash

  # TODO: -sL or -sS?
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  sudo apt update && sudo apt install nodejs
 
  # Install Yarn. (Bower is a dead parrot!)
  # See https://yarnpkg.com/
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update && sudo apt-get install yarn
  
  # Apparently, NPM works better when there is a Node version manager present.
  # NPM says we don't need to reinstall node to install it, which is good because installing yarn befor installing nvm
  # would be ideal considering that NVM has osme issues with yarn.
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash 
  
  # TODO: What about Webpack (https://webpack.js.org/)?  I'll need to get back to you on that.
  # For now let's put a pin in that.
  # I would suggest reading this though
  # https://medium.com/front-end-hacking/what-are-npm-yarn-babel-and-webpack-and-how-to-properly-use-them-d835a758f987
  # TODO: Make a script to include babel (https://babeljs.io/) when making new node.js projects.
  # TODO: Make a script to create new React.js (https://reactjs.org/) projects.
  # TODO: Make a script to create new Three.js (https://threejs.org/) projects.
  # TODO: Definitely write something for Express.js (https://expressjs.com/). (Part of MERN)
  # TODO: What about Socket.io? (https://socket.io/) (We can use it with Express.js, but what about React?)
  #       TODO: Find more uses of socket.io.
  # TODO: Take alook at other javascript libraries just for fun.
  # * Processing.js (http://processingjs.org/)
  # * Physics.js (http://wellcaffeinated.net/PhysicsJS/)
  # * Planck.js (http://piqnt.com/planck.js/)
  # * Matter.js (http://brm.io/matter-js/)
  # * Cannon.js (http://www.cannonjs.org/)
  # Use CDNJS (https://cdnjs.com/) to try them out!

  # Install typescript, you'll want this for YouCompleteMe for Vim.
  # See http://www.typescriptlang.org/
  sudo npm install -g typescript
  # sudo npm install -g
  
  #install_virtualenv                        # nodeenv is dependent on virtualenv
  #sudo pip install --no-cache-dir nodeenv   # TODO: Does this install node 9.4.0?
  #nodeenv env                               # TODO: Is this right?
  # UPDATE: DO NOT INSTALL NODEENV!
  # I still recommnd using virtualenv for Python projects, but do not use nodeenv.
  # If you ran the previous two commands, get rid of it using these two commands
  # rm -rf ~/env      # or wherever you made that env directory
  # sudo /usr/local/bin/nodeenv
  
  # So what should we install when we create a new node project?
  # Well, most node projects are MEAN stack
  # Mongodb for a database
  # Express.js for a "Sinatra-like" back-end web application framework
  # Angular.js/Angular.io for front-end web application framework
  # Node.js for the server runtime environment

  nvm load                                           # Load NVM for Angular.
  sudo npm install --unsafe-perm -g @angular/cli     # Install the Angular CLI from Angular.io
  nvm unload                                         # We can continue to build our global tool arsenal.
  # Because node-sass keeps falling into an infinite loop, we need to use the --unsafe-perm 
  # angular appears to einsall ejs (express.js?) and webpack, and sass? (node-sass)
  install_mongodb         # A NoSQL Database
  # Angular needs a Task Runner. Gulp provides a way to do this as a pipeline.
  # See https://gulpjs.com 
  sudo npm install gulp-cli -g
}

