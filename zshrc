source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

# Plugins
antigen bundle autojump
antigen bundle bundler
antigen bundle chrissicool/zsh-256color
antigen bundle composer
antigen bundle djui/alias-tips
antigen bundle ember-cli
antigen bundle fzf
antigen bundle git
antigen bundle heroku
antigen bundle rails
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Pure Theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

# load completions
autoload -Uz compinit
compinit

# Aliases
unalias c
source ~/.aliases

export PATH=$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR=nvim
export PGDATA=/usr/local/var/postgres

eval "$(hub alias -s)"  # Load Hub
eval "$(direnv hook zsh)" # Load direnv
ssh-add -A 2>/dev/null; # Load in SSH keys

# asdf
source /usr/local/opt/asdf/asdf.sh
source /usr/local/etc/bash_completion.d/asdf.bash

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--color=16,fg+:4,hl:6,hl+:6,info:5'

# rust
export PATH=$PATH:$HOME/.cargo/bin

# GPG
export GPG_TTY=$(tty)

# `git trust-bin` to trust repo and prepend binaries to path
export PATH=".git/safe/../../bin:$PATH"
