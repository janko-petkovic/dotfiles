return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup()
    vim.keymap.set('n', '<leader>t', '<CMD>NvimTreeToggle<CR>')
  end
}
