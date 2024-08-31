return {
  "stefandtw/quickfix-reflector.vim", -- change code in the quickfix window
  {
    -- search and replace
    "MagicDuck/grug-far.nvim",
    config = true,
    keys = {
      {
        "\\",
        function()
          require("grug-far").open({ staticTitle = "Find and replace" })
          vim.defer_fn(function()
            vim.wo.colorcolumn = ""
            vim.wo.cursorline = false
          end, 10)
        end,
        desc = "Search and replace",
      },
      {
        "<bar>",
        function()
          require("grug-far").open({
            prefills = { search = vim.fn.expand("<cword>") },
            staticTitle = "Find: " .. vim.fn.expand("<cword>"),
          })
          vim.defer_fn(function()
            vim.cmd("stopinsert")
            vim.wo.colorcolumn = ""
            vim.wo.cursorline = false
          end, 10)
        end,
        desc = "Search current word",
      },
    },
  },
}
