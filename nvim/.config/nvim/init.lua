-- Packer
------------------------
require('packer-config')


-- Plugin cofigurations
--------------------------

-- Theme
require('everforest-config')

-- GUI
require('nvim-tree-config')
require('lualine-config')
require('barbar-config')

-- Language server stuff
require('lsp-config.language-servers')
require('lsp-config.nvim-cmp')
require('treesitter-config')

-- Mappings in the end!
require('settings')
require('mappings')


