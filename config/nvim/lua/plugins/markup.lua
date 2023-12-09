return {
  {
    -- HTML text expander
    "mattn/emmet-vim",
    cmd = { "Emmet", "EmmetInstall" },
    init = function()
      vim.g.user_emmet_install_global = 0
    end,
  },
  {
    -- Markdown syntax and config
    "preservim/vim-markdown",
    init = function()
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_conceal_code_blocks = 0
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_override_foldtext = 0
    end,
  },
  "cespare/vim-toml", -- TOML syntax
  "jxnblk/vim-mdx-js", -- MDX syntax
  "othree/html5.vim", -- HTML5 syntax
}
