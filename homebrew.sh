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
#DON'T EXECUTE THIS - BUT USE install.sh, please

echo installing homebrew if necessary
which -s brew
if [[ $? != 0 ]] ; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
    brew upgrade
fi

echo installing homebrew packages, only if not already available
which -s git || brew install git
which -s git-lfs || brew install git-lfs
which -s tig || brew install tig
which -s readline || brew install readline
which -s wget || brew install wget
which -s bash-completion || brew install bash-completion
which -s autojump || brew install autojump
which -s python3 || brew install python3
which -s git-extras || brew install git-extras

read -p "Would you install Node.js and npm? Press y or n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo installing nodejs and npm, only if not already available
  echo if necessary run brew unlink node
  which -s node || brew install node
  brew link node
fi

read -p "Would you install/compile MongoDb 4.2? Press y or n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo installing mongodb
  brew tap mongodb/brew
  brew install mongodb-community@4.2
  #create a folder for mongodb to prevent an error on mac osx
  brew services start mongodb-community
fi

read -p "Would you install/compile haskell? Press y or n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo installing haskell
  brew cask install haskell-platform
fi
