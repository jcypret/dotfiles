return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    opts = {
      highlight = {
        enable = true,
        disable = { "markdown" },
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "comment",
        "commonlisp",
        "css",
        "scss",
        "diff",
        "dockerfile",
        "elixir",
        "eex",
        "heex",
        "erlang",
        "elm",
        "go",
        "graphql",
        "haskell",
        "html",
        "http",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "jsonc",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "ruby",
        "rust",
        "svelte",
        "toml",
        "vim",
        "vue",
        "yaml",
      },
    },
  },
}
