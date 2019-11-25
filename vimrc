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

"create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>bn :enew<cr>
"close current buffer
nnoremap <leader>bd :bp <bar> bd! #<cr>
"close all open buffers
nnoremap <leader>ba :bufdo bd!<cr>
"Tab to switch to next open buffer
nnoremap <Tab> :bnext<cr>
"Shift + Tab to switch to previous open buffer
nnoremap <S-Tab> :bprevious<cr>

" Clipboard
vnoremap <C-c> "+y
inoremap <C-v> <ESC>"+pa

" Code Folding
set foldlevelstart=99 " prevent collapse on initial fold
let g:ruby_fold = 1

" Diffing
nmap <Leader>dd :term git diff<cr>i
nmap <Leader>dh :term git diff HEAD<cr>i
nmap <Leader>ds :term git diff --staged --ignore-all-space<cr>i

" File Navigation
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

" replace the word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

" Clear highlight from search results
nnoremap <silent> <Leader>/
      \ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Tab Navigation
nnoremap T :tabnew<CR>
nnoremap H gT
nnoremap L gt

" THEME ========================================================================
set termguicolors

" Nord Theme (dark)
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_uniform_status_lines = 1
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
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_highlighting_cache = 1

" Ale
let g:ale_lint_on_enter = 0
let g:ale_linters_explicit = 1
let g:ale_sign_error = '=>'
let g:ale_sign_warning = '->'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'cpp': ['clang-format'],
  \ 'css': ['stylelint'],
  \ 'elixir': ['mix_format'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'ruby': ['standardrb'],
  \ 'rust': ['rustfmt'],
  \ 'scss': ['stylelint'],
  \ 'typescript': ['eslint'],
  \ 'vue': ['eslint'],
  \ }
let g:ale_linters = {
  \ 'cpp': ['gcc', 'clang-format', 'cppcheck', 'cpplint'],
  \ 'css': ['stylelint'],
  \ 'javascript': ['eslint'],
  \ 'markdown': ['write-good'],
  \ 'ruby': ['ruby', 'solargraph', 'standardrb'],
  \ 'scss': ['stylelint'],
  \ 'typescript': ['eslint', 'tsserver'],
  \ 'vim': ['vint'],
  \ 'vue': ['eslint', 'vls'],
  \ }
let g:ale_c_clangformat_options = '-style=google'
let g:ale_cpp_cpplint_options = '--linelength=120' .
  \ '--filter=-runtime/references,-legal/copyright,-build/namespaces'
let g:ale_ruby_rubocop_executable = 'bundle'

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

" goyo (writing mode)
nnoremap <Leader>W :Goyo<CR>

function! s:goyo_enter()
  set background=light
  colorscheme pencil
  IndentLinesDisable
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
  endif
  set noshowmode
  set nocursorline
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
  set showmode
  set cursorline
  call deoplete#enable()
endfunction

" fzf
nnoremap <C-p> :Files<CR>
nmap <Leader>; :Buffers<CR>
nnoremap \ :Rg<space>

" Indent Line
let g:indentLine_char = '⎸'
let g:indentLine_concealcursor = 0
let g:indentLine_defaultGroup = 'Whitespace'
let g:indentLine_fileTypeExclude = ['startify', 'help']

" NERDTree
let g:NERDTreeUpdateOnCursorHold = 0
let g:NERDTreeWinPos = 'right'

" Rainbow Parentheses Improved
let g:rainbow_active = 0

" Startify
let g:startify_change_to_vcs_root = 1

" Tagbar
nmap <C-t> :TagbarToggle<CR>
let g:tagbar_left = 1

" Vim EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Vim Gitgutter
set updatetime=100
let g:gitgutter_grep = 'rg --color=never'

" Vim Markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_override_foldtext = 0

" Vim Test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let g:test#strategy = 'neovim'
" Use ctr-o to leave test output on screen
tmap <C-o> <C-\><C-n>

" Vim Titlecase
let g:titlecase_map_keys = 0
nmap <leader>gt <Plug>Titlecase
nmap <leader>gT <Plug>TitlecaseLine

" Vim Polyglot
let g:polyglot_disabled = [
  \ 'css',
  \ 'html',
  \ 'javascript',
  \ 'ruby',
  \ 'typescript',
  \ 'vue'
  \ ]

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " writing mode
  autocmd User GoyoEnter nested call <SID>goyo_enter()
  autocmd User GoyoLeave nested call <SID>goyo_leave()

  " hide invisible chars in nerdtree panel
  autocmd FileType nerdtree setlocal nolist
  autocmd FileType vue syntax sync fromstart

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile {Appraisals,*Brewfile} set filetype=ruby

  " turn off line numbers for terminal
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd FileType gitcommit setlocal nonumber norelativenumber

  " Markdown formatting
  autocmd FileType markdown setlocal nobreakindent spell ts=4 sw=4 tw=0

  " Set comment style to // for cpp and vue
  autocmd FileType cpp,vue setlocal commentstring=//\ %s

  " Use rainbow parens for lisp-based languages
  autocmd FileType lisp,clojure,scheme RainbowToggleOn

  " remove status line background for fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

  " set ruby linters based on project config
  autocmd FileType ruby call SetAleRubyBufferLinters()
augroup END

" Local config
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif
