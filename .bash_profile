 ###############################################################################
 # Filename   : .bash_profile                                                  #
 # Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                   #
 # Created    : Unknown                                                        #
 # Last edit  : 2022-08-04 19:42                                               #
 # Purpose    : executed by bash(1) for login shells                           #
 # Reference  : /usr/share/doc/bash/examples/startup-files                     #
 # Depends    : bash                                                           #
 # Arguments  : N/A                                                            #
 # Known bugs : NKA                                                            #
 # To do      : N/A                                                            #
 ###############################################################################

if [ -f ~/.profile ]; then
    . ~/.profile
fi
