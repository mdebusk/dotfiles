setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal smartindent
setlocal colorcolumn=80
setlocal fileformat=unix

" ensure black is installed
if executable('black')
    setlocal formatprg="black --quiet -"
    setlocal formatexpr=
endif
