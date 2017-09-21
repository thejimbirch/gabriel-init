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

# Installing software...
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
brew cask install flux
brew cask install google-chrome
brew cask install google-photos-backup
brew cask install harvest
brew cask install integrity
brew cask install iterm2
brew cask install kap
brew cask install limechat
brew cask install omnigraffle
brew cask install openoffice
brew cask install processing
brew cask install rescuetime
brew cask install java
brew cask install screaming-frog-seo-spider
brew cask install sketch
brew cask install skitch
brew cask install skype
brew cask install slack
brew cask install sourcetree
brew cask install sublime-text
brew cask install vagrant
brew cask install vagrant-manager
brew cask install virtualbox
brew cask install zoomus

# Not available
# - Kalabox
# - Mac Remover
# - Pixelmator
# - Reason 8
# - Theremini Editor
# - TotalValidator

# Install and set up Sublime Text 3
echo "Setting up Sublime Text"
cd ~/Library/Application Support/Sublime Text 3/Packages
git clone https://github.com/kkga/spacegray.git spacegray
git clone https://github.com/sirkitree/DrupalCodingStandard.git
git clone git://github.com/benmatselby/sublime-phpcs.git Phpcs
git clone https://github.com/kemayo/sublime-text-git.git
git clone https://github.com/spadgos/sublime-jsdocs.git
cd ~

# App Store Apps
brew install mas
mas signin jimbirch@gmail.com # This will give a warning if you signed in to iCloud when you set up the computer.
# id's are tied to specific versions.  Do a `mas list` to get an updated list.
mas install 425424353 # The Unarchiver (3.11.1)
mas install 467939042 # Growl (2.1.3)
mas install 408981434 # iMovie (10.1.5)
mas install 408981381 # iPhoto (9.6.1)
mas install 970246631 # Disk Cleaner (1.3)
mas install 411246225 # Caffeine (1.1.1)
mas install 442168834 # SiteSucker (2.10.2)
mas install 586862299 # Duplicate Cleaner For iPhoto (1.13)
mas install 533696630 # Webcam Settings (2.3)
mas install 490192174 # Battery Health (5.4)
mas install 408980954 # GarageBand (6.0.5)
mas install 417375580 # BetterSnapTool (1.7)
mas install 403388562 # Transmit (4.4.12)
mas install 506189836 # Harvest (2.0.6)
mas upgrade

# Dev tools
brew install node
brew install npm

npm install --global a11y # Easy accessibility audits powered by the Chrome Accessibility Tools.
npm install --global grunt-cli # The Grunt command line interface.
npm install --global imageoptim-cli # Automates ImageOptim, ImageAlpha, and JPEGmini.
npm install --global imagemin-cli # Minify images.
npm install --global lighthouse # Lighthouse analyzes web apps and web pages, collecting modern performance metrics and insights on developer best practices.
npm install --global pa11y@beta # Pa11y is your automated accessibility testing pal. It runs HTML CodeSniffer from the command line for programmatic accessibility reporting.
npm install --global prettier # Prettier is an opinionated code formatter.
npm install --global psi # PageSpeed Insights with reporting.
npm install --global sitespeed.io # Using sitespeed.io you can test your web site against Web Performance best practices.
npm install --global webpagetest # WebPageTest API Wrapper is a NPM package that wraps WebPageTest API for NodeJS.

# Get composer and put it in the right place. This will require your password
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Install Composer tools
composer global require hirak/prestissimo # composer parallel install plugin
composer global require drupal/coder # Drupal Coder, PHP_CodeSniffer, and Drupal Coding Standards
composer global require wp-coding-standards/wpcs:dev-master # Adds WordPress Coding Standards

# Sets Config for PHP_CodeSniffer
phpcs --config-set installed_paths $HOME/.composer/vendor/drupal/coder/coder_sniffer,$HOME/.composer/vendor/wp-coding-standards/wpcs

# Be sure we can vagrant
brew install ansible
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-auto_network

# Set up PHP tools
# https://philsturgeon.uk/php/2013/08/20/php-static-analysis-in-sublime-text/
# http://benmatselby.github.io/sublime-phpcs/
echo "Setting up PHP Tools"
sudo chown -R `whoami` /usr/local
brew tap homebrew/homebrew-php

# Do the Mac thing that you have to do but you shouldn't have to do
# This https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain
curl -o ~/Library/LaunchAgents/ssh.add.a.plist https://raw.githubusercontent.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain/master/ssh.add.a.plist

# Hold my own hand to make sure I finish configuring.
echo "Add your ssh keys (you put them in your secret hiding place)."
pause 'Press [Enter] when you have added your ssh key.'
chmod 400 ~/.ssh/*

# Move preference files
echo "Setting up your preference files."
cp .gitconfig ~/.gitconfig
cp .gitignore_global ~/.gitignore_global
cp .profile ~/.profile

# Get git things
curl -o /usr/local/etc/bash_completion.d/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o /usr/local/etc/bash_completion.d/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

echo "NICE WORK! Time to do the things."
