# dotfiles
Some core dotfiles I use on every machine.
The tree is already setup to stow everything in the correct folders once you clone the repo.

## Requirements
A lazy file I will try to keep updated with the requirements for the
settings (I should really make a script ik)

- **Official**: dunst, less, rust, git, htop, openssh, stow, zathura,
zathura-pdfmupdf, npm, unzip, fd, fzy, kitty, fuzzel, dolphin, brightnessclt,
neovim, tree, mpv, man, swaybg, cmake, wget, xclip, biber, ripgrep, grim, slurp,
wl-clipboard, feh, firefox, xdg-desktop-portal, xdg-desktop-portal-hyprland

- Install `paru`: in ~
```
mkdir src; cd src
git clone https://aur.archlinux.org/paru.git; cd paru
makepkg -sic
```

- **AUR**: codium, wlsunset, zoom


## Additional setup
- Make the brightness modifiable by janko (udev or smt)
- SETUP BLUETOOTH: 
`sudo systemctl enable bluetooth`
`sudo systemctl start bluetooth`
