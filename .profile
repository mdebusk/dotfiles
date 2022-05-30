###############################################################################
# Filename   : .profile                                                       #
# Author     : Michael DeBusk (https://github.com/mdebusk/)                   #
# Created    : Unknown                                                        #
# Last edit  : 2022-02-23 17:37                                               #
# Purpose    : Sets bash environment variables                                #
# Depends    : bash                                                           #
# Arguments  : N/A                                                            #
# Known bugs : NKA                                                            #
# To do      : N/A                                                            #
###############################################################################

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
