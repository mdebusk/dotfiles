###############################################################################
# Filename   : $HOME/.profile                                                 #
# Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                   #
# Created    : Unknown                                                        #
# Last edit  : 2024-11-30 00:53                                               #
# Purpose    : Sets environment variables                                     #
# TODO       : Move ~/.vim to $XDG_CONFIG_HOME                                #
###############################################################################

# ** Source ~/.bashrc if appropriate {{{
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
# End sourcing ~/.bashrc }}}


export JAVA_HOME=$(dirname $(dirname $(readlink -f  /usr/bin/javac)))

# For Tesseract OCR
export TESSDATA_PREFIX=/usr/share/tesseract-ocr/4.00/tessdata/

# This is set for the git version of vim
export VISUAL=/usr/local/bin/vim
export EDITOR=$VISUAL

# For the "par" formatter, per its documentation:
# http://www.nicemice.net/par/par-doc.var
export PARINIT="rTbgqR B=.,?'_A_a_@ Q=_s>|"

# ** Modify path for various programs {{{
# Add $JAVA_HOME to path
export PATH=$PATH:$JAVA_HOME

# Set PATH so it includes user's private bin if it exists
test -d "$HOME/bin" && PATH="$HOME/bin:$PATH"

# Add rust/cargo to path
test -f "$HOME/.local/share/cargo/env" && . "$HOME/.local/share/cargo/env"
# End path modifications }}}

# ** Help programs use the XDG standard {{{
# Establish the standard directories' locations {{{2
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_STATE_HOME=$HOME/.local/state
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_VIDEOS_DIR="$HOME/Videos"
# I added these above; there's no need to do it again.
# I'll comment it out in case something doesn't go well.
## test -f ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs && source ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs
# End standard locations }}}

# Specific programs {{{
# Useful: https://wiki.archlinux.org/title/XDG_Base_Directory
# Also useful: https://github.com/b3nj5m1n/xdg-ninja
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java -Djavafx.cachedir=${XDG_CACHE_HOME}/openjfx"
export ANDROID_HOME=$XDG_DATA_HOME/android
export CALOPT="--col=$XDG_CONFIG_HOME/ccal/cal.col --d=$XDG_DATA_HOME/ccal/cal.dat --u --f"
export CARGO_HOME=$XDG_DATA_HOME/cargo
export CHROMIUM_BSU_SCORE="$XDG_DATA_HOME"/chromium_bsu/
export CHROMIUM_BSU_DATA="$XDG_DATA_HOME"/chromium_bsu/
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/.nv
export DOTREMINDERS="$XDG_CONFIG_HOME/remind/reminders.rem"
export DVDCSS_CACHE=$XDG_DATA_HOME/dvdcss
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GPODDER_DOWNLOAD_DIR=$HOME/Podcasts/
export GPODDER_HOME=$XDG_CONFIG_HOME/gpodder/
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export HTML_TIDY=$XDG_CONFIG_HOME/tidyrc
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc
export KDEHOME="$XDG_CONFIG_HOME"/kde
export MPLAYER_HOME=$XDG_CONFIG_HOME/mplayer
export MYSQL_HISTFILE=$XDG_STATE_HOME/mysql/mysql_history
export NCFTPDIR=$XDG_CONFIG_HOME/ncftp
export NETRC=$XDG_CONFIG_HOME/netrc
export NODE_REPL_HISTORY=$XDG_STATE_HOME/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PWS_PREFSDIR=$XDG_CONFIG_HOME/pwsafe/
export PYENV_ROOT=$XDG_DATA_HOME/pyenv
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export SQLITE_HISTORY=$XDG_STATE_HOME/sqlite3/sqlite_history
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export WGETRC=$XDG_CONFIG_HOME/wgetrc
export WORKON_HOME="$XDG_DATA_HOME/virtualenvs"
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME"/.nv
# I'm not quite ready to take this step
## export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
# End specific programs }}}
# End xdg }}}

# ** For NPM {{{
export NPM_PACKAGES="/home/michael/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
export PATH="$NPM_PACKAGES/bin:$PATH"
# End NPM }}}



