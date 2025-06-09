-------------------------------------------------------------------------------
-- Filename   : init.lua                                                     --
-- Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                 --
-- Created    : 2022-07-05 15:44                                             --
-- Last edit  : 2025-06-09 01:33                                             --
-- Purpose    : Initialization file for neovim                               --
-- Reference  : I haven't found a good one yet                               --
-- Depends    : neovim                                                       --
-- Known bugs : NKA                                                          --
-- TODO       : Turn this into something useful                              --
-------------------------------------------------------------------------------

require("remaps")
require("set")

vim.cmd(':iab <expr> dts strftime("%F %R")')
vim.cmd('colorscheme neosolarized')

-- Make netrc look like NERDtree
vim.g.netrw_altv = 1
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25
