# dotfiles
Some core dotfiles I use on every machine.
The tree is already setup to stow everything in the correct folders once you clone the repo.

## Requirements
A lazy file I will try to keep updated with the requirements for the
settings (I should really make a script ik)

- **Hyprland**: just follow the official documentation for the ecosystem

- **Core progs**: `ripgrep`, `foot`, `fd`, `fzy`, `git`, `stow`, `codium`,
  `neovim`, 

- **Cool utils**:
`wev`: find out which key you are pressing


- **Official**: dunst, less, rust, git, htop, openssh, stow, zathura,
zathura-pdfmupdf, npm, unzip, fd, fzy,neovim, tree, mpv, man, cmake, wget, xclip, biber, ripgrep, grim, slurp,
wl-clipboard, feh, firefox, xdg-desktop-portal-hyprland




## Additional setup

This was my old goto, now hypersunset takes care of everything I would say
- Make the brightness modifiable by janko (udev or smt)
- SETUP BLUETOOTH: 
`sudo systemctl enable bluetooth`
`sudo systemctl start bluetooth`


## Install the dotfiles
The tree structure is mirrored in the `stow/` folder.
Just run `stow stow/ --dotfiles` from the `dotfiles` directory.
