cask_args appdir: "/Applications"

tap "cjbassi/gotop"
tap "heroku/brew"
tap "homebrew/cask"
tap "homebrew/services"
tap "thoughtbot/formulae"
tap "universal-ctags/universal-ctags"

# Unix
brew "cmake"
brew "openssl"
brew "p7zip"
brew "rcm"
brew "reattach-to-user-namespace"
brew "tree"

# ZSH
brew "antigen"
brew "autojump"
brew "fzf"
brew "pv"
brew "zsh"

# Better Unix
brew "bat" # cat
brew "exa" # ls
brew "fd" # find
brew "gotop" # top
brew "ncdu" # du
brew "prettyping" # ping
brew "ripgrep" # grep
brew "tldr" # man pages

# Git
brew "git"

brew "diff-so-fancy"
brew "git-standup"
brew "hub"
brew "lazygit"

# Programming
brew "asdf"
brew "clisp"
brew "cloc"
brew "neovim"
brew "tmux"
brew "universal-ctags", args: ["HEAD"]

# Heroku
brew "heroku-node" # heroku and parity dependency

brew "heroku"
brew "parity"

# Image manipulation
brew "imagemagick"
brew "guetzli"

# C++
brew "clang-format"
brew "cppcheck"
brew "cquery"
brew "llvm", args: ["with-toolchain"]

# Databases
brew "mysql@5.7", restart_service: true, link: true, conflicts_with: ["mysql"]
brew "postgres", restart_service: :changed
brew "redis", restart_service: :changed

# Javascript
brew "yarn", args: ["without-node"]

# PHP
brew "composer"
brew "dnsmasq"
brew "nginx"
brew "php@7.1", restart_service: true, link: true, conflicts_with: ["php"]

# Applications
brew "mas"

cask "alacritty"
cask "alfred"
cask "appcleaner"
cask "bartender"
cask "chromedriver"
cask "dash"
cask "dropbox"
cask "fantastical"
cask "firefox"
cask "google-chrome"
cask "hammerspoon"
cask "handbrake"
cask "imagealpha"
cask "imageoptim"
cask "keepingyouawake"
cask "ngrok"
cask "postico"
cask "qbserve"
cask "screenflow"
cask "sequel-pro"
cask "sketch"
cask "spectacle"
cask "spotify"
cask "vlc"

mas "Gestimer", id: 990588172
mas "Todoist", id: 585829637
