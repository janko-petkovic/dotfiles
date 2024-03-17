return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzy-native.nvim'
  },

  config = function()
    local telescope = require('telescope')
    telescope.setup{
      extensions = {
        fzf_native = {
          override_generic_sorter = false,
          override_file_sorter = true
        }
      }
    }
    telescope.load_extension('fzy_native')


    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set({'n','v'}, '<leader>gs', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
    vim.keymap.set('n', '<leader>/', builtin.buffers, {})
    vim.keymap.set('n', '<leader><leader>', builtin.current_buffer_fuzzy_find, {})

  end
}
