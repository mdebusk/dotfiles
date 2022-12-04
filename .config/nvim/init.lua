-------------------------------------------------------------------------------
-- Filename   : init.lua                                                     --
-- Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                 --
-- Created    : 2022-07-05 15:44                                             --
-- Last edit  : 2022-12-04 04:26                                             --
-- Purpose    : Initialization file for vim                                  --
-- Reference  : I haven't found a good one yet                               --
-- Depends    : neovim                                                       --
-- Known bugs : NKA                                                          --
-- TODO       : Turn this into something useful                              --
-------------------------------------------------------------------------------

vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.background = dark
vim.cmd('colorscheme neosolarized')
vim.cmd(':iab <expr> dts strftime("%F %R")')

