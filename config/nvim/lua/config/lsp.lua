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

-- diagnostic symbols
for _, sign in ipairs({
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
}) do
  vim.fn.sign_define(sign.name, {
    texthl = sign.name,
    text = sign.text,
    numhl = "",
  })
end

-- common on-attach
local on_attach = function(client, bufnr)
  require("lsp_signature").on_attach({})

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "a", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

-- docker
lspconfig.dockerls.setup({})

-- graphql
lspconfig.graphql.setup({})

-- javascript + typescript
lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
})

-- json
lspconfig.jsonls.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
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
    client.server_capabilities.document_formatting = false
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

-- primsa
lspconfig.prismals.setup({})

-- python
lspconfig.pyright.setup({})

-- ruby
lspconfig.sorbet.setup({})

-- tailwindcss
lspconfig.tailwindcss.setup({})

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

local null_ls = require("null-ls")

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup({
  diagnostics_format = "#{s}: #{m}",
  sources = {
    -- javascript
    code_actions.eslint,
    diagnostics.eslint,
    formatting.eslint,
    -- lua
    formatting.stylua,
    -- python
    diagnostics.flake8,
    formatting.isort,
    formatting.black,
    -- ruby
    diagnostics.rubocop,
    diagnostics.erb_lint,
    formatting.rubocop,
    formatting.erb_lint,
    -- shell
    code_actions.shellcheck,
    diagnostics.shellcheck,
    formatting.shfmt,
    -- vim
    diagnostics.vint,
    -- all
    formatting.prettier.with({ extra_filetypes = { "ruby" } }),
  },
})
