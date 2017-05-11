#!/bin/bash

#The MIT License (MIT)
#
#Copyright (c) 2015-2017 Stefano Cappa
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

tput setaf 2; echo "Welcome to KS89 dotfiles 2.0 - last update 10/02/2016"

tput setaf 2; echo "Attention! If you want to run this script install Xcode command line developer tools and Sublime Text"
tput setaf 2; echo "Please, insert your password if requested"

read -p "Do u have Sublime Text and Xcode installed? Are you ready? Type y or n " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    tput setaf 1; echo "getting root privileges"
    sudo -v

    tput setaf 1; echo "accept xcode license to proceed"
    sudo xcodebuild -license

    tput setaf 2; echo "copying files to home dir"
    cp .bash_profile ~/.bash_profile
    cp .git-completion.bash ~/.git-completion.bash
    cp .git-prompt.sh ~/.git-prompt.sh
    cp .gitconfig ~/.gitconfig

    tput setaf 3; echo "installing homebrew and packages (for instance node.js and npm)"
    bash homebrew.sh

    tput setaf 4; echo "applying custom macOS preferences"
    bash macos.sh

    tput setaf 5; echo "installing redis-server"
    bash redis.sh

    tput setaf 6; echo "installing some global packages from npm"
    bash npm.sh

    tput setaf 1; echo "installing other software"
    bash thirdparty-software.sh

    tput setaf 5; echo "installing Apache Http and Bench"
    bash apache-bench.sh

    tput setaf 2; echo "source ~/.bash_profile called"
    source ~/.bash_profile

    tput setaf 3; echo "Thank u, bye bye!"
fi
