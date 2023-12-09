local prettier = { "prettierd", "prettier" }
local javascript = { "injected", "eslint_d", prettier }

return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        ["*"] = { "trim_whitespace", "codespell" },
        cpp = { "clang_format" },
        javascript = javascript,
        javascriptreact = javascript,
        json = { prettier },
        lua = { "stylua" },
        markdown = { prettier },
        python = { "isort", "black" },
        ruby = { prettier },
        sh = { "shfmt" },
        toml = { prettier },
        typescript = javascript,
        typescriptreact = javascript,
        yaml = { prettier },
      },
    },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format()
        end,
        desc = "Format buffer",
      },
    },
  },
}
