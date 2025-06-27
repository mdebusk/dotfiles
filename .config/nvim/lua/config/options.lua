-------------------------------------------------------------------------------
-- Filename   : set.lua                                                      --
-- Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                 --
-- Created    : 2022-07-05 15:44                                             --
-- Last edit  : 2023-01-09 19:26                                             --
-- Purpose    : set stsatements configuration for neovim                     --
-- Reference  : :options                                                     --
-- Depends    : neovim                                                       --
-- Known bugs : NKA                                                          --
-- TODO       : N/A                                                          --
-------------------------------------------------------------------------------

-- ** 1. Important {{{
-- End 1 }}}

-- ** 2. Moving around, searching, and patterns {{{
vim.opt.autochdir = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.path:append '**'
vim.opt.smartcase = true
-- End 2 }}}

-- ** 3. Tags {{{
-- End 3 }}}

-- ** 4 Displaying text {{{
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = {
    tab = '╠═',
    trail = '░',
    nbsp = '▃',
    leadmultispace = '┊   ',
}
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
-- End 5 }}}

-- ** 5 Syntax, highlighting, and spelling {{{
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.hlsearch = false
vim.opt.termguicolors = true
-- End 5 }}}

-- ** 6. Multiple windows {{{
vim.opt.splitbelow = true
vim.opt.splitright = true
-- TODO status line
-- End 6 }}}

-- ** 7. Multiple tab pages {{{
-- End 7 }}}

-- ** 8. Terminal {{{
vim.opt.guicursor = ""
vim.opt.title = true
-- End 8 }}}

-- ** 9. Using the mouse {{{
vim.opt.mousefocus = true
-- End 9 }}}

-- ** 10. GUI {{{
-- End 10 }}}

-- ** 11. Printing {{{
-- End 11 }}}

-- ** 12. Messages and info {{{
-- End 12 }}}

-- ** 13. Selecting text {{{
-- End 13 }}}

-- ** 14. Editing text {{{
vim.opt.completeopt= { "menuone", "noselect" }
vim.opt.pumheight = 10
vim.opt.undofile = true
-- End 14 }}}

-- ** 15. Tabs and indenting {{{
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
-- End 15 }}}

-- ** 16. Folding {{{
vim.opt.foldlevel = 99
vim.opt.foldmethod = "marker"
-- End 16 }}}

-- ** 17. Diff mode {{{
-- End 17 }}}

-- ** 18. Mapping {{{
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 200
-- End 18 }}}

-- ** 19. Reading and writing files {{{
vim.opt.autowrite = true
-- End 19 }}}

-- ** 20. The swap file {{{
-- End 20 }}}

-- ** 21. Command line editing {{{
-- End 21 }}}

-- ** 22. Executing external commands {{{
-- End 22 }}}

-- ** 23. Running make and jumping to errors (quickfix) {{{
-- End 23 }}}

-- ** 24. Language specific {{{
-- End 24 }}}

-- ** 25. Multi-byte characters {{{
-- End 25 }}}

-- ** 26. Various {{{
vim.opt.signcolumn = "yes"
-- End 25 }}}
