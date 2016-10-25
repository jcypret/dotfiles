source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh

alias emberclean="npm cache clean && bower cache clean && rm -rf node_modules bower_components dist tmp && npm install && bower install"
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;"

heroku=/usr/local/heroku/bin
rbenv=$HOME/.rbenv/bin
homebrew=/usr/local/bin:/usr/local/sbin
postgres=/Applications/Postgres.app/Contents/Versions/latest/bin

export PATH=./bin:/usr/local/sbin:$heroku:$rbenv:$homebrew:$postgres:$PATH

eval "$(nodenv init -)"

# Plugins
antigen bundle chrissicool/zsh-256color
antigen bundle ember-cli
antigen bundle git
antigen bundle heroku
antigen bundle rails
antigen bundle rbenv
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Pure Theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply
