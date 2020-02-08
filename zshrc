# zsh history
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# vi mode
bindkey -v

# completions
setopt autocd
autoload -Uz compinit
compinit

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

source ~/.zsh_plugins.sh
source ~/.aliases
