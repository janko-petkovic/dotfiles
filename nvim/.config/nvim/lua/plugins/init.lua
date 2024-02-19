-- start configuring the plugins
require('lazy').setup({

  'tpope/vim-fugitive',

  -- LSP stuff
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Additional lua configuration, makes nvim stuff amazing!
      -- 'folke/neodev.nvim',
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      require('plugins.configs.luasnip')
      require('plugins.configs.nvim-cmp')
    end
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },

  { 'numToStr/Comment.nvim', opts = {} },
  

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
        config = function()
          local builtin = require('telescope.builtin')
          vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
          vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
          vim.keymap.set('n', '<leader>/', builtin.buffers, {})
          vim.keymap.set('n', '<leader><leader>', builtin.current_buffer_fuzzy_find, {})
        end
      },
    },
  },


  -- Treesitter
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },

  {
    'lervag/vimtex',
    config = function()
      vim.cmd.filetype 'plugin indent on'
      vim.cmd.syntax 'enable'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = 'output/aux',
        out_dir = 'output',
        callback = 1,
        continuous = 1,
        executable = 'latexmk',
        options = {
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode'
        },
      }
      vim.g.vimtex_quickfix_ignore_filters = {
        'Underfull',
        'Overfull',
        'float specifier changed'
      }
    end
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup()
      vim.keymap.set('n', '<leader>t', '<CMD>NvimTreeToggle<CR>')
    end
  },


  {
    'catppuccin/nvim',
    name = 'catpuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
            light = "latte",
            dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
            enabled = false, -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
            comments = { "italic" }, -- Change the style of comments
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            notify = false,
            mini = {
                enabled = true,
                indentscope_color = "",
            },
        },
      })

      -- setup must be called before loading
      vim.cmd.colorscheme "catppuccin-frappe"
    end
  },
  --
  -- {
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
  -- },
  --
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local mark = require('harpoon.mark')
      local ui = require('harpoon.ui')
      vim.keymap.set("n", "<leader>a", mark.add_file, {})
      vim.keymap.set("n", "<A-e>", ui.toggle_quick_menu, {})
      vim.keymap.set("n", "<A-1>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<A-2>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<A-3>", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<A-4>", function() ui.nav_file(4) end)
    end
  }

}, {})
