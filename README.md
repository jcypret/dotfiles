# Justin's Dotfiles

## Installation

```zsh
# clone dotfiles
mkdir ~/Code && cd ~/Code
git clone https://github.com/jcypret/dotfiles.git

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --global

# install dotfiles
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
env RCRC=$HOME/Code/dotfiles/rcrc rcup
zbundle
compaudit | xargs chmod g-w

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# setup SSH key
https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
```
