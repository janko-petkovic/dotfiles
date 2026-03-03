return {
  'ellisonleao/gruvbox.nvim',
  priority=1000,
  config = function()
    vim.cmd("colorscheme gruvbox")
  end
}

-- return {
--   'neanias/everforest-nvim',
--   version = false,
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require 'everforest'.setup({
--       background = 'medium',
--       transparent_ackground_level = 0,
--     })
--     require 'everforest'.load()
--   end
-- }
