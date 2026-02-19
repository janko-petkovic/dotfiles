map = vim.keymap.set
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\' -- the first backslash is for escaping

local lang_exec_table = {
  lua="lua",
  python="python",
}

map('i', 'jk', '<Esc>')
map('n', 'J', 'J^')

map('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Floating diagnostics'})
map('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list'})

map('n', '<leader>r', function()
    local file_name = vim.fn.expand("%")
    local file_type = vim.bo.filetype
    vim.cmd("!" .. lang_exec_table[file_type] .. " " .. file_name)
  end,
  { desc = 'Run the currently open buffer' }
)
