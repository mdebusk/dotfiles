"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filename   : init.vim                                                       "
" Author     : Michael DeBusk (https://github.com/mdebusk/)                   "
" Created    : 2022-04-25                                                     "
" Last edit  : 2022-04-25 11:11                                               "
" Purpose    : Initialization file for Neovim                                 "
" Depends    : nvim                                                           "
" Arguments  : none                                                           "
" Known bugs : NKA                                                            "
" To do      : none yet                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc
