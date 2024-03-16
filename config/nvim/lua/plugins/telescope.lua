return {
  {
    -- fuzzy file browser
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "sorbet/rbi",
        },
      },
    },
    keys = {
      { "<c-p>", "<cmd>Telescope find_files hidden=true<cr>" },
      { "<leader>;", "<cmd>Telescope buffers<cr>" },
    },
  },
}
