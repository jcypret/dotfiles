source $(brew --prefix)/share/antigen/antigen.zsh
source ~/.aliases

antigen use oh-my-zsh

# Plugins
antigen bundle bundler
antigen bundle chrissicool/zsh-256color
antigen bundle ember-cli
antigen bundle thefuck
antigen bundle git
antigen bundle heroku
antigen bundle jsahlen/nodenv.plugin.zsh
antigen bundle rails
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Pure Theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

POSTGRES=/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=/usr/local/bin:/usr/local/sbin:$POSTGRES:$PATH
export EDITOR=vim
export TERM=xterm-256color

eval "$(rbenv init -)" # Load in RBenv shims
ssh-add -A 2>/dev/null; # Load in SSH keys

export PATH=./bin:$PATH # always check ./bin first
