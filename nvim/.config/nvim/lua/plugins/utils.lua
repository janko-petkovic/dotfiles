return {
  
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },

  {
    'folke/which-key.nvim',
    opts = {}
  },

  'tpope/vim-fugitive',
  
  {
    'numToStr/Comment.nvim',
    opts = {}
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup()
      vim.keymap.set('n', '<leader>t', '<CMD>NvimTreeToggle<CR>')
    end
  },
}
