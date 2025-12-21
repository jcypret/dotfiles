return {
  {
    -- go align (ga)
    "junegunn/vim-easy-align",
    keys = {
      { "ga", "<plug>(EasyAlign)", mode = { "n", "x" } },
    },
  },
  {
    -- go join (gj) and go split (gs)
    "AndrewRadev/splitjoin.vim",
    init = function()
      vim.g.splitjoin_python_brackets_on_separate_lines = 1
      vim.g.splitjoin_ruby_curly_braces = 0
      vim.g.splitjoin_ruby_hanging_args = 0
      vim.g.splitjoin_trailing_comma = 1
    end,
  },
  "christoomey/vim-sort-motion", -- go sort (gs)
  "christoomey/vim-titlecase", -- go titleize (gt)
  "tpope/vim-surround", -- go surround (ys)
  { "echasnovski/mini.ai", version = "*", config = true }, -- additional text objects
  { "echasnovski/mini.comment", version = "*", config = true }, -- go comment (gc)
}
