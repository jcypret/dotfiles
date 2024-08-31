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
    "CopilotC-Nvim/CopilotChat.nvim",
    config = true,
  },
}
