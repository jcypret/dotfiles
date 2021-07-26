" Install vim-plug if not already installed.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/bundle')

Plug 'janko-m/vim-test' " polyglot test runner
Plug 'rizzatti/dash.vim', {'on': ['Dash', 'Dash!']} " open documentation in Dash
Plug 'tpope/vim-repeat' " repeating for supported plugins with `.`
Plug 'tpope/vim-unimpaired' " pairs of handy bracket mappings
Plug 'tweekmonster/startuptime.vim', {'on': 'StartupTime'} " profile vim startup time
Plug 'wakatime/vim-wakatime' " automatic time tracking
Plug 'freitass/todo.txt-vim'

" Autocomplete, linting, and fixing
Plug 'hrsh7th/nvim-compe' " completion
Plug 'hrsh7th/vim-vsnip' " snippet framework
Plug 'jiangmiao/auto-pairs' " inserts/deletes brackets, parens, quotes in pair
Plug 'neovim/nvim-lspconfig' " configs for neovim built-in lsp
Plug 'nvim-treesitter/nvim-treesitter', {'branch': '0.5-compat', 'do': ':TSUpdate'} " improved file parsing
Plug 'rafamadriz/friendly-snippets' " snippet collectoin
Plug 'ray-x/lsp_signature.nvim' " function signature hints
Plug 'tpope/vim-endwise' " wisely adds `end` in ruby
" Telescope
Plug 'nvim-lua/popup.nvim' " telescope dependency
Plug 'nvim-lua/plenary.nvim' " telescope and gitsigns dependency
Plug 'nvim-telescope/telescope.nvim' " fuzzy file browser

" C++
Plug 'octol/vim-cpp-enhanced-highlight' " C++ syntax

" Crystal
Plug 'rhysd/vim-crystal' " Crystal syntax

" CSS
Plug 'cakebaker/scss-syntax.vim' " Sassy CSS syntax (sass/scss)
Plug 'hail2u/vim-css3-syntax' " CSS3 syntax

" CTags
Plug 'ludovicchabant/vim-gutentags' " automatic ctag generation
Plug 'majutsushi/tagbar' " ctag browser

" Git
Plug 'junegunn/gv.vim' " git commit browser
Plug 'lewis6991/gitsigns.nvim' " git diff in the sign column
Plug 'shumphrey/fugitive-gitlab.vim' " :Gbrowse GitLab support
Plug 'tommcdo/vim-fubitive' " :Gbrowse BitBucket support
Plug 'tpope/vim-fugitive' " Git wrapper

" Elixir
Plug 'elixir-lang/vim-elixir' " Elixir syntax

" JavaScript
Plug 'pangloss/vim-javascript' " JavaScript/ES6 syntax
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'elzr/vim-json' " JSON syntax and config
" Vue
Plug 'posva/vim-vue' " Vue SFC syntax
Plug 'mustache/vim-mustache-handlebars' " handlebars syntax
" React
Plug 'maxmellon/vim-jsx-pretty' " React JSX syntax
Plug 'peitalin/vim-jsx-typescript' " TypeScript JSX syntax
Plug 'styled-components/vim-styled-components', {'branch': 'main'} " Emotion syntax
Plug 'jparise/vim-graphql' " GraphQL syntax

" Markup
Plug 'cespare/vim-toml' " TOML syntax
Plug 'mattn/emmet-vim', {'on': ['Emmet', 'EmmetInstall']} " HTML text expander
Plug 'othree/html5.vim' " HTML5 syntax
Plug 'plasticboy/vim-markdown' " Markdown syntax and config

" Motions
Plug 'AndrewRadev/splitjoin.vim' " go join (gj) and go split (gs)
Plug 'christoomey/vim-sort-motion' " go sort (gs)
Plug 'christoomey/vim-titlecase' " go titleize (gt)
Plug 'junegunn/vim-easy-align' " go align (ga)
Plug 'tpope/vim-commentary' " go comment (gc)
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'wellle/targets.vim' " additional text objects

" Navigation and Files
Plug 'arp242/jumpy.vim' " filetype-specific mappings for [[ and ]]
Plug 'christoomey/vim-tmux-navigator' " seamless navigation between tmux panes and vim splits
Plug 'gioele/vim-autoswap' " stop the swap file messages and just switch to correct window
Plug 'pbrisbin/vim-mkdir' " auto create any non-existent directories before writing buffer
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']} " file system explorer
Plug 'simeji/winresizer' " vim motion moving and resizing of windows
Plug 'tpope/vim-eunuch' " helpers for UNIX (:Delete, :Move, :Rename)

" Python
Plug 'vim-python/python-syntax' " Python syntax
Plug 'Vimjas/vim-python-pep8-indent' " improved indention

" Ruby
Plug 'joker1007/vim-ruby-heredoc-syntax', {'for': ['ruby']} " heredoc syntax highlighting (like SQL)
Plug 'kana/vim-textobj-user', {'for': ['ruby']} " required for vim-textobj-rubyblock
Plug 'nelstrom/vim-textobj-rubyblock', {'for': ['ruby']} " motion for Ruby blocks
Plug 'tpope/vim-bundler' " Bundler wrapper (:Bundle) and Gemfile syntax
Plug 'tpope/vim-rails' " Rails wrapper (gf, projectionist def, enhanced syntax)
Plug 'tpope/vim-rake' " Rake wrapper (:Rake, projectionist def)
Plug 'vim-ruby/vim-ruby' " Ruby syntax

" Search and Replace
Plug 'stefandtw/quickfix-reflector.vim' " change code in the quickfix window
Plug 'mhinz/vim-grepper' " better grepping + motions (gf)

" SQL
Plug 'exu/pgsql.vim' " PostgreSQL syntax

" Writing
Plug 'reedes/vim-pencil' " improved wrapped prose editing

" Themes and UI
Plug 'jcypret/nord-midnight-vim' " dark theme
Plug 'lukas-reineke/indent-blankline.nvim' " shows lines for indention levels
Plug 'luochen1990/rainbow' " colored matched parens for Lisp sanity
Plug 'mhinz/vim-startify' " fancy start screen
Plug 'reedes/vim-colors-pencil' " writing theme
Plug 'vim-airline/vim-airline' " improved status and tablines

" DevIcons must load last...
Plug 'ryanoasis/vim-devicons' " Nerd Font support (file type icons)

call plug#end()
