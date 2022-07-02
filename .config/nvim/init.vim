"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filename   : init.vim                                                       "
" Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                   "
" Created    : 2022-04-25                                                     "
" Last edit  : 2022-07-02 13:51                                               "
" Purpose    : Initialization file for Neovim                                 "
" Depends    : nvim                                                           "
" Arguments  : none                                                           "
" Known bugs : NKA                                                            "
" To do      : none yet                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc
