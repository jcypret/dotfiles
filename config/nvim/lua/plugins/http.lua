return {
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>hs", desc = "Send request" },
      { "<leader>ha", desc = "Send all requests" },
      { "<leader>hb", desc = "Open scratchpad" },
    },
    ft = { "http", "rest" },
    opts = {
      global_keymaps = true,
      global_keymaps_prefix = "<leader>h",
      kulala_keymaps_prefix = "",
    },
  },
}
