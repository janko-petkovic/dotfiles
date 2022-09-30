return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use "EdenEast/nightfox.nvim"        -- nightfox colortheme
    use 'sainnhe/everforest'            -- everforest colortheme

    -- GUI
    use 'kyazdani42/nvim-tree.lua'      -- tree
    use 'nvim-lualine/lualine.nvim'     -- status bar
    use 'rcarriga/nvim-notify'          -- notification tray
    use 'romgrk/barbar.nvim'            -- tabs bar
    use 'kyazdani42/nvim-web-devicons'  -- icons for all
    
    -- nvim-lspconfig, autocompletion
    use 'neovim/nvim-lspconfig'         -- lsp-server config plugin
    use 'hrsh7th/nvim-cmp'              -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'          -- LSP source for nvim-cmp

    -- tree-sitter and related
    use {'nvim-treesitter/nvim-treesitter', 
         run = ':TSUpdate'}             -- tree-sitter
    use 'nvim-treesitter/nvim-treesitter-refactor' -- refactor


    -- snippets
    use 'saadparwaiz1/cmp_luasnip'      -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'              -- Snippets plugin
end)
