#!/bin/bash
# File: ./inc/install_mongodb.sh
# Info: Install MongoDB
# Usage: source ./inc/install_mongodb.sh
# Note: You will want to install MongoDB before installing Node.js

# TODO: Add a variable determining which version of mongodb to download
install_mongodb(){
  # This process shold install MongoDB community edition
  # See https://docs.mongodb.com/master/tutorial/install-mongodb-on-ubuntu/
  # However this resolves problems with installing on WSL https://github.com/Microsoft/WSL/issues/796#issuecomment-330128289
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
  sudo apt-get update
  # So apparently, the latest mongodb (from the Mongo website) won't work on it's own unless we install Ubuntu's mongo first.
  # Basically it needs a jumpstart.
  sudo apt-get install mongodb            # Ubuntu's MongoDB
  sudo apt-get install mongodb-org        # MongoDB's MongoDB (overwrites Ubuntu's)
  # Pin a specific version (if you want)
  # echo "mongodb-org hold" | sudo dpkg --set-selections
  # echo "mongodb-org-server hold" | sudo dpkg --set-selections
  # echo "mongodb-org-shell hold" | sudo dpkg --set-selections
  # echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
  # echo "mongodb-org-tools hold" | sudo dpkg --set-selections
  # Run the MongoDB daemon
  # Don't run it like MongoDB does.
  # sudo service mongod start     # should listen to port 27017 unless specified. Check /var/log/mongodb/mongodb.log for details.
  # Run it the Ubuntu way!
  sudo service mongodb start      # TODO: OK, so how do we runt this when WSLTTY starts up?
  # Start a mongo shell (Settings are applied in /etc/mongodb.conf) 
  mongo # --host 127.0.0.1:27017
  # The databases should be stored in /var/lib/mongodb
  # The log files should be stored in /var/log/mongodb
}

