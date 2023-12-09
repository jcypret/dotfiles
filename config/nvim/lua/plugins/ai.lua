return {
  {
    -- AI-powered pair programming
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
      },
    },
  },
  {
    -- AI-powered diagnostics
    "piersolenski/wtf.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = { "Wtf" },
  },
}
