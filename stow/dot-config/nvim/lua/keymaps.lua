local map = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

lang_exec_table = {
  lua='lua',
  python='python',
}

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Don't use esc all the time 
map('i', 'jk', '<Esc>')

-- delete without changing the registers
map({'n', 'x'}, 'x', '"_x')
map({'n', 'x'}, 'X', '"_d')


-- Diagnostic keymaps
vim.keymap.set('n', '<leader>dm', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Launch the code in the buffer
vim.keymap.set('n', '<leader>r', function()
    local file_name = vim.fn.expand("%")
    local lang = vim.bo.filetype
    print(lang_exec_table[lang] .. " " .. file_name)
    -- os.execute(lang_exec_table[lang] .. " " .. file_name)
  end,
  {desc = 'run the code in the buffer'}
)

