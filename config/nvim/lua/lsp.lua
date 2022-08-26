local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

-- ensure installed
lsp_installer.setup({
  automatic_installation = true,
})

-- diagnostic mappings
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>D", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

-- common on-attach
local on_attach = function(client, bufnr)
  require("lsp_signature").on_attach({})

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "a", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

  vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- override: default config
lspconfig.util.default_config =
  vim.tbl_extend("force", lspconfig.util.default_config, {
    capabilities = capabilities,
    on_attach = on_attach,
  })

-------------------------------------------------------------------------------
--> CONFIG
-------------------------------------------------------------------------------

-- bash
lspconfig.bashls.setup({})

-- javascript + typescript
lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
})

-- json
lspconfig.jsonls.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

-- lua (neovim)
lspconfig.sumneko_lua.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
      diagnostics = { globals = { "vim" } },
    },
  },
})

-- python
lspconfig.pyright.setup({})

-- ruby
lspconfig.solargraph.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
})

-- vim
lspconfig.vimls.setup({})

-- vue
lspconfig.vuels.setup({
  settings = {
    vetur = {
      experimental = {
        templateInterpolationService = true,
      },
    },
  },
})

-- yaml
lspconfig.yamlls.setup({})

-------------------------------------------------------------------------------
--> LINTING + FORMATTING (EFM)
-------------------------------------------------------------------------------

local black = require("efm/black")
local eslint = require("efm/eslint")
local flake8 = require("efm/flake8")
local isort = require("efm/isort")
local prettier = require("efm/prettier")
local pylint = require("efm/pylint")
local shfmt = require("efm/shfmt")
local stylua = require("efm/stylua")

local js_defaults = { eslint, prettier }

lspconfig.efm.setup({
  init_options = {
    documentFormatting = true,
  },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      css = { prettier },
      html = { prettier },
      javascript = js_defaults,
      javascriptreact = js_defaults,
      json = { prettier },
      lua = { stylua },
      python = { pylint, flake8, isort, black },
      sh = { shfmt },
      toml = { prettier },
      typescript = js_defaults,
      typescriptreact = js_defaults,
      vue = js_defaults,
      yaml = { prettier },
    },
  },
})
