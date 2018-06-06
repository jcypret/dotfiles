set encoding=utf-8
scriptencoding utf-8

" Load plugins
source ~/.vimrc.bundles
runtime! macros/matchit.vim

" Leader
let g:mapleader = ' '

set autowrite    " save before running commands (useful for TDD)
set cursorline   " highlight the current line
set nojoinspaces " when joining lines, collaps to a single space
set wildmenu     " enable tab-completions for vim commands

" Display whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Match longest frist, then next full match
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
set foldmethod=syntax
set nofoldenable
set foldlevelstart=99

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

" Dracula Theme
" let g:indentLine_color_gui = '#44475A'
" colorscheme dracula
" highlight Comment gui=italic guifg=#6272A4

" Nord Theme
let g:nord_comment_brightness = 10
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
let g:fzf_colors = {
  \ 'hl':   ['fg', 'Comment'],
  \ 'hl+':  ['fg', 'healthSuccess'],
  \ 'bg+':  ['bg', 'CursorLine', 'CursorColumn'],
  \ }
colorscheme nord

" LANGUAGE SETTINGS ============================================================

" HTML
let g:html_indent_tags = 'li\|p'

" Ruby
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'

" PLUGIN SETTINGS ==============================================================

" Airline
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" Ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
highlight ALEErrorSign ctermbg=Red
highlight ALEWarningSign ctermbg=Yellow
highlight clear SignColumn
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'ruby': ['rubocop'],
  \ 'vue': ['eslint']
  \ }
let g:ale_linters = {
  \ 'cpp': ['gcc', 'clang-format', 'cppcheck', 'cpplint'],
  \ 'javascript': ['eslint'],
  \ 'ruby': ['ruby', 'rubocop']
  \ }
let g:ale_cpp_cpplint_options = '--linelength=120'
nmap <Leader>f :ALEFix<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:UltiSnipsExpandTrigger = '<C-j>'

" fzf
nnoremap <C-p> :Files<CR>
nmap <Leader>; :Buffers<CR>

" Indent Line
let g:indentLine_concealcursor = 0
let g:indentLine_char = ''
let g:indentLine_fileTypeExclude = ['startify', 'help']

" Ripgrep
nnoremap K :Rg<CR>
nnoremap \ :Rg<Space>
let g:rg_highlight = 1

" Startify
let g:startify_change_to_vcs_root = 1

" Vim EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Vim EasyMotion
let g:EasyMotion_do_mapping = 0 " disable default mappings
let g:EasyMotion_smartcase = 1 " case insensitive
" Search by one or two letters
nmap s <Plug>(easymotion-overwin-f2)
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Vim Gitgutter
set updatetime=100

" Vim Highlighted Yank
let g:highlightedyank_highlight_duration = 250

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
vmap <leader>gt <Plug>Titlecase
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
  autocmd FileType eruby setlocal foldmethod=indent

  " Spell check markdown files
  autocmd BufRead,BufNewFile *.md setlocal spell

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile {Appraisals,*Brewfile} set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

  " Show cursor line only in current panel
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline

  " HACK: remove status line background for fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
