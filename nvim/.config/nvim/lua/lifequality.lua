-- OPTIONS
--
local opt = vim.opt
local api = vim.api

-- Tabulation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

-- Automatic line break at 80
opt.tw = 80

-- Set highlight on search
opt.hlsearch = true

-- Make line numbers default
opt.number = true

-- Enable mouse mode
opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
opt.clipboard = 'unnamedplus'

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300

-- Set completeopt to have a better completion experifalse
opt.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
opt.termguicolors = true


-- MAPPINGS
--
-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('', '<ESC>', '<ESC>:noh<CR>:lua require("notify").dismiss()<CR>', {silent = true})

-- clipboard
api.nvim_set_option('clipboard', 'unnamedplus')

