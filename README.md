dotfiles
========

A few useful dotfiles for:

- vim
- tmux
- awesomeWM
- xbindkeys

The prefered method of management is by utilizing [gnu stow](https://www.gnu.org/software/stow/).

Provided that this repository is in the root of the home directory (e.g.
`~/dotfiles`) you can easily install the tmux configuration from this
repository by running:

	$ stow tmux

Note that this will generate the appropriate symlinks only in case the
destination files do not already exist. You can also uninstall a set of
configurations by running command similar to:

	$ stow -D tmux

This command will uninstall the previously installed tmux configuration.
