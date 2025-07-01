local opt = vim.opt
local O = vim.o
local G = vim.g

G.mapleader = ' '
G.maplocalleader = '\\'
G.loaded_netrw = 0
G.loaded_netrwPlugin = 0
G.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

opt.number = true
opt.swapfile = false
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4 -- Number of spaces a tab counts for
opt.shiftwidth = 4 -- Number of spaces used for each step of (auto)indent
opt.softtabstop = 4 -- Number of spaces a tab displays as
opt.fillchars = { eob = ' ' } -- Remove the ~ line
opt.undofile = true
opt.clipboard = 'unnamedplus' -- Copy to system clipboard
opt.termguicolors = true
opt.scrolloff = 8
opt.cursorline = true
opt.hlsearch = false
opt.incsearch = true

O.signcolumn = 'yes'
O.background = 'dark'

vim.wo.relativenumber = true
