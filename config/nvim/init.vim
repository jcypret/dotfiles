set encoding=utf-8
scriptencoding utf-8

" Python hosts
let g:python_host_prog = '$HOME/.asdf/shims/python2'
let g:python3_host_prog = '$HOME/.asdf/shims/python3'

" Load plugins
source ~/.config/nvim/plugins.vim
runtime! macros/matchit.vim

" Leader
let g:mapleader = ' '

set autowrite      " save before running commands (useful for TDD)
set cmdheight=2    " extra room at bottom for messages
set cursorline     " highlight the current line
set hidden         " allow hiding unsaved buffers
set linebreak      " prevent soft-wrapping inside of word
set nojoinspaces   " when joining lines, collapse to a single space
set noshowcmd      " don't show partial commands in status bar
set noshowmode     " redundant to status line mode
set regexpengine=1 " use legacy syntax parsing for ruby
set shortmess+=c   " hide completion menu messages
set signcolumn=yes " always show signcolumns
set splitbelow     " open new horizontal splits below
set splitright     " open new vertical splits to the right
set wildmenu       " enable tab-completions for vim commands

" turn off automatic hard-wrapping
set formatoptions-=t

" Display whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Highlight embedded Lua scripts
let g:vimsyn_embed= 'l'

" Match longest first, then next full match
set wildmode=list:longest,full

" Reload vimrc
nnoremap <leader>rr :source ~/.config/nvim/init.vim<cr>

" VIM SETTINGS =================================================================

" Buffers
"
" create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>bn :enew<cr>
" close current buffer
nnoremap <leader>bd :bp <bar> bd! #<cr>
" close all open buffers
nnoremap <leader>bD :bufdo bd!<cr>

" Clipboard
vnoremap <c-c> "+y
inoremap <c-v> <esc>"+pa
" put same yank repeatedly
vnoremap P "0p

" Code Folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99 " prevent collapse on initial fold

" Diffing
nnoremap <leader>dd :term git diff<cr>i
nnoremap <leader>dh :term git diff HEAD<cr>i
nnoremap <leader>ds :term git diff --staged --ignore-all-space<cr>i

" File Navigation
" Switch between the last two files
nnoremap <leader><leader> <c-^>
" Edit another file in the same directory as the current file
nnoremap <leader>e :e <c-r>=escape(expand('%:p:h'),' ') . '/'<cr>
nnoremap <leader>s :split <c-r>=escape(expand('%:p:h'), ' ') . '/'<cr>
nnoremap <leader>v :vnew <c-r>=escape(expand('%:p:h'), ' ') . '/'<cr>

" Indention
set tabstop=2    " indent 2 spaces
set shiftwidth=2 " indent 2 spaces when using >>
set shiftround   " snap to increments of 2
set expandtab    " use soft tabs

" Line Numbers
set relativenumber
set number
set numberwidth=5

" Line Width
set textwidth=80           " Set column width
set colorcolumn=+1         " highlight 81st column
set breakindent            " wrap lines in editor if too wide for screen
set breakindentopt=shift:2 " indent wrapped line

" Movements
"
" Jump to beginning of line after whitespace
nnoremap 0 g^
nnoremap $ g$
" Move between panels
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" Move vertically through wrapped text
nnoremap j gj
nnoremap k gk

" Search /
set ignorecase       " case-insensitive when lowercase
set smartcase        " case-sensitive when uppercase
set inccommand=split " live preview for find/replace

" Clear highlight from search results
nnoremap <silent> <leader>/
  \ :nohlsearch<c-r>=has('diff')?'<bar>diffupdate':''<cr><cr><c-l>

" Tab Navigation
nnoremap T :tabnew<cr>
nnoremap <silent> [t :tabprevious<cr>
nnoremap <silent> ]t :tabnext<cr>
nnoremap <silent> [T :tabrewind<cr>
nnoremap <silent> ]T :tablast<cr>

" THEME ========================================================================
set termguicolors

" Nord Theme (dark)
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
colorscheme nord

" Pencil Theme (writing)
" colorscheme pencil
" set background=light

let s:currentTheme = 'nord'
function! ThemeToggle()
  if (s:currentTheme ==? 'nord')
    let s:currentTheme = 'pencil'
    set background=light
    colorscheme pencil
  else
    let s:currentTheme = 'nord'
    set background=dark
    colorscheme nord
  endif
endfunction

nnoremap <silent> <leader>w :call ThemeToggle()<cr>

" LSP + COMPLETION =============================================================

lua require("lsp")
lua require("treesitter")
lua require("completion")

" LANGUAGE SETTINGS ============================================================

" HTML
let g:html_indent_tags = 'li\|p'

" Python
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

" Ruby
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_heredoc_syntax_filetypes = {
  \ 'pgsql': {'start': 'SQL'},
  \ 'ruby': {'start': 'RUBY'},
  \ 'xml': {'start': 'XML'},
  \ 'yaml': {'start': 'YAML'},
  \ }

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
let g:AutoPairsMultilineClose = 0

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
let g:grepper.tools = ['git', 'rg', 'grep']

" Indent Blankline
let g:indent_blankline_char = '▏'
let g:indent_blankline_filetype_exclude = ['', 'nerdtree', 'startify', 'tagbar']
let g:indent_blankline_buftype_exclude = ['help']
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_use_treesitter = v:true

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
let g:NERDTreeIgnore = ['__pycache__', '\.egg-info$[[dir]]']
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
nnoremap <leader>; <cmd>Telescope buffers<cr>
nnoremap <c-p> <cmd>Telescope find_files hidden=true<cr>
highlight link TelescopeMatching Keyword

" Vim Test
nnoremap <silent> <leader>t :TestNearest<cr>
nnoremap <silent> <leader>T :TestFile<cr>
nnoremap <silent> <leader>S :TestSuite<cr>
nnoremap <silent> <leader>l :TestLast<cr>
nnoremap <silent> <leader>L :TestVisit<cr>
let g:test#strategy = 'neovim'
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
  autocmd BufRead,BufNewFile .env.* set filetype=sh
  autocmd BufRead,BufNewFile .{babel,eslint,jscs,jshint}rc set filetype=json
  autocmd BufRead,BufNewFile Procfile* set filetype=yaml
  autocmd BufRead,BufNewFile {Appraisals,*Brewfile} set filetype=ruby

  " Set file-type specific settings
  autocmd FileType cpp,vue setlocal commentstring=//\ %s " Set comment style to // for cpp and vue
  autocmd FileType crystal nnoremap <buffer> <silent> <leader>f :CrystalFormat<cr>
  autocmd FileType css,scss setlocal iskeyword+=- " Fix CSS highlighting for keywords
  autocmd FileType gitcommit call pencil#init({'wrap': 'hard', 'textwidth': 72}) | setlocal nonumber norelativenumber spell
  autocmd FileType html,eruby EmmetInstall
  autocmd FileType lisp,clojure,scheme RainbowToggleOn " Use rainbow parens for lisp-based languages
  autocmd FileType markdown let b:tagbar_ignore = 1 | call pencil#init() | setlocal nobreakindent spell
  autocmd FileType nerdtree setlocal nolist " hide invisible chars in nerdtree panel
  autocmd TermOpen * setlocal nonumber norelativenumber " turn off line numbers for terminal

  " fix weird highlighting for mixed syntax
  autocmd BufEnter *.{js,jsx,ts,tsx,vue} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx,vue} :syntax sync clear
augroup END

" Local config
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif
