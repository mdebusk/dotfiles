# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

# mesg n

export JAVA_HOME=$(dirname $(dirname $(readlink -f  /usr/bin/javac)))
export PATH=$PATH:$JAVA_HOME

# This is set for the got version of vim
export EDITOR=/usr/local/bin/vim

# Google Test Libraries
# See https://wiki.gnucash.org/wiki/Google_Test
# export GTEST_ROOT=$HOME/Source/googletest/googletest
export GTEST_ROOT=$HOME/Source/googletest/
export GMOCK_ROOT=$HOME/Source/googletest/googlemock
