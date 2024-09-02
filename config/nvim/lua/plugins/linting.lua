return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      cpp = { "cpplint", "cppcheck" },
      elixir = { "credo" },
      python = { "flake8" },
      ruby = { "standardrb", "erb_lint" },
      vim = { "vint" },
      yaml = { "actionlint" },
    }

    vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
      callback = function()
        local lint_status, lint = pcall(require, "lint")
        if lint_status then
          lint.try_lint()
        end
      end,
    })
  end,
}
