local path_generator = require("user.utils.path").path_generator
local colorscheme = require("user.colorschemes")
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

--
--
local plugin = path_generator("user/plugins/")
--

require("lazy").setup({
	plugin("mini_nvim"), -- comment, surround
	plugin("neotree"),
	plugin("windline"),
	plugin("vimpostor/vim-tpipeline"),
	plugin("nvim_ufo"),
	plugin("null_ls_nvim"),
	plugin("todo_comments"),
	plugin("nvim_highlight_colors"),
	plugin("diffview"),
	plugin("lsp_config"),
	plugin("cmp"),
	plugin("nvim_treesitter"),
	plugin("treesitter_textobjects"),
	plugin("vim-fugitive"),
	plugin("rhubarb"),
	plugin("sleuth"),
	plugin("gitsigns"),
	plugin("indent-blankline"),
	plugin("telescope"),
	plugin("telescope-fzf-native"),
	--
	colorscheme("rose_pine"),
})
