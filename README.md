# Justin's Dotfiles

## Installation

```zsh
# clone dotfiles
mkdir ~/Code
git clone https://github.com/jcypret/dotfiles.git
cd ~/Code/dotfiles

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Homebrew/bundle
brew bundle

# install dotfiles
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
env RCRC=$HOME/Code/dotfiles/rcrc rcup

# configure neovim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir ~/.vim
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# setup SSH key
https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
```
