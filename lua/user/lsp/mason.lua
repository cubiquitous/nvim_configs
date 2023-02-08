local utils = require("user/lsp/util")
-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(utils.servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = utils.capabilities,
			on_attach = utils.on_attach,
			settings = utils.servers[server_name],
		})
	end,
})
