# ~/.profile: executed by Bourne-compatible login shells.
# Michael DeBusk
# Last edit: 2021-03-25 14:02

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

# mesg n

export JAVA_HOME=$(dirname $(dirname $(readlink -f  /usr/bin/javac)))
export PATH=$PATH:$JAVA_HOME

# This is set for the git version of vim
export VISUAL=/usr/local/bin/vim
export EDITOR=$VISUAL

# Google Test Libraries
# See https://wiki.gnucash.org/wiki/Google_Test
# export GTEST_ROOT=$HOME/Source/googletest/googletest
export GTEST_ROOT=$HOME/Source/googletest/
export GMOCK_ROOT=$HOME/Source/googletest/googlemock
