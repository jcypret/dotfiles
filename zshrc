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
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Spaceship Theme
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# Pure Theme
# antigen bundle mafredri/zsh-async
# antigen bundle sindresorhus/pure

antigen apply

source ~/.aliases

POSTGRES=/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$HOME/.bin:/usr/local/bin:/usr/local/sbin:$POSTGRES:$PATH
export EDITOR=vim
export TERM=xterm-256color

eval "$(rbenv init -)" # Load in RBenv shims
ssh-add -A 2>/dev/null; # Load in SSH keys

export PATH=./bin:$PATH # always check ./bin first
