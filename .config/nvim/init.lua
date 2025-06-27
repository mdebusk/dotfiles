-------------------------------------------------------------------------------
-- Filename   : init.lua                                                     --
-- Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                 --
-- Created    : 2022-07-05 15:44                                             --
-- Last edit  : 2025-06-26 22:27                                             --
-- Purpose    : Initialization file for neovim                               --
-- Reference  : https://neovim.io/doc/                                       --
-- Depends    : neovim                                                       --
-- Known bugs : NKA                                                          --
-- TODO       : N/A                                                          --
-------------------------------------------------------------------------------

-- Required for TreeSitter
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.keys")
require("config.options")
require("config.lazy")

vim.cmd(':iab <expr> dts strftime("%F %R")')

-- Make netrc look like NERDtree
vim.g.netrw_altv = 1
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25
