return {
  {
    -- mason lsp-config plugin
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      automatic_installation = true,
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup(opts)
    end,
  },
  {
    -- install linters and formatters
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "actionlint",
        "clang-format",
        "codespell",
        "cpplint",
        "erb-lint",
        "eslint-lsp",
        "shellcheck",
        "shfmt",
        "stylua",
        "tailwindcss-language-server",
        "vint",
      },
    },
  },
}
