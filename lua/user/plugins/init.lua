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
	return function(path_str)
		if string.find(path_str, "/") then
			return path_str
		end
		return require(main_path .. path_str)
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
	plugin("mapper"),
	plugin("cheatsheet"),
	plugin("toggleterm"),
	--
	colorscheme("rose_pine"),
	colorscheme("embark"),
	colorscheme("gloombuddy"),
	colorscheme("nyoom-engineering/oxocarbon.nvim"),
	colorscheme("navarasu/onedark.nvim"),
	colorscheme("mhartington/oceanic-next"),
	colorscheme("glepnir/zephyr-nvim"),
	colorscheme("yonlu/omni.vim"),
	colorscheme("matsuuu/pinkmare"),
	colorscheme("EdenEast/nightfox.nvim"),
	colorscheme("shaunsingh/nord.nvim"),
	colorscheme("rebelot/kanagawa.nvim"),
	colorscheme("cocopon/iceberg.vim"),
	colorscheme("AlanWarren/rocket"),
	colorscheme("atelierbram/Base2Tone-nvim"),
	colorscheme("drewtempelmeyer/palenight.vim"),
	colorscheme("nyoom-engineering/oxocarbon.nvim"),
})
