return {
  {
    -- dark theme
    "jcypret/nord-midnight-vim",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- highlight embedded languages
      vim.g.vimsyn_embed = "l"

      vim.g.nord_italic = 1
      vim.g.nord_italic_comments = 1
      vim.g.nord_underline = 1

      vim.cmd([[colorscheme nord]])
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
    -- improved status and tablines
    "vim-airline/vim-airline",
    init = function()
      vim.g.airline_powerline_fonts = 1
      vim.g.airline_skip_empty_sections = 1
      vim.g["airline#extensions#branch#displayed_head_limit"] = 25 -- truncate branch name
      vim.g["airline#extensions#branch#format"] = 1 -- only show last branch segment (/)
      vim.g["airline#extensions#branch#vcs_checks"] = {} -- hide dirty/untracked symbol
      vim.g["airline#extensions#gutentags#enabled"] = 0 -- hide async status
      vim.g["airline#extensions#hunks#enabled"] = 0 -- hide +/- git change counts
      vim.g["airline#extensions#tabline#enabled"] = 1 -- enable buffer tabline
      vim.g["airline#extensions#tabline#formatter"] = "unique_tail_improved" -- disambiguate file names
      vim.g["airline#extensions#tagbar#enabled"] = 0 -- disable slow extension
      vim.g["airline#parts#ffenc#skip_expected_string"] = "utf-8[unix]" -- hide encoding for utf-8
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
  "RRethy/vim-illuminate", -- cursor symbol highlight
  "norcalli/nvim-colorizer.lua", -- highlight hex colors
}
