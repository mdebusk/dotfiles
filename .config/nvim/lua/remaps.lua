-------------------------------------------------------------------------------
-- Filename   : remaps.lua                                                   --
-- Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                 --
-- Created    : 2022-12-15 18:00                                             --
-- Last edit  : 2022-12-17 14:58                                             --
-- Purpose    : Keymappings for neovim                                       --
-- Reference  : x                                                            --
-- Depends    : neovim, keymap.lua                                           --
-- Known bugs : NKA                                                          --
-- TODO       : N/A                                                          --
-------------------------------------------------------------------------------

-- Disable arrow keys
vim.keymap.set("n", "<Up>", "<NOP>");
vim.keymap.set("n", "<Down>", "<NOP>");
vim.keymap.set("n", "<Left>", "<NOP>");
vim.keymap.set("n", "<Right>", "<NOP>");

-- Keep the cursor centered during half-page jumps, search, and join
vim.keymap.set("n", "n", "nzzzv");
vim.keymap.set("n", "<C-d>", "<C-d>zz");
vim.keymap.set("n", "N", "Nzzzv");
vim.keymap.set("n", "<C-u>", "<C-u>zz");
vim.keymap.set("n", "J", "mzJ`z");

-- Undo break points
vim.keymap.set("i", ",", ",<c-g>u");
vim.keymap.set("i", ".", ".<c-g>u");
vim.keymap.set("i", "!", "!<c-g>u");
vim.keymap.set("i", "?", "?<c-g>u");

-- Don't leave visual mode when (un)indenting
vim.keymap.set("v", "<", "<gv");
vim.keymap.set("v", ">", ">gv");

-- In case you open a file without sudo permissions
vim.keymap.set("c", "w!!", "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!");

-- Open help in a vertical split and to the right
vim.keymap.set("c", "help", "vertical botright help");

