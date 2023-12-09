local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api
        .nvim_buf_get_lines(0, line - 1, line, true)[1]
        :sub(col, col)
        :match("%s")
      == nil
end

local feedkey = function(key, mode)
  local k = vim.api.nvim_replace_termcodes(key, true, true, true)
  vim.api.nvim_feedkeys(k, mode, true)
end

return {
  {
    -- completion framework
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer", -- source: buffer
      "hrsh7th/cmp-nvim-lsp", -- source: lsp
      "hrsh7th/cmp-vsnip", -- source: snippets (vsnip)
      "hrsh7th/vim-vsnip", -- snippets framework
      "onsails/lspkind.nvim", -- lsp menu icons
      "rafamadriz/friendly-snippets", -- snippets
    },
    init = function()
      vim.o.completeopt = "menu,menuone,noselect"
    end,
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      cmp.setup({
        formatting = {
          format = lspkind.cmp_format(),
        },
        mapping = cmp.mapping.preset.insert({
          -- enter: confirm selection
          ["<cr>"] = cmp.mapping.confirm({ select = false }),
          -- tab forward: next item
          ["<tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
              feedkey("<plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          -- tab backward: previous item
          ["<s-tab>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
              feedkey("<plug>(vsnip-jump-prev)", "")
            end
          end, { "i", "s" }),
        }),
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
