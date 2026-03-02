return {
  'nvim-telescope/telescope.nvim', version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- optional but recommended
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  config = function()
    local map = vim.keymap.set
    local builtin = require('telescope.builtin')

    map('', '<leader>pl', builtin.planets, {})
    map('', '<leader><leader>', builtin.builtin, {})
    map('', '<leader>ff', builtin.find_files, {})
    map('', '<leader>?', builtin.oldfiles, {})
    map('', '<leader>/', builtin.buffers, {})
    map('', '<leader>gs', builtin.live_grep, {})
  end
}


