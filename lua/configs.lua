local opt = vim.opt
local o = vim.o

opt.background = "dark" -- set this to dark or light
vim.cmd.colorscheme("oxocarbon")

o.foldcolumn = "1" -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true

o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
o.relativenumber = true

-- Enable mouse mode
o.mouse = "a"

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Decrease update time
o.updatetime = 250
vim.wo.signcolumn = "yes"
o.clipboard = "unnamedplus"
-- Set colorscheme
o.termguicolors = true
o.t_Co = 256

-- vim.cmd([[colorscheme rose-pine]])

-- Set completeopt to have a better completion experience
o.completeopt = "menuone,noselect"

vim.g.mapleader = " "
vim.g.maplocalleader = " "
