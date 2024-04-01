###############################################################################
# Filename   : fzf.bash                                                       #
# Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                   #
# Created    : 2021-11-30                                                     #
# Last edit  : 2024-04-01 13:06                                               #
# Purpose    : Initialization for fzf utility                                 #
# Reference  : https://github.com/junegunn/fzf                                #
# Depends    : fzf                                                            #
# Known bugs : NKA                                                            #
# TODO       : N/A                                                            #
###############################################################################

# Setup fzf # {{{
if [[ ! "$PATH" == */home/michael/Source/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/michael/Source/fzf/bin"
fi

eval "$(fzf --bash)"

# Auto-completion
[[ $- == *i* ]] && source"/home/michael/Source/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
source "/home/michael/Source/fzf/shell/key-bindings.bash"
# End setup }}}


# Color scheme (Solarized Light) {{{
# Author: Ethan Schoonover (https://ethanschoonover.com/solarized/)
# Thanks: https://vitormv.github.io/fzf-themes/
export FZF_DEFAULT_OPTS+=" --color="
export FZF_DEFAULT_OPTS+="bg+:#eeed85,"
export FZF_DEFAULT_OPTS+="bg:#fdf6e3,"
export FZF_DEFAULT_OPTS+="border:#073642,"
export FZF_DEFAULT_OPTS+="fg+:#073642,"
export FZF_DEFAULT_OPTS+="fg:#657b83,"
export FZF_DEFAULT_OPTS+="header:#268bd2,"
export FZF_DEFAULT_OPTS+="hl+:#268bd2,"
export FZF_DEFAULT_OPTS+="hl:#268bd2,"
export FZF_DEFAULT_OPTS+="info:#93a1a1,"
export FZF_DEFAULT_OPTS+="label:#657b83,"
export FZF_DEFAULT_OPTS+="marker:#2aa198,"
export FZF_DEFAULT_OPTS+="pointer:#2aa198,"
export FZF_DEFAULT_OPTS+="prompt:#b58900,"
export FZF_DEFAULT_OPTS+="query:#6c71c4,"
export FZF_DEFAULT_OPTS+="spinner:#2aa198"
# End color scheme }}}


# Layout {{{
# https://github.com/junegunn/fzf/blob/master/ADVANCED.md
export FZF_DEFAULT_OPTS+=" --height=33%"
export FZF_DEFAULT_OPTS+=" --layout=reverse"
export FZF_DEFAULT_OPTS+=" --info=inline"
export FZF_DEFAULT_OPTS+=" --border"
export FZF_DEFAULT_OPTS+=" --margin=1"
export FZF_DEFAULT_OPTS+=" --padding=1"
# End layout }}}
