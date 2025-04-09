# vim07

My Vim configuration. Aimed to be a fully featured IDE. With keybindings focused on preventing Emacs pinky.

## Current packages - not yet tracked here

./opt:
gruvbox # forked

./start:
ale  vim-fugitive  vim-gitgutter  vim-graphql  vim-prisma

## How to a add a package

Example of coc.nvim

```bash
git submodule add --branch release https://github.com/neoclide/coc.nvim.git pack/testing/opt/coc.nvim
vim -c "helptags pack/testing/opt/coc.nvim/doc/ | q"
```

## How to update all packages at once

```bash
git pull --recurse
```

## Generate helptags for one package

Inside vim

```vim
:helptags pack/testing/start/vim-snipmate/doc/
:helptags ALL
```
