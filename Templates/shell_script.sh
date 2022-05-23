#!/bin/bash 

# Header block {{{
###############################################################################
# Filename   :
# Author     : Michael DeBusk (https://github.com/mdebusk)
# Last edit  :
# Purpose    :
# Arguments  : h=Help, g=License, V=version
# Known bugs :
# To do      :
###############################################################################}}}

#{{{License and copyright
#  Copyright © 2022 Michael DeBusk (https://github.com/mdebusk/)

#  Template copyright © 2007, 2019 David Both LinuxGeek46@both.org
#  https://opensource.com/article/19/12/bash-script-template

#  Full GNU General Public License can be viewed here:
#  https://www.gnu.org/licenses/gpl-3.0.en.html
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERcHANTABILITY or FITNESS FOR A PARTIcULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#}}} End license and copyright

# {{{Help

set -euo pipefail # catch a variety of errors

Help()
{
    cat <<EOF
Add description of the script functions here.

Syntax: $0 [-g|h|v|V]
options:
g     Print the GPL license notification.
h     Print this Help.
v     Verbose mode.
V     Print software version and exit.

EOF
}
#}}} End help

# {{{License display
#
License()
{
    cat <<EOF
$0 Copyright © 2022 Michael DeBusk

This program comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to
redistribute it under certain conditions.
See https://www.gnu.org/licenses/gpl-3.0.en.html

EOF
}
#}}} End license display

# {{{check for root.
checkRoot()
{
   # If we are not running as root we exit the program
   if [ `id -u` != 0 ]
   then
      echo "ERROR: You must be root user to run this program"
      exit
   fi
}
#}}} End check for root

# {{{Main program

# Sanity checks
#
# Are we root? If not, then quit
# checkRoot

# Initialize variables
option=""
Version="0.1"
Msg="Hello world!"
#
# Process the input options. Add options as needed.
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

echo "$Msg"
#}}} End main program
