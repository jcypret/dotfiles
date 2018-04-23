" Leader
let mapleader=" "

" Automatically :write before running commands
" Useful for automatically savings before running specs.
set autowrite

" Load plugins
source ~/.vimrc.bundles

" Case-insensitive search unless capitals
set ignorecase
set smartcase

" Live preview of substitions
set inccommand=split

" Clear highlight search results
nnoremap <silent> <Leader>/ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Display whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" When joining lines, collaps to a single space
set nojoinspaces

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

" Access system clipboard
vnoremap <C-c> "+y
inoremap <C-v> <ESC>"+pa

" Set Dracula colorscheme
colorscheme dracula

" Use italics for code comments
" color s:comment from Dracula theme
highlight Comment gui=italic guifg=#6272A4

" Enable powerline font for Airline
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1

" Indention guides
let g:indentLine_concealcursor = 0
let g:indentLine_char = ""
let g:indentLine_fileTypeExclude = ["startify", "help"]
" color s:selection from Dracula theme
let g:indentLine_color_gui = '#44475A'

" Auto completion similar to Bash
set wildmenu
set wildmode=list:longest,list:full

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

" Quicker window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Jump to beginning of line after whitespace
nmap 0 ^

" Reload vim config and install plugins
nmap <Leader>bi :source ~/.vimrc<cr>

" Open the file explorer
nmap ff :Explore<CR>
map <C-n> :NERDTreeToggle<CR>
map <Leader>n :NERDTreeFind<CR>
autocmd FileType nerdtree setlocal nolist " hide invisible chars in nerdtree panel

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Bind K to grep word under cursor
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" fzf
nnoremap <C-p> :Files<CR>
nmap <Leader>; :Buffers<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Use preferred ruby indention style
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'

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
let test#strategy = "neovim"
" Use ctr-o to leave test output on screen
tmap <C-o> <C-\><C-n>

" Startify
let g:startify_change_to_vcs_root = 1

" Use deoplete
let g:deoplete#enable_at_startup = 1
let g:UltiSnipsExpandTrigger="<C-j>"

" Configure Neomake
let g:neomake_ruby_checkers = ['mri', 'rubocop']
let g:neomake_javascript_checkers = ['eslint']
autocmd! BufWritePost * Neomake

runtime! macros/matchit.vim

" The Silver Searcher
if executable('ag')
  " Use for global searches
  let g:ackprg = 'ag --vimgrep'

  cnoreabbrev Ack Ack!
  nnoremap \ :Ack!<Space>
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
nmap <Leader>f <Plug>(easymotion-overwin-f)
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
