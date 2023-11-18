-- mason
require("mason").setup()
-- ensure LSPs installed
require("mason-lspconfig").setup({
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
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
end

local lspconfig = require("lspconfig")
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

-- eslint
lspconfig.eslint.setup({})

-- graphql
lspconfig.graphql.setup({})

-- javascript + typescript
lspconfig.tsserver.setup({})

-- json
lspconfig.jsonls.setup({
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

-- lua (neovim)
lspconfig.lua_ls.setup({
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
lspconfig.tailwindcss.setup({
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          "cva\\(([^)]*)\\)",
          "[\"'`]([^\"'`]*).*?[\"'`]",
        },
      },
    },
  },
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
lspconfig.yamlls.setup({
  settings = {
    yaml = {
      keyOrdering = false,
    },
  },
})

-------------------------------------------------------------------------------
--> LINTING
-------------------------------------------------------------------------------

require("lint").linters_by_ft = {
  python = { "flake8" },
  ruby = { "standardrb", "erb_lint" },
  vim = { "vint" },
  yaml = { "actionlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-------------------------------------------------------------------------------
--> FORMATTING
-------------------------------------------------------------------------------

local prettier = { "prettierd", "prettier" }
local javascript = { "injected", "eslint_d", prettier }

require("conform").setup({
  formatters_by_ft = {
    ["*"] = { "trim_whitespace", "codespell" },
    javascript = javascript,
    javascriptreact = javascript,
    json = { prettier },
    lua = { "stylua" },
    markdown = { prettier },
    python = { "isort", "black" },
    ruby = { prettier, "erb_format" },
    sh = { "shfmt" },
    toml = { prettier },
    typescript = javascript,
    typescriptreact = javascript,
  },
})

-- :Format
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line =
      vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, range = range })
end, { range = true })

-- <leader>f
vim.keymap.set("n", "<leader>f", ":Format<CR>")
