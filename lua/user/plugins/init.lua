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
	-- [[   ESSENTIAL]]
	plugin("telescope"),
	plugin("telescope-fzf-native"),
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
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({
				mapping = { "jk" }, -- a table with mappings to use
				timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
				clear_empty_lines = false, -- clear line after escaping if there is only whitespace
				keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
				-- example(recommended)
				-- keys = function()
				--   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
				-- end,
			})
		end,
	},
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
})
