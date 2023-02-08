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
local function path_generator(main_path)
	return function(sub_path)
		return require(main_path .. sub_path)
	end
end

--
local colorscheme = path_generator("user/colorschemes/")
local plugin = path_generator("user/plugins/")
--

require("lazy").setup({
	plugin("mini_nvim"),
	plugin("numb_nvim"),
	plugin("neotree"),
	plugin("nvim_ufo"),
	plugin("null_ls_nvim"),
	plugin("comment_nvim"),
	plugin("barbar"),
	plugin("nvim_surround"),
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
	plugin("lualine"),
	plugin("indent-blankline"),
	plugin("telescope"),
	plugin("telescope-fzf-native"),
	--
	colorscheme("rose_pine"),
	colorscheme("oxocarbon"),
	colorscheme("onedark"),
	colorscheme("oceanic-next"),
	colorscheme("zephyr-nvim"),
	colorscheme("gloombuddy"),
	colorscheme("omni_vim"),
	colorscheme("pinkmare"),
	colorscheme("nightfox"),
	colorscheme("nord"),
})
