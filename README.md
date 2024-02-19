# dotfiles
Some core dotfiles I use on every machine.
The tree is already setup to stow everything in the correct folders once you clone the repo.

## Requirements
A lazy file I will try to keep updated with the requirements for the
settings.

- **Official**: dunst, less, rust, git, htop, openssh, stow, zathura,
zathura-pdfmupdf, npm, unzip, fd, fzy, kitty, fuzzel, dolphin, brightnessclt,
neovim, tree, mpv, man, swaybg, cmake, wget, xclip, biber

- Install `paru`: in ~
```
mkdir src; cd src
git clone https://aur.archlinux.org/paru.git; cd paru
makepkg -sic
```
- **AUR**: codium, brave-bin, wlsunset

### Specifications
Let's see what we need where.

- Nvim: `npm`, `unzip`, `livetex`, `zathura`, `zathura-pdf-mupdf`
- Kitty: `ttf-ubuntu-mono-nerd`
- Bash: `fd`, `fzy`

## Additional setup
- Make the brightness modifiable by janko (udev or smt)
- SETUP BLUETOOTH: 
`sudo systemctl enable bluetooth`
`sudo systemctl start bluetooth`
