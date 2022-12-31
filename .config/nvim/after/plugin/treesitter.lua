-------------------------------------------------------------------------------
-- Filename   : treesitter.lua                                               --
-- Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                 --
-- Created    : 2022-12-15                                                   --
-- Last edit  : 2022-12-30 19:46                                             --
-- Purpose    : Handles treesitter plugin in lua                             --
-- Reference  : https://youtu.be/w7i4amO_zaE                                 --
-- Depends    : neovim                                                       --
-- Known bugs : NKA                                                          --
-- TODO       : N/A                                                          --
-------------------------------------------------------------------------------
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "c", "css", "help", "html", "javascript", "lua", "markdown", "python", "yaml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
