-- Modeline and Notes {
--   vim: set foldmarker={,} foldlevel=0 spell:
-- }

-- Basics {
    vim.opt.compatible = false -- explicitly get out of vi-compatible mode
    vim.opt.exrc = false -- don't use local version of .(g)vimrc, .exrc
    vim.opt.background = 'dark' -- we plan to use a dark background
    vim.opt.cpoptions = 'aABceFsmq'
    --                   |||||||||
    --                   ||||||||+-- When joining lines, leave the cursor
    --                   |||||||      between joined lines
    --                   |||||||+-- When a new match is created (showmatch)
    --                   ||||||      pause for .5
    --                   ||||||+-- Set buffer options when entering the
    --                   |||||      buffer
    --                   |||||+-- :write command updates current file name
    --                   ||||+-- Automatically add <CR> to the last line
    --                   |||      when using :@r
    --                   |||+-- Searching continues at the end of the match
    --                   ||      at the cursor position
    --                   ||+-- A backslash has no special meaning in mappings
    --                   |+-- :write updates alternative file name
    --                   +-- :read updates alternative file name
-- }

-- General {
    vim.opt.autochdir = true -- always switch to the current file directory
    vim.opt.backspace = { 'indent', 'eol', 'start' } -- make backspace a more flexible
    vim.opt.backup = false -- make NO backup files
    vim.opt.clipboard:append({ 'unnamed' }) -- share windows clipboard
    vim.opt.directory = '/tmp' -- directory to place swap files in
    vim.opt.fileformats = { 'unix', 'dos', 'mac' } -- support all three, in this order
    vim.opt.iskeyword:append({ '_', '$', '@', '%', '#' })
    vim.opt.errorbells = false -- don't make noise
    vim.opt.whichwrap="b,s,h,l,<,>,~,[,]" -- everything wraps
    --             | | | | | | | | |
    --             | | | | | | | | +-- --]-- Insert and Replace
    --             | | | | | | | +-- --[-- Insert and Replace
    --             | | | | | | +-- --~-- Normal
    --             | | | | | +-- <Right> Normal and Visual
    --             | | | | +-- <Left> Normal and Visual
    --             | | | +-- --l-- Normal and Visual (not recommended)
    --             | | +-- --h-- Normal and Visual (not recommended)
    --             | +-- <Space> Normal and Visual
    --             +-- <BS> Normal and Visual
    vim.opt.wildmenu = true -- turn on command line completion wild style
    
    vim.opt.wildignore= { '*.dll', '*.o', '*.obj', '*.bak', '*.exe', '*.pyc',
    	'*.jpg', '*.gif' , '*.png' } -- ignore these list file extensions
    vim.opt.wildmode= { 'list' , 'longest' } -- turn on wild mode huge list
    vim.opt.undolevels=9999

    vim.opt.autoread = true -- autoread when file is changed from the outside
    vim.opt.hlsearch = true --Highlight search things
    vim.opt.incsearch = true --Make search act like search in modern browsers
    vim.opt.magic = true --Set magic on, for regular expressions

    -- Map leader key {
        vim.g.mapleader = ','
    -- }
-- }

-- Vim UI {
    vim.opt.cursorcolumn = true -- highlight the current column
    vim.opt.incsearch = true -- BUT do highlight as you type you search phrase
    vim.opt.laststatus = 2 -- always show the status line
    vim.opt.lazyredraw = true -- do not redraw while running macros
    vim.opt.linespace = 0 -- don't insert any extra pixel lines between rows
    vim.opt.list = false -- we do want to show tabs, to ensure we get them out of my files
    vim.opt.listchars= { tab = '>-', trail = '-' } -- show tabs and trailing
    vim.opt.matchtime = 5 -- how many tenths of a second to blink matching brackets for
    vim.opt.hlsearch = false -- do not highlight searched for phrases
    vim.opt.startofline = false -- leave my cursor where it was
    vim.opt.visualbell = false -- don't blink
    vim.opt.number = true -- turn on line numbers
    vim.opt.numberwidth = 5 -- We are good up to 99999 lines
    vim.opt.report = 0 -- tell us when anything is changed via :...
    vim.opt.ruler = true -- Always show current positions along the bottom
    vim.opt.scrolloff = 10 -- Keep 10 lines (top/bottom) for scope
    vim.opt.shortmess = 'aOstT' -- shortens messages to avoid 'press a key' prompt
    vim.opt.showcmd = true -- show the command being typed
    vim.opt.showmatch = true -- show matching brackets
    vim.opt.sidescrolloff = 10 -- Keep 5 lines at the size
    vim.opt.statusline = '%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]'
    --                     | | | | |  |   |      |  |     |    |
    --                     | | | | |  |   |      |  |     |    + current
    --                     | | | | |  |   |      |  |     |       column
    --                     | | | | |  |   |      |  |     +-- current line
    --                     | | | | |  |   |      |  +-- current % into file
    --                     | | | | |  |   |      +-- current syntax in
    --                     | | | | |  |   |          square brackets
    --                     | | | | |  |   +-- current fileformat
    --                     | | | | |  +-- number of lines
    --                     | | | | +-- preview flag in square brackets
    --                     | | | +-- help flag in square brackets
    --                     | | +-- readonly flag in square brackets
    --                     | +-- rodified flag in square brackets
    --                     +-- full path to file in the buffer
-- }

-- Text Formatting/Layout {
    vim.opt.completeopt='' -- don't use a pop up menu for completions
--    set expandtab -- no real tabs please!
    vim.opt.formatoptions='rq' -- Automatically insert comment leader on return,
                          -- and let gq format comments
    vim.opt.ignorecase = true -- case insensitive by default
    vim.opt.infercase = true -- case inferred by default
    vim.opt.wrap = false -- do not wrap line
    vim.opt.shiftround = true -- when at 3 spaces, and I hit > ... go to 4, not 5
    vim.opt.smartcase = true -- if there are caps, go case-sensitive
    vim.opt.shiftwidth=2 -- auto-indent amount when using cindent,
                      -- >>, << and stuff like that
--    set softtabstop=4 -- when hitting tab or backspace, how many spaces
                       --should a tab be (see expandtab)
--    set tabstop=4 -- real tabs should be 8, and they will show with
                   -- set list on
    vim.opt.smarttab = true
    vim.opt.sw = 8
-- }

-- Folding {
    vim.opt.foldenable = true -- Turn on folding
    vim.opt.foldmarker = { '{' , '}' } -- Fold C style code (only use this as default if you use a high foldlevel)
    vim.opt.foldmethod = 'marker' -- Fold on the marker
    vim.opt.foldlevel = 100 -- Don't autofold anything (but I can still fold manually)
    vim.opt.foldopen= { 'block', 'hor', 'mark', 'percent', 'quickfix', 'tag' } -- what movements open folds
-- }

-- Plugin Settings {
    --let b:match_ignorecase = 1 -- case is stupid
-- }

-- Mappings {
    -- space / shift-space scroll in normal mode
	vim.api.nvim_set_keymap('', '<S-space>', '<C-b>', { noremap = true } )
	vim.api.nvim_set_keymap('', '<space>', '<C-f>', { noremap = true } )


    -- Make Arrow Keys Useful Again {
        --left
        vim.api.nvim_set_keymap('', '<C-P>', '<ESC>:bp<RETURN>', {})
        --right
        vim.api.nvim_set_keymap('', '<C-N>', '<ESC>:bn<RETURN>', {})
        --up
        vim.api.nvim_set_keymap('', '<S-F>', '<ESC>:NERDTreeToggle<RETURN>', {})
        --down
        vim.api.nvim_set_keymap('', '<C-F>', '<ESC>:FzfLua files<RETURN>', {})
    -- }
    
    -- Tab usability {
        vim.api.nvim_set_keymap('', '<C-<>', '<ESC>:tabprevious<RETURN>', {})
        vim.api.nvim_set_keymap('', '<C->>', '<ESC>:tabnext<RETURN>', {})
    -- }

    -- Multiple line indent and de-indent {
        vim.api.nvim_set_keymap('v', '<Tab>', '>gv', {})
        vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', {})
    -- }

    -- Changing shiftwidth {
        vim.api.nvim_set_keymap('', '<leader>t2', ':setlocal shiftwidth=2<cr>', {})
        vim.api.nvim_set_keymap('', '<leader>t4', ':setlocal shiftwidth=4<cr>', {})
        vim.api.nvim_set_keymap('', '<leader>t8', ':setlocal shiftwidth=8<cr>', {})
    -- }

    -- Move a line of text using ALT+[jk] or Command+[jk] on mac {
        vim.api.nvim_set_keymap('n', '<M-j>' , 'mz:m+<cr>`z', {})
        vim.api.nvim_set_keymap('n', '<M-k>' , 'mz:m-2<cr>`z', {})
        vim.api.nvim_set_keymap('v', '<M-j>' , ':m\'>+<cr>`<my`>mzgv`yo`z', {})
        vim.api.nvim_set_keymap('v', '<M-k>' , ':m\'<-2<cr>`>my`<mzgv`yo`z', {})
    -- }

    -- Moving between windows {
       vim.api.nvim_set_keymap('', 'C-j>', '<C-W>j', {})
       vim.api.nvim_set_keymap('', 'C-k>', '<C-W>k', {})
       vim.api.nvim_set_keymap('', 'C-h>', '<C-W>h', {})
       vim.api.nvim_set_keymap('', 'C-l>', '<C-W>l', {})
    -- }


-- }

-- Arrow Key hack {
	vim.api.nvim_create_autocmd('VimEnter', { pattern = '*', command='map <C-Left>  <ESC>:bp<CR>' } )
	vim.api.nvim_create_autocmd('VimEnter', { pattern = '*', command='map <C-Right> <ESC>:bn<CR>' } )
-- }

-- Cope section {
    vim.api.nvim_set_keymap('', '<leader>cc', ':botright cope<cr>', {} )
    vim.api.nvim_set_keymap('', '<leader>n', ':cn<cr>', {})
    vim.api.nvim_set_keymap('', '<leader>p', ':cp<cr>', {})
-- }

-- Extensions {
	vim.cmd.colorscheme("tokyonight")
	vim.api.nvim_set_keymap('', '<space>', '<C-f>', { noremap = true } )
-- }

-- Language Servers {
	require'lspconfig'.clangd.setup{}
-- }
