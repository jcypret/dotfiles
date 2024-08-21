return {
  {
    -- file system explorer
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
  -- seamless navigation between tmux panes and vim splits
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      -- hjkl mappings
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
      -- arrow mappings
      { "<c-left>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-down>", "<cmd>TmuxNavigateDown<cr>" },
      { "<c-up>", "<cmd>TmuxNavigateUp<cr>" },
      { "<c-right>", "<cmd>TmuxNavigateRight<cr>" },
    },
  },
  { "echasnovski/mini.bracketed", version = "*", config = true }, -- square bracket navigation
  "gioele/vim-autoswap", -- stop the swap file messages and just switch to correct window
  "pbrisbin/vim-mkdir", -- auto create any non-existent directories before writing buffer
  "simeji/winresizer", -- vim motion moving and resizing of windows
  "tpope/vim-eunuch", -- helpers for UNIX (:Delete, :Move, :Rename)
}
