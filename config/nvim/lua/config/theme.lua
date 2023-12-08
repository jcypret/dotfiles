local g = vim.g
local opt = vim.opt

 -- highlight embedded languages
g.vimsyn_embed = "l"

-- enable 24-bit RGB colors
opt.termguicolors = true

-- nord theme
g.nord_italic = 1
g.nord_italic_comments = 1
g.nord_underline = 1
vim.cmd("colorscheme nord")

-- highlight hex colors
require("colorizer").setup()
