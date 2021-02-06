setopt always_to_end # move cursor to end if word had one match
setopt auto_cd # omit `cd` when navigating directories
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt auto_param_slash # add trailing slash for directory completion
setopt extended_history # store timestamps for history entries
setopt hist_expire_dups_first # keeps unique events in history for longer
setopt hist_ignore_dups # do not record subsequent event matching previous
setopt hist_ignore_space # space prefix for intentionally omitting a history entry
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances

# vim
bindkey -v # vi mode
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

HISTSIZE=50000
SAVEHIST=10000

# homebrew
eval $(/opt/homebrew/bin/brew shellenv)

export EDITOR=nvim
export PGDATA="$HOMEBREW_PREFIX/var/postgres"
export SHELL="$HOMEBREW_PREFIX/bin/zsh"
export TIME_STYLE="long-iso" # iso timestamps for `ls -l`

# asdf
source "$HOMEBREW_PREFIX/opt/asdf/asdf.sh"

# completion
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name '' # group results by category

# crystal
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/openssl/lib/pkgconfig"

# direnv
eval "$(direnv hook zsh)" # Load direnv

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# gcloud
CLOUDSDK_HOME="$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
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

# ssh
ssh-add -A 2>/dev/null; # Load in SSH keys

source ~/.zsh_plugins.sh
source ~/.aliases

# path
path+=("$HOME/.cargo/bin") # rust
path=("$HOME/.bin" $path) # dotfiles
path=(".git/safe/../../bin" $path) # `git trust-bin`
export -U PATH

# load completions if not already loaded
if ! (( $+functions[compdef] )) ; then
  autoload -Uz compinit && compinit
fi
