require("nvim-treesitter.configs").setup({
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
})
