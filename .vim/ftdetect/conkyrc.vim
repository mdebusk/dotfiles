" Vim filetype detection file for Conky config files
" https://github.com/brndnmtthws/conky/blob/main/extras/vim/ftdetect/conkyrc.vim

au BufNewFile,BufRead *conkyrc set filetype=conkyrc
au BufNewFile,BufRead conky.conf set filetype=conkyrc
