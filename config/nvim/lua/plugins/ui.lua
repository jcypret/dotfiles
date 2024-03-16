return {
  {
    "jcypret/nord.nvim",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      local nord = require("nord.colors")

      -- highlight embedded languages
      vim.g.vimsyn_embed = "l"

      -- theme config
      vim.g.nord_bold = false
      vim.g.nord_borders = true
      vim.g.nord_italic = false

      -- apply theme
      vim.cmd([[colorscheme nord]])

      -- italicize comments
      local hl = vim.api.nvim_get_hl_by_name("@comment", true)
      vim.api.nvim_set_hl(0, "@comment", { fg = hl.foreground, italic = true })

      -- darken line numbers
      vim.api.nvim_set_hl(0, "LineNr", { fg = nord.nord2_gui })
    end,
  },
  {
    -- shows lines for indentation levels
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
      },
      scope = {
        show_start = false,
        show_end = false,
        highlight = { "DiagnosticHint" }, -- nord 10
      },
      exclude = {
        filetypes = { "nerdtree", "startify", "tagbar" },
        buftypes = { "help" },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      theme = "nord",
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = function()
      return {
        highlights = require("nord").bufferline.highlights(),
        options = {
          separator_style = "slope",
          show_buffer_close_icons = false,
        },
      }
    end,
  },
  {
    -- colored matched parens for Lisp sanity
    "luochen1990/rainbow",
    init = function()
      vim.g.rainbow_active = 0
    end,
  },
  {
    -- fancy start screen
    "mhinz/vim-startify",
    init = function()
      vim.g.startify_change_to_vcs_root = 1
    end,
  },
  {
    -- Nerd Font support (file type icons)
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    -- better vim.ui
    "stevearc/dressing.nvim",
    config = {
      input = {
        win_options = {
          winhighlight = "NormalFloat:",
        },
      },
    },
  },
  "RRethy/vim-illuminate", -- cursor symbol highlight
  "norcalli/nvim-colorizer.lua", -- highlight hex colors
}
