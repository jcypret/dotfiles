return {
  {
    -- configs for neovim built-in lsp
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/SchemaStore.nvim", -- json schemas
      "saghen/blink.cmp", -- completion
    },
    config = function()
      -- Set up keymaps when LSP attaches (replaces on_attach)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local bufopts = { noremap = true, silent = true, buffer = bufnr }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
          vim.keymap.set("n", "a", vim.lsp.buf.code_action, bufopts)
          vim.keymap.set("n", "gD", vim.lsp.buf.implementation, bufopts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        end,
      })

      -- Set default capabilities for all LSP servers
      local capabilities = require("blink.cmp").get_lsp_capabilities({
        textDocument = {
          -- enable code folding
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      })

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.enable({
        "bashls", -- bash
        "ccls", -- c++
        "dockerls", -- docker
        "expert", -- elixir
        "eslint", -- eslint
        "graphql", -- graphql
        "jsonls", -- json
        "lua_ls", -- lua (neovim)
        "prismals", -- prisma
        "pyright", -- python
        "sorbet", -- ruby
        "tailwindcss", -- tailwindcss
        "vale_ls", -- vale
        "vimls", -- vim
        "vuels", -- vue
        "yamlls", -- yaml
      })

      -- json
      vim.lsp.config("jsonls", {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      -- lua (neovim)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      -- tailwindcss
      vim.lsp.config("tailwindcss", {
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

      -- vale
      vim.lsp.config("vale_ls", {
        filetypes = { "markdown", "markdown.mdx", "text" },
      })

      -- vue
      vim.lsp.config("vuels", {
        settings = {
          vetur = {
            experimental = {
              templateInterpolationService = true,
            },
          },
        },
      })

      -- yaml
      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
      })

      -- javascript + typescript (still uses typescript-tools)
      require("typescript-tools").setup({
        capabilities = capabilities,
        settings = {
          jsx_close_tag = {
            enable = true,
            filetypes = { "javascriptreact", "typescriptreact" },
          },
        },
      })
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },
}
