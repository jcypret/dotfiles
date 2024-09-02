return {
  {
    -- configs for neovim built-in lsp
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/SchemaStore.nvim", -- json schemas
      "hrsh7th/cmp-nvim-lsp",
      "ray-x/lsp_signature.nvim", -- function signature hints
    },
    config = function()
      -- common on-attach
      local on_attach = function(_, bufnr)
        require("lsp_signature").on_attach({}, bufnr)

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

      -- enable code folding
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local default_config =
        vim.tbl_extend("force", lspconfig.util.default_config, {
          capabilities = capabilities,
          on_attach = on_attach,
        })

      -- bash
      lspconfig.bashls.setup(default_config)

      -- c++
      lspconfig.ccls.setup(default_config)

      -- docker
      lspconfig.dockerls.setup(default_config)

      -- eslint
      lspconfig.eslint.setup(default_config)

      -- elixir
      lspconfig.elixirls.setup(vim.tbl_extend("force", default_config, {
        cmd = {
          vim.fn.resolve(
            vim.fn.stdpath("data")
              .. "/mason/packages/elixir-ls/language_server.sh"
          ),
        },
      }))

      -- graphql
      lspconfig.graphql.setup(default_config)

      -- javascript + typescript
      require("typescript-tools").setup(default_config)

      -- json
      lspconfig.jsonls.setup(vim.tbl_extend("force", default_config, {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      }))

      -- lua (neovim)
      lspconfig.lua_ls.setup(vim.tbl_extend("force", default_config, {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" } },
          },
        },
      }))

      -- primsa
      lspconfig.prismals.setup(default_config)

      -- python
      lspconfig.pyright.setup(default_config)

      -- ruby
      lspconfig.sorbet.setup(default_config)

      -- tailwindcss
      lspconfig.tailwindcss.setup(vim.tbl_extend("force", default_config, {
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
      }))

      -- vale
      lspconfig.vale_ls.setup(vim.tbl_extend("force", default_config, {
        filetypes = { "markdown", "markdown.mdx", "text" },
      }))

      -- vim
      lspconfig.vimls.setup(default_config)

      -- vue
      lspconfig.vuels.setup(vim.tbl_extend("force", default_config, {
        settings = {
          vetur = {
            experimental = {
              templateInterpolationService = true,
            },
          },
        },
      }))

      -- yaml
      lspconfig.yamlls.setup(vim.tbl_extend("force", default_config, {
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
      }))
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },
}
