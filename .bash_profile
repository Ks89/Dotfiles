export HOME=/Users/Ks89

export PATH="$HOME":"$PATH"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home"
export PATH=$JAVA_HOME/bin:$PATH

export ANT_HOME="/usr/local/opt/ant"
export PATH=$ANT_HOME/bin:$PATH

export GRADLE_HOME="/usr/local/opt/gradle"
export PATH=$GRADLE_HOME/bin:$PATH

export M2_HOME="/usr/local/opt/maven"
export MAVEN_HOME="/usr/local/opt/maven"
export M2_REPO="/Users/Ks89/.m2/repository"
export PATH=$MAVEN_HOME/bin:$PATH

export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export ANDROID_NDK_HOME="/usr/local/share/android-ndk"
export PATH=$ANDROID_SDK_ROOT/tools:$PATH
export PATH=$ANDROID_SDK_ROOT/tools/bin:$PATH
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH
export PATH=$ANDROID_NDK_HOME/tools:$PATH

export SONAR_SCANNER="~/sonar-scanner"
export PATH=$SONAR_SCANNER/bin:$PATH

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
