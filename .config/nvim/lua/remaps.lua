-------------------------------------------------------------------------------
-- Filename   : remaps.lua                                                   --
-- Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                 --
-- Created    : 2022-12-15 18:00                                             --
-- Last edit  : 2022-12-15 19:11                                             --
-- Purpose    : Keymappings for neovim                                       --
-- Reference  : x                                                            --
-- Depends    : neovim, keymap.lua                                           --
-- Known bugs : NKA                                                          --
-- TODO       : N/A                                                          --
-------------------------------------------------------------------------------

local keymap = require("keymap");

local nnoremap = keymap.nnoremap;

-- Disable arrow keys
nnoremap("<Up>", "<NOP>");
nnoremap("<Down>", "<NOP>");
nnoremap("<Left>", "<NOP>");
nnoremap("<Right>", "<NOP>");

-- Keep the cursor centered during half-page jumps, search, and join
nnoremap("n", "nzzzv");
nnoremap("<C-d>", "<C-d>zz");
nnoremap("N", "Nzzzv");
nnoremap("<C-u>", "<C-u>zz");
nnoremap("J", "mzJ`z");

-- Undo break points
-- inoremap(",", ",<c-g>u");
-- inoremap(".", ".<c-g>u");
-- inoremap("!", "!<c-g>u");
-- inoremap("?", "?<c-g>u");

-- Don't leave visual mode when (un)indenting
-- vnoremap("<", "<gv");
-- vnoremap(">", ">gv");

