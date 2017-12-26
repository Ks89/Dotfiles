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

echo installing sublime text command line utils
sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# Install Spectacle
echo installing Spectacle
read -p "Would you install Spectacle? Press y or n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  brew cask install spectacle
fi

# Install nvm
echo installing nvm
read -p "Would you install nvm? Press y or n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
fi


# Install Flux
echo installing flux
read -p "Would you install Flux? Press y or n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  brew cask install flux
fi

# Install Java JDK 7 and 8
echo installing jdk
read -p "Would you install Java8 and 9? Press y or n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    brew tap caskroom/versions
    brew cask install java8
    brew cask install java
fi

# Install Android SDK, Gradle and Android Studio
echo installing android studio
read -p "Would you install android-sdk, ant, maven and gradle? Press y or n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    brew install ant
    brew install maven
    brew install gradle
    brew cask install android-sdk
    brew cask install android-ndk

    echo adding platform-tools to install fastboot, adb and so on
    sdkmanager --update
    sdkmanager --list
    sdkmanager "tools"
    sdkmanager "platform-tools"
    sdkmanager "build-tools;27.0.3"
    sdkmanager "platform-tools" "platforms;android-27"

    echo to run sdkmanager you need Java 8 JDK in your PATH variable
    
    sudo chmod 777 /usr/local/share/android-sdk/platform-tools/fastboot

    #brew cask install android-studio
fi

# Install Genymotion
echo installing genymotion
read -p "Would you install Genymotion? Press y or n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  brew cask install genymotion
fi

# Install travis
echo installing travis
read -p "Would you install travis? Press y or n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo gem install travis
fi

read -p "Would you install/compile yarn? Press y or n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo installing yarn
  brew install yarn
  echo checking yarn version
  yarn --version
fi
