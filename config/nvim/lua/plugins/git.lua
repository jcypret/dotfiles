return {
  {
    -- Git wrapper
    "tpope/vim-fugitive",
    cmd = { "Git", "Gstatus", "Gcommit", "Gpush", "Gwrite", "Gdelete" },
    keys = {
      { "<leader>gs", ":Git<cr>:20wincmd_<cr>" },
      { "<leader>gc", ":Git commit<cr>" },
      { "<leader>gp", ":Git push<cr>" },
      { "<leader>gb", ":Git blame<cr>" },
      { "<leader>gh", ":GBrowse<cr>", mode = { "n", "v" } },
    },
  },
  {
    -- git diff in the sign column
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    -- git merge conflicts
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },
  "tpope/vim-rhubarb", -- gbrowse for GitHub
}
