local autocmd = vim.api.nvim_create_autocmd

vim.cmd([[
augroup vimrc
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
  autocmd BufRead,BufNewFile *gitconfig* set filetype=gitconfig
  autocmd BufRead,BufNewFile .env* lua vim.diagnostic.disable()
  autocmd BufRead,BufNewFile .env.* set filetype=sh
  autocmd BufRead,BufNewFile .{babel,eslint,jscs,jshint}rc set filetype=json
  autocmd BufRead,BufNewFile Procfile* set filetype=yaml
  autocmd BufRead,BufNewFile devcontainer.json set filetype=jsonc
  autocmd BufRead,BufNewFile {Appraisals,*Brewfile} set filetype=ruby

  " Set file-type specific settings
  autocmd FileType cpp,vue setlocal commentstring=//\ %s " Set comment style to // for cpp and vue
  autocmd FileType crystal nnoremap <buffer> <silent> <leader>f :CrystalFormat<cr>
  autocmd FileType css,scss setlocal iskeyword+=- " Fix CSS highlighting for keywords
  autocmd FileType html,eruby EmmetInstall
  autocmd FileType lisp,clojure,scheme RainbowToggleOn " Use rainbow parens for lisp-based languages
  autocmd FileType nerdtree setlocal nolist " hide invisible chars in nerdtree panel
  autocmd TermOpen * setlocal nonumber norelativenumber " turn off line numbers for terminal

  " fix weird highlighting for mixed syntax
  autocmd BufEnter *.{js,jsx,ts,tsx,vue} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx,vue} :syntax sync clear
  autocmd BufEnter *.{md,mdx} :set shiftwidth=2
augroup END
]])
