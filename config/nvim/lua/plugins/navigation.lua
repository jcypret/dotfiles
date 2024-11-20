return {
  -- file system explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    cmd = { "Neotree" },
    keys = {
      { "<c-n>", ":Neotree toggle<cr>" },
      { "<leader>n", ":Neotree reveal<cr>" },
    },
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
      default_component_configs = {
        indent = {
          highlight = "LineNr",
        },
      },
      renderers = {
        message = {
          { "name", highlight = "@comment" },
        },
      },
    },
  },
  -- code label navigation
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },
  { "echasnovski/mini.bracketed", version = "*", config = true }, -- square bracket navigation
  "christoomey/vim-tmux-navigator", -- seamless navigation between tmux panes and vim splits
  "gioele/vim-autoswap", -- stop the swap file messages and just switch to correct window
  "pbrisbin/vim-mkdir", -- auto create any non-existent directories before writing buffer
  "simeji/winresizer", -- vim motion moving and resizing of windows
  "tpope/vim-eunuch", -- helpers for UNIX (:Delete, :Move, :Rename)
}
