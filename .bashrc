# ~/.bashrc: executed by bash(1) for non-login shells.
# Michael DeBusk
# Last edit: 2021-05-31 15:55

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ** Enviroment Variables{{{

# Escape sequences for less. I'm not sure why I put them here.'
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Set PATH so it includes user's private bin if it exists
test -d "$HOME/bin" && PATH="$HOME/bin;$PATH"

# For NPM
export NPM_PACKAGES="/home/michael/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
export PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Help programs use the XDG Base Directory standard
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export CALOPT="--col=$XDG_CONFIG_HOME/ccal/cal.col --d=$XDG_DATA_HOME/ccal/cal.dat --u --f"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export SQLITE_HISTORY=$XDG_CACHE_HOME/sqlite3/sqlite_history

# News server, for SLRN
export NNTPSERVER='news.eternal-september.org'

# Does anybody look at the history file for less?
export LESSHISTFILE=-

# For Tesseract OCR
export TESSDATA_PREFIX=/usr/share/tesseract-ocr/4.00/tessdata/

# End Environment variables}}}

# ** History {{{
# save all the histories
export HISTFILESIZE=10000
export HISTSIZE=5000

# don't put duplicate lines or empty spaces in the history
export HISTCONTROL=ignoreboth

# Add date and time to history command output
export HISTTIMEFORMAT="%FT%T: "

# combine multiline commands in history
shopt -s cmdhist

# merge session histories
shopt -s histappend

# This will ignore duplicates, as well as ls, bg, fg and exit as well,
# making for a cleaner bash history.
export HISTIGNORE="&:ls:[bf]g:exit"
# End History }}}

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# ** Prompt{{{
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac
# End Prompt}}}

# ** Aliases{{{

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    d=$XDG_CONFIG_HOME/dircolors
    test -r $d && eval "$(dircolors $d)"
    alias ls='ls -lhpv --color=auto --group-directories-first'
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
alias remind='remind $XDG_CONFIG_HOME/remind/reminders.rem'
alias slrn='slrn -i "$XDG_CONFIG_HOME"/slrn/slrnrc -f "$XDG_CONFIG_HOME"/slrn/jnewsrc-september'
alias sqlite3='sqlite3 -init "$XDG_CONFIG_HOME"/sqlite3/sqliterc'

# Use vim as a pager with syntax highlighting
alias vless='/usr/local/share/vim/vim82/macros/less.sh'

# Add color to grep output
alias grep='grep --color=auto'

# Password generator
alias pwgen='echo; tr -dc A-Za-z0-9_ < /dev/urandom | head -c 32 | xargs;echo'

# Use wget to mirror a Web site
alias mirror='wget --mirror --convert-links --html-extension --wait=2 -o log'

# Update all packages
alias update='sudo apt update && sudo apt upgrade -y && sudo snap refresh'

# Find zombie processes
alias zombie='ps axo stat,ppid,pid,comm | grep -w defunct'

# Start VLC from the command line
alias nvlc='nvlc --browse-dir ~/Music'

# Start Joplin terminal version
alias joplincli='~/.joplin-bin/bin/joplin'

# What are my external and internal IP addresses?
alias ips="echo -n 'External IP: ' ; curl ifconfig.co; echo; echo -n 'Internal IP: ' ; ifconfig wlp3s0 | grep inet\ | awk '{ print \$2 }' "

# Diary
alias dz='cd ~/Documents && echo -e "## `date +%Y%m%d%H%M%S`\n" >> diary.md && vim "+ normal G" +startinsert diary.md && cd'

# alias for bare git repo use (dotfile repo)
# https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# End aliases}}}

# ** Functions{{{
lcd() { cd ${1} ; ls ; }

wttr()
{
    local request="wttr.in/${1-21901?FQ}"
    [ "$(tput cols)" -lt 125 ] && request+='?n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}

# End Functions}}}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Add support for fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
