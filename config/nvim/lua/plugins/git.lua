return {
  {
    -- Git wrapper
    "tpope/vim-fugitive",
    cmd = { "Git", "Gstatus", "Gcommit", "Gpush", "Gwrite", "Gdelete" },
    keys = {
      { "<leader>gs", ":Git<cr>:20wincmd_<cr>" },
      { "<leader>gc", ":Git commit<cr>" },
      { "<leader>gp", ":Git push<cr>" },
    }
  },
  {
    -- git diff in the sign column
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    -- git commit browser
    "junegunn/gv.vim",
    cmd = "GV",
    keys = {
      { "<leader>gv", ":GV<cr>" },
    },
  },
  "tpope/vim-rhubarb", -- gbrowse for GitHub
}
