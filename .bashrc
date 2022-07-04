###############################################################################
# Filename   : .bashrc                                                        #
# Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                   #
# Created    : 2008                                                           #
# Last edit  : 2022-07-04 14:41                                               #
# Purpose    : Configuration file for bash shell                              #
# Depends    : bash                                                           #
# Arguments  : none                                                           #
# Known bugs : NKA                                                            #
# To do      : none yet                                                       #
###############################################################################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ** Environment Variables {{{

# ** Environment variables for less {{{2
# Set colors for less.
# https://wiki.archlinux.org/index.php/Color_output_in_console#less
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Does anybody look at the history file for less?
export LESSHISTFILE=-

# Sensible (to me) defaults for less
# https://www.topbug.net/blog/2016/09/27/make-gnu-less-more-powerful/
export LESS="-F -i -J -M -R -x4 -z-4"
# End less}}}

# Unset manpath so we can inherit from /etc/manpath via
# the `manpath` command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# News server, for SLRN
export NNTPSERVER='news.eternal-september.org'

# End environment variables }}}

# ** History {{{
export HISTFILESIZE=1000000         # Lines of histyry stored on disk
export HISTIGNORE="&:ls:[bf]g:exit" # Ignore duplicates, as well as ls, bg, fg and exit
export HISTSIZE=100000              # Lines of history stored in memory
export HISTTIMEFORMAT="%FT%T: "     # Add timestamp to history file
shopt -s cmdhist                    # combine multiline commands in history
shopt -s histappend                 # merge session histories

# Ignore duplicates and commands starting with an empty space; also, delete duplicates
export HISTCONTROL=ignoreboth:erasedups
# End history }}}

# ** Prompt {{{
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32;40m\]\u@\h\[\033[00;40m\]:\[\033[00;34;40m\]\w\[\033[00m\]\$ '

# If this is an xterm, set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac
# End prompt }}}

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# enable color support of ls
if [ "$TERM" != "dumb" ]; then
    d=$XDG_CONFIG_HOME/dircolors
    test -r $d && eval "$(dircolors $d)"
fi

# ** Sourcing of external files {{{
# Aliases
[ -f "$XDG_CONFIG_HOME"/bash_aliases ] && . "$XDG_CONFIG_HOME"/bash_aliases

# Functions
[ -f "$XDG_CONFIG_HOME"/bash_functions ] && . "$XDG_CONFIG_HOME"/bash_functions

# Programmable completion features
# bash completion
[ -f /etc/bash_completion ] && . /etc/bash_completion

# Add support for fzf
[ -f $XDG_CONFIG_HOME/fzf/fzf.bash ] && source $XDG_CONFIG_HOME/fzf/fzf.bash

# Add completions for Alacritty
[ -f "$XDG_CONFIG_HOME"/bash_functions ] && . $HOME/Source/alacritty/extra/completions/alacritty.bash
# End sourcing of external files }}}
