source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

# Plugins
antigen bundle bundler
antigen bundle chrissicool/zsh-256color
antigen bundle djui/alias-tips
antigen bundle ember-cli
antigen bundle git
antigen bundle heroku
antigen bundle jsahlen/nodenv.plugin.zsh
antigen bundle rails
antigen bundle thefuck
antigen bundle vi-mode
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Pure Theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
# antigen bundle DFurnes/purer
# autoload -U promptinit; promptinit
# prompt purer

# Spaceship Theme
# antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
# SPACESHIP_DOCKER_SHOW=false

# Powerlevel9k Theme
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs rbenv nodeenv)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode)
# antigen theme dritter/powerlevel9k powerlevel9k --branch=async_all_the_segments
# antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

source ~/.aliases

export PATH=$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR=nvim
export PGDATA=/usr/local/var/postgres
export TERM=xterm-256color
export RPROMPT="" # Hide right prompt

eval "$(rbenv init -)"  # Load in RBenv shims
eval "$(nodenv init -)" # Load Nodenv shims
eval "$(hub alias -s)"  # Load Hub
ssh-add -A 2>/dev/null; # Load in SSH keys

export PATH=./bin:$PATH # always check ./bin first
