local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

-- ensure installed
lsp_installer.setup({
  automatic_installation = true,
})

-- common on-attach
local on_attach = function(client, bufnr)
  require("lsp_signature").on_attach({})
end

-- override: default config
lspconfig.util.default_config = vim.tbl_extend(
  "force",
  lspconfig.util.default_config,
  { on_attach = on_attach }
)

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
  formatting = false,
})

-- vim
lspconfig.vimls.setup({})

-- vue
lspconfig.vuels.setup({})

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
local vint = require("efm/vint")

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
      vim = { vint },
      vue = js_defaults,
      yaml = { prettier },
    },
  },
})
