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
source "$(brew --prefix asdf)/asdf.sh"

# bat
export BAT_THEME='Nord'

# crystal
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# use nord theme (https://github.com/junegunn/fzf/wiki/Color-schemes#nord)
export FZF_DEFAULT_OPTS='
  --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
  --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
'

# rust
export PATH=$PATH:$HOME/.cargo/bin

# GPG
export GPG_TTY=$(tty)

# `git trust-bin` to trust repo and prepend binaries to path
export PATH=".git/safe/../../bin:$PATH"

source ~/.zsh_plugins.sh
source ~/.aliases
