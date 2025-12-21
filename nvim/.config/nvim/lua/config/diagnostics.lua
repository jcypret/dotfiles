-- diagnostic config
vim.diagnostic.config({
  float = {
    source = true,
    border = "rounded",
  },
})

-- diagnostic mappings
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "D", vim.diagnostic.open_float, opts)

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "", -- or other icon of your choice here, this is just what my config has:
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
})
