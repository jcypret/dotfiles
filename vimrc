" Leader
let mapleader=" "

" Automatically :write before running commands
" Useful for automatically savings before running specs.
set autowrite

" Show partial command in bottom right corner.
" e.g. the motion change-in-word would show 'ci' while still typing.
set showcmd

" Load plugins
source ~/.vimrc.bundles

" Case-insensitive search unless capitals
set smartcase

" Highlight search results
set hlsearch
nnoremap <silent> <Leader>/ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" When joining lines, collaps to a single space
set nojoinspaces

" Don't redraw during macros
set lazyredraw

" Highlight the current line
set cursorline

" Preserve indention on line breaks
set breakindent
set breakindentopt=shift:2

" Set column width
set textwidth=80
set colorcolumn=+1

" Line numbers
set relativenumber
set number
set numberwidth=5

" Enable true colors
set termguicolors

" Enable powerline font for Airline
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" Set Dracula colorscheme
colorscheme dracula

" Set Gotham colorscheme
" colorscheme gotham

" Set Quantum colorscheme
" let g:airline_theme='quantum'
" let g:quantum_black = 1
" let g:quantum_italics = 1
" colorscheme quantum

" Use italics for code comments
set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic ctermfg=241

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Switch to normal mode
imap jj <esc>

" Move vertically through wrapped text
nmap j gj
nmap k gk

" Jump to beginning of line after whitespace
nmap 0 ^

" Reload vim config and install plugins
nmap <Leader>bi :source ~/.vimrc<cr>

" Open the file explorer
nmap ff :Explore<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>
nnoremap <Leader>d :Dispatch<space>

" Bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Pastes text from system clipboard without auto indentation.
map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>

" Redraw screen, specifically for when there are glitchy charactes.
map <Leader>R :redraw!<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Quicker window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Search ctags with Ctrlp
nnoremap <leader>. :CtrlPTag<cr>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "dispatch"

" Use tabs for auto completion
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Configure Syntastic with recommended settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_eruby_ruby_quiet_messages =
  \ {"regex": "possibly useless use of a variable in void context"}
let g:syntastic_ruby_checkers = ['rubocop', 'mri', 'reek']
let g:syntastic_javascript_checkers = ['eslint']

" Use The Silver Searcher for grep
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

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
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_override_foldtext = 0

" Spell check markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Vim EasyMotion
" Search for word by two letters
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Move!
vmap <c-k> <Plug>MoveBlockUp
vmap <c-j> <Plug>MoveBlockDown

" Index ctags from any project, including those outside Rails
function! ReindexCtags()
  let l:ctags_hook = '$(git rev-parse --show-toplevel)/.git/hooks/ctags'

  if exists(l:ctags_hook)
    exec '!'. l:ctags_hook
  else
    exec "!ctags -R ."
  endif
endfunction

nmap <Leader>ct :call ReindexCtags()<CR>
