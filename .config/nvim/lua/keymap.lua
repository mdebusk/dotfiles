-------------------------------------------------------------------------------
-- Filename   : keymap.lua                                                   --
-- Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                 --
-- Created    : 2022-12-15 18:00                                             --
-- Last edit  : 2022-12-15 18:11                                             --
-- Purpose    : Key mapping function for neovim                              --
-- Reference  : https://youtu.be/5amnow9X3Po                                 --
-- Depends    : neovim, lua                                                  --
-- Known bugs : NKA                                                          --
-- TODO       : N/A                                                          --
-------------------------------------------------------------------------------
function bind(mode, outer_opts)
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force", {}, outer_opts or {}, opts or {})
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

local M = {}

M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.inoremap = bind("i")

M.buf_nnoremap = bind("n", {buffer = 0})
M.buf_vnoremap = bind("v", {buffer = 0})
M.buf_inoremap = bind("i", {buffer = 0})

return M
