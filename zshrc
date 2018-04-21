source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

# Plugins
antigen bundle autojump
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

# Pure Theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

source ~/.aliases
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR=nvim
export PGDATA=/usr/local/var/postgres

eval "$(rbenv init -)"  # Load in RBenv shims
eval "$(nodenv init -)" # Load Nodenv shims
eval "$(hub alias -s)"  # Load Hub
ssh-add -A 2>/dev/null; # Load in SSH keys

# always check ./bin first
export PATH=./bin:$PATH

# fzf
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# GPG
export GPG_TTY=$(tty)
