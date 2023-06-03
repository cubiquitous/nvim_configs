-- [[ Setting options ]]
-- See `:help vim.o`
-- local opt = vim.opt
local set = vim.o

set.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
set.background = "dark" -- set this to dark or light

set.foldcolumn = "1" -- '0' is not bad
set.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
set.foldlevelstart = 99
set.foldenable = true

set.hlsearch = false

vim.wo.number = true -- Make line numbers default
set.relativenumber = true -- relative numbers

-- set.mouse = "a" -- Enable mouse mode

-- Enable break indent
set.breakindent = true
-- Save undo history
set.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true
-- Decrease update time
set.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
-- column of signs before numbers
vim.wo.signcolumn = "yes"
set.clipboard = "unnamedplus"
set.completeopt = "menuone,noselect"
set.cursorline = true
set.expandtab = true -- tabs will become spaces
-- set.fileencoding = "utf-8"
set.splitbelow = true -- splits forced to be below
set.splitright = true -- splits forced to be at right
set.shiftwidth = 2 -- amount of spaces at each indent
set.tabstop = 2 -- spaces for each tab
set.scrolloff = 5 --number of lines shown above and below the cursor
set.autoread = true -- automatically reloads the file if isn't already
set.confirm = true
vim.cmd.colorscheme("rose-pine")
set.termguicolors = true
set.t_Co = 256

-- "-" is interpred as it's own keyword
vim.opt.iskeyword:append("-")

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
