source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

# Plugins
antigen bundle autojump
antigen bundle bundler
antigen bundle chrissicool/zsh-256color
antigen bundle composer
antigen bundle djui/alias-tips
antigen bundle ember-cli
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

# Aliases
source ~/.aliases

export PATH=$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR=nvim
export PGDATA=/usr/local/var/postgres

source /usr/local/opt/asdf/asdf.sh
eval "$(hub alias -s)"  # Load Hub
ssh-add -A 2>/dev/null; # Load in SSH keys

# always check ./bin first
export PATH=./bin:$PATH

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--color=16,fg+:4,hl:6,hl+:6,info:5'

# GPG
export GPG_TTY=$(tty)
