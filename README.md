# .vim

This is my Vim configuration. Aimed to be a fully featured IDE. With
keybindings focused on preventing pinky pain.

## Currently supported languages and features

Currently, Java is working well with this configuration, features include:
auto-completion, various other features supported by an LSP (e.g. static
checking, go to definition, go to implementation, find references), and
**debugging**.

Other languages are well-supported using coc.nvim, including JavaScript /
Typescript, JSX, Python, Rust.

There are also Git and `ripgrep` integrations.

## Package management

This configuration doesn't use an external plugin manager. Instead it relies on
the builtin package management shipped with Vim since version 8, plus the
submodules feature of Git to update packages.

### How to a add a package

Example of coc.nvim

```bash
git submodule add --branch release https://github.com/neoclide/coc.nvim.git pack/testing/opt/coc.nvim
vim -c "helptags pack/testing/opt/coc.nvim/doc/ | q"
```

### How to update all packages at once

```bash
git pull --recurse
# or try
git submodule update --remote
```

### Generate helptags for one package

Inside vim

```vim
:helptags pack/testing/start/vim-snipmate/doc/
:helptags ALL
```

## License

Apache 2.0. See [LICENSE](./LICENSE) file.
