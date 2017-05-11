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

# Install Apache Httpd with Apache bench (software to test your server)
echo installing Apache Httpd with Apache bench
read -p "Would you install Apache Httpd with Apache bench? Press y or n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  wget -P ~/httpd/ http://apache.mirrors.pair.com/httpd/httpd-2.4.25.tar.bz2
  tar xzvf ~/httpd/httpd-2.4.25.tar.bz2 -C ~/httpd/
  cd ~/httpd/httpd-2.4.25/srclib
  wget http://apache.panu.it//apr/apr-1.5.2.tar.bz2
  wget http://apache.panu.it//apr/apr-util-1.5.4.tar.bz2
  tar xzvf ~/httpd/httpd-2.4.25/srclib/apr-1.5.2.tar.bz2 -C ~/httpd/httpd-2.4.25/srclib/
  tar xzvf ~/httpd/httpd-2.4.25/srclib/apr-util-1.5.4.tar.bz2 -C ~/httpd/httpd-2.4.25/srclib/
  mv ~/httpd/httpd-2.4.25/srclib/apr-1.5.2 ~/httpd/httpd-2.4.25/srclib/apr
  mv ~/httpd/httpd-2.4.25/srclib/apr-util-1.5.4 ~/httpd/httpd-2.4.25/srclib/apr-util
  cd ~/httpd/httpd-2.4.25
  ./configure
  make
  cd ~/httpd/httpd-2.4.25
  sudo chmod -R a+x support/
fi
