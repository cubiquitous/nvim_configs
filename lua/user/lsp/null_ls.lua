local null_ls = require("null-ls")
local utils = require("user.lsp.utils")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	-- register any number of sources simultaneously
	sources = {
		null_ls.builtins.formatting.prettierd.with({
			-- depends on npm
			filetypes = {
				"javascript",
				"typescript",
				"css",
				"scss",
				"html",
				"json",
				"yaml",
				"markdown",
				"graphql",
				"md",
				"txt",
			},
		}),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.beautysh, -- depends on apt python3-venv
		-- null_ls.builtins.formatting.sqlformat,
	},

	capabilities = utils.capabilities,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(_client)
							return _client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
	--
})
