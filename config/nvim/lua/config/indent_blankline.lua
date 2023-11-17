vim.api.nvim_set_hl(0, "IblScope", { fg = "#5E81AC" })

require("ibl").setup({
  indent = {
    char = "▏",
  },
  scope = {
    show_start = false,
    show_end = false,
  },
  exclude = {
    filetypes = { "nerdtree", "startify", "tagbar" },
    buftypes = { "help" },
  },
})
