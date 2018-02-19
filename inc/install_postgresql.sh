#!/bin/bash
# File: inc/install_postgresql.sh
# Info: Install PostgreSQL
# Usage: source ./inc/install_postgresql.sh

install_postgresql(){
  # Install PostgreSQL
  echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list 
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
  sudo apt update && sudo apt install postgresql-9.6
}

