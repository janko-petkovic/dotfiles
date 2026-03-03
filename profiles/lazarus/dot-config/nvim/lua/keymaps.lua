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
--Moving
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')
--Resizing
map('n', '=', '<cmd>horizontal resize +1<cr>')
map('n', '+', '<cmd>horizontal resize -1<cr>')
map('n', '-', '<cmd>vertical resize +1<cr>')
map('n', '_', '<cmd>vertical resize -1<cr>')
--Splitting
map('n', '<leader>s', '<cmd>sp<cr>')
map('n', '<leader>v', '<cmd>vs<cr>')

-- Dianostics
map('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Floating diagnostics'})
map('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list'})


-- Utils
--Running (broken)
map('n', '<leader>r', function()
    local file_name = vim.fn.expand("%")
    local file_type = vim.bo.filetype
    vim.cmd("!" .. lang_exec_table[file_type] .. " " .. file_name)
  end,
  { desc = 'Run the currently open buffer' }
)


--Sourcing
map('n', '<leader>w', function()
  vim.api.nvim_cmd({cmd="source", args={vim.fn.expand("%")}}, {}) end, {})
