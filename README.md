# Justin's Dotfiles

## Installation

```bash
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

# configure iTerm2
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# configure neovim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir ~/.vim
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
pip3 install neovim

# enable italics
tic -o $HOME/.terminfo $HOME/Code/dotfiles/xterm-256color.terminfo

# setup SSH key
https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
```
