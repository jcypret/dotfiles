return {
  {
    -- Ruby syntax
    "vim-ruby/vim-ruby",
    init = function()
      vim.g.ruby_indent_block_style = "do"
      vim.g.ruby_indent_assignment_style = "variable"
    end,
  },
  {
    -- heredoc syntax highlighting (like SQL)
    "joker1007/vim-ruby-heredoc-syntax",
    ft = "ruby",
    init = function()
      vim.g.ruby_heredoc_syntax_filetypes = {
        pgsql = { start = "SQL" },
        ruby = { start = "RUBY" },
        xml = { start = "XML" },
        yaml = { start = "YAML" },
      }
    end,
  },
  {
    -- required for vim-textobj-rubyblock
    "kana/vim-textobj-user",
    ft = "ruby",
  },
  {
    -- motion for Ruby blocks
    "nelstrom/vim-textobj-rubyblock",
    ft = "ruby",
  },
  { "tpope/vim-bundler" }, -- Bundler wrapper (:Bundle) and Gemfile syntax
  { "tpope/vim-rails" }, -- Rails wrapper (gf, projectionist def, enhanced syntax)
  { "tpope/vim-rake" }, -- Rake wrapper (:Rake, projectionist def)
}
