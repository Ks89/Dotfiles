#!/bin/bash

#LAST UPDATE 10-19-15
#ONLY FOR OSX
#TESTED ON: OSX 10.11 El Capitan

#To be able to execute this
#chmod a+x install.sh
#do not run "sudo ./install.sh" to prevent errors when the script calls "brew install"
#run simply ./install.sh

#copy files to home dir
cp .bash_profile ~/.bash_profile
cp .git-completion.bash ~/.git-completion.bash
cp .git-prompt.sh ~/.git-prompt.sh
cp .gitconfig ~/.gitconfig

#now install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

#now install softwares using brew
brew install readline
bew install git-lfs
brew install tig
brew install wget
brew install bash-completion

#show hidden files on osx
defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app

#install sublime text command line utils
sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl