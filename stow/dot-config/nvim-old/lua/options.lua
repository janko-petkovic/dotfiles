-- Set highlight on search
local opt = vim.opt

opt.number = true

-- Tabs 
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.wrap = false

opt.textwidth = 80

opt.smartindent = true
opt.autoindent = true

opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = false
opt.scrolloff = 4
opt.signcolumn = 'yes'

opt.updatetime = 50

opt.colorcolumn = "80"

opt.spell = true


vim.g.python_indent = {
  open_paren = 4,
  nested_paren = 4,
  -- continue = 5,
  closed_paren_align_last_line = false,
}
