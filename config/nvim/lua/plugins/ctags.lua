return {
  {
    -- ctag browser
    "majutsushi/tagbar",
    cmd = { "TagbarToggle" },
    init = function()
      vim.g.tagbar_iconchars = { "▸", "▾" }
      vim.g.tagbar_sort = 0

      vim.api.nvim_set_hl(0, "TagbarAccessPublic", { fg = "#A3BE8C" })
      vim.api.nvim_set_hl(0, "TagbarAccessProtected", { fg = "#EBCB8B" })
      vim.api.nvim_set_hl(0, "TagbarAccessPrivate", { fg = "#BF616A" })
    end,
    keys = {
      { "<c-t>", ":TagbarToggle<cr>" },
    },
  },
  "ludovicchabant/vim-gutentags", -- automatic ctag generation
}
