setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
setopt autocd

bindkey -v # vi mode

export EDITOR=nvim
export HISTSIZE=50000
export PATH=$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH
export PGDATA=/usr/local/var/postgres
export SAVEHIST=10000
export TIME_STYLE="long-iso" # iso timestamps for `ls -l`

# asdf
source /usr/local/opt/asdf/asdf.sh

# completion
zstyle ':completion:*' menu select

# crystal
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

# direnv
eval "$(direnv hook zsh)" # Load direnv

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# gcloud
CLOUDSDK_HOME=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk
if [ -d "$CLOUDSDK_HOME" ]; then
  source "$CLOUDSDK_HOME/path.zsh.inc"
  source "$CLOUDSDK_HOME/completion.zsh.inc"
fi

# gpg
export GPG_TTY=$(tty)

# nord
eval $(gdircolors ~/.dir_colors)
# source: https://github.com/junegunn/fzf/wiki/Color-schemes#nord
export FZF_DEFAULT_OPTS='
  --color fg:#D8DEE9,bg:#242933,hl:#A3BE8C,fg+:#D8DEE9,bg+:#3B4252,hl+:#A3BE8C
  --color pointer:#BF616A,info:#434C5E,spinner:#434C5E,header:#434C5E,prompt:#81A1C1,marker:#EBCB8B'

# rust
export PATH=$PATH:$HOME/.cargo/bin

# ssh
ssh-add -A 2>/dev/null; # Load in SSH keys

# `git trust-bin` to trust repo and prepend binaries to path
export PATH=".git/safe/../../bin:$PATH"

source ~/.zsh_plugins.sh
source ~/.aliases

# load completions if not already loaded
if ! (( $+functions[compdef] )) ; then
  autoload -Uz compinit && compinit
fi
