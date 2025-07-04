" https://jezenthomas.com/2015/05/shell-script-static-analysis-in-vim/
set makeprg=shellcheck\ -f\ gcc\ %
au BufWritePost * :silent make | redraw!
