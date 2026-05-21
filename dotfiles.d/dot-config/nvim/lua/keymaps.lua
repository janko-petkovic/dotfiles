map = vim.keymap.set
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\' -- the first backslash is for escaping

local lang_exec_table = {
  lua="lua",
  python="python",
}

map('i', 'jk', '<Esc>')
map('n', 'J', 'J^')

-- Windows
-- Moving
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')
map({'t', 'i'}, '<C-l>', '<C-\\><C-n><C-w>l')
map({'t', 'i'}, '<C-h>', '<C-\\><C-n><C-w>h')
map({'t', 'i'}, '<C-k>', '<C-\\><C-n><C-w>k')
map({'t', 'i'}, '<C-j>', '<C-\\><C-n><C-w>j')

-- Resizing
map('n', '-', '<cmd>horizontal resize +1<cr>')
map('n', '_', '<cmd>horizontal resize -1<cr>')
map('n', '=', '<cmd>vertical resize +1<cr>')
map('n', '+', '<cmd>vertical resize -1<cr>')

-- Openclose
map('n', '<C-w><C-h>', '<cmd>vnew<cr>')
map('n', '<C-w><C-j>', '<cmd>rightbelow new<cr>')
map('n', '<C-w><C-k>', '<cmd>new<cr>')
map('n', '<C-w><C-l>', '<cmd>rightbelow vnew<cr>')
map('n', '<C-b><C-d>', vim.cmd.bd)

-- Terminal
map('n', '<C-x><C-h>', '<cmd>topleft vertical terminal<cr><cmd>vertical res 40<cr>i')
map('n', '<C-x><C-j>', '<cmd>botright horizontal terminal<cr><cmd>res 10<cr>i')
map('n', '<C-x><C-k>', '<cmd>topleft horizontal terminal<cr><cmd>res 10<cr>i')
map('n', '<C-x><C-l>', '<cmd>botright vertical terminal<cr><cmd>vertical res 40<cr>i')
map('t', '<Esc>', '<C-\\><C-n>')

-- Dianostics
map('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Floating diagnostics'})
map('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list'})



--Sourcing
map('n', '<leader>w', function()
  vim.api.nvim_cmd({cmd="source", args={vim.fn.expand("%")}}, {}) end, {})
