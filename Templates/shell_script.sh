#!/usr/bin/env bash

###############################################################################
# Filename   : x                                                              #
# Author     : Michael DeBusk (https://gitlab.com/mdebusk)                    #
# Created    : x                                                              #
# Last edit  : x                                                              #
# Purpose    : x                                                              #
# Arguments  : h=Help, g=License, V=version                                   #
# Known bugs : NKA                                                            #
# TODO       : N.A                                                            #
###############################################################################

# ** License {{{
###############################################################################
# This is free and unencumbered software released into the public domain.     #
#                                                                             #
# Anyone is free to copy, modify, publish, use, compile, sell, or             #
# distribute this software, either in source code form or as a compiled       #
# binary, for any purpose, commercial or non-commercial, and by any means.    #
#                                                                             #
# In jurisdictions that recognize copyright laws, the author or authors of    #
# this software dedicate any and all copyright interest in the software to    #
# the public domain. We make this dedication for the benefit of the public    #
# at large and to the detriment of our heirs and successors. We intend        #
# this dedication to be an overt act of relinquishment in perpetuity of       #
# all present and future rights to this software under copyright law.         #
#                                                                             #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,             #
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF          #
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.      #
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER     #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     #
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         #
# DEALINGS IN THE SOFTWARE.                                                   #
#                                                                             #
# For more information, please refer to <http://unlicense.org/>               #
###############################################################################
#  End license and copyright }}}

set -euo pipefail # catch a variety of errors

Help() { # {{{
    cat << EOF
Add description of the script functions here.

Syntax: $0 [-g|h|v|V]
options:
g     Print the GPL license notification.
h     Print this Help.
v     Verbose mode.
V     Print software version and exit.

EOF
} # }}}


License() { # {{{
    cat <<EOF
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any means.

In jurisdictions that recognize copyright laws, the author or authors of
this software dedicate any and all copyright interest in the software to
the public domain. We make this dedication for the benefit of the public
at large and to the detriment of our heirs and successors. We intend
this dedication to be an overt act of relinquishment in perpetuity of
all present and future rights to this software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
EOF
} # }}}


checkRoot() { # {{{
    # If we are not running as root we exit the program
    if [ `id -u` != 0 ]
    then
        echo "ERROR: You must be root user to run this program"
        exit
    fi
} # }}}

# ** Main program {{{

# ** Sanity checks {{{2
#
# Are we root? If not, then quit
# checkRoot
# End sanity checks }}}

# ** Initialize variables {{{2
option=""
Version="0.1"
Msg="Hello world!"
# End variables }}}

# ** Process the input options. Add options as needed. {{{2
#
# Get the options
while getopts ":ghV" option; do
    case $option in
        h) # display Help
            Help
            exit;;
        g) # display license
            License
            exit;;
        V) # display version
            echo -e "$0 version $Version\n"
            exit;;
        \?) # incorrect option
            echo "Error: Invalid option"
            exit;;
    esac
done
# End options }}}

echo "$Msg"
#}}} End main program
