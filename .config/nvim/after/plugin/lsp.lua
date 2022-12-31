-------------------------------------------------------------------------------
-- Filename   : lsp.lua                                                      --
-- Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                 --
-- Created    : 2022-12-15                                                   --
-- Last edit  : 2022-12-30 19:46                                             --
-- Purpose    : Handles treesitter plugin in neovim                          --
-- Reference  : https://youtu.be/w7i4amO_zaE                                 --
-- Depends    : neovim                                                       --
-- Known bugs : NKA                                                          --
-- TODO       : N/A                                                          --
-------------------------------------------------------------------------------
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup()
