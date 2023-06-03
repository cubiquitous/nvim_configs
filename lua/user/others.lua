-- from u/m00fin
-- creates persistent foldings and saves cursor location_
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

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- creates small delay until the autocomplete dropdown shows up
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

-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.cmd([[ autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%")) ]])
