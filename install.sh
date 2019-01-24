#!/usr/bin/env bash

# This is heavily inspired by the amazing Michelle, Luke and Avi
# https://github.com/craychee/loki-init
# https://github.com/lukewertz/gabriel-init
# https://github.com/froboy/durandal-init

function pause() {
  read -p "$*"
}

CWD=($PWD)

cd ~

# We can't get them directly, but just click this button :)
xcode-select --install

pause 'Press [Enter] once you have installed XCode and XCode Command Line Tools.'

# Just make sure...
sudo xcodebuild -license accept

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Homebrew
brew install imagemagick
brew install ruby
brew install git
brew install wget
brew install brew-cask

brew tap caskroom/cask
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/binary
brew tap homebrew/php
brew install homebrew/php/terminus
brew install homebrew/php/wp-cli

# Applications
brew cask install 1password
brew cask install balsamiq-mockups
brew cask install bartender
brew cask install docker
brew cask install firefox
brew cask install google-backup-and-sync
brew cask install google-chrome
brew cask install google-photos-backup
brew cask install harvest
brew cask install iterm2
brew cask install java
brew cask install kap
brew cask install lando
brew cask install quicklook-json
brew cask install rescuetime
brew cask install screaming-frog-seo-spider
brew cask install slack
brew cask install sublime-text
brew cask install transmit
brew cask install vlc
brew cask install zoomus

# Node/NPM Tools
brew install node
brew install npm
# Easy accessibility audits powered by the Chrome Accessibility Tools
npm install --global a11y
# A package manager for the web
npm install -g bower
# The Grunt command line interface
npm install --global grunt-cli
# Grunt wrapper for criticalcss
npm install -g grunt-criticalcss
# Automates ImageOptim, ImageAlpha, and JPEGmini
npm install --global imageoptim-cli
# Lighthouse analyzes web apps and web pages, collecting modern performance metrics and insights on developer best practices
npm install --global lighthouse
# Pa11y is your automated accessibility testing pal. It runs HTML CodeSniffer from the command line for programmatic accessibility reporting
npm install --global prettier
# PageSpeed Insights with reporting
npm install --global psi
# Using sitespeed.io you can test your web site against Web Performance best practices
npm install --global sitespeed.io
# Generate uuids from the command line
npm install -g uuid-cli
# WebPageTest API Wrapper is a NPM package that wraps WebPageTest API for NodeJS
npm install --global webpagetest

# Get composer and put it in the right place. This will require your password
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Install Composer tools
# composer parallel install plugin
composer global require hirak/prestissimo
# Drupal Coder, PHP_CodeSniffer, and Drupal Coding Standards
composer global require drupal/coder
# Adds WordPress Coding Standards
composer global require wp-coding-standards/wpcs:dev-master

# Sets Config for PHP_CodeSniffer
phpcs --config-set installed_paths $HOME/.composer/vendor/drupal/coder/coder_sniffer,$HOME/.composer/vendor/wp-coding-standards/wpcs

# Set up PHP tools
# https://philsturgeon.uk/php/2013/08/20/php-static-analysis-in-sublime-text/
# http://benmatselby.github.io/sublime-phpcs/
echo "Setting up PHP Tools"
sudo chown -R `whoami` /usr/local
brew tap homebrew/homebrew-php

# Do the Mac thing that you have to do but you shouldn't have to do
# This https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain
curl -o ~/Library/LaunchAgents/ssh.add.a.plist https://raw.githubusercontent.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain/master/ssh.add.a.plist

# Hold my own hand to make sure I finish configuring
echo "Add your ssh keys (you put them in your secret hiding place)."
pause 'Press [Enter] when you have added your ssh key.'
chmod 400 ~/.ssh/*

# Get git things
curl -o /usr/local/etc/bash_completion.d/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o /usr/local/etc/bash_completion.d/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

echo "Script finished.  Be sure to install Pixelmator manually."
