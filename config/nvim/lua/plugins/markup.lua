return {
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
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = {
      markdown = {
        bullets = {},
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        quote_highlight = "Quote",
        headline_highlights = {
          "Headline1",
          "Headline2",
          "Headline3",
          "Headline4",
          "Headline5",
          "Headline6",
        },
      },
    },
  },
  "cespare/vim-toml", -- TOML syntax
  "jxnblk/vim-mdx-js", -- MDX syntax
  "othree/html5.vim", -- HTML5 syntax
}
