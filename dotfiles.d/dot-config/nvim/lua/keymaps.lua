map = vim.keymap.set
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\' -- the first backslash is for escaping

local lang_exec_table = {
  lua="lua",
  python="python",
}

-- Quality of life
map('i', 'jk', '<Esc>')
map('n', 'J', 'J^')
map('t', '<Esc>', "<C-\\><C-n>")
map('n', '<Esc>', "<cmd>noh<cr>")

--Dianostics
map('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Floating diagnostics'})
map('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list'})

--Sourcing
map('n', '<leader>w', function()
  vim.api.nvim_cmd({cmd="source", args={vim.fn.expand("%")}}, {}) end, {})

map({'n', 'i'}, "<leader>o", vim.cmd.Oil, {desc='Open oil'})



-- Windows
--Moving
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')
map({'t', 'i'}, '<C-h>', '<C-\\><C-n><C-w>h')
map({'t', 'i'}, '<C-j>', '<C-\\><C-n><C-w>j')
map({'t', 'i'}, '<C-k>', '<C-\\><C-n><C-w>k')
map({'t', 'i'}, '<C-l>', '<C-\\><C-n><C-w>l')

--Open terminal
map('n', '<C-x><C-h>', '<cmd>to vert terminal<cr><cmd>vert res 40<cr>i')
map('n', '<C-x><C-j>', '<cmd>bo hor terminal<cr><cmd>res 10<cr>i')
map('n', '<C-x><C-k>', '<cmd>to hor terminal<cr><cmd>res 10<cr>i')
map('n', '<C-x><C-l>', '<cmd>bo vert terminal<cr><cmd>vert res 40<cr>i')

--Closing
map('n', '<C-b><C-d>', '<cmd>bd<cr>')
map({'t', 'i'}, '<C-b><C-d>', '<C-\\><C-n><cmd>bd<cr>')

--New
map('n', '<C-n><C-h>', '<cmd>vert new<cr>i')
map('n', '<C-n><C-j>', '<cmd>rightb new<cr>i')
map('n', '<C-n><C-k>', '<cmd>new<cr>i')
map('n', '<C-n><C-l>', '<cmd>rightb vert new<cr>i')

--Resizing
map('n', '=', '<cmd>horizontal resize +1<cr>')
map('n', '+', '<cmd>horizontal resize -1<cr>')
map('n', '-', '<cmd>vertical resize +1<cr>')
map('n', '_', '<cmd>vertical resize -1<cr>')

