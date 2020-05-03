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
nmap <Leader>rr :source ~/.vimrc<cr>

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
vnoremap <C-c> "+y
inoremap <C-v> <ESC>"+pa

" Code Folding
set foldmethod=syntax
set foldlevelstart=99 " prevent collapse on initial fold
let g:ruby_fold = 1

" Diffing
nmap <Leader>dd :term git diff<cr>i
nmap <Leader>dh :term git diff HEAD<cr>i
nmap <Leader>ds :term git diff --staged --ignore-all-space<cr>i

" File Navigation
let g:NERDTreeWinSize = 45
map <C-n> :NERDTreeToggle<CR>
map <Leader>n :NERDTreeFind<CR>
" Switch between the last two files
nnoremap <leader><leader> <c-^>
" Edit another file in the same directory as the current file
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

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
nmap 0 g^
nmap $ g$
" Move between panels
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Move vertically through wrapped text
nmap j gj
nmap k gk

" Search /
set ignorecase       " case-insensitive when lowercase
set smartcase        " case-sensitive when uppercase
set inccommand=split " live preview for find/replace

" Clear highlight from search results
nnoremap <silent> <Leader>/
      \ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Tab Navigation
nnoremap T :tabnew<CR>
nmap <silent> [t :tabprevious<CR>
nmap <silent> ]t :tabnext<CR>
nmap <silent> [T :tabrewind<CR>
nmap <silent> ]T :tablast<CR>

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

" LANGUAGE SETTINGS ============================================================

" HTML
let g:html_indent_tags = 'li\|p'

" Ruby
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_heredoc_syntax_filetypes = {
  \ 'pgsql' : { 'start' : 'SQL' },
  \ 'xml' : { 'start' : 'XML' },
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
  \ 'markdown': ['languagetool', 'write-good'],
  \ 'ruby': ['ruby', 'standardrb'],
  \ 'typescript': ['eslint', 'tslint'],
  \ 'vim': ['vint'],
  \ 'vue': ['eslint'],
  \ }
let g:ale_c_clangformat_options = '-style=google'
let g:ale_cpp_cpplint_options = '--linelength=120' .
  \ '--filter=-runtime/references,-legal/copyright,-build/namespaces'
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_languagetool_options = '--language en-US --disable ARROWS,EN_QUOTES'

nmap <Leader>f :ALEFix<CR>
nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>

function! SetAleRubyBufferLinters()
  if filereadable('.rubocop.yml')
    let ruby_linters = g:ale_linters['ruby']
    call filter(ruby_linters, {idx, val -> val != 'standardrb'})
    call add(ruby_linters, 'rubocop')

    let b:ale_linters = { 'ruby': ruby_linters }
    let b:ale_fixers = { 'ruby': ['rubocop'] }
  endif
endfunction

" Auto Pairs
let g:AutoPairsMultilineClose = 0

" Deoplete
let g:deoplete#enable_at_startup = 1

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Gitgutter
set updatetime=100
let g:gitgutter_grep = 'rg --color=never'

" Goyo (writing mode)
nnoremap <Leader>W :Goyo<CR>

function! s:goyo_enter()
  set background=light
  colorscheme pencil
  IndentLinesDisable
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
  endif
  set nocursorline
  set noshowmode
  call deoplete#disable()
  highlight link ALEErrorSign Error
  highlight link ALEWarningSign Todo
  highlight link ALEError SpellBad
  highlight link ALEWarning SpellCap
endfunction

function! s:goyo_leave()
  set background=dark
  colorscheme nord
  IndentLinesEnable
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
  endif
  set cursorline
  set showmode
  call deoplete#enable()
endfunction

" fzf
nnoremap <C-p> :Files<CR>
nmap <Leader>; :Buffers<CR>
let g:fzf_preview_window = ''

" Indent Line
let g:indentLine_char = '▏'
let g:indentLine_concealcursor = 0
let g:indentLine_defaultGroup = 'Whitespace'
let g:indentLine_fileTypeExclude = ['startify', 'help', 'fzf']

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

function! s:language_client_config()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
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

" Vim Ripgrep
nnoremap \ :Rg<space>
nnoremap <bar> :Rg -F <cword><space>
let g:rg_command = 'rg --vimgrep -S'
let g:rg_highlight = 1

" Startify
let g:startify_change_to_vcs_root = 1

" Splitjoin
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

" Tagbar
nmap <C-t> :TagbarToggle<CR>

" Vim Test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let g:test#strategy = 'neovim'
" Use ctr-o to leave test output on screen
tmap <C-o> <C-\><C-n>

augroup vimrcEx
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
  autocmd BufRead,BufNewFile {Appraisals,*Brewfile} set filetype=ruby

  " Set file-type specific settings
  autocmd FileType * call s:language_client_config() " set LanguageClient config for enabled filetypes
  autocmd FileType cpp,vue setlocal commentstring=//\ %s " Set comment style to // for cpp and vue
  autocmd FileType crystal nnoremap <buffer> <silent> <leader>f :CrystalFormat<cr>
  autocmd FileType css,scss setlocal iskeyword+=- " Fix CSS highlighting for keywords
  autocmd FileType fzf set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 showmode ruler
  autocmd FileType gitcommit setlocal nonumber norelativenumber
  autocmd FileType lisp,clojure,scheme RainbowToggleOn " Use rainbow parens for lisp-based languages
  autocmd FileType markdown setlocal nobreakindent spell ts=4 sw=4 tw=0 | let b:tagbar_ignore = 1
  autocmd FileType nerdtree setlocal nolist " hide invisible chars in nerdtree panel
  autocmd FileType ruby call SetAleRubyBufferLinters() " set ruby linters based on project config
  autocmd FileType yaml,eruby.yaml setlocal foldmethod=expr
  autocmd TermOpen * setlocal nonumber norelativenumber " turn off line numbers for terminal

  " writing mode
  autocmd User GoyoEnter nested call <SID>goyo_enter()
  autocmd User GoyoLeave nested call <SID>goyo_leave()

  " fix weird highlighting for mixed syntax
  autocmd BufEnter *.{js,jsx,ts,tsx,vue} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx,vue} :syntax sync clear
augroup END

" Local config
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif
