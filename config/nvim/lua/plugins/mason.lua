return {
  {
    -- mason lsp-config plugin
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "bashls", -- bash
        "ccls", -- c++
        "dockerls", -- docker
        "expert", -- elixir
        "eslint", -- eslint
        "graphql", -- graphql
        "jsonls", -- json
        "lua_ls", -- lua (neovim)
        "prismals", -- prisma
        "pyright", -- python
        "sorbet", -- ruby
        "tailwindcss", -- tailwindcss
        "vale_ls", -- vale
        "vimls", -- vim
        "vuels", -- vue
        "yamlls", -- yaml
      },
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
        "shellcheck",
        "shfmt",
        "stylua",
        "vint",
      },
    },
  },
}
