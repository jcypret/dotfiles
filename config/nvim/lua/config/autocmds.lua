local autocmd = vim.api.nvim_create_autocmd

-- When editing a file, always jump to the last known cursor position
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if
      vim.bo.filetype ~= "gitcommit"
      and vim.fn.line("'\"") > 0
      and vim.fn.line("'\"") <= vim.fn.line("$")
    then
      vim.api.nvim_exec('normal g`"', false)
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
    vim.diagnostic.disable(0)
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
    client.server_capabilities.semanticTokensProvider = nil
  end,
})
