return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble", "TroubleClose", "TroubleToggle" },
    keys = {
      {
        "D",
        function()
          require("trouble").toggle("workspace_diagnostics")
        end,
      },
    },
  },
}
