 ###############################################################################
 # Filename   : .bash_profile                                                  #
 # Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                   #
 # Created    : Unknown                                                        #
 # Last edit  : 2022-07-02 13:25                                               #
 # Purpose    : executed by bash(1) for login shells                           #
 # Reference  : /usr/share/doc/bash/examples/startup-files                     #
 # Depends    : bash                                                           #
 # Arguments  : N/A                                                            #
 # Known bugs : NKA                                                            #
 # To do      : N/A                                                            #
 ###############################################################################

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/.profile ]; then
    . ~/.profile
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi
