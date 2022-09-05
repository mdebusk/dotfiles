###############################################################################
# Filename   : fzf.bash                                                       #
# Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                   #
# Created    : 2021-11-30 20:45:58.485227149 -0500                            #
# Last edit  : 2022-09-05 11:15                                               #
# Purpose    : Initialization for fzf utility                                 #
# Reference  : https://gitlab.com/junegunn/                                   #
# Depends    : fzf                                                            #
# Arguments  : N/A                                                            #
# Known bugs : NKA                                                            #
# To do      : N/A                                                            #
###############################################################################

# Setup fzf
##if [[ ! "$PATH" == */home/michael/Source/fzf/bin* ]]; then
##  export PATH="${PATH:+${PATH}:}/home/michael/Source/fzf/bin"
##fi

# Auto-completion
##[[ $- == *i* ]] && source"/home/michael/Source/fzf/shell/completion.bash" 2> /dev/null
[[ $- == *i* ]] && source"/usr/share/bash-completion/completions/fzf" 2> /dev/null
# Key bindings
source "/home/michael/.config/fzf/key-bindings.bash"

# Color scheme (Solarized Light) {{{
# Author: Ethan Schoonover (https://ethanschoonover.com/solarized/)
# modified by aramisgitlab (https://gitlab.com/arzg/)
export FZF_DEFAULT_OPTS="--color="
export FZF_DEFAULT_OPTS+="bg+:#eee8d5,"
export FZF_DEFAULT_OPTS+="bg:#fdf6e3,"
export FZF_DEFAULT_OPTS+="spinner:#2aa198,"
export FZF_DEFAULT_OPTS+="hl:#268bd2,"
export FZF_DEFAULT_OPTS+="fg:#657b83,"
export FZF_DEFAULT_OPTS+="header:#268bd2,"
export FZF_DEFAULT_OPTS+="info:#b58900,"
export FZF_DEFAULT_OPTS+="pointer:#2aa198,"
export FZF_DEFAULT_OPTS+="marker:#2aa198,"
export FZF_DEFAULT_OPTS+="fg+:#073642,"
export FZF_DEFAULT_OPTS+="prompt:#b58900,"
export FZF_DEFAULT_OPTS+="hl+:#268bd2"
# End color scheme }}}

# Layout {{{
# https://gitlab.com/junegunn/fzf/blob/master/ADVANCED.md
export FZF_DEFAULT_OPTS+=" --height=33%"
export FZF_DEFAULT_OPTS+=" --layout=reverse"
export FZF_DEFAULT_OPTS+=" --info=inline"
export FZF_DEFAULT_OPTS+=" --border"
export FZF_DEFAULT_OPTS+=" --margin=1"
export FZF_DEFAULT_OPTS+=" --padding=1"
# End layout }}}


