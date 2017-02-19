" Leader
let mapleader=" "

" Automatically :write before running commands
" Useful for automatically savings before running specs.
set autowrite

" Load plugins
source ~/.vimrc.bundles

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" When joining lines, collaps to a single space
set nojoinspaces

" Preserve indention on line breaks
set breakindent
set breakindentopt=shift:2

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

" Set column width
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=235

" Line numbers
set relativenumber
set number
set numberwidth=5
highlight LineNr ctermfg=237

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
imap jk <esc>
imap kj <esc>

" Move vertically through wrapped text
nmap j gj
nmap k gk

" Jump to beginning of line after whitespace
nmap 0 ^

" Reload vim config and install plugins
nmap <Leader>bi :source ~/.vimrc<cr>

" Run commands that require an interactive shell
nnoremap <Leader>c :RunInInteractiveShell<space>

" Bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Pastes text from system clipboard without auto indentation.
map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Prevent use of arrow keys in normal mode
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

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

" Disable tab choosing for UltiSnips compatibility.
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

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

" start of default statusline
set statusline=%f\ %h%w%m%r
" Syntastic statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" end of default statusline (with ruler)
set statusline+=%=%(%l,%c%V\ %=\ %P%)

" Configure Syntastic with recommended settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Remove trailing whitespace when a file is saved
" Source: <http://vim.wikia.com/wiki/Remove_unwanted_spaces>
function! TrimWhiteSpace()
  " Do not record the whitespace removal in the undo history
  " Source: <http://vim.1045645.n5.nabble.com/there-s-undojoin-how-about-dotjoin-td1203135.html>
  try
    undojoin
  catch
    " Probably an undo was just issued, and so there's no way to join the undo.
    " Which sucks.
  endtry
  %s/\s*$//
  ''
endfunction
autocmd! FileWritePre * :call TrimWhiteSpace()
autocmd! FileAppendPre * :call TrimWhiteSpace()
autocmd! FilterWritePre * :call TrimWhiteSpace()
autocmd! BufWritePre * :call TrimWhiteSpace()
