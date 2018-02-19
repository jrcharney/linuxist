#!/bin/bash
# File: inc/install_weechat.sh
# Info: Install Weechat IRC
# Usage: source ./inc/weechat.sh

install_weechat(){
  # Install Weechat IRC
  # TODO: This is the best example
  # TODO: What is weechat depdent on?
  sudo apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
  sudo bash -c "echo 'deb https://weechat.org/ubuntu xenial main' >/etc/apt/sources.list.d/weechat.list"
  sudo apt update && sudo apt install weechat-curses weechat-plugins
}

