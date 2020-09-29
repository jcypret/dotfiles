set encoding=utf-8
scriptencoding utf-8

" Load plugins
source ~/.vimrc.bundles
runtime! macros/matchit.vim

" Leader
let g:mapleader = ' '

set autowrite      " save before running commands (useful for TDD)
set cmdheight=2    " extra room at bottom for messages
set cursorline     " highlight the current line
set hidden         " allow hiding unsaved buffers
set linebreak      " prevent soft-wrapping inside of word
set nojoinspaces   " when joining lines, collaps to a single space
set noshowcmd      " don't show partial commands in status bar
set regexpengine=1 " use legacy syntax parsing for ruby
set signcolumn=yes " always show signcolumns
set splitbelow     " open new horizontal splits below
set splitright     " open new vertical splits to the right
set wildmenu       " enable tab-completions for vim commands

" turn off automatic hard-wrapping
set formatoptions-=t

" Display whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Match longest first, then next full match
set wildmode=list:longest,full

" Reload vimrc
nnoremap <leader>rr :source ~/.vimrc<cr>

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

" Code Folding
set foldmethod=syntax
set foldlevelstart=99 " prevent collapse on initial fold
let g:ruby_fold = 1

" Diffing
nnoremap <leader>dd :term git diff<cr>i
nnoremap <leader>dh :term git diff HEAD<cr>i
nnoremap <leader>ds :term git diff --staged --ignore-all-space<cr>i

" File Navigation
let g:NERDTreeWinSize = 45
noremap <c-n> :NERDTreeToggle<cr>
noremap <leader>n :NERDTreeFind<cr>
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

" LANGUAGE SETTINGS ============================================================

" HTML
let g:html_indent_tags = 'li\|p'

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
let g:airline#extensions#branch#displayed_head_limit = 25
let g:airline#extensions#gutentags#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline_powerline_fonts = 1

" Ale
let g:ale_lint_on_enter = 0
let g:ale_linters_explicit = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'cpp': ['clang-format'],
  \ 'css': ['prettier'],
  \ 'elixir': ['mix_format'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'json': ['prettier'],
  \ 'markdown': ['prettier'],
  \ 'ruby': ['standardrb'],
  \ 'rust': ['rustfmt'],
  \ 'scss': ['prettier'],
  \ 'typescript': ['prettier', 'eslint', 'tslint'],
  \ 'vue': ['prettier', 'eslint'],
  \ 'yaml': ['prettier']
  \ }
let g:ale_linters = {
  \ 'cpp': ['gcc', 'clang-format', 'cppcheck', 'cpplint'],
  \ 'crystal': ['ameba'],
  \ 'javascript': ['eslint'],
  \ 'markdown': ['write-good'],
  \ 'ruby': ['ruby', 'standardrb', 'reek', 'sorbet'],
  \ 'typescript': ['eslint', 'tslint'],
  \ 'vim': ['vint'],
  \ 'vue': ['eslint'],
  \ }
let g:ale_c_clangformat_options = '-style=google'
let g:ale_cpp_cpplint_options = '--linelength=120' .
  \ '--filter=-runtime/references,-legal/copyright,-build/namespaces'
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_languagetool_options = '--language en-US --disable ARROWS,EN_QUOTES'

nnoremap <leader>f :ALEFix<cr>
nnoremap <silent> K :ALEHover<cr>
nnoremap <silent> gd :ALEGoToDefinition<cr>

function! SetAleRubyBufferLinters()
  if filereadable('.rubocop.yml')
    let ruby_linters = g:ale_linters['ruby']
    call filter(ruby_linters, {idx, val -> val != 'standardrb'})
    call add(ruby_linters, 'rubocop')

    let b:ale_linters = {'ruby': ruby_linters}
    let b:ale_fixers = {'ruby': ['rubocop']}
  endif
endfunction

" Auto Pairs
let g:AutoPairsMultilineClose = 0

" Clap
let g:clap_search_box_border_style = 'nil' " disable rounded edges
let g:clap_selected_sign = {'text': '=>'}
let g:clap_current_selection_sign = {'text': '->'}

" leader variants for filtering by glob
nnoremap <leader>; :Clap buffers<cr>
nnoremap <c-p> :Clap files<cr>
nnoremap <leader>p :Clap files<space>
nnoremap <bar> :Clap grep ++query=<cword><cr>
nnoremap <leader><bar> :Clap grep ++query=<cword><space>
nnoremap \ :Clap grep<cr>
nnoremap <leader>\ :Clap grep<space>

" Deoplete
let g:deoplete#enable_at_startup = 1

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Fugitive
nnoremap <silent> <leader>gs :Git<cr>:20wincmd_<cr>
nnoremap <silent> <leader>gc :Git commit<cr>
nnoremap <silent> <leader>gp :Git push<cr>
nnoremap <silent> <leader>gl :GV<cr>

" Gitgutter
set updatetime=100
let g:gitgutter_grep = 'rg --color=never'

" Indent Line
let g:indentLine_char = '▏'
let g:indentLine_concealcursor = 0
let g:indentLine_defaultGroup = 'Whitespace'
let g:indentLine_fileTypeExclude = ['startify', 'help']

" Vim JSON
let g:vim_json_syntax_conceal = 0

" Vim JSX Pretty
let g:vim_jsx_pretty_disable_tsx = 1 " handled by peitalin/vim-jsx-typescript

" LanguageClient
let g:LanguageClient_settingsPath = expand('~/.vim/settings.json')
let g:LanguageClient_useVirtualText = 'No'
let g:LanguageClient_diagnosticsDisplay = {
  \ 1: {'name': 'Error', 'texthl': 'ALEError', 'signText': '', 'signTexthl': 'ALEErrorSign', 'virtualTexthl': 'Error'},
  \ 2: {'name': 'Warning', 'texthl': 'ALEWarning', 'signText': '', 'signTexthl': 'ALEWarningSign', 'virtualTexthl': 'Todo'},
  \ 3: {'name': 'Information', 'texthl': 'ALEInfo', 'signText': '', 'signTexthl': 'ALEInfoSign', 'virtualTexthl': 'Todo'},
  \ 4: {'name': 'Hint', 'texthl': 'ALEInfo', 'signText': '', 'signTexthl': 'ALEInfoSign', 'virtualTexthl': 'Todo'},
  \ }
let g:LanguageClient_serverCommands = {
  \ 'cpp': ['cquery'],
  \ 'crystal': ['scry'],
  \ 'javascript': ['typescript-language-server', '--stdio'],
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ 'ruby': ['solargraph', 'stdio'],
  \ 'vue': ['vls'],
  \ }

function! ConfigureLanguageClient()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<cr>
    nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<cr>
  endif
endfunction

" Vim Markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_override_foldtext = 0

" NERDTree
let g:NERDTreeUpdateOnCursorHold = 0

" Rainbow Parentheses Improved
let g:rainbow_active = 0

" Startify
let g:startify_change_to_vcs_root = 1

" Splitjoin
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

" Tagbar
nnoremap <c-t> :TagbarToggle<cr>

" Vim Test
nnoremap <silent> <leader>t :TestNearest<cr>
nnoremap <silent> <leader>T :TestFile<cr>
nnoremap <silent> <leader>a :TestSuite<cr>
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
  autocmd BufRead,BufNewFile *.tsx,*.jsx set filetype=typescript.tsx
  autocmd BufRead,BufNewFile .env.* set filetype=sh
  autocmd BufRead,BufNewFile .{babel,eslint,jscs,jshint}rc set filetype=json
  autocmd BufRead,BufNewFile Procfile* set filetype=yaml
  autocmd BufRead,BufNewFile {Appraisals,*Brewfile} set filetype=ruby

  " Set file-type specific settings
  autocmd FileType * call ConfigureLanguageClient() " set LanguageClient config for enabled filetypes
  autocmd FileType cpp,vue setlocal commentstring=//\ %s " Set comment style to // for cpp and vue
  autocmd FileType crystal nnoremap <buffer> <silent> <leader>f :CrystalFormat<cr>
  autocmd FileType css,scss setlocal iskeyword+=- " Fix CSS highlighting for keywords
  autocmd FileType gitcommit call pencil#init({'wrap': 'hard', 'textwidth': 72}) | setlocal nonumber norelativenumber spell
  autocmd FileType lisp,clojure,scheme RainbowToggleOn " Use rainbow parens for lisp-based languages
  autocmd FileType markdown let b:tagbar_ignore = 1 | call pencil#init() | setlocal nobreakindent spell
  autocmd FileType nerdtree setlocal nolist " hide invisible chars in nerdtree panel
  autocmd FileType ruby call SetAleRubyBufferLinters() " set ruby linters based on project config
  autocmd FileType yaml,eruby.yaml setlocal foldmethod=expr
  autocmd TermOpen * setlocal nonumber norelativenumber " turn off line numbers for terminal

  " fix weird highlighting for mixed syntax
  autocmd BufEnter *.{js,jsx,ts,tsx,vue} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx,vue} :syntax sync clear
augroup END

" Local config
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif
