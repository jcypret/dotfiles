return {
  {
    -- Python syntax
    "vim-python/python-syntax",
    init = function()
      vim.g.python_highlight_all = 1
      vim.g.python_highlight_space_errors = 0
    end,
  },
  "Vimjas/vim-python-pep8-indent", -- improved indentation
}
