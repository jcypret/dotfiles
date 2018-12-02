set encoding=utf-8
scriptencoding utf-8

" Load plugins
source ~/.vimrc.bundles
runtime! macros/matchit.vim

" Leader
let g:mapleader = ' '

set autowrite      " save before running commands (useful for TDD)
set cursorline     " highlight the current line
set nojoinspaces   " when joining lines, collaps to a single space
set noshowcmd      " don't show partial commands in status bar
set regexpengine=1 " use legacy syntax parsing for ruby
set wildmenu       " enable tab-completions for vim commands

" Display whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Match longest first, then next full match
set wildmode=list:longest,full

" Redraw window
nnoremap <leader>re :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" Reload vimrc
nmap <Leader>rr :source ~/.vimrc<cr>

" Switch to normal mode
imap jj <esc>

" VIM SETTINGS =================================================================

" Clipboard
vnoremap <C-c> "+y
inoremap <C-v> <ESC>"+pa

" Code folding
set foldlevelstart=99 " prevent collapse on initial fold
let g:ruby_fold = 1

" File navigation
nmap ff :Explore<CR>
map <C-n> :NERDTreeToggle<CR>
map <Leader>n :NERDTreeFind<CR>
" Switch between the last two files
nnoremap <leader><leader> <c-^>
" Edit another file in the same directory as the current file
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" Git diff
nmap <Leader>dd :term git diff<cr>i
nmap <Leader>dh :term git diff HEAD<cr>i
nmap <Leader>ds :term git diff --staged<cr>i

" Indention
set tabstop=2 " indent 2 spaces
set shiftwidth=2 " indent 2 spaces when using >>
set shiftround " snap to increments of 2
set expandtab " use soft tabs

" Line numbers
set relativenumber
set number
set numberwidth=5

" Line width
set textwidth=80 " Set column width
set colorcolumn=+1 " highlight 81st column
set breakindent " wrap lines in editor if too wide for screen
set breakindentopt=shift:2 " indent wrapped line

" Movements
" Move vertically through wrapped text
nmap j gj
nmap k gk
" Jump to beginning of line after whitespace
nmap 0 ^
" Move between panels
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Search /
set ignorecase " case-insensitive when lowercase
set smartcase " case-sensitive when uppercase
set inccommand=split " live preview for find/replace
" Clear highlight from search results
nnoremap <silent> <Leader>/ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Split screen
set splitbelow
set splitright

" Tab navigation
nnoremap <C-t> :tabnew<CR>
nnoremap H gT
nnoremap L gt

" THEME ========================================================================
set termguicolors

" Nord Theme
let g:nord_comment_brightness = 10
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
colorscheme nord

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
let g:ale_lint_on_text_changed = 0
let g:ale_linters_explicit = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
highlight ALEErrorSign ctermbg=Red
highlight ALEWarningSign ctermbg=Yellow
highlight clear SignColumn
let g:ale_fixers = {
  \ 'cpp': ['clang-format'],
  \ 'javascript': ['eslint'],
  \ 'ruby': ['rubocop'],
  \ 'vue': ['eslint'],
  \ }
let g:ale_linters = {
  \ 'cpp': ['gcc', 'clang-format', 'cppcheck', 'cpplint'],
  \ 'javascript': ['eslint'],
  \ 'ruby': ['ruby', 'rubocop'],
  \ 'vue': ['eslint'],
  \ }
let g:ale_c_clangformat_options = '-style=google'
let g:ale_cpp_cpplint_options = '--linelength=120 --filter=-runtime/references,-legal/copyright,-build/namespaces'
nmap <Leader>f :ALEFix<CR>

" Auto Pairs
let g:AutoPairsMultilineClose = 0

" fzf
nnoremap <C-p> :Files<CR>
nmap <Leader>; :Buffers<CR>

" Indent Line
let g:indentLine_concealcursor = 0
let g:indentLine_char = ''
let g:indentLine_fileTypeExclude = ['startify', 'help']

" Language Client
"   npm install vue-language-server -g
"   yarn global add javascript-typescript-langserver
let g:LanguageClient_serverCommands = {
  \ 'cpp': ['/usr/local/bin/cquery',
  \ '--log-file=/tmp/cq.log',
  \ '--init={"cacheDirectory":"/var/cquery/"}'],
  \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
  \ 'vue': ['vls'],
  \ }
nnoremap <silent> <leader>h :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>d :call LanguageClient#textDocument_definition()<CR>

" ncm2
set completeopt=noinsert,menuone,noselect
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" NERDTree
let g:NERDTreeUpdateOnCursorHold = 0

" Ripgrep
nnoremap K :Rg<CR>
nnoremap \ :Rg<Space>
let g:rg_highlight = 1

" Startify
let g:startify_change_to_vcs_root = 1

" Vim EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Vim Gitgutter
set updatetime=100
let g:gitgutter_grep = 'rg color --color=never'

" Vim Markdown
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

augroup vimrcEx
  autocmd!

  autocmd BufEnter * call ncm2#enable_for_buffer()

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " hide invisible chars in nerdtree panel
  autocmd FileType nerdtree setlocal nolist
  autocmd FileType vue syntax sync fromstart

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile {Appraisals,*Brewfile} set filetype=ruby

  " turn off line numbers for terminal
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd FileType gitcommit setlocal nonumber norelativenumber

  " Markdown formatting
  autocmd BufRead,BufNewFile *.md setlocal spell
  autocmd FileType markdown setlocal ts=4 sw=4

  " Set comment style to // for cpp and vue
  autocmd FileType cpp,vue setlocal commentstring=//\ %s

  " HACK: remove status line background for fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
