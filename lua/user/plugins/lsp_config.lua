return { -- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	config = function()
		require("neodev").setup()
	end,
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Useful status updates for LSP
		{
			"j-hui/fidget.nvim",
			config = function()
				require("fidget").setup()
			end,
		},

		-- Additional lua configuration, makes nvim stuff amazing
		"folke/neodev.nvim",
	},
}
