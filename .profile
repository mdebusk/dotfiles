###############################################################################
# Filename   : .profile                                                       #
# Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                   #
# Created    : Unknown                                                        #
# Last edit  : 2022-09-04 18:31                                               #
# Purpose    : Sets environment variables                                     #
# Depends    : N/A                                                            #
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

# For Tesseract OCR
export TESSDATA_PREFIX=/usr/share/tesseract-ocr/4.00/tessdata/

# This is set for the git version of vim
export VISUAL=/usr/local/bin/vim
export EDITOR=$VISUAL

# Modify path for various programs {{{
# Add $JAVA_HOME to path
export PATH=$PATH:$JAVA_HOME

# Set PATH so it includes user's private bin if it exists
test -d "$HOME/bin" && PATH="$HOME/bin:$PATH"

# Add rust/cargo to path
test -f "$HOME/.local/share/cargo/env" && . "$HOME/.local/share/cargo/env"
# End path modifications }}}

# Google Test Libraries, needed for compiling GnuCash {{{
# See https://wiki.gnucash.org/wiki/Google_Test
# Commented out because they're now available in the repos
##export GTEST_ROOT=$HOME/Source/googletest/
##export GMOCK_ROOT=$HOME/Source/googletest/googlemock }}}

# Help programs use the XDG standard {{{
export ANDROID_HOME=$XDG_DATA_HOME/android
export CALOPT="--col=$XDG_CONFIG_HOME/ccal/cal.col --d=$XDG_DATA_HOME/ccal/cal.dat --u --f"
export CARGO_HOME=$XDG_DATA_HOME/cargo
export CHROMIUM_BSU_SCORE="$XDG_DATA_HOME"/chromium_bsu/
export CHROMIUM_BSU_DATA="$XDG_DATA_HOME"/chromium_bsu/
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/.nv
export DVDCSS_CACHE=$XDG_DATA_HOME/dvdcss
export GPODDER_DOWNLOAD_DIR=$HOME/Podcasts/
export GPODDER_HOME=$XDG_CONFIG_HOME/gpodder/
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export HISTFILE=$XDG_STATE_HOME/bash/history
export HTML_TIDY=$XDG_CONFIG_HOME/tidyrc
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc
export JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export KDEHOME="$XDG_CONFIG_HOME"/kde
export MPLAYER_HOME=$XDG_CONFIG_HOME/mplayer
export MYSQL_HISTFILE=$XDG_DATA_HOME/mysql_history
export NCFTPDIR=$XDG_CONFIG_HOME/ncftp
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PWS_PREFSDIR=$XDG_CONFIG_HOME/pwsafe/
export PYENV_ROOT=$XDG_DATA_HOME/pyenv
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export SQLITE_HISTORY=$XDG_CACHE_HOME/sqlite3/sqlite_history
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export WGETRC=$XDG_CONFIG_HOME/wgetrc
export WORKON_HOME="$XDG_DATA_HOME/virtualenvs"
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME"/.nv
test -f ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs && source ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs
# I'm not quite ready to take this step
## export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
# End xdg }}}

# For NPM {{{
export NPM_PACKAGES="/home/michael/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
export PATH="$NPM_PACKAGES/bin:$PATH"
# End NPM }}}
