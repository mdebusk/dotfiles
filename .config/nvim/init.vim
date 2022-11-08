-------------------------------------------------------------------------------
-- Filename   : init.lua                                                     --
-- Author     : Michael DeBusk (https://gitlab.com/mdebusk/)                 --
-- Created    : 2022-07-05 15:44                                             --
-- Last edit  : 2022-11-07 11:36                                             --
-- Purpose    : Initialization file for vim                                  --
-- Reference  : I haven't found a good one yet                               --
-- Depends    : neovim                                                       --
-- Known bugs : NKA                                                          --
-- TODO       : Finish converting to lua                                     --
-------------------------------------------------------------------------------

-- ** 1. Important {{{
-- End Important }}}

-- ** 2. Moving around, searching and patterns {{{
vim.opt.autochdir = true     -- Automatically change working directory to that of open file
vim.opt.ignorecase = true    -- ignore case when using a search pattern
vim.opt.path:append '**'     -- Search down into subfolders
vim.opt.smartcase = true     -- override 'ignorecase' when pattern has upper case characters
-- End Moving around, searching and patterns }}}

-- ** 3. Tags {{{
-- End Tags }}}

-- ** 4. Displaying text {{{
vim.opt.cmdheight=2          -- Set the command window height to 2 lines
vim.opt.fillchars:append 'fold:·'    -- Set fill character for folds
vim.opt.lazyredraw = true    -- Don’t update screen during macro and script execution
vim.opt.list = true          -- Show whitespace characters
-- TODO List of strings used for list mode
-- vim.opt.listchars=tab:╠═,trail:░,nbsp:▃,leadmultispace:┊\ \ \ ,
vim.opt.wrap = false              -- Turn off word wrapping
vim.opt.number = true        -- Enable line numbering, taking up 6 spaces
vim.opt.numberwidth=5        -- Set line numbering to take up 5 spaces
vim.opt.sidescrolloff=5      -- Number of columns to show around the cursor
vim.opt.scrolloff=3          -- Number of lines to show around the cursor
augroup numbertoggle     -- Toggles relativenumber on and off based on mode
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * vim.opt.relativenumber = true
    autocmd BufLeave,FocusLost,InsertEnter   * vim.opt.relativenumber = false
augroup END
-- End Displaying text }}}

-- ** 5. Syntax highlighting and spelling {{{
filetype indent plugin on -- indent depends on filetype
vim.opt.colorcolumn=+1        -- Show the column where text would wrap
vim.opt.cursorline = true     -- Highlight current line
syntax enable
-- End Syntax highlighting and spelling }}}

-- ** 6. Multiple Windows {{{
vim.opt.splitbelow = true    -- New horizontal split opens below the existing one
vim.opt.splitright = true    -- New vertical split opens right of the existing one
-- Initiate statusline {{{2
vim.opt.statusline=                            -- Start with an empty statusline
vim.opt.statusline+=[%02n]                     -- Buffer number
vim.opt.statusline+=\ %F%m%r%h%w               -- File path, modified, r/o, help, preview
vim.opt.statusline+=\ [Fmt\:%{&ff}]            -- file format
vim.opt.statusline+=\ [Type\:%Y]               -- Filetype
vim.opt.statusline+=\ [ASC\:%04.4b]         -- ASCII code of character under cursor
vim.opt.statusline+=\ [HEX\:%04.4B]           -- Hex code of character under cursor
vim.opt.statusline+=%=                         -- Move to right side of the line
vim.opt.statusline+=\ [Line\:%04l,\ Col\:%03v] -- Cursor location
vim.opt.statusline+=\ [%3p%%]                  -- Percentage through file
vim.opt.statusline+=\ [Lines\:%L]              -- Total lines in file
-- set statusline+=%#color#%
-- End statusline }}}
-- End Multiple Windows }}}

-- ** 7. Multiple tab pages {{{
-- End Multiple tab pages }}}

-- ** 8. Terminal {{{
-- End Terminal }}}

-- ** 9. Using the mouse {{{
vim.opt.mousefocus = true                 -- May as well use it if it's there
-- End Using the mouse }}}

-- ** 10. GUI {{{
-- End GUI }}}

-- ** 11. Printing {{{
vim.opt.printdevice=pdf     -- Use PDF printer
vim.opt.printoptions=paper:letter,syntax:y,wrap:y,duplex:long
-- End Printing }}}

-- ** 12. Messages and info {{{
vim.opt.confirm = true       -- ask if you wish to save changed files
vim.opt.visualbell = true    -- Use visual bell instead of beeping when doing something wrong
-- End Messages and info }}}

-- ** 13. Selecting text {{{
-- End Selecting text }}}

-- ** 14. Editing text {{{
vim.opt.complete+=kspell
vim.opt.completeopt=menuone,longest
vim.opt.omnifunc=syntaxcomplete#Complete
vim.opt.matchpairs+=<:>      -- Add angle brackets to matchpairs
vim.opt.undofile = true       -- Save and restorre undo file
-- End Editing text }}}

-- ** 15. Tabs and indenting {{{
vim.opt.expandtab = true     -- turn tabs into whitespace
vim.opt.shiftround = true    -- use multiple of shiftwidth when indenting with '<' and '>'
vim.opt.shiftwidth=4         -- Indent width for autoindent
vim.opt.smartindent = true   -- Turn on smart indent
vim.opt.softtabstop=4        -- Number of spaces a tab counts when editing
vim.opt.tabstop=4            -- set tab character to 4 characters
-- End Tabs and indenting }}}

-- ** 16. Folding {{{
vim.opt.foldlevel=99
vim.opt.foldmethod=marker
-- End Folding }}}

-- ** 17. Diff mode {{{
-- End Diff mode }}}

-- ** 18. Mapping {{{
-- Quickly time out on keycodes, but never time out on mappings
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen=200

-- In case you open a file without sudo permissions
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

-- Open help in a vertical split and to the right
cnoremap help vertical botright help

-- Disable arrow movement; resize splits instead.
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

-- Keep the cursor centered during search and join
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

-- Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

-- Don't leave visual mode when (un)indenting
vnoremap < <gv
vnoremap > >gv

-- End Mapping }}}

-- ** 19. Reading and writing files {{{
vim.opt.autowrite = true     -- Writes file when switching to another buffer
vim.opt.backup = true        -- keep a backup file
-- https://www.techrepublic.com/article/turn-off-modeline-support-in-vim/
vim.opt.modelines=0          -- Do not check for existing modelines
vim.opt.modeline = false     -- Disable modeline support
-- End Reading and writing files }}}

-- ** 20. The swap file {{{
-- End The swap file }}}

-- ** 21. Command line editing {{{
-- Ignore the following extensions when using wildmenu
vim.opt.wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam
-- End Command line editing }}}

-- ** 22. Running external commands {{{
-- End Running external commands }}}

-- ** 23. Running make and jumping to errors {{{
-- End Running make and jumping to errors }}}

-- ** 24. Language-specific {{{
-- End Language-specific }}}

-- ** 25. Multi-byte characters {{{
-- End Multi-byte characters }}}

-- ** 26. Various {{{
vim.opt.bufhidden=hide       -- Hide buffer when not in window
vim.opt.signcolumn=yes
-- End Various }}}

-- ** Color scheme {{{
vim.opt.t_Co=16
let g:solarized_termcolors=16
let g:solarized_termtrans=1
colorscheme solarized
highlight Comment cterm=italic gui=italic
highlight clear SpellBad
highlight SpellBad cterm=underline,bold gui=undercurl
-- End Color scheme }}}

-- ** Customized file types {{{
augroup views            -- Back up and restore views on buffer open
    autocmd!
    au BufWinLeave ?* mkview
    au BufWinEnter ?* silent loadview
augroup END

augroup markdown {{{2
    au BufNewFile,BufRead *.md :set iskeyword=@,48-57,_,-,192-255
    au BufNewFile,BufRead *.md :iab (c) &#169;
    au BufNewFile,BufRead *.md :iab (r) &#174;
    au BufNewFile,BufRead *.md :iab -- &#8211;
    au BufNewFile,BufRead *.md :iab --- &#8212;
    au BufNewFile,BufRead *.md :iab (tm) &#8482;
    let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sql']
augroup END -- markdown }}}

augroup filetype_LaTeX {{{2
    autocmd!
    -- copy document template into empty new buffer
    au BufNewFile *.tex
                \ 0r $HOME/Templates/latex_document.tex

    au BufNewFIle,BufRead *.tex :iab latex \LaTeX\
    map <F9> :!pdflatex %<CR>
augroup END --}}}

augroup filetype_bash {{{2
    autocmd!
    -- copy script template into empty new buffer
    au BufNewFile *.sh
                \ 0r $HOME/Templates/shell_script.sh
augroup END --}}}

augroup filetype_python {{{2
    -- Delete all trailing whitespace before saving
    au BufWritePre *.py :%s/\s\+$//e
    -- copy script template into empty new buffer
    au BufNewFile *.py
                \ 0r $HOME/Templates/python_script.py
    au BufNewFile,BufRead *.py
                \ vim.opt.tabstop=4 |
                \ vim.opt.softtabstop=4 |
                \ vim.opt.shiftwidth=4 |
                \ vim.opt.textwidth=79 |
                \ vim.opt.expandtab = true |
                \ vim.opt.autoindent = true |
                \ vim.opt.smartindent = true |
                \ vim.opt.colorcolumn=80 |
                \ vim.opt.fileformat=unix
augroup END --}}}

augroup web_development {{{2
    au BufNewFile,BufRead *.js, *.html, *.css, *.php
                \ set tabstop=2 |
                \ set softtabstop=2 |
                \ set shiftwidth=2

    -- copy HTML document template into empty new buffer
    au bufnewfile *.html
                \ 0r $HOME/Templates/html_document.html
augroup END --}}}

-- End Customized file types }}}

-- ** Abbreviations {{{
-- Insert date (and maybe time)
:iab <expr> dts strftime(--%F %R--)    -- Date/time stamp
:iab <expr> dtg strftime(--%e %b %Y--) -- Date style used in genealogy

-- for QIF files
:iab ckng MAutopay<CR>LAssets:Current Assets:Capital One 360:Checking

-- End Abbreviations }}}

-- ** Plugins {{{

-- Make netrw look like NERDtree {{{2
-- https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
-- augroup ProjectDrawer
--  -- autocmd!
--  -- autocmd VimEnter * :Vexplore
-- augroup END
-- End netrw-to-NERDtree }}}
-- End Plugins }}}

-- ** Miscellaneous stuff {{{
-- automatically leave insert mode after 'updatetime' milliseconds of inaction
-- https://vim.fandom.com/wiki/To_switch_back_to_normal_mode_automatically_after_inaction
au CursorHoldI * stopinsert

-- Use a line cursor within insert mode and a block cursor everywhere else.
-- https://www.youtube.com/watch?v=FcQjTXLrVUU&t=198s
-- Reference chart of values:{{{2
--   Ps = 0  -> blinking block.
--   Ps = 1  -> blinking block (default).
--   Ps = 2  -> steady block.
--   Ps = 3  -> blinking underline.
--   Ps = 4  -> steady underline.
--   Ps = 5  -> blinking bar (xterm).
--   Ps = 6  -> steady bar (xterm).
-- End reference chart }}}
let &t_SI = --\e[6 q-- -- Steady bar for insert mode
let &t_EI = --\e[2 q-- -- Steady block for everything else

-- Save macro in register d
let @d='gg/last edit\ *:\ *\d/e:nohlRdtsýaggd'

-- Set sup a local buffer as a pseudo-word-processor {{{2
function! Writer()
    map j gj
    map k gk
    setlocal formatoptions=t1
    setlocal textwidth=80
    setlocal noautoindent
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal expandtab
    setlocal wrap
    setlocal nolist
    setlocal linebreak
    set syntax=markdown
endfunction
com! WR call Writer()
-- End Writer function }}}
-- End Miscellaneous stuff }}}
