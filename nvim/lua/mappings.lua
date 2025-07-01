local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local builtin = require('telescope.builtin')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
-- Save file
map('n', '<C-s>', '<cmd>w<CR>')
map('x', '<leader>p', [["_dP]])
-- Close active buffer
map('n', '<leader>x', '<cmd>bd<CR>')
-- Cycle opened buffers
map('n', '<Tab>', '<cmd>bnext<CR>', opts)
map('n', '<S-Tab>', '<cmd>bprevious<CR>', opts)
-- Telescope
map('n', '<leader>ff', builtin.find_files, { desc = 'Find file' })
map('n', '<leader>fw', builtin.live_grep, { desc = 'Find word' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Find buffer' })
-- nvim-tree
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Nvim tree' })
-- jump normal mode
map('i', 'jn', '<Esc>', {})
-- Navigate vim panes better
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = 'switch window left' })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = 'switch window right' })
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = 'switch window down' })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = 'switch window up' })

