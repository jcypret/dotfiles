set encoding=utf-8
scriptencoding utf-8

" Load plugins
source ~/.vimrc.bundles
runtime! macros/matchit.vim

" Leader
let g:mapleader = ' '

set autowrite      " save before running commands (useful for TDD)
set cursorline     " highlight the current line
set hidden         " allow hiding unsaved buffers
set nojoinspaces   " when joining lines, collaps to a single space
set noshowcmd      " don't show partial commands in status bar
set regexpengine=1 " use legacy syntax parsing for ruby
set signcolumn=yes " always show signcolumns
set splitbelow     " open new horizontal splits below
set splitright     " open new vertical splits to the right
set wildmenu       " enable tab-completions for vim commands

" Display whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Match longest first, then next full match
set wildmode=list:longest,full

" Reload vimrc
nmap <Leader>rr :source ~/.vimrc<cr>

" VIM SETTINGS =================================================================

" Buffers

" save current buffer
nnoremap <leader>w :w<cr>
"create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>B :enew<cr>
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
nmap 0 ^
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
nnoremap <C-t> :tabnew<CR>
nnoremap H gT
nnoremap L gt

" THEME ========================================================================
set termguicolors

" Nord Theme
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
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
let g:ale_linters_explicit = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_fixers = {
  \ 'cpp': ['clang-format'],
  \ 'css': ['stylelint'],
  \ 'elixir': ['mix_format'],
  \ 'javascript': ['eslint'],
  \ 'ruby': ['rubocop', 'standardrb'],
  \ 'scss': ['stylelint'],
  \ 'vue': ['eslint'],
  \ }
let g:ale_linters = {
  \ 'cpp': ['gcc', 'clang-format', 'cppcheck', 'cpplint'],
  \ 'css': ['stylelint'],
  \ 'javascript': ['eslint'],
  \ 'ruby': ['ruby', 'rubocop', 'standardrb'],
  \ 'scss': ['stylelint'],
  \ 'vim': ['vint'],
  \ 'vue': ['eslint'],
  \ }
let g:ale_c_clangformat_options = '-style=google'
let g:ale_cpp_cpplint_options = '--linelength=120' .
      \ '--filter=-runtime/references,-legal/copyright,-build/namespaces'
let g:ale_ruby_rubocop_executable = 'bundle' " use `bundle exec rubocop`
nmap <Leader>f :ALEFix<CR>

" Auto Pairs
let g:AutoPairsMultilineClose = 0

" Conquer of Completion (coc)
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-solargraph',
  \ 'coc-tsserver',
  \ 'coc-vetur',
  \ 'coc-yaml',
  \ ]

highlight link CocErrorSign ALEErrorSign
highlight link CocWarningSign ALEWarningSign

nmap <silent> gd <Plug>(coc-definition)

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use space+h to show documentation in preview window
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" fzf
nnoremap <C-p> :Files<CR>
nmap <Leader>; :Buffers<CR>

" Indent Line
let g:indentLine_concealcursor = 0
let g:indentLine_char = ''
let g:indentLine_fileTypeExclude = ['startify', 'help']

" NERDTree
let g:NERDTreeUpdateOnCursorHold = 0

" Rainbow Parentheses Improved
let g:rainbow_active = 0

" Ripgrep
nnoremap K :Rg<CR>
nnoremap \ :Rg<Space>
let g:rg_highlight = 1

" Startify
let g:startify_change_to_vcs_root = 1

" Tagbar
nmap T :TagbarToggle<CR>

" Vim EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Vim Gitgutter
set updatetime=100
let g:gitgutter_grep = 'rg --color=never'

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

  " Use rainbow parens for lisp-based languages
  autocmd FileType lisp,clojure,scheme RainbowToggleOn

  " HACK: remove status line background for fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" Local config
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif
