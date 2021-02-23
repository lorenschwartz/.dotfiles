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
brew tap teamookla/speedtest
brew install speedtest --force
brew install ispell
brew install svn
brew install aspell
brew install gnutls

# Install MacOS Applications
brew install --cask visual-studio-code
brew install --cask gimp
brew install --cask rawtherapee
brew install --cask iina
brew install --cask signal

# Install fonts
brew tap homebrew/cask-fonts
brew install --cask font-source-code-pro
brew install --cask font-roboto-mono
brew install --cask font-fira-code

# Remove outdated versions from the cellar.
brew cleanup

# Install Spacemacs
brew tap d12frosted/emacs-plus
brew install emacs-plus
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -s /usr/local/opt/emacs-plus@27/Emacs.app /Applications

# Clone N A N O Emacs
git clone https://github.com/rougier/nano-emacs.git

# Clone my dotfiles config
git clone https://github.com/lorenschwartz/.dotfiles.git

# Clone `use-package
cd ~/.emacs.d/elpa
git clone https://github.com/jwiegley/use-package.git
