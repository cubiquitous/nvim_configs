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
local plugin = path_generator("user/plugins/")
--

require("lazy").setup({
	-- [[   ESSENTIAL]]
	plugin("telescope"),
	plugin("telescope-fzf-native"),
	plugin("mini_nvim"),
	-- [[ Markdown ]]
	plugin("mkdnflow"),
	plugin("clipboard"),
	plugin("markdown-preview"),
	-- [[   LSP   ]]
	plugin("lsp_config"),
	plugin("cmp"),
	plugin("nvim_treesitter"),
	plugin("treesitter_textobjects"),
	plugin("lsp_saga"),
	plugin("null_ls_nvim"),
	-- [[   USEFUL   ]]
	plugin("nvim_highlight_colors"),
	plugin("sleuth"),
	plugin("indent-blankline"),
	plugin("vgit"),
	plugin("nvim_ufo"),
	-- [[   FLUFF   ]]
	plugin("neotree"),
	plugin("windline"),
	plugin("vimpostor/vim-tpipeline"),
	plugin("todo_comments"),
	-- [[   COLORSCHEME   ]]
	colorscheme("rose_pine"),
	-- [[   DEACTIVATED   ]]
	-- plugin("gitsigns"),
	-- plugin("vim-fugitive"),
	-- plugin("rhubarb"),
	-- plugin("diffview"),
	-- plugin("prurigro/vim-markdown-concealed"),
})
