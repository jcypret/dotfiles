return {
  "stefandtw/quickfix-reflector.vim", -- change code in the quickfix window
  {
    -- search and replace
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "\\",
        '<cmd>lua require("spectre").toggle()<CR>',
        { desc = "Toggle Spectre" },
      },
      {
        "<bar>",
        '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
        { desc = "Search current word" },
      },
    },
  },
}
