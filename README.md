# dotfiles
Some core dotfiles I use on every machine.
The tree is already setup to stow everything in the correct folders once you clone the repo.

## Requirements
A lazy file I will try to keep updated with the requirements for the
settings.

### Nvim
- `packer` the plugin manager I use
- `pyright` the python server for the tree-sitter
- patched font (say from `https://www.nerdfonts.com/`)
- themes: green 'everforest'

### LaTeX
- `tectonic` is used to compile the latex material. The setup is still not perfect
but I am waiting for the next W2 interface to be stable to implement it more
regularly.
Moreover, `biber` is giving some major issues with the version numbers, I still
have to check properly into that.
- `evince` or `siouyek` are two good options for pdf readers that update their 
view as the source file updates.

### Kitty
- fonts: `Ubuntu Mono`, `Roboto Mono

### Bash
- `fd` an alternative to find to be used with `fzf` for the `sd` command. Dunno
if it performs better but certainly gives many less graphical problems.

## Setting up the printer
- Insatall cups
- Check for the drivers on arch or the AUR
- install system-config-printer
- follow the utility
