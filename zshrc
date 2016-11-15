source $(brew --prefix)/share/antigen/antigen.zsh
source ~/.dotfiles/aliases.zsh

antigen use oh-my-zsh

# Plugins
antigen bundle chrissicool/zsh-256color
antigen bundle ember-cli
antigen bundle thefuck
antigen bundle git
antigen bundle heroku
antigen bundle jsahlen/nodenv.plugin.zsh
antigen bundle rails
antigen bundle rbenv
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Pure Theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

postgres=/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=./bin:/usr/local/bin:/usr/local/sbin:$postgres:$PATH
