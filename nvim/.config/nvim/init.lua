local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- For some reason I cannot load options and keymaps with the lazy API.
-- I will fix this like so for now.
require('options')
require('keymaps')

require('lazy').setup({
  spec = {
    { import = 'plugins' }
  }
})
