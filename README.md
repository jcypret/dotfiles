# Justin's Dotfiles

## Installation

```zsh
# clone dotfiles
mkdir ~/Code && cd ~/Code
git clone https://github.com/jcypret/dotfiles.git

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install Brewfile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle --file ~/Code/dotfiles/Brewfile

# install dotfiles
sudo dscl . -create "/Users/$USER" UserShell "$HOMEBREW_PREFIX/bin/zsh"
env RCRC=$HOME/Code/dotfiles/rcrc rcup
zbundle
compaudit | xargs chmod g-w

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# setup SSH key
https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
```
