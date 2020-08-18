#!/usr/bin/env bash

TARGET="$HOME/.dotfiles"

# Install x-code
xcode-select --install

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install and update Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install git if not already there
brew install git

# Clojure and Leiningen
brew install clojure
brew install leiningen

# Intall terminal packages
brew install tree
brew install fortune
brew install cowsay
brew install ghostscript
brew install imagemagick

# Install MacOS Applications
brew cask install visual-studio-code
brew cask install gimp
brew cask install rawtherapee

# Install Source Code Pro font
brew tap homebrew/cask-fonts
brew cask install font-source-code-pro

# Remove outdated versions from the cellar.
brew cleanup

# Install Spacemacs
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew linkapps emacs-plus
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -s /usr/local/opt/emacs-plus@27/Emacs.app /Applications
