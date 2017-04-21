# vim-gitctags
VIM Plugin for automated CTags generation on GIT C projects

## Dependencies
Following software are required for vim-gitctags to work properly:
* git
* exhuberent-ctags

## How it works
You pretty much have nothing to do:
* When opening a .c or .h file from a git project, vim-gitctags will load the .git/tags file if it exists, and create it if needed.
* vim-gitctags will automatically update the ctag file when a .c or .h file is saved by vim, if the file is in a git project. ctag filed is stored in .git/tags

## How to install
TODO
