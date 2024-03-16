return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble", "TroubleClose", "TroubleToggle" },
    keys = {
      {
        "<leader>x",
        function()
          require("trouble").toggle("workspace_diagnostics")
        end,
      },
      {
        "gR",
        "<cmd>Trouble lsp_references<cr>",
      },
    },
  },
}
