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
```

## Setup SSH

Symlink for more idiomatic SSH agent:

```sh
mkdir -p ~/.1password && ln -s ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock
```

Add the following to `~/.ssh/config`:

```
Host *
  IdentityAgent "~/.1password/agent.sock"
```

## Configure MacOS

- Keyboard Settings: Caps Lock -> Control
- Install coding font
- Set Alfred preferences folder
