local opt = vim.opt
local set = vim.o

opt.background = "dark" -- set this to dark or light

set.foldcolumn = "1" -- '0' is not bad
set.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
set.foldlevelstart = 99
set.foldenable = true

set.hlsearch = false

vim.wo.number = true -- Make line numbers default
set.relativenumber = true -- relative numbers

set.mouse = "a" -- Enable mouse mode

-- Enable break indent
set.breakindent = true
-- Save undo history
set.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true
-- Decrease update time
set.updatetime = 250
-- column of signs before numbers
vim.wo.signcolumn = "yes"
set.clipboard = "unnamedplus"
-- Set colorscheme
set.completeopt = "menuone,noselect"

--[[
  avaliable themes: 
     oxocarbon
     rose-pine
-- ]]
vim.cmd.colorscheme("oxocarbon")
set.termguicolors = true
set.t_Co = 256

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
