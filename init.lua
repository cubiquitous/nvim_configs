-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("user/plugins")
require("user/settings")

-- from u/m00fin_
vim.cmd([[
	let g:skipview_files = [
		\ '[EXAMPLE PLUGIN BUFFER]'
		\ ]
	function! MakeViewCheck()
		if has('quickfix') && &buftype =~ 'nofile'
			" Buffer is marked as not a file
			return 0
		endif
		if empty(glob(expand('%:p')))
			" File does not exist on disk
			return 0
		endif
		if index(g:skipview_files, expand('%')) >= 0
			" File is in skip list
			return 0
		endif
		return 1
	endfunction
	augroup vimrcAutoView
		autocmd!
		" Autosave & Load Views.
		autocmd BufWritePost,BufLeave,BufWinLeave,WinLeave ?* if MakeViewCheck() | mkview! | endif
		autocmd BufWinEnter ?* if MakeViewCheck() | normal! zx
		autocmd BufWinEnter,BufWritePost ?* if MakeViewCheck() | silent! loadview | endif
	augroup end
]])

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Turn on lsp status information
require("fidget").setup()

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = {
		autocompletion = false,
		keyword_length = 2,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "nvim-lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "nvim-lua" },
	},
})

-- creates small delay until the dropdown shows up
vim.cmd([[
  let s:timer = 0
  autocmd TextChangedI * call s:on_text_changed()
  function! s:on_text_changed() abort
    call timer_stop(s:timer)
    let s:timer = timer_start(250, function('s:complete'))
  endfunction
  function! s:complete(...) abort
    lua require('cmp').complete({ reason = require('cmp').ContextReason.Auto })
  endfunction
]])

require("user/lsp")
require("user/mappings")
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
