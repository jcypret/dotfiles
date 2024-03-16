-- diagnostic config
vim.diagnostic.config({
  float = {
    source = "always",
    border = "rounded",
  },
})

-- diagnostic mappings
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "D", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

-- diagnostic symbols
local signs = {
  Error = "",
  Warn = "",
  Hint = "",
  Info = "",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
