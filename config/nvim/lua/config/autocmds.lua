local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- When editing a file, always jump to the last known cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if
      vim.tbl_contains(exclude, vim.bo[buf].filetype)
      or vim.b[buf].lazyvim_last_loc
    then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Set syntax highlighting for specific file types
autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.tsx", "*.jsx" },
  command = "set filetype=typescriptreact",
})
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*gitconfig*",
  command = "set filetype=gitconfig",
})
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = ".env*",
  callback = function()
    vim.diagnostic.enable(false)
  end,
})
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = ".env.*",
  command = "set filetype=sh",
})
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = ".{babel,eslint,jscs,jshint}rc",
  command = "set filetype=json",
})
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Procfile*",
  command = "set filetype=yaml",
})
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "devcontainer.json",
  command = "set filetype=jsonc",
})
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "{Appraisals,*Brewfile}",
  command = "set filetype=ruby",
})

-- Set file-type specific settings
autocmd("FileType", {
  pattern = "cpp,vue",
  callback = function()
    vim.bo.commentstring = "// %s" -- Set comment style to // for cpp and vue
  end,
})
autocmd("FileType", {
  pattern = "css,scss",
  callback = function()
    vim.bo.iskeyword = vim.bo.iskeyword .. ",-"
  end,
})
autocmd("FileType", {
  pattern = "csv",
  callback = function()
    vim.opt_local.wrap = false
  end,
})
autocmd("FileType", {
  pattern = "grug-far",
  callback = function()
    vim.defer_fn(function()
      vim.wo.colorcolumn = ""
      vim.wo.cursorline = false
    end, 10) -- 10ms delay
  end,
})
autocmd("FileType", {
  pattern = "html,eruby",
  command = "EmmetInstall",
})
autocmd("FileType", {
  pattern = "lisp,clojure,scheme",
  command = "RainbowToggleOn",
})
autocmd("FileType", {
  pattern = "nerdtree",
  callback = function()
    vim.wo.list = false
  end,
})
autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})

-- Fix weird highlighting for mixed syntax
autocmd("BufEnter", {
  pattern = "*.{js,jsx,ts,tsx,vue}",
  command = "syntax sync fromstart",
})
autocmd("BufLeave", {
  pattern = "*.{js,jsx,ts,tsx,vue}",
  command = "syntax sync clear",
})
autocmd("BufEnter", {
  pattern = "*.{md,mdx}",
  callback = function()
    vim.bo.shiftwidth = 2
  end,
})

-- Disable semantic tokens (for now)
autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ timeout = 300 })
  end,
})
