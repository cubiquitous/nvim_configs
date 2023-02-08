local null_ls = require("null-ls")
null_ls.setup({
	-- register any number of sources simultaneously
	sources = {
		null_ls.builtins.formatting.prettierd.with({

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
		null_ls.builtins.formatting.sqlformat,
	},
	capabilities = capabilities,
	-- on_attach = on_attach,
	--
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							return client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
