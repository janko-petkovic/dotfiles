local set = vim.opt

-- Notification plugin
vim.notify = require('notify')

-- Colorscheme
set.termguicolors = true
vim.cmd('colorscheme everforest')


set.number = true
set.relativenumber = true
set.cursorline = true

-- set.expandtab = true
-- set.smarttab = true
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

