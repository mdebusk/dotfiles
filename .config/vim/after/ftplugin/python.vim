" These settings are already in my vimrc, but I want to make sure
" that vim alays uses these settings for python scripts no matter
" what has been done to vim before the buffer is opened

setlocal autoindent
setlocal colorcolumn=80
setlocal expandtab
setlocal fileformat=unix
setlocal shiftwidth=4
setlocal smartindent
setlocal smartindent
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=79

" ensure black is installed
if executable('black')
    setlocal formatprg="black --quiet -"
    setlocal formatexpr=
endif
