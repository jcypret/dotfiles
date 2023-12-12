local g = vim.g
local map = vim.api.nvim_set_keymap

g.mapleader = " "

-- BUFFERS
-- create a new buffer (save it with :w ./path/to/FILENAME)
map("n", "<leader>bn", ":enew<cr>", { noremap = true })
-- close current buffer
map("n", "<leader>bd", ":bp <bar> bd! #<cr>", { noremap = true })
-- close all open buffers
map("n", "<leader>bD", ":bufdo bd!<cr>", { noremap = true })

-- CLIPBOARD
-- copy to clipboard in visual mode
map("v", "<C-c>", '"+y', { noremap = true })
-- paste from clipboard in insert mode
map("i", "<C-v>", '<esc>"+pa', { noremap = true })
-- put same yank repeatedly
map("v", "P", '"0p', { noremap = true })

-- DIFFING
-- diff against last commit
map("n", "<leader>dd", ":term git diff<cr>i", { noremap = true })
-- diff against HEAD
map("n", "<leader>dh", ":term git diff HEAD<cr>i", { noremap = true })
-- diff staged changes, ignoring all spaces
map(
  "n",
  "<leader>ds",
  ":term git diff --staged --ignore-all-space<cr>i",
  { noremap = true }
)

-- FILE NAVIGATION
-- Switch between the last two files
map("n", "<leader><leader>", "<C-^>", { noremap = true })
-- Edit another file in the same directory as the current file
map(
  "n",
  "<leader>e",
  ":e <C-r>=escape(expand('%:p:h'), ' ') . '/'<cr>",
  { noremap = true }
)

-- MOVEMENTS
-- Jump to beginning of line after whitespace
map("n", "0", "g^", { noremap = true })
map("n", "$", "g$", { noremap = true })
-- Move between panels
map("n", "<C-h>", "<C-w>h", { noremap = true })
map("n", "<C-j>", "<C-w>j", { noremap = true })
map("n", "<C-k>", "<C-w>k", { noremap = true })
map("n", "<C-l>", "<C-w>l", { noremap = true })
-- Move vertically through wrapped text
map("n", "j", "gj", { noremap = true })
map("n", "k", "gk", { noremap = true })

-- SEARCH
-- Clear highlight from search results
map(
  "n",
  "<leader>/",
  ":nohlsearch<c-r>=has('diff')?'<bar>diffupdate':''<cr><cr><C-l>",
  { noremap = true, silent = true }
)

-- TABS
map("n", "T", ":tabnew<cr>", { noremap = true, silent = true })
map("n", "[t", ":tabprevious<cr>", { noremap = true, silent = true })
map("n", "]t", ":tabnext<cr>", { noremap = true, silent = true })
map("n", "[T", ":tabrewind<cr>", { noremap = true, silent = true })
map("n", "]T", ":tablast<cr>", { noremap = true, silent = true })
