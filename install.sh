#!/bin/bash

#The MIT License (MIT)
#
#Copyright (c) 2015-2016 Stefano Cappa
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#THE SOFTWARE.

#ONLY FOR OSX

#To be able to execute this
#chmod a+x install.sh
#bash install.sh

echo Welcome to KS89 dotfiles 1.1 - last update 10/01/2016

echo Attention! If you want to run this script install Xcode command line developer tools and Node.js
echo Please, insert your password if requested

read -p "Do u have Nodejs and Xcode installed? Are you ready? Type y or n " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo copying files to home dir
    cp .bash_profile ~/.bash_profile
    cp .git-completion.bash ~/.git-completion.bash
    cp .git-prompt.sh ~/.git-prompt.sh
    cp .gitconfig ~/.gitconfig

    echo installing homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew upgrade

    echo installing software using brew
    brew install readline
    bew install git-lfs
    brew install tig
    brew install wget
    brew install bash-completion

    echo show hidden files on osx
    defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app

    echo installing sublime text command line utils
    sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

    echo installing wget
    brew install wget

    echo installing mongodb
    brew install mongodb --with-openssl

    #create a folder for mongodb to prevent an error on mac osx
    sudo mkdir -p /data/db

    echo installing redis server
    wget http://download.redis.io/redis-stable.tar.gz
    tar xvzf redis-stable.tar.gz
    cd redis-stable
    make install
    cd ..
    rm -rf redis-stable
    rm -f redis-stable.tar.gz

    echo installing some global packages from npm
    sudo npm install -g karma-cli
    sudo npm install --global mocha
    sudo npm install -g webpack@2.1.0-beta.22
    sudo npm install -g typescript
    sudo npm install -g nodemon
    sudo npm install -g gulp@github:gulpjs/gulp#4.0

fi
