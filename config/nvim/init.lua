-- load plugins
vim.cmd([[
source ~/.config/nvim/plugins.vim
]])

require("config.keymaps")
require("config.languages")
require("config.options")
require("config.theme")

require("config.completion")
require("config.lsp")
require("config.treesitter")

vim.cmd([[

" PLUGIN SETTINGS ==============================================================

" Airline
let g:airline#extensions#branch#displayed_head_limit = 25 " truncate branch name
let g:airline#extensions#branch#format = 1 " only show last branch segment (/)
let g:airline#extensions#branch#vcs_checks = [] " hide dirty/untracked symbol
let g:airline#extensions#gutentags#enabled = 0 " hide async status
let g:airline#extensions#hunks#enabled = 0 " hide +/- git change counts
let g:airline#extensions#tabline#enabled = 1 " enable buffer tabline
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " disambiguate file names
let g:airline#extensions#tagbar#enabled = 0 " disable slow extension
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' " hide encoding for utf-8
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" simplify page location to `l:c`
call airline#parts#define_raw('linenr', '%l')
call airline#parts#define_accent('linenr', 'bold')
let g:airline_section_z = airline#section#create(['linenr', ':%c'])

" Auto Pairs
lua require('mini.pairs').setup()

" EasyAlign
xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

" Vim-Emmet
let g:user_emmet_install_global = 0 " don't enable for all buffers

" Fugitive
nnoremap <silent> <leader>gs :Git<cr>:20wincmd_<cr>
nnoremap <silent> <leader>gc :Git commit<cr>
nnoremap <silent> <leader>gp :Git push<cr>
nnoremap <silent> <leader>gl :GV<cr>

" Gitsigns
lua require('gitsigns').setup()

" Grepper
nnoremap \ :Grepper<cr>
nnoremap <bar> :Grepper -cword -noprompt<cr>
nmap g\ <plug>(GrepperOperator)
xmap g\ <plug>(GrepperOperator)
runtime plugin/grepper.vim " load default values
let g:grepper.highlight = 1
let g:grepper.prompt_quote = 1
let g:grepper.prompt_text = '$t> '
let g:grepper.tools = ['rg', 'git', 'grep']

" Indent Blankline
lua require("config.indent_blankline")

" Vim JSON
let g:vim_json_syntax_conceal = 0

" Vim JSX Pretty
let g:vim_jsx_pretty_disable_tsx = 1 " handled by peitalin/vim-jsx-typescript

" Vim Markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_override_foldtext = 0

" NERDTree
let g:NERDTreeUpdateOnCursorHold = 0
noremap <c-n> :NERDTreeToggle<cr>
noremap <leader>n :NERDTreeFind<cr>

" Rainbow Parentheses Improved
let g:rainbow_active = 0

" Startify
let g:startify_change_to_vcs_root = 1

" Splitjoin
let g:splitjoin_python_brackets_on_separate_lines = 1
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_trailing_comma = 1

" Tagbar
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_sort = 0
nnoremap <c-t> :TagbarToggle<cr>
highlight TagbarAccessPublic guifg=#A3BE8C
highlight TagbarAccessProtected guifg=#EBCB8B
highlight TagbarAccessPrivate guifg=#BF616A

" Telescope
lua require("config.telescope")
nnoremap <leader>; <cmd>Telescope buffers<cr>
nnoremap <c-p> <cmd>Telescope find_files hidden=true<cr>
highlight link TelescopeMatching Keyword

" Vim Test
let g:root_markers = ['package.json', '.git/']
let g:test#strategy = 'neovim'
let g:test#javascript#runner = 'jest'
let test#javascript#jest#executable = 'pnpm test -- '

" WTF
lua require("wtf").setup()

function! s:RunVimTest(cmd)
  for marker in g:root_markers
    let marker_file = findfile(marker, expand('%:p:h') . ';')
    if strlen(marker_file) > 0
      let g:test#project_root = fnamemodify(marker_file, ':p:h')
      break
    endif
    let marker_dir = finddir(marker, expand('%:p:h') . ';')
    if strlen(marker_dir) > 0
      let g:test#project_root = fnamemodify(marker_dir, ':p:h')
      break
    endif
  endfor
  execute a:cmd
endfunction

nnoremap <silent> <leader>t :call <SID>RunVimTest('TestNearest')<cr>
nnoremap <silent> <leader>T :call <SID>RunVimTest('TestFile')<cr>
nnoremap <silent> <leader>S :call <SID>RunVimTest('TestSuite')<cr>
nnoremap <silent> <leader>l :call <SID>RunVimTest('TestLast')<cr>
nnoremap <silent> <leader>L :call <SID>RunVimTest('TestVisit')<cr>
" Use ctr-o to leave test output on screen
tnoremap <c-o> <c-\><c-n>

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
