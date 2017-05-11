export ANDROID_SDK_ROOT=/Users/Ks89/android-sdk-macosx

export HOME=/Users/Ks89

export PATH="$ANDROID_SDK_ROOT/tools/":"$ANDROID_SDK_ROOT/platform-tools/":"$PATH"

export PATH="$ANDROID_SDK_HOME/tools/":"$ANDROID_SDK_HOME/platform-tools/":"$PATH"

export PATH="$ANDROID_NDK_ROOT":"$PATH"

export PATH="$HOME":"$PATH"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home"

export M2_HOME="/Users/Ks89/apache-maven"

export M2_REPO="/Users/Ks89/.m2/repository"

export PATH=$JAVA_HOME/bin:$PATH

export PATH=/opt/local/bin:$PATH

source ~/.git-prompt.sh

export PS1="$(tput bold)$(tput setaf 2)\u@\h$(tput setaf 6):\W$(tput setaf 3)\$(__git_ps1)$(tput setaf 6) \$ $(tput sgr0)"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# set the number of open files to be 1024
ulimit -S -n 1024

#Bash alias
alias cd..="cd .."

export APACHE_BENCH=/Users/Ks89/httpd/httpd-2.4.25/support/ab
export PATH=$APACHE_BENCH:$PATH

export PATH="/usr/local/git/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH"

PATH=~/bin:$PATH

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
