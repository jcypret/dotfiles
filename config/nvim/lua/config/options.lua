local opt = vim.opt

opt.autowrite = true -- save before running commands (useful for TDD)
opt.cmdheight = 2 -- extra room at bottom for messages
opt.cursorline = true -- highlight the current line
opt.formatoptions:remove("t") -- turn off auto hard-wrapping
opt.laststatus = 3
opt.linebreak = true -- prevent soft-wrapping inside of word
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- whitespace characters
opt.shortmess:append("c") -- hide completion menu messages
opt.showcmd = false -- don't show partial commands in status bar
opt.showmode = false -- redundant to status line mode
opt.signcolumn = "yes" -- always show signcolumns
opt.splitbelow = true -- open new horizontal splits below
opt.splitright = true -- open new vertical splits to the right
opt.wildmode = { "list:longest", "full" } -- match longest first, then full list
opt.termguicolors = true -- enable 24-bit RGB colors

-- indentation
opt.tabstop = 2 -- indent 2 spaces
opt.shiftwidth = 2 -- indent 2 spaces when using >>
opt.shiftround = true -- snap to increments of 2
opt.expandtab = true -- use soft tabs

-- line numbers
opt.relativenumber = true
opt.number = true
opt.numberwidth = 5

-- line width
opt.textwidth = 80 -- Set column width
opt.colorcolumn = "+1" -- highlight 81st column
opt.breakindent = true -- wrap lines in editor if too wide for screen
opt.breakindentopt = "shift:2" -- indent wrapped line

-- search
opt.ignorecase = true -- case-insensitive when lowercase
opt.smartcase = true -- case-sensitive when uppercase
opt.inccommand = "split" -- live preview for find/replace
