local javascript = { "injected", "eslint", "prettier" }

return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      format_on_save = {
        timeout_ms = 5000,
      },
      formatters_by_ft = {
        ["*"] = { "trim_whitespace" },
        cpp = { "clang_format" },
        javascript = javascript,
        javascriptreact = javascript,
        json = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        python = { "isort", "black" },
        ruby = { "prettier" },
        sh = { "shfmt" },
        toml = { "prettier" },
        typescript = javascript,
        typescriptreact = javascript,
        yaml = { "prettier" },
      },
    },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ timeout_ms = 5000 })
          vim.notify(
            "Formatted buffer",
            vim.log.levels.INFO,
            { title = "Conform" }
          )
        end,
        desc = "Format buffer",
      },
    },
  },
}
