local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


-- Leader key space
vim.g.mapleader = ' '

-- Exit and save quickly. I did this for the splits
-- mainly but I don't know is it a good idea in 
-- general?
---------------------------------------------------
map('n', '<A-q>', ':q<CR>', opts)
map('i', '<A-q>', '<Esc> | :q<CR>', opts)
map('n', '<A-w>', ':w<CR>', opts)
map('i', '<A-w>', '<Esc> | :w<CR>', opts)

-- handle splits more easily
-------------------------------------------
map('n', '<A-o>', ':on<CR>', opts)
map('n', '<A-s>', ':split<CR>', opts)
map('n', '<A-v>', ':vsplit<CR>', opts)

map('n', '<A-Left>', ':wincmd h<CR>', opts)
map('n', '<A-Down>', ':wincmd j<CR>', opts)
map('n', '<A-Right>', ':wincmd l<CR>', opts)
map('n', '<A-Up>', ':wincmd k<CR>', opts)


-- Compile latex stuff using tectonic simple command
---------------------------------------------
map('i', '<C-l>', '<Esc> | :w | !tectonic %<CR> | A', opts)
map('n', '<C-l>', ':w | !tectonic %<CR>', opts)

-- Nvim Tree
--------------
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)


-- Barbar
-----------------------------------------------------
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

