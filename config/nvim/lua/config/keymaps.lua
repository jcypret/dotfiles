local g = vim.g
local map = vim.api.nvim_set_keymap

local function noremap(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

g.mapleader = " "

-- BUFFERS
-- create a new buffer (save it with :w ./path/to/FILENAME)
noremap("n", "<leader>bn", ":enew<cr>")
-- close current buffer
noremap("n", "<leader>bd", ":bp <bar> bd! #<cr>") -- close all open buffers
noremap("n", "<leader>bD", ":bufdo bd!<cr>")

-- CLIPBOARD
-- copy to clipboard in visual mode
noremap("v", "<C-c>", '"+y')
-- paste from clipboard in insert mode
noremap("i", "<C-v>", '<esc>"+pa')
-- put same yank repeatedly
noremap("v", "P", '"0p')

-- DIFFING
-- diff against last commit
noremap("n", "<leader>dd", ":term git diff<cr>i")
-- diff against HEAD
noremap("n", "<leader>dh", ":term git diff HEAD<cr>i")
-- diff staged changes, ignoring all spaces
noremap("n", "<leader>ds", ":term git diff --staged --ignore-all-space<cr>i")

-- FILE NAVIGATION
-- Switch between the last two files
noremap("n", "<leader><leader>", "<C-^>")
-- Edit another file in the same directory as the current file
noremap("n", "<leader>e", ":e <C-r>=escape(expand('%:p:h'), ' ') . '/'<cr>")
noremap("n", "<leader>s", ":split <C-r>=escape(expand('%:p:h'), ' ') . '/'<cr>")
noremap("n", "<leader>v", ":vnew <C-r>=escape(expand('%:p:h'), ' ') . '/'<cr>")

-- MOVEMENTS
-- Jump to beginning of line after whitespace
noremap("n", "0", "g^")
noremap("n", "$", "g$")
-- Move between panels
noremap("n", "<C-h>", "<C-w>h")
noremap("n", "<C-j>", "<C-w>j")
noremap("n", "<C-k>", "<C-w>k")
noremap("n", "<C-l>", "<C-w>l")
-- Move vertically through wrapped text
noremap("n", "j", "gj")
noremap("n", "k", "gk")

-- SEARCH
-- Clear highlight from search results
noremap(
  "n",
  "<leader>/",
  ":nohlsearch<c-r>=has('diff')?'<bar>diffupdate':''<cr><cr><C-l>"
)

-- TAB NAVIGATION
noremap("n", "T", ":tabnew<cr>")
noremap("n", "[t", ":tabprevious<cr>")
noremap("n", "]t", ":tabnext<cr>")
noremap("n", "[T", ":tabrewind<cr>")
noremap("n", "]T", ":tablast<cr>")

-- COPILOT
g.copilot_no_tab_map = true
map(
  "i",
  "<c-j>",
  'copilot#Accept("<cr>")',
  { noremap = true, silent = true, expr = true, script = true }
)
vim.cmd("highlight CopilotSuggestion guifg=#4C566A")
