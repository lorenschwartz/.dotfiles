# Before loading

1. Install xcode

`xcode-select --install`

2. Install Homebrew

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

3. Update Homebrew

`brew update`

## Installing dotfiles to another system
It just needs two shell commands before fetching the remote repo.

`echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc`

`source ~/.zshrc`

`echo ".dotfiles.git" >> .gitignore`

`git clone --bare https://www.github.com/lorenschwartz/.dotfiles.git $HOME/.dotfiles.git`

`dotfiles checkout`

`dotfiles config --local status.showUntrackedFiles no`

1. Create alias to ensure that the git bare repository works without problem.
2. Reload the shell setting to use that alias.
3. Add .dotfiles.git directory to .gitignore to prevent recursion issues.
4. Clone the repo.
5. Check if it works fine.
6. If you already have configuration files with identical names, checkout will fail. Back up and remove those files. Skip back up if you don’t need them.
7. Prevent untracked files from showing up on dotfiles status.
