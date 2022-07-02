###############################################################################
# Filename   : .bashrc                                                        #
# Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                   #
# Created    : 2008                                                           #
# Last edit  : 2022-07-02 15:22                                               #
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
# save all the histories
export HISTFILESIZE=1000000
export HISTSIZE=100000

# Ignore duplicates and commands starting with
# an empty space, and delete duplicates
export HISTCONTROL=ignoreboth:erasedups

# Add date and time to history command output
export HISTTIMEFORMAT="%FT%T: "

# combine multiline commands in history
shopt -s cmdhist

# merge session histories
shopt -s histappend

# This will ignore duplicates, as well as ls, bg, fg and exit,
# making for a cleaner bash history.
export HISTIGNORE="&:ls:[bf]g:exit"
# End history }}}

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

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

# ** Aliases {{{

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    d=$XDG_CONFIG_HOME/dircolors
    test -r $d && eval "$(dircolors $d)"
    alias ls='ls -lhpv --color=auto --group-directories-first --time-style=long-iso'
fi

#Sane defaults for cp, rm, and mv; prompt before overwrite
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# Other usweful defaults
alias free="free -hmtw"
alias df="df -Tha --total"
alias wget="wget -c"

# Help programs use the XDG Base Directory standard
alias remind='remind -@2 $XDG_CONFIG_HOME/remind/reminders.rem'
alias tkremind='tkremind $XDG_CONFIG_HOME/remind/reminders.rem'
alias slrn='slrn -i $XDG_CONFIG_HOME/slrn/slrnrc -f $XDG_CONFIG_HOME/slrn/jnewsrc-september'
alias sqlite3='sqlite3 -init $XDG_CONFIG_HOME/sqlite3/sqliterc'
alias dosbox='dosbox -conf $XDG_CONFIG_HOME/dosbox/dosbox-0.74-3.conf'
alias mysql-workbench="mysql_workbench.sh"

# Use vim as a pager with syntax highlighting
alias vless='/usr/local/share/vim/vim90/macros/less.sh'

# Add color to grep output
alias grep='grep --color=auto'

# Password generator
alias pwgen='echo -e "\n$(tr -dc A-Za-z0-9_ < /dev/urandom | head -c 32 | xargs)\n"'

# Use wget to mirror a Web site
alias mirror='wget --mirror --convert-links --html-extension --wait=2 -o log'

# Find zombie processes
alias zombie='ps axo stat,ppid,pid,comm | grep -w defunct'

# Start VLC from the command line
alias nvlc='nvlc --browse-dir ~/Music'

# Start Joplin terminal version
alias joplincli='~/bin/Joplin/bin/joplin'

# What are my external and internal IP addresses?
alias ips="echo -n 'External IP: ' ; curl ifconfig.co; echo -n 'Internal IP: ' ; ifconfig wlp3s0 | grep inet\ | awk '{ print \$2 }' "

# Diary
alias dz='pushd ~/Documents && echo -e "\n## `date +%F\ %T` {{{\n\n}}}" >> diary.md && vim "+ normal Gk" +startinsert diary.md && popd'

# alias for bare git repo use (dotfile repo)
# https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# End aliases }}}

# ** Functions {{{
# End functions}}}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Add support for fzf
[ -f $XDG_CONFIG_HOME/fzf/fzf.bash ] && source $XDG_CONFIG_HOME/fzf/fzf.bash

# Add completions for Alacritty
source /home/michael/Source/alacritty/extra/completions/alacritty.bash
