local lsp_installer = require('nvim-lsp-installer')
local lspconfig = require('lspconfig')

lsp_installer.setup {
  automatic_installation = true
}

local on_attach = function(client, bufnr)
  require('lsp_signature').on_attach()
end

-- bash
lspconfig.bashls.setup {
  on_attach = on_attach,
}

-- javascript + typescript
lspconfig.tsserver.setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    on_attach(client, bufnr)
  end
}

-- json
lspconfig.jsonls.setup {
  on_attach = on_attach,
  provideFormatter = false,
}

-- linting + formatting
lspconfig.efm.setup {
  on_attach = on_attach,
}

-- lua
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  }
}

-- python
lspconfig.pyright.setup {
  on_attach = on_attach,
}

-- ruby
lspconfig.solargraph.setup {
  on_attach = on_attach,
  formatting = false,
}

-- vim
lspconfig.vimls.setup {
  on_attach = on_attach,
}

-- vue
lspconfig.vuels.setup {
  on_attach = on_attach,
}

-- yaml
lspconfig.yamlls.setup {
  on_attach = on_attach,
}
