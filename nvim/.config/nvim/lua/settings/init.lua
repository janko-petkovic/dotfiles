local set = vim.opt

vim.notify = require('notify')

set.number = true
set.relativenumber = true
set.cursorline = true

set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4

set.hlsearch = true
set.incsearch = true

set.splitbelow = true
set.splitright = true
set.scrolloff = 5
set.fileencoding = 'utf-8'

set.mouse = 'a'
set.confirm = true

set.hidden = true

-- Colorscheme
vim.cmd('colorscheme terafox')
